package com.buckwa.dao.impl.pbp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.buckwa.dao.intf.pbp.AcademicKPIDao;
import com.buckwa.domain.pbp.AcademicKPI;
import com.buckwa.domain.pbp.AcademicKPIAttribute;
import com.buckwa.domain.pbp.AcademicKPIAttributeValue;
import com.buckwa.domain.pbp.AcademicKPIUserMapping;
import com.buckwa.domain.pbp.AcademicKPIWrapper;
import com.buckwa.domain.pbp.PBPWorkType;
import com.buckwa.util.BeanUtils;
import com.buckwa.util.school.SchoolConstants;
import com.buckwa.util.school.SchoolUtil;

@Repository("academicKPIDao")
public class AcademicKPIDaoImpl implements AcademicKPIDao {
	private static Logger logger = Logger.getLogger(AcademicKPIDaoImpl.class);
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SchoolUtil schoolUtil;
	
	@Autowired
	private GenerateCodeUtil  generateCodeUtil;
 
	@Override
	public AcademicKPIWrapper getByAcademicYear( String getByAcademicYear) {		 		
		String sql =" select *  from academic_kpi where academic_year ='"+getByAcademicYear+"'" ; 
		logger.info(" sql:"+sql);
		List<AcademicKPI> academicKPIList  =null;
		
		try{
			academicKPIList = this.jdbcTemplate.query(sql,	new AcademicKPIMapper() );	
		}catch (org.springframework.dao.EmptyResultDataAccessException ex){
			ex.printStackTrace();
		} 
		AcademicKPIWrapper academicKPIWrapper = new AcademicKPIWrapper();  
		academicKPIWrapper.setAcademicKPIList(academicKPIList);
		return academicKPIWrapper;
	}
	
	@Override
	public AcademicKPI getByCodeAcademicYear( String code ,String getByAcademicYear) {		 		
		String sql =" select *  from academic_kpi where academic_year ='"+getByAcademicYear+"' and code ='"+code+"'" ; 
		logger.info(" sql:"+sql);
		AcademicKPI academicKPI   =null;
		
		try{
			academicKPI = this.jdbcTemplate.queryForObject(sql,	new AcademicKPIMapper() );	
			
			
		}catch (org.springframework.dao.EmptyResultDataAccessException ex){
			ex.printStackTrace();
		} 
		
		if(academicKPI!=null){
			// Get KPI Attribute
			String sqlAttribute =" select *  from academic_kpi_attribute where academic_year ='"+getByAcademicYear+"' and academic_kpi_code ='"+code+"'" ; 
			List<AcademicKPIAttribute> academicKPIAttributeList = new ArrayList();
			try{
				academicKPIAttributeList = this.jdbcTemplate.query(sqlAttribute,	new AcademicKPIAttributeMapper() );	
			}catch (org.springframework.dao.EmptyResultDataAccessException ex){
				ex.printStackTrace();
			} 
			 
			academicKPI.setAcademicKPIAttributeList(academicKPIAttributeList);
			
		}
 
		return academicKPI;
	}
	
	
	@Override
	public AcademicKPIWrapper getAllByAcademicYear( String getByAcademicYear) {	
		
		String sqlpbp_work_type =" select *  from pbp_work_type where academic_year ='"+getByAcademicYear+"'" ;  
		
		logger.info("  getAllByAcademicYear  sqlpbp_work_type:"+sqlpbp_work_type);
		
		AcademicKPIWrapper academicKPIWrapper = new AcademicKPIWrapper();	 	
		
	 
		List<PBPWorkType> pBPWorkTypeList  = this.jdbcTemplate.query(sqlpbp_work_type,	new PBPWorkTypeMapper() );	 

		for(PBPWorkType tmp:pBPWorkTypeList){ 
			
			String sqlkpi =" select *  from academic_kpi where academic_year ='"+getByAcademicYear+"' and work_type_code ='"+tmp.getCode()+"' order by order_no" ; 
			logger.info(" sqlkpi:"+sqlkpi);
			List<AcademicKPI> academicKPIList   =null;
			
			try{
				academicKPIList = this.jdbcTemplate.query(sqlkpi,	new AcademicKPIMapper() );	
				
				
			}catch (org.springframework.dao.EmptyResultDataAccessException ex){
				ex.printStackTrace();
			} 
			
			
			for(AcademicKPI tmpxx: academicKPIList){
				String sqlAttribute =" select *  from academic_kpi_attribute where academic_year ='"+tmpxx.getAcademicYear()+"' and academic_kpi_code ='"+tmpxx.getCode()+"'" ; 
				List<AcademicKPIAttribute> academicKPIAttributeList = new ArrayList();
				try{
					academicKPIAttributeList = this.jdbcTemplate.query(sqlAttribute,	new AcademicKPIAttributeMapper() );	
				}catch (org.springframework.dao.EmptyResultDataAccessException ex){
					ex.printStackTrace();
				} 
				 
				tmpxx.setAcademicKPIAttributeList(academicKPIAttributeList);
			}
			tmp.setAcademicKPIList(academicKPIList);
			
		}
		
		academicKPIWrapper.setpBPWorkTypeList(pBPWorkTypeList); 
 
		return academicKPIWrapper;
	}
	
	

	
	@Override
	public AcademicKPI getById( String id) {		 		
		String sql =" select *  from academic_kpi where academic_kpi_id ="+id+"" ; 
		logger.info(" sql:"+sql);
		 AcademicKPI  academicKPI  = academicKPI = this.jdbcTemplate.queryForObject(sql,	new AcademicKPIMapper() );	
	     if(academicKPI!=null){
	 		String sqlAttribute =" select *  from academic_kpi_attribute where academic_kpi_code ='"+academicKPI.getCode()+"' and academic_year='"+academicKPI.getAcademicYear()+"'" ; 
			logger.info(" sqlAttribute:"+sqlAttribute);
			List<AcademicKPIAttribute>  academicKPIAttributeList = this.jdbcTemplate.query(sqlAttribute,	new AcademicKPIAttributeMapper() );	
			
			academicKPI.setAcademicKPIAttributeList(academicKPIAttributeList);
	     }
	 
		return academicKPI;
	}
	
