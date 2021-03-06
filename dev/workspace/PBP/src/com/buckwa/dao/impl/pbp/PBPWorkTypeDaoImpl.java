package com.buckwa.dao.impl.pbp;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.buckwa.dao.intf.pbp.PBPWorkTypeDao;
import com.buckwa.domain.pbp.AcademicKPI;
import com.buckwa.domain.pbp.AcademicKPIAttribute;
import com.buckwa.domain.pbp.AcademicKPIAttributeValue;
import com.buckwa.domain.pbp.AcademicKPIUserMapping;
import com.buckwa.domain.pbp.AcademicYearEvaluateRound;
import com.buckwa.domain.pbp.MarkRank;
import com.buckwa.domain.pbp.MarkRankWrapper;
import com.buckwa.domain.pbp.PBPWorkType;
import com.buckwa.domain.pbp.PBPWorkTypeSub;
import com.buckwa.domain.pbp.PBPWorkTypeWrapper;
import com.buckwa.util.BeanUtils;
import com.buckwa.util.BuckWaDateUtils;
import com.buckwa.util.BuckwaNumberUtil;
import com.buckwa.util.school.SchoolUtil;

@Repository("pBPWorkTypeDao")
public class PBPWorkTypeDaoImpl implements PBPWorkTypeDao {
	private static Logger logger = Logger.getLogger(PBPWorkTypeDaoImpl.class);
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private SchoolUtil schoolUtil;
	