	@Override
	public void deleteById( String id) {		 		
		String sql =" delete from academic_kpi where academic_kpi_id ="+id+"" ; 
		String sqlattribute =" delete from academic_kpi_attribute where academic_kpi_id ="+id+"" ; 
		logger.info(" sql:"+sql);
		this.jdbcTemplate.update(sql); 
		this.jdbcTemplate.update(sqlattribute); 
	  
	}
	
	@Override
	public void deleteAttributeById( String id) {		 		
		String sql =" delete from academic_kpi_attribute where kpi_attribute_id ="+id+"" ; 
		logger.info(" sql:"+sql);
		this.jdbcTemplate.update(sql); 
	 
	  
	}
	
	@Override
	public AcademicKPIWrapper getByAcademicYearWorkTypeCode( String getByAcademicYear,String workTypeCode) {		 		
		String sql =" select *  from academic_kpi where academic_year ='"+getByAcademicYear+"' and work_type_code='"+workTypeCode+"' order by order_no asc " ; 
		logger.info("getByAcademicYearWorkTypeCode  sql:"+sql);
		List<AcademicKPI> academicKPIList  =null;
		
		try{
			academicKPIList = this.jdbcTemplate.query(sql,	new AcademicKPIMapper() );	
		}catch (org.springframework.dao.EmptyResultDataAccessException ex){
			ex.printStackTrace();
		} 
		AcademicKPIWrapper academicKPIWrapper = new AcademicKPIWrapper();  
		academicKPIWrapper.setAcademicKPIList(academicKPIList);
		return academicKPIWrapper;
	}
	
	@Override
	public boolean isExistCreate(AcademicKPI domain) {
		 boolean returnValue = false;
		try{
			String sqltmp = "select count(*) as totalItem  from academic_kpi t  where t.name='"+StringEscapeUtils.escapeSql(domain.getName())+"'  and t.work_type_code='"+domain.getWorkTypeCode()+"' and t.academic_year='"+domain.getAcademicYear()+"'";
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
	public Long create(AcademicKPI domain) {
		logger.info("domain : "+BeanUtils.getBeanString(domain));	
		final int nexCode = generateCodeUtil.getNextaAcademicKPI(domain);
		final AcademicKPI finalDomain = domain;
		KeyHolder keyHolder = new GeneratedKeyHolder(); 		
		jdbcTemplate.update(new PreparedStatementCreator() {  
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {  
				PreparedStatement ps = connection.prepareStatement("" +						
						"  insert into academic_kpi (name, code,work_type_code,mark,academic_year,unit_code,rule_code,order_no,description) values (?, ?,?,?,?,?,?,?,?)" +
					 "", Statement.RETURN_GENERATED_KEYS);   
				ps.setString(1,finalDomain.getName());
				ps.setInt(2,nexCode);
				ps.setInt(3,new Integer(finalDomain.getWorkTypeCode()));	
				ps.setBigDecimal(4, finalDomain.getMark());
				ps.setString(5,finalDomain.getAcademicYear());
				ps.setInt(6,new Integer(finalDomain.getUnitCode()));	
				ps.setString(7,finalDomain.getMultiplyValue());
				ps.setInt(8,new Integer(finalDomain.getOrderNo()));
				ps.setString(9,finalDomain.getDescription());
				return ps;  
				}
			}, 	keyHolder); 	
		Long returnid =  keyHolder.getKey().longValue();		
 
		
		AcademicKPIAttribute academicKPIAttribute = new AcademicKPIAttribute();
		academicKPIAttribute.setAcademicKPICode(nexCode+"");
		academicKPIAttribute.setAcademicKPIId(returnid);
		academicKPIAttribute.setName("���ͧҹ");
		//academicKPIAttribute.setMandatory("Y");
		academicKPIAttribute.setAcademicYear(finalDomain.getAcademicYear());
		addNewAttribute(academicKPIAttribute);
		
		
		return returnid;
	}
	
	@Override
	public Long importwork(AcademicKPIUserMapping domain) {
		logger.info("  ########## importworkdomain : "+BeanUtils.getBeanString(domain));	
		 
		final AcademicKPIUserMapping finalDomain = domain;
		
		if(finalDomain.getAcademicKPIId()!=null){
			
			if("Y".equalsIgnoreCase(finalDomain.getIsCoTeach())){
				finalDomain.setStatus(SchoolConstants.STATUS_CREATE_CO_TEACH);
			}
			
		
		KeyHolder keyHolder = new GeneratedKeyHolder(); 		
		jdbcTemplate.update(new PreparedStatementCreator() {  
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {  
				PreparedStatement ps = connection.prepareStatement("" +						
						"  insert into academic_kpi_user_mapping (academic_kpi_code, academic_year,user_name,academic_kpi_id,work_type_code"
						+ " ,name,ratio,create_date,status,from_source, is_co_teach) values (?, ?,? ,?,?,?,?,?,?,?,?)" +
					 "", Statement.RETURN_GENERATED_KEYS);   
				ps.setString(1,finalDomain.getAcademicKPICode()); 
				ps.setString(2,finalDomain.getAcademicYear());	
				ps.setString(3,finalDomain.getUserName());
				ps.setLong(4, finalDomain.getAcademicKPIId());
				ps.setString(5, finalDomain.getWorkTypeCode());
				ps.setString(6, finalDomain.getName());
				ps.setInt(7, finalDomain.getRatio());
				ps.setTimestamp(8, new Timestamp(System.currentTimeMillis()));
				ps.setString(9, finalDomain.getStatus());
				ps.setString(10, finalDomain.getFromSource());
				ps.setString(11, finalDomain.getIsCoTeach());
				return ps;  
				}
			}, 	keyHolder); 	
		final Long returnid =  keyHolder.getKey().longValue();	
		
		logger.info(" ######################### academic_kpi_return_id:"+returnid);
		
		
		List<AcademicKPIAttributeValue> academicKPIAttributeValueList =finalDomain.getAcademicKPIAttributeValueList();
		for(final AcademicKPIAttributeValue tmp:academicKPIAttributeValueList){
			
			jdbcTemplate.update(new PreparedStatementCreator() {  
				public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {  
					PreparedStatement ps = connection.prepareStatement("" +						
							"  insert into academic_kpi_attribute_value (kpi_user_mapping_id, name,value,academic_year,create_date ,from_source) values (?, ?,?,?,?,?  )" +
						 "", Statement.RETURN_GENERATED_KEYS);   
					ps.setLong(1,returnid);
					ps.setString(2,tmp.getName());
					ps.setString(3,tmp.getValue());	 
					ps.setString(4,finalDomain.getAcademicYear());	 
					ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
					ps.setString(6, finalDomain.getFromSource());
					logger.info(" insert  academic_kpi_attribute_value  with academic_kpi_user_mapping_id: "+returnid+"  with attribute name:"+tmp.getName()+"  value:"+tmp.getValue());
					return ps;  
					}
				}, 	keyHolder); 				
	 
			
		} 
		return returnid;
		} else{
			return 1l;
		}
		
	}
	 
 
	@Override
	public boolean isAttributeExistCreate(AcademicKPIAttribute academicKPIAttribute) {
		 boolean returnValue = false;
		try{
			String sqltmp = "select count(*) as totalItem  from academic_kpi_attribute t  where t.name='"+StringEscapeUtils.escapeSql(academicKPIAttribute.getName())+"'  and t.academic_kpi_code="+academicKPIAttribute.getAcademicKPICode()+" and t.academic_year='"+academicKPIAttribute.getAcademicYear()+"'";
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
	public AcademicKPIAttribute addNewAttribute(AcademicKPIAttribute academicKPIAttribute){
		logger.info("domain : "+BeanUtils.getBeanString(academicKPIAttribute));	
		final int nexCode = generateCodeUtil.getNextAttributeCode(academicKPIAttribute);
		final AcademicKPIAttribute finalDomain = academicKPIAttribute;
		KeyHolder keyHolder = new GeneratedKeyHolder(); 		
		jdbcTemplate.update(new PreparedStatementCreator() {  
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {  
				PreparedStatement ps = connection.prepareStatement("" +						
						"  insert into academic_kpi_attribute (name, code,academic_kpi_code,is_calculate,academic_year,academic_kpi_id,mandatory) values (?, ?,?,?,?,?,?  )" +
					 "", Statement.RETURN_GENERATED_KEYS);   
				ps.setString(1,finalDomain.getName());
				ps.setInt(2,nexCode);
				ps.setInt(3,new Integer(finalDomain.getAcademicKPICode()));	 
				ps.setString(4,finalDomain.getIsCalculate()); 
				
				ps.setString(5,finalDomain.getAcademicYear()); 
				ps.setLong(6,finalDomain.getAcademicKPIId()); 
				ps.setString(7,finalDomain.getMandatory()); 
				return ps;  
				}
			}, 	keyHolder); 	
		Long returnid =  keyHolder.getKey().longValue();		
 
		String sql =" select *  from academic_kpi_attribute where kpi_attribute_id ="+returnid+"" ; 
		logger.info(" sql:"+sql);
		AcademicKPIAttribute  returnObj = this.jdbcTemplate.queryForObject(sql,	new AcademicKPIAttributeMapper() );	
		
		
		return returnObj;
	}
	
	
	
	
	
	
	@Override
	public void edit(AcademicKPI domain) {
		logger.info("domain : "+BeanUtils.getBeanString(domain));	 
		
		this.jdbcTemplate.update(
				"update    academic_kpi set name=?,mark=?,unit_code=? ,rule_code=? ,order_no=?,description=? ,"
				+ " special_p1=?,   special_p2=?, special_p3=?, special_p4=?, total_student_from=?, total_student_to=?,from_reg=? where academic_kpi_id=? ",
				domain.getName(), domain.getMark(),domain.getUnitCode(),domain.getMultiplyValue(),domain.getOrderNo(),domain.getDescription(),
				 domain.getSpecialP1(),
				 domain.getSpecialP2(),
				 domain.getSpecialP3(),
				 domain.getSpecialP4(),
				 domain.getTotalStudentFrom(),
				 domain.getTotalStudentTo(),
				 domain.getFromRegis(),
				domain.getAcademicKPIId()); 
		
		List<AcademicKPIAttribute> academicKPIAttributeList = domain.getAcademicKPIAttributeList();
		if(academicKPIAttributeList!=null&&academicKPIAttributeList.size()>0){
			for(AcademicKPIAttribute tmp:academicKPIAttributeList){
				logger.info(" checkValue:"+tmp.getIsCalculate());
				String isCheckFlage = "on".equalsIgnoreCase(tmp.getIsCalculate())?"Y":"N";
				String isCheckFlage2 = "on".equalsIgnoreCase(tmp.getIsValidateNumber())?"Y":"N";
				logger.info("  Name :"+tmp.getName()+" isCal:"+isCheckFlage+" isValidateNumber:"+isCheckFlage2);
				this.jdbcTemplate.update(
						"update    academic_kpi_attribute set name=?, is_calculate=?,is_validate_number=?  where kpi_attribute_id=? ",
						tmp.getName(), isCheckFlage,isCheckFlage2,tmp.getAcademicKPIAtributeId()); 
			}
			
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
			domain.setOrderNo(rs.getString("order_no"));
			
			domain.setSpecialP1(rs.getString("special_p1"));
			domain.setSpecialP2(rs.getString("special_p2"));
			domain.setSpecialP3(rs.getString("special_p3"));
			domain.setSpecialP4(rs.getString("special_p4"));
			domain.setTotalStudentFrom(rs.getString("total_student_from"));
			domain.setTotalStudentTo(rs.getString("total_student_to"));
			domain.setFromRegis(rs.getString("from_reg"));
			//logger.info(" ###### Multiply Value:"+rs.getString("rule_code"));
			
			try{
			domain.setUnitDesc(schoolUtil.getUnitDescMyCode(rs.getString("unit_code"), rs.getString("academic_year")));
		}catch(org.springframework.dao.EmptyResultDataAccessException ex){
			ex.printStackTrace();
		}
		 
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
		 
		return domain;
    }
	}
}