	@Autowired
	private GenerateCodeUtil  generateCodeUtil;
	@Override
	public PBPWorkTypeWrapper getByAcademicYear( String getByAcademicYear) {		 		
		String sql =" select *  from pbp_work_type where academic_year ='"+getByAcademicYear+"'" ;  
		
		logger.info("  getByAcademicYear sql:"+sql);
		
		PBPWorkTypeWrapper pBPWorkTypeWrapper = new PBPWorkTypeWrapper();	 	
		
		try{
		List<PBPWorkType> pBPWorkTypeList  = this.jdbcTemplate.query(sql,	new PBPWorkTypeMapper() );	
		
		

		for(PBPWorkType tmp:pBPWorkTypeList){
			String sqlSub =" select *  from pbp_work_type_sub  where work_type_id ="+tmp.getWorkTypeId(); 
			logger.info(" sqlSub:"+sqlSub);
			List<PBPWorkTypeSub> pBPWorkTypeSubList  =null;
			
			try{
				pBPWorkTypeSubList = this.jdbcTemplate.query(sqlSub,	new PBPWorkTypeSubMapper() );	
				
				if(pBPWorkTypeSubList!=null&&pBPWorkTypeSubList.size()>0){
					
					for(PBPWorkTypeSub subTmp:pBPWorkTypeSubList){
						
						// Get KPI User Mapping belong to sub
						
					}
					
					
					tmp.setpBPWorkTypeSubList(pBPWorkTypeSubList);
				}else{
					
					String sqlMap =" select *  from academic_kpi_user_mapping  where work_type_code ="+tmp.getCode()+" and academic_year='"+tmp.getAcademicYear()+"'"; 
					
			 
					List<AcademicKPIUserMapping>	academicKPIUserMappingList = this.jdbcTemplate.query(sqlMap,	new AcademicKPIUserMappingMapper() );	
					
					if(academicKPIUserMappingList!=null&&academicKPIUserMappingList.size()>0){
						
						for(AcademicKPIUserMapping mappingTmp:academicKPIUserMappingList){
							
							//AcademicKPIAttributeValueMapper
							
						}
						
					}
					
					tmp.setAcademicKPIUserMappingList(academicKPIUserMappingList);
				}
				
				
			}catch (org.springframework.dao.EmptyResultDataAccessException ex){
				ex.printStackTrace();
			} 
		}
		
		pBPWorkTypeWrapper.setpBPWorkTypeList(pBPWorkTypeList);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return pBPWorkTypeWrapper;
	}
	
	
	@Override
	public PBPWorkTypeWrapper getCalculateByAcademicYear( String academicYear,String userName,String round,String employeeType) {
		logger.info("  getCalculateByAcademicYear getByAcademicYear xx:"+academicYear+"userName :"+userName+" round:"+round+" employeeType:"+employeeType);
		
		
		// Get Start ,End Date 
		
		//String evalType = "1";
		
		//if(employeeType.equalsIgnoreCase("����Ҫ���")){
			
		//}else{
		//	evalType ="2";
		//}
		
		// ######## Start academic_year, academic_evaluate_round
		String sqlRound =" select *  from academic_evaluate_round where academic_year  ='"+academicYear+"' and evaluate_type='"+employeeType+"'"   ;  
		logger.info(" sqlRound:"+sqlRound);
		 AcademicYearEvaluateRound  academicYearEvaluateRound   = this.jdbcTemplate.queryForObject(sqlRound,	new AcademicYearEvaluateRoundMapper() );	
		
		 //logger.info(" academicYearEvaluateRound:"+BeanUtils.getBeanString(academicYearEvaluateRound));
		 
		 long startTime =0l;
		 long endTime =0l;
		 
		 Timestamp startTimeStamp = null;
		 Timestamp endTimeStamp = null;
		 
		 if(employeeType.equalsIgnoreCase("1")){
			 if("1".equalsIgnoreCase(round)){
				 startTime = academicYearEvaluateRound.getRound1StartDate().getTime();
				 startTimeStamp = academicYearEvaluateRound.getRound1StartDate();
				 
				 endTime = academicYearEvaluateRound.getRound1EndDate().getTime();
				 endTimeStamp = academicYearEvaluateRound.getRound1EndDate();
			 }else{
				 startTime = academicYearEvaluateRound.getRound2StartDate().getTime();
				 startTimeStamp = academicYearEvaluateRound.getRound2StartDate();
				 
				 endTime = academicYearEvaluateRound.getRound2EndDate().getTime();
				 endTimeStamp = academicYearEvaluateRound.getRound2EndDate();
			 }
			 
		 }else{
			 
			 startTime = academicYearEvaluateRound.getRound1StartDate().getTime();
			 startTimeStamp = academicYearEvaluateRound.getRound1StartDate();
			 
			 endTime = academicYearEvaluateRound.getRound1EndDate().getTime();
			 endTimeStamp = academicYearEvaluateRound.getRound1EndDate(); 
			 
		 }
				 
		 logger.info(" Start Date:"+startTimeStamp+"  long:"+startTime);
		 logger.info(" End Date:"+endTimeStamp+"  long:"+endTime);
		 
		 
		 
		
		String sql =" select *  from pbp_work_type where academic_year ='"+academicYear+"'" ;  
		
		logger.info(" getByAcademicYear sql:"+sql);
		
		PBPWorkTypeWrapper pBPWorkTypeWrapper = new PBPWorkTypeWrapper();	 	
		
		try{
		List<PBPWorkType> pBPWorkTypeList  = this.jdbcTemplate.query(sql,	new PBPWorkTypeMapper() );	 
		for(PBPWorkType tmp:pBPWorkTypeList){
			String sqlSub =" select *  from pbp_work_type_sub  where work_type_id ="+tmp.getWorkTypeId(); 
			logger.info(" sqlSub:"+sqlSub);
			List<PBPWorkTypeSub> pBPWorkTypeSubList  =null;
			
			try{
				pBPWorkTypeSubList = this.jdbcTemplate.query(sqlSub,	new PBPWorkTypeSubMapper() );	
				
				/*
				if(pBPWorkTypeSubList!=null&&pBPWorkTypeSubList.size()>0){
					
					for(PBPWorkTypeSub subTmp:pBPWorkTypeSubList){
						
						// Get KPI User Mapping belong to sub
						
					} 
					tmp.setpBPWorkTypeSubList(pBPWorkTypeSubList);
				}else{
				*/
					
					String sqlMap =" select *  from academic_kpi_user_mapping  where work_type_code ="+tmp.getCode()+" " +
							" and academic_year='"+tmp.getAcademicYear()+"' and user_name='"+userName+"' and create_date BETWEEN '"+startTimeStamp+"' AND '"+endTimeStamp+"'"; 
					//BETWEEN '2013-03-26 00:00:01' AND '2013-03-26 23:59:59'
					logger.info(" sqlMap:"+sqlMap);
					
					List<AcademicKPIUserMapping>	academicKPIUserMappingList = this.jdbcTemplate.query(sqlMap,	new AcademicKPIUserMappingMapper() );	
					
					if(academicKPIUserMappingList!=null&&academicKPIUserMappingList.size()>0){
						
						logger.info(" Found academic_kpi_user_mapping for worktype code:"+tmp.getCode()+"  username :"+userName+" academicYear:"+academicYear+" list below ");
						for(AcademicKPIUserMapping mappingTmp:academicKPIUserMappingList){
							logger.info("  "+mappingTmp.getKpiUserMappingId());
						}
						
						for(AcademicKPIUserMapping mappingTmp:academicKPIUserMappingList){
							
							String sqlkpi =" select *  from academic_kpi where academic_kpi_id ="+mappingTmp.getAcademicKPIId() ; 
							//logger.info(" sqlkpi:"+sqlkpi);
							 
							
							try{
								 AcademicKPI  academicKPI  = this.jdbcTemplate.queryForObject(sqlkpi,	new AcademicKPIMapper() );
								 mappingTmp.setAcademicKPI(academicKPI);
								 
								 
									String sqlAttributeValue =" select *  from academic_kpi_attribute_value where kpi_user_mapping_id ="+mappingTmp.getKpiUserMappingId() ; 
									List<AcademicKPIAttributeValue> academicKPIAttributeValueList = new ArrayList();
									try{
										logger.info(" sqlAttributeValue:"+sqlAttributeValue);
										academicKPIAttributeValueList = this.jdbcTemplate.query(sqlAttributeValue,	new AcademicKPIAttributeValueMapper() );
										logger.info(" Found Attribute list for Usermaping id :"+mappingTmp.getKpiUserMappingId()+" size:"+ academicKPIAttributeValueList.size());
									}catch (org.springframework.dao.EmptyResultDataAccessException ex){
										ex.printStackTrace();
									} 
									
								 
									mappingTmp.setAcademicKPIAttributeValueList(academicKPIAttributeValueList);
									
									
									
									String sqlAttribute  =" select *  from academic_kpi_attribute  where academic_kpi_code ="+mappingTmp.getAcademicKPICode()+" and academic_year='"+mappingTmp.getAcademicYear()+"'" ; 
									List<AcademicKPIAttribute> academicKPIAttributeList = new ArrayList();
									try{
										//logger.info(" sqlAttribute:"+sqlAttribute);
										academicKPIAttributeList = this.jdbcTemplate.query(sqlAttribute,	new AcademicKPIAttributeMapper() );
										
									}catch (org.springframework.dao.EmptyResultDataAccessException ex){
										ex.printStackTrace();
									} 									
									
									
									for(AcademicKPIAttributeValue attributeValueTmp: academicKPIAttributeValueList){
										//logger.info("  Start set is calculate  attributeName  :"+attributeValueTmp.getName() ); 
										for(AcademicKPIAttribute attributeTmp:academicKPIAttributeList){
											String isCalculate = attributeTmp.getIsCalculate();
											//String isValidateNumber= attributeTmp.getIsCalculate();
											String attributeName = attributeTmp.getName();
											
											//logger.info("   attributeName  :"+attributeName +"  isCalculate:"+isCalculate ); 
											
										
										String attributeValueName = attributeValueTmp.getName();
										if(attributeName.equalsIgnoreCase(attributeValueName)){
											if("Y".equalsIgnoreCase(isCalculate)){
												logger.info(" attributeValueName:"+attributeValueName+"   Found is calculate Y , So set Y");
												attributeValueTmp.setIsCalculate("Y");
										}
									 }
										}
									}
									
									
									mappingTmp.setAcademicKPIAttributeList(academicKPIAttributeList);
								 
							}catch (org.springframework.dao.EmptyResultDataAccessException ex){
								ex.printStackTrace();
							} 
							
							//AcademicKPIAttributeValueMapper
							
						}
						
					}
					
					tmp.setAcademicKPIUserMappingList(academicKPIUserMappingList);
			//	} 
				
			}catch (org.springframework.dao.EmptyResultDataAccessException ex){
				ex.printStackTrace();
			} 
		}
		
		
		// Callculate 
		
		BigDecimal totalMark = new BigDecimal(0.00);
		BigDecimal totalMarkCompareBase = new BigDecimal(0.00);
		BigDecimal totalPercentMark = new BigDecimal(0.00);
		BigDecimal totalPercentMarkComareBase = new BigDecimal(0.00);
		
		for(PBPWorkType tmp:pBPWorkTypeList){
			BigDecimal maxMark = new BigDecimal(tmp.getMaxHour());
			BigDecimal limitBase = new BigDecimal(tmp.getLimitBase());
			
			int minHour =tmp.getMinHour();
			int maxHour =tmp.getMaxHour();
			
			BigDecimal totalInWorkType = new BigDecimal(0.00);
			List<AcademicKPIUserMapping> academicKPIUserMappingList =  tmp.getAcademicKPIUserMappingList();
			
			if(academicKPIUserMappingList!=null&&academicKPIUserMappingList.size()>0){
				for(AcademicKPIUserMapping mappingTmp:academicKPIUserMappingList){
					
					BigDecimal totalMappingTmp = new BigDecimal(0.0);
					//logger.info(" Start With Total Mark:"+totalMappingTmp);
					AcademicKPI kpiTmp = mappingTmp.getAcademicKPI();
					
					String mappingStatus = mappingTmp.getStatus();
					
					if("APPROVED".equalsIgnoreCase(mappingStatus)){
						
						String calResultStr =" 15";
						
						//List<AcademicKPIAttribute>  academicKPIAttributeList  =mappingTmp.getAcademicKPIAttributeList();
						List<AcademicKPIAttributeValue>  academicKPIAttributeValueList  =mappingTmp.getAcademicKPIAttributeValueList();
						
						logger.info("   ########## Mapping id:"+mappingTmp.getKpiUserMappingId()+" Statatus  Approve , So Start Calculate " );
						logger.info(" KPI Mark:"+kpiTmp.getMark()+" Multiply Value:"+kpiTmp.getMultiplyValue()); 
						 
						
						calResultStr=calResultStr+ " X (" +kpiTmp.getMark()+" คะแนน KPI )";
						
						BigDecimal multiplyValueBig = new BigDecimal(0.00);
						
						try{
							multiplyValueBig = new BigDecimal(kpiTmp.getMultiplyValue());
						}catch(Exception ex){
							//
						}
						
						
						if(kpiTmp.getMultiplyValue()!=null&&multiplyValueBig.doubleValue()>0){
							
							totalMappingTmp =totalMappingTmp.add(kpiTmp.getMark()).multiply(multiplyValueBig).setScale(2); 
							logger.info("  Found multiply value :"+kpiTmp.getMultiplyValue()+"  So multiply by :"+kpiTmp.getMultiplyValue()+" = "+totalMappingTmp);
						}else{
							
						 	
							totalMappingTmp =totalMappingTmp.add(kpiTmp.getMark()); 
							logger.info("  No multiply value :"+kpiTmp.getMultiplyValue()+"  So Add by :"+kpiTmp.getMultiplyValue()+" = "+totalMappingTmp);
						}
						
						
						
					//	logger.info("   Mark after Multiply or Add Value :"+totalMappingTmp);
						
					
						
						logger.info("  Start is calculate attribute size :"+academicKPIAttributeValueList.size());
								for(AcademicKPIAttributeValue attributeValueTmp: academicKPIAttributeValueList){
									//logger.info("  Start  attributeName check Is calculate   :"+attributeValueTmp.getName() ); 
									//for(AcademicKPIAttribute attributeTmp:academicKPIAttributeList){
										String isCalculate = attributeValueTmp.getIsCalculate();
										//String isValidateNumber= attributeTmp.getIsCalculate();
									//	String attributeName = attributeTmp.getName();
										
										String attributeValueName = attributeValueTmp.getName();
										
										
										if("Y".equalsIgnoreCase(isCalculate)){
									
											logger.info(" Found    attributeName  :"+attributeValueName +"  isCalculate:"+isCalculate ); 
									//if(attributeName.equalsIgnoreCase(attributeValueName)){
										
										String attributeValueValue = attributeValueTmp.getValue();
										logger.info(" Multiply Value :"+attributeValueValue); 
										BigDecimal tmpBeforCall = totalMappingTmp;
										if(attributeValueName.indexOf("สัดส่วน(%)")!=-1){
											//logger.info(" ############ Found Ratio Attribute value:"+attributeValueValue);
										
											totalMappingTmp =totalMappingTmp.multiply(new BigDecimal(attributeValueValue).setScale(2)).divide(new BigDecimal(100));
											logger.info("   Attribute Name:"+attributeValueName+"   Attribute value:"+attributeValueValue+ " isCal:"+isCalculate +"  So :"+tmpBeforCall+"*"+attributeValueValue+"/100 = "+totalMappingTmp);
										
											calResultStr=calResultStr+ " X (" +attributeValueName+" "+attributeValueValue+")";
										}else{ 
											
											totalMappingTmp =totalMappingTmp.multiply(new BigDecimal(attributeValueValue).setScale(2));
											logger.info("   Attribute Name:"+attributeValueName+"   Attribute value:"+attributeValueValue+ " isCal:"+isCalculate +" So :"+tmpBeforCall+"*"+attributeValueValue+"  = "+totalMappingTmp);
											calResultStr=calResultStr+ " X (" +attributeValueValue+" "+attributeValueName+")";
										}
										
									//	break;
									//}
								}
								
								
							}
								logger.info("  Call Str: "+calResultStr);
								
								mappingTmp.setCalResultStr(calResultStr+" = "+totalMappingTmp.setScale(2));	
								 
								 
								updateCallResultStr(mappingTmp);
								
					//	}
						
						logger.info("   Mark after other Attribute :"+totalMappingTmp);
					} else{
						logger.info("   ##########  Mapping id:"+mappingTmp.getKpiUserMappingId()+"  Statatus Not Approve , So Skip" );
					}
					
				 
					BigDecimal totalPercentInMapping = totalMappingTmp.multiply(new BigDecimal(100)).divide( limitBase ,2,RoundingMode.HALF_UP); 
					mappingTmp.setTotalInMapping(totalMappingTmp.setScale(2)); 
					
					
					
					
					mappingTmp.setTotalPercentInMapping(totalPercentInMapping.setScale(2));
					totalInWorkType =totalInWorkType.add(totalMappingTmp.setScale(2));
				} 				
			} 
			
			BigDecimal totalInPercentWorkType = totalInWorkType.multiply(new BigDecimal(100)).divide( limitBase ,2,RoundingMode.HALF_UP); 
			logger.info("totalInPercentWorkType :"+totalInWorkType + "  compare  :"+limitBase + "  ---->"+totalInPercentWorkType+"  % " );
			tmp.setTotalInWorkType(totalInWorkType.setScale(2));
			
			tmp.setTotalInPercentWorkType(totalInPercentWorkType.setScale(2));
			if(totalInWorkType.intValue()<minHour){
				tmp.setTotalInPercentCompareBaseWorkType(totalInPercentWorkType.setScale(2));
				tmp.setTotalInWorkTypeCompareBase(totalInWorkType.setScale(2));
				tmp.setCompareBaseStatus("UNDER");
			}else  if(totalInWorkType.intValue()>maxHour){
				tmp.setTotalInPercentCompareBaseWorkType (new BigDecimal(tmp.getMaxPercent()).setScale(2));
				tmp.setTotalInWorkTypeCompareBase(new BigDecimal(tmp.getMinHour()).setScale(2));
				tmp.setCompareBaseStatus("OVER");
			}else {
				tmp.setTotalInPercentCompareBaseWorkType(totalInPercentWorkType.setScale(2));
				tmp.setTotalInWorkTypeCompareBase(totalInWorkType.setScale(2));
				tmp.setCompareBaseStatus("NORMAL");
			}
			
			
			totalPercentMark =totalPercentMark.add(tmp.getTotalInPercentWorkType().setScale(2));
			totalPercentMarkComareBase =totalPercentMarkComareBase.add(tmp.getTotalInPercentCompareBaseWorkType().setScale(2));
			totalMark = totalMark.add(totalInWorkType.setScale(2));
			totalMarkCompareBase =totalMarkCompareBase.add(tmp.getTotalInWorkTypeCompareBase().setScale(2));
			logger.info(" total Mark:"+totalMark);
		} 
		
			//BigDecimal totalPercentMark = totalMark.multiply(new BigDecimal(100)).divide(maxMark,2,RoundingMode.HALF_UP); 
			logger.info(" totalPercentMark  :"+totalPercentMark);
			pBPWorkTypeWrapper.setTotalMark(totalMark.setScale(2));
			pBPWorkTypeWrapper.setTotalMarkCompareBase(totalMarkCompareBase);
			pBPWorkTypeWrapper.setTotalPercentMark(totalPercentMark.setScale(2));
			pBPWorkTypeWrapper.setTotalPercentMarkCompareBase(totalPercentMarkComareBase.setScale(2));
			
			// 1- Because mark_rank keep 0,1
			 int employeeTypeGetSalary = Integer.parseInt(employeeType) -1;
			pBPWorkTypeWrapper.setIncreaseSalaryRate(getIncreaseSalaryRate(totalPercentMarkComareBase,academicYear,employeeTypeGetSalary+"",round));
			pBPWorkTypeWrapper.setpBPWorkTypeList(pBPWorkTypeList);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return pBPWorkTypeWrapper;
	} 
	
	
	private int updateCallResultStr ( AcademicKPIUserMapping mappingTmp){
		int returnValue = 0;
		try{
			final AcademicKPIUserMapping finalTmp = mappingTmp;
		 
			jdbcTemplate.update(new PreparedStatementCreator() {  
				public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {  
					PreparedStatement ps = connection.prepareStatement("" +						
							"  update  academic_kpi_user_mapping set cal_result_str =?   where kpi_user_mapping_id=?  " +
						 "", Statement.RETURN_GENERATED_KEYS);   
					ps.setString(1,finalTmp.getCalResultStr());			 
					ps.setLong(2, finalTmp.getKpiUserMappingId());
				 
				
					return ps;  
					}
				} );			 
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return returnValue;
		
	}
	 
	private int getIncreaseSalaryRate (BigDecimal totalPercentMark,String academicYear,String employeeType,String round){
		int returnValue = 0;
		try{
			
			  
			String sql =" select *  from mark_rank where academic_year ='"+academicYear+"' and employee_type='"+employeeType+"' and round ='"+round+"'" ;  
			
			logger.info("  getIncreaseSalaryRate sql:"+sql);
			
			MarkRankWrapper markRankWrapper = new MarkRankWrapper();	 				
			List<MarkRank> markRankList  = this.jdbcTemplate.query(sql,	new MarkRankMapper() );	
			
			for(MarkRank markRankTmp:markRankList){
				
				int markFrom =markRankTmp.getMarkFrom();
				int markTo =markRankTmp.getMarkTo();
				int mark =totalPercentMark.intValue();
				logger.info("  markFrom:"+markFrom+"  markTo:"+markTo+" mark:"+mark);
				boolean isBetween = BuckwaNumberUtil.isBetween(markFrom, markTo, mark);
				
				logger.info("  isBetween:"+isBetween);
				if(isBetween){
					returnValue = markRankTmp.getSalaryLevel();
					break;
					
				}
				
				
			}
			 
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		return returnValue;
		
	}
	
	
	@Override
	public PBPWorkType  getById( String id) {		 		
		String sql =" select *  from pbp_work_type where work_type_id="+id ;  
		
		logger.info("  getByAcademicYear sql:"+sql);
		 	 				
		 PBPWorkType pBPWorkType   = this.jdbcTemplate.queryForObject (sql,	new PBPWorkTypeMapper() );				
			if(pBPWorkType!=null){
				
				
				String sqlSub =" select *  from pbp_work_type_sub  where work_type_id ="+id; 
				logger.info(" sqlSub:"+sqlSub);
				List<PBPWorkTypeSub> pBPWorkTypeSubList  =null;
				
				try{
					pBPWorkTypeSubList = this.jdbcTemplate.query(sqlSub,	new PBPWorkTypeSubMapper() );	
					pBPWorkType.setpBPWorkTypeSubList(pBPWorkTypeSubList);
					
				}catch (org.springframework.dao.EmptyResultDataAccessException ex){
					ex.printStackTrace();
				} 
				
			}
	 
		return pBPWorkType;
	}
	@Override
	public PBPWorkType  getByCode( String code, String academicYear) {		 		
		String sql =" select *  from pbp_work_type where code="+code+" and academic_year='"+academicYear+"'" ;  
		
		logger.info("  getByAcademicYear sql:"+sql);
		 	 				
		 PBPWorkType pBPWorkType   = this.jdbcTemplate.queryForObject (sql,	new PBPWorkTypeMapper() );				
			if(pBPWorkType!=null){
				
				
				String sqlSub =" select *  from pbp_work_type_sub  where work_type_id ="+pBPWorkType.getWorkTypeId(); 
				logger.info(" sqlSub:"+sqlSub);
				List<PBPWorkTypeSub> pBPWorkTypeSubList  =null;
				
				try{
					pBPWorkTypeSubList = this.jdbcTemplate.query(sqlSub,	new PBPWorkTypeSubMapper() );	
					pBPWorkType.setpBPWorkTypeSubList(pBPWorkTypeSubList);
					
				}catch (org.springframework.dao.EmptyResultDataAccessException ex){
					ex.printStackTrace();
				} 
				
			}
	 
		return pBPWorkType;
	}
	
	
	
	@Override
	public PBPWorkType  getSub( String id) {		 		
		String sql =" select *  from pbp_work_type where work_type_id ="+id; 
		logger.info(" sql:"+sql);
		PBPWorkType  pBPWorkType   =null;
		
		try{
			pBPWorkType  = this.jdbcTemplate.queryForObject(sql,	new PBPWorkTypeMapper() );	
		}catch (Exception ex){
			ex.printStackTrace();
		} 
		
		if(pBPWorkType!=null){
			
			
			String sqlSub =" select *  from pbp_work_type_sub  where work_type_id ="+id; 
			logger.info(" sqlSub:"+sqlSub);
			List<PBPWorkTypeSub> pBPWorkTypeSubList  =null;
			
			try{
				pBPWorkTypeSubList = this.jdbcTemplate.query(sqlSub,	new PBPWorkTypeSubMapper() );	
				pBPWorkType.setpBPWorkTypeSubList(pBPWorkTypeSubList);
				
			}catch (org.springframework.dao.EmptyResultDataAccessException ex){
				ex.printStackTrace();
			} 
			
		}
	 
		return pBPWorkType ;
	}
	
	
	
	@Override
	public boolean isExist(PBPWorkType pBPWorkType) {
		 boolean returnValue = false;
		try{
			String sqltmp = "select count(*) as totalRole  from pbp_work_type t  where t.name='"+pBPWorkType.getName()+"' " ;
			Long found = this.jdbcTemplate.queryForLong(sqltmp);
			if(found!=null&&found.intValue()>0){
				returnValue = true;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}			
		return returnValue;
	}	
	
	
	@Override
	public void create(PBPWorkType pBPWorkType) {
		logger.info("  create # ");		
		final PBPWorkType finalpBPWorkType = pBPWorkType;
		KeyHolder keyHolder = new GeneratedKeyHolder(); 		
		jdbcTemplate.update(new PreparedStatementCreator() {  
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {  
				PreparedStatement ps = connection.prepareStatement("" +						
						"  insert into mark_rank (mark_from, mark_to,academic_year) values (?, ?,?)" +
					 "", Statement.RETURN_GENERATED_KEYS);   
			//	ps.setInt(1,finalpBPWorkType.getMarkFrom());
				//ps.setInt(2,finalpBPWorkType.getMarkTo());
				ps.setString(3,finalpBPWorkType.getAcademicYear());		 			
				return ps;  
				}
			}, 	keyHolder); 	
		Long returnid =  keyHolder.getKey().longValue();		
 
	}
	
	@Override
	public void edit(PBPWorkTypeWrapper pBPWorkTypeWrapper) {
		logger.info("  edit # ");		
		final PBPWorkTypeWrapper finalPBPWorkTypeWrapper = pBPWorkTypeWrapper;
		
		List<PBPWorkType> pBPWorkTypeList = finalPBPWorkTypeWrapper.getpBPWorkTypeList();
		
		for(final PBPWorkType pBPWorkTypeTmp:pBPWorkTypeList){		
			logger.info("  pBPWorkTypeTmp id: "+pBPWorkTypeTmp.getWorkTypeId()+"  name:"+pBPWorkTypeTmp.getName()+" limit:"+pBPWorkTypeTmp.getLimitBase());
			jdbcTemplate.update(new PreparedStatementCreator() {  
				public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {  
					PreparedStatement ps = connection.prepareStatement("" +						
							"  update  pbp_work_type set name =? ,min_percent=?,min_hour=?,max_percent=? ,max_hour=?,limit_base=? where work_type_id=? and academic_year='"+finalPBPWorkTypeWrapper.getAcademicYear()+"'" +
						 "", Statement.RETURN_GENERATED_KEYS);   
					ps.setString(1,pBPWorkTypeTmp.getName());
					ps.setInt(2,pBPWorkTypeTmp.getMinPercent());
					ps.setInt(3,pBPWorkTypeTmp.getMinHour());
					ps.setInt(4,pBPWorkTypeTmp.getMaxPercent());
					ps.setInt(5,pBPWorkTypeTmp.getMaxHour());
					ps.setInt(6,pBPWorkTypeTmp.getLimitBase());
					ps.setLong(7, pBPWorkTypeTmp.getWorkTypeId());
				 
				
					return ps;  
					}
				} );			
			
		} 
 
	}
	
	
	
	
	@Override
	public void delete(String  pBPWorkTypeId) {
		logger.info("pBPWorkTypeId: "+pBPWorkTypeId);		
	        String deleteSQL ="delete from  pbp_work_type where work_type_id ="+pBPWorkTypeId;
	        String deleteSubSQL ="delete from  pbp_work_type_sub where work_type_id ="+pBPWorkTypeId;
	        logger.info(" #### delete:"+deleteSQL);
	        logger.info(" #### deleteSubSQL:"+deleteSubSQL);
			this.jdbcTemplate.update(deleteSQL);	
			this.jdbcTemplate.update(deleteSQL);
	 
 
	}
	
	
	
	@Override
	public void addNew(PBPWorkType pBPWorkType) {
		logger.info(" .addNew # ");		
		final String academicYear = schoolUtil.getCurrentAcademicYear();
		final int nexCode = generateCodeUtil.getNextAcademicUnitCode(academicYear);
		final PBPWorkType finalpBPWorkType = pBPWorkType;
		KeyHolder keyHolder = new GeneratedKeyHolder(); 		
		jdbcTemplate.update(new PreparedStatementCreator() {  
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {  
				PreparedStatement ps = connection.prepareStatement("" +						
						"  insert into pbp_work_type (min_percent,min_hour,max_percent,max_hour, academic_year,code,limit_base) values (?, ?,?,?,?,?,?)" +
					 "", Statement.RETURN_GENERATED_KEYS);   
				ps.setInt(1,0);
				ps.setInt(2,0);
				ps.setInt(3,0);
				ps.setInt(4,0);
				ps.setString(5,finalpBPWorkType.getAcademicYear());		
				ps.setInt(6,nexCode);
				ps.setInt(7, 0);
				return ps;  
				}
			}, 	keyHolder); 	
		Long returnid =  keyHolder.getKey().longValue();		
 
	}
	@Override
	public void addNewSub(PBPWorkTypeSub pBPWorkTypeSub) {
		logger.info(" .addNew # ");		
		final String academicYear = schoolUtil.getCurrentAcademicYear();
		final int nexCode = generateCodeUtil.getNextWorkTypeSubCode(pBPWorkTypeSub.getWorkTypeId()+"");
		final PBPWorkTypeSub finalpBPWorkTypeSub = pBPWorkTypeSub;
		KeyHolder keyHolder = new GeneratedKeyHolder(); 		
		jdbcTemplate.update(new PreparedStatementCreator() {  
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {  
				PreparedStatement ps = connection.prepareStatement("" +						
						"  insert into pbp_work_type_sub (code,work_type_id,academic_year ) values (? ,?,?)" +
					 "", Statement.RETURN_GENERATED_KEYS);   
			 	
				ps.setInt(1,nexCode);
				ps.setLong(2, finalpBPWorkTypeSub.getWorkTypeId());
				ps.setString(3, academicYear);
				return ps;  
				}
			}, 	keyHolder); 	
		Long returnid =  keyHolder.getKey().longValue();		
 
	} 
	
	@Override
	public void editSub(PBPWorkType pBPWorkType) {
		logger.info("  edit # ");		
		final PBPWorkType finalPBPWorkTypeWrapper = pBPWorkType;
		
		List<PBPWorkTypeSub> pBPWorkTypeSubList = finalPBPWorkTypeWrapper.getpBPWorkTypeSubList();
		
		for(final PBPWorkTypeSub pBPWorkTypeTmp:pBPWorkTypeSubList){			
			jdbcTemplate.update(new PreparedStatementCreator() {  
				public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {  
					PreparedStatement ps = connection.prepareStatement("" +						
							"  update  pbp_work_type_sub set name =?   where work_type_sub_id=?  "+
						 "", Statement.RETURN_GENERATED_KEYS);   
					ps.setString(1,pBPWorkTypeTmp.getName());
					 
					ps.setLong(2, pBPWorkTypeTmp.getWorkTypeSubId());
				 
				
					return ps;  
					}
				} );			
			
		} 
 
	}
	
	
	
	
	@Override
	public void deleteSub(String  pBPWorkTypeSubId) {
		logger.info("pBPWorkTypeId: "+pBPWorkTypeSubId);		
	        String deleteSQL ="delete from  pbp_work_type_sub where work_type_sub_id ="+pBPWorkTypeSubId;
	        logger.info(" #### delete:"+deleteSQL);
			this.jdbcTemplate.update(deleteSQL);	
		 
	 
 
	}
	
	
	private class PBPWorkTypeMapper implements RowMapper<PBPWorkType> {   						
        @Override
		public PBPWorkType mapRow(ResultSet rs, int rowNum) throws SQLException {
        	PBPWorkType domain = new PBPWorkType(); 
        	domain.setWorkTypeId(rs.getLong("work_type_id"));
			domain.setCode(rs.getString("code"));
			domain.setName(rs.getString("name"));
			domain.setDescription(rs.getString("description"));
			domain.setMinPercent(rs.getInt("min_percent"));
			domain.setMinHour(rs.getInt("min_hour"));
			domain.setMaxPercent(rs.getInt("max_percent"));
			domain.setMaxHour(rs.getInt("max_hour"));
			domain.setAcademicYear(rs.getString("academic_year"));
			domain.setLimitBase(rs.getInt("limit_base"));
		 
		return domain;
    }
	}
	
	
	private class PBPWorkTypeSubMapper implements RowMapper<PBPWorkTypeSub> {   						
        @Override
		public PBPWorkTypeSub mapRow(ResultSet rs, int rowNum) throws SQLException {
        	PBPWorkTypeSub domain = new PBPWorkTypeSub(); 
        	domain.setWorkTypeSubId(rs.getLong("work_type_sub_id"));
        	domain.setWorkTypeId(rs.getLong("work_type_id"));
			domain.setCode(rs.getString("code"));
			domain.setName(rs.getString("name"));
	 
			domain.setAcademicYear(rs.getString("academic_year"));
		 
		return domain;
    }
	}
	
	private class AcademicKPIUserMappingMapper implements RowMapper<AcademicKPIUserMapping> {   						
        @Override
		public AcademicKPIUserMapping mapRow(ResultSet rs, int rowNum) throws SQLException {
        	AcademicKPIUserMapping domain = new AcademicKPIUserMapping(); 
        	
        	
        	domain.setKpiUserMappingId(rs.getLong("kpi_user_mapping_id"));
        	domain.setAcademicKPIId(rs.getLong("academic_kpi_id"));
			domain.setName(rs.getString("name"));		 
			domain.setWorkTypeCode(rs.getString("work_type_code"));  
			domain.setAcademicYear(rs.getString("academic_year"));
			domain.setAcademicKPICode(rs.getString("academic_kpi_code"));
			domain.setStatus(rs.getString("status"));
		 
		return domain;
    }
	}
	 
 
	
	private class AcademicKPIAttributeValueMapper implements RowMapper<AcademicKPIAttributeValue> {   						
        @Override
		public AcademicKPIAttributeValue mapRow(ResultSet rs, int rowNum) throws SQLException {
        	AcademicKPIAttributeValue domain = new AcademicKPIAttributeValue(); 
        	 
        	domain.setAcademicKPIMappingId(rs.getLong("kpi_user_mapping_id"));
			domain.setName(rs.getString("name"));		
			domain.setValue(rs.getString("value"));	 
		 
			return domain;
    }
	}
	
	private class AcademicKPIMapper implements RowMapper<AcademicKPI> {   						
        @Override
		public AcademicKPI mapRow(ResultSet rs, int rowNum) throws SQLException {
        	AcademicKPI domain = new AcademicKPI(); 
        	domain.setAcademicKPIId(rs.getLong("academic_kpi_id"));
			domain.setName(rs.getString("name"));		
			domain.setCode(rs.getString("code"));	
			domain.setWorkTypeCode(rs.getString("work_type_code"));
			domain.setDescription(rs.getString("description"));	
			domain.setStatus(rs.getString("status"));	
			domain.setAcademicYear(rs.getString("academic_year"));
			domain.setMark(rs.getBigDecimal("mark"));
			domain.setUnitCode(rs.getString("unit_code"));
			domain.setMultiplyValue(rs.getString("rule_code"));
			domain.setUnitDesc(schoolUtil.getUnitDescMyCode(rs.getString("unit_code"), rs.getString("academic_year")));
		 
		return domain;
    }
	}
	
	private class AcademicKPIAttributeMapper implements RowMapper<AcademicKPIAttribute> {   						
        @Override
		public AcademicKPIAttribute mapRow(ResultSet rs, int rowNum) throws SQLException {
        	AcademicKPIAttribute domain = new AcademicKPIAttribute(); 
        	domain.setAcademicKPIAtributeId(rs.getLong("kpi_attribute_id"));
        	domain.setAcademicKPIId(rs.getLong("academic_kpi_id"));
			domain.setName(rs.getString("name"));		
			domain.setCode(rs.getString("code"));	
			domain.setAcademicKPICode(rs.getString("academic_kpi_code"));
			domain.setIsCalculate(rs.getString("is_calculate")); 
			domain.setIsValidateNumber(rs.getString("is_validate_number"));
			domain.setAcademicYear(rs.getString("academic_year"));
		    domain.setMandatory(rs.getString("mandatory"));
		 
		return domain;
    }
	}
	
	
	private class MarkRankMapper implements RowMapper<MarkRank> {   						
        @Override
		public MarkRank mapRow(ResultSet rs, int rowNum) throws SQLException {
        	MarkRank domain = new MarkRank(); 
        	domain.setMarkRankId(rs.getLong("mark_rank_id"));
			domain.setMarkFrom(rs.getInt("mark_from"));		
			domain.setMarkTo(rs.getInt("mark_to"));	
			domain.setSalaryLevel(rs.getInt("salary_level"));			 
			domain.setAcademicYear(rs.getString("academic_year"));
		return domain;
    }
	}
	
	private class AcademicYearEvaluateRoundMapper implements RowMapper<AcademicYearEvaluateRound> {   						
        @Override
		public AcademicYearEvaluateRound mapRow(ResultSet rs, int rowNum) throws SQLException {
        	AcademicYearEvaluateRound domain = new AcademicYearEvaluateRound(); 
        	domain.setRoundId(rs.getLong("round_id"));
			domain.setRound1StartDate(rs.getTimestamp("round1_start_date"));		
			domain.setRound1EndDate(rs.getTimestamp("round1_end_date"));
			domain.setRound1StartDateStr(BuckWaDateUtils.get_ddMMyyyy_from_date(rs.getTimestamp("round1_start_date")));
			domain.setRound1EndDateStr(BuckWaDateUtils.get_ddMMyyyy_from_date(rs.getTimestamp("round1_end_date")));
			
			domain.setRound1Status(rs.getString("round1_status"));
			
			domain.setRound2StartDate(rs.getTimestamp("round2_start_date"));
			domain.setRound2EndDate(rs.getTimestamp("round2_End_date"));
			domain.setRound2StartDateStr(BuckWaDateUtils.get_ddMMyyyy_from_date(rs.getTimestamp("round2_start_date")));
			domain.setRound2EndDateStr(BuckWaDateUtils.get_ddMMyyyy_from_date(rs.getTimestamp("round2_End_date")));
			domain.setRound2Status(rs.getString("round2_status"));
			
			domain.setAcademicYear(rs.getString("academic_year"));
			domain.setEvaluateType(rs.getString("evaluate_type"));
			domain.setEvaluateTypeDesc(rs.getString("evaluate_type_desc"));
			
		return domain;
    }
	}
}
