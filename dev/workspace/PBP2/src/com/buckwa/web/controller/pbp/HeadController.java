package com.buckwa.web.controller.pbp;

import static com.googlecode.charts4j.Color.BLACK;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pbp.AcademicKPIUserMappingWrapper;
import com.buckwa.domain.pbp.AcademicPerson;
import com.buckwa.domain.pbp.Department;
import com.buckwa.domain.pbp.Faculty;
import com.buckwa.domain.pbp.PBPWorkType;
import com.buckwa.domain.pbp.PBPWorkTypeWrapper;
import com.buckwa.domain.validator.pbp.ReplyPBPMessageValidator;
import com.buckwa.domain.webboard.Message;
import com.buckwa.service.intf.pbp.AcademicKPIUserMappingService;
import com.buckwa.service.intf.pbp.FacultyService;
import com.buckwa.service.intf.pbp.HeadService;
import com.buckwa.service.intf.pbp.PBPWorkTypeService;
import com.buckwa.service.intf.webboard.WebboardTopicService;
import com.buckwa.util.BeanUtils;
import com.buckwa.util.BuckWaConstants;
import com.buckwa.util.BuckWaUtils;
import com.buckwa.util.school.SchoolUtil;
import com.googlecode.charts4j.AxisLabels;
import com.googlecode.charts4j.AxisLabelsFactory;
import com.googlecode.charts4j.AxisStyle;
import com.googlecode.charts4j.AxisTextAlignment;
import com.googlecode.charts4j.Color;
import com.googlecode.charts4j.Data;
import com.googlecode.charts4j.GCharts;
import com.googlecode.charts4j.LineStyle;
import com.googlecode.charts4j.Plots;
import com.googlecode.charts4j.RadarChart;
import com.googlecode.charts4j.RadarPlot;
import com.googlecode.charts4j.RadialAxisLabels;
import com.googlecode.charts4j.Shape;

@Controller
@RequestMapping("/head/pbp")
@SessionAttributes({"academicKPIUserMappingWrapper"} ) 
public class HeadController {	
	private static Logger logger = Logger.getLogger(HeadController.class);	 
	@Autowired
	private HeadService headService;	
	
	@Autowired
	private AcademicKPIUserMappingService academicKPIUserMappingService;
	
	@Autowired
	private SchoolUtil schoolUtil;
	
	@Autowired
	private PBPWorkTypeService pBPWorkTypeService;
	
	@Autowired
	private FacultyService facultyService;
	
	@Autowired
	private WebboardTopicService  webboardTopicService;
	
	@RequestMapping(value="init.htm", method = RequestMethod.GET)
	public ModelAndView initList() {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("headWorkList");
		try{
			BuckWaRequest request = new BuckWaRequest(); 
			 
			String headUserName = BuckWaUtils.getUserNameFromContext();
			String academicYear =schoolUtil.getCurrentAcademicYear();
			
			request.put("headUserName",headUserName);
			request.put("academicYear",academicYear);
			request.put("status",""); 
			BuckWaResponse response = headService.getByHeadAcademicYear(request);
			if(response.getStatus()==BuckWaConstants.SUCCESS){	
				AcademicKPIUserMappingWrapper academicKPIUserMappingWrapper = (AcademicKPIUserMappingWrapper)response.getResObj("academicKPIUserMappingWrapper");
			 
				academicKPIUserMappingWrapper.setAcademicYear(academicYear);
				mav.addObject("academicKPIUserMappingWrapper", academicKPIUserMappingWrapper);	
			}				  
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}	
	
	
	@RequestMapping(value="initByUserName.htm", method = RequestMethod.GET)
	public ModelAndView initByUserName(HttpServletRequest httpRequest,@RequestParam("userName") String userName) {
		logger.info(" Start  userName: "+userName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("headWorkUserList");
		try{
			
			httpRequest.getSession().setAttribute("approveUserName", userName);
			BuckWaRequest request = new BuckWaRequest(); 
			 
			String headUserName = BuckWaUtils.getUserNameFromContext();
			String academicYear =schoolUtil.getCurrentAcademicYear();
			
			request.put("headUserName",headUserName);
			request.put("academicYear",academicYear);
			request.put("userName",userName);
			request.put("status",""); 
			BuckWaResponse response = headService.getByUserAcademicYear(request);
			if(response.getStatus()==BuckWaConstants.SUCCESS){	
				AcademicKPIUserMappingWrapper academicKPIUserMappingWrapper = (AcademicKPIUserMappingWrapper)response.getResObj("academicKPIUserMappingWrapper");
			 
				academicKPIUserMappingWrapper.setAcademicYear(academicYear);
				mav.addObject("academicKPIUserMappingWrapper", academicKPIUserMappingWrapper);	
			}				  
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}	
	
	
	@RequestMapping(value="viewWork.htm", method = RequestMethod.GET)
	public ModelAndView viewWork(@RequestParam("kpiUserMappingId") String kpiUserMappingId  ) {
		logger.info(" Start  kpiUserMappingId:"+kpiUserMappingId );
		ModelAndView mav = new ModelAndView();
		mav.setViewName("viewWork");
		try{
			BuckWaRequest request = new BuckWaRequest(); 
			request.put("kpiUserMappingId",kpiUserMappingId);
			BuckWaResponse response = academicKPIUserMappingService.getById(request);
			if(response.getStatus()==BuckWaConstants.SUCCESS){	
	 
				 AcademicKPIUserMappingWrapper academicKPIUserMappingWrapper = (AcademicKPIUserMappingWrapper)response.getResObj("academicKPIUserMappingWrapper");
				  
				mav.addObject("academicKPIUserMappingWrapper", academicKPIUserMappingWrapper);
			} else{
				mav.addObject("errorCode", "E001"); 
				mav.setViewName("headWorkList");
				
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}
	
	@RequestMapping(value="approveWork.htm", method = RequestMethod.GET)
	public ModelAndView approveWork(HttpServletRequest httpRequest,@RequestParam("kpiUserMappingId") String kpiUserMappingId  ) {
		logger.info(" Start  kpiUserMappingId:"+kpiUserMappingId );
		ModelAndView mav = new ModelAndView();
		mav.setViewName("headWorkList");
		try{
			
			String approveUserName =(String)httpRequest.getSession().getAttribute("approveUserName");
			BuckWaRequest request = new BuckWaRequest(); 
			request.put("kpiUserMappingId",kpiUserMappingId);
			BuckWaResponse response = academicKPIUserMappingService.approve(request);
			 logger.info(" ### approveWork after approve ");
			if(response.getStatus()==BuckWaConstants.SUCCESS){	
	 
		 
			return initByUserName(httpRequest,approveUserName);	
			} else{
				mav.addObject("errorCode", "E001"); 
				mav.setViewName("viewWork");
				
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}
	
	
	@RequestMapping(value="viewDepartmentMark.htm", method = RequestMethod.GET)
	public ModelAndView viewDepartmentMark() {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("viewDepartment");
		try{
			BuckWaRequest request = new BuckWaRequest(); 
			 
			String headUserName = BuckWaUtils.getUserNameFromContext();
			String academicYear =schoolUtil.getCurrentAcademicYear();
			
			request.put("headUserName",headUserName);
			request.put("academicYear",academicYear);
			  
			BuckWaResponse response = headService.getDepartmentMark(request);
			if(response.getStatus()==BuckWaConstants.SUCCESS){	
				Department department = (Department)response.getResObj("department");
			 
				department.setAcademicYear(academicYear);
				mav.addObject("department", department);	
			}				  
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}	
	
	@RequestMapping(value="viewMarkDepartment.htm", method = RequestMethod.GET)
	public ModelAndView viewMarkDepartment() {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("markDepartment");
		try{
			BuckWaRequest request = new BuckWaRequest(); 
			 
			String headUserName = BuckWaUtils.getUserNameFromContext();
			String academicYear =schoolUtil.getCurrentAcademicYear();
			
			request.put("headUserName",headUserName);
			request.put("academicYear",academicYear);
			request.put("status",""); 
			BuckWaResponse response = headService.getDepartmentMark(request);
			if(response.getStatus()==BuckWaConstants.SUCCESS){	
				Department department = (Department)response.getResObj("department"); 
				department.setAcademicYear(academicYear);
				 request = new BuckWaRequest(); 
				 String facultyCode =department.getFacultyCode();
				request.put("academicYear",academicYear);
				request.put("facultyCode",facultyCode);
				 //response = pBPWorkTypeService.getByAcademicYear(request);
				 response = pBPWorkTypeService.getByAcademicYearFacultyCode(request);
				if(response.getStatus()==BuckWaConstants.SUCCESS){	
					PBPWorkTypeWrapper pBPWorkTypeWrapper = (PBPWorkTypeWrapper)response.getResObj("pBPWorkTypeWrapper"); 
					List<PBPWorkType> pBPWorkTypeList = pBPWorkTypeWrapper.getpBPWorkTypeList();
					
					
					for(PBPWorkType typeTmp:pBPWorkTypeList){
					 
						String shortDesc ="";
						StringTokenizer st = new StringTokenizer(typeTmp.getName(), " ");
						int numberOfSt =1;
				        while (st.hasMoreElements()) { 
				        
				        	String stStr = st.nextElement().toString();
				        	logger.info(" numberOfSt:"+numberOfSt+"  stStr:"+ stStr);
				            if(numberOfSt==1){
				            	shortDesc = stStr;
				            }
				            if(numberOfSt==2){
				            	//axisLables = axisLables +" "
				            	//st.nextElement();
				            }
				            numberOfSt++;
				        } 	
				        
				        typeTmp.setShortDesc(shortDesc);
				        
				        
				 
				        // Sum total mark
				     List<AcademicPerson>  academicPersonListMark = department.getAcademicPersonList();
				     BigDecimal totalMark = new BigDecimal(0.00);
				     int totalPerson =0;
				     for(AcademicPerson personTmp: academicPersonListMark){
				    	 
				    	List<PBPWorkType> pBPWorkTypeListTotalMark	= personTmp.getpBPWorkTypeWrapper().getpBPWorkTypeList();
				    	
				    	if(pBPWorkTypeListTotalMark!=null){
				    		
						      for(PBPWorkType totalMarkTmp:pBPWorkTypeListTotalMark){
							    	//  System.out.print(" totalMarkTmp id:"+totalMarkTmp.getWorkTypeId());
							    	  
							    	  if(typeTmp.getWorkTypeId().intValue()==totalMarkTmp.getWorkTypeId().intValue()){ 
							  			
								 
											//totalMark = totalMark.add(totalMarkTmp.getTotalInPercentCompareBaseWorkType());
											totalMark = totalMark.add(totalMarkTmp.getTotalInPercentWorkType());
										 
							    	  }
							    	  
							      }				    		
				    		
				    	}

					      totalPerson++;  
					       
				     }
				     
				     
				     if(totalPerson==0){
				    	 totalPerson=1;
				     }
				     logger.info(" totalmark:"+totalMark+"  totalperson:"+totalPerson);
				     BigDecimal totalInPercentCompareBaseWorkTypeAVG = totalMark.divide(new BigDecimal(totalPerson) ,2, BigDecimal.ROUND_HALF_UP);
 
				     typeTmp.setTotalAllWorkType(totalMark); 
				     typeTmp.setTotalInPercentCompareBaseWorkType(totalMark);
				     typeTmp.setTotalInPercentCompareBaseWorkTypeAVG(totalInPercentCompareBaseWorkTypeAVG);
				 
					}
					
					department.setpBPWorkTypeList(pBPWorkTypeList);
					
					// Save Department Summary to DB
					
					
					request.put("academicYear",academicYear);
					request.put("facultyCode",department.getFacultyCode());
					response =  facultyService.getFacultyByCodeAndYear(request);
					if(response.getStatus()==BuckWaConstants.SUCCESS){	
						Faculty faculty = (Faculty)response.getResObj("faculty");  
						logger.info(" #### Faculty:"+ BeanUtils.getBeanString(faculty));
						department.setFaculty(faculty);
						
						request.put("department",department);
						headService.saveDepartmentReportSummary(request);
					}
					 
				}	 
				 
				
				
				List<String> axisLabelList =new ArrayList();
				List<Number> dataList = new ArrayList();				
				BigDecimal data1 = null;				
				List<PBPWorkType> pBPWorkTypeList = department.getpBPWorkTypeList();		
				
				
				List<BigDecimal> pointList  = new ArrayList();
				for(PBPWorkType typeTmp:pBPWorkTypeList){
		 
					//pointList.add(typeTmp.getTotalInPercentCompareBaseWorkType()) ;
					pointList.add(typeTmp.getTotalInPercentCompareBaseWorkTypeAVG()) ;
		 
			
				}
				
				BigDecimal maxPoint =Collections.max(pointList);
				
				
				int loop =0;
				for(PBPWorkType typeTmp:pBPWorkTypeList){
					logger.info(" loop:"+loop);
					String tempLabel ="";
					StringTokenizer st = new StringTokenizer(typeTmp.getName(), " ");
					int numberOfSt =1;
			        while (st.hasMoreElements()) { 			        
			        	String stStr = st.nextElement().toString();
			        	logger.info(" numberOfSt:"+numberOfSt+"  stStr:"+ stStr);
			            if(numberOfSt==1){
			            	tempLabel = stStr;
			            }
			            if(numberOfSt==2){
			            	//axisLables = axisLables +" "
			            	//st.nextElement();
			            }
			            numberOfSt++;
			        }
					
			        axisLabelList.add(tempLabel);
			        
			        logger.info("typeTmp.getTotalInPercentCompareBaseWorkTypeAVG():"+typeTmp.getTotalInPercentCompareBaseWorkTypeAVG()+" data1:"+data1+"  maxPoint:"+ maxPoint);
			     //   BigDecimal weight100  = typeTmp.getTotalInPercentCompareBaseWorkType().multiply(new BigDecimal(100)).setScale(2,BigDecimal.ROUND_UP).divide(maxPoint).setScale(2,BigDecimal.ROUND_UP);
			      //  BigDecimal weight100AVG  = typeTmp.getTotalInPercentCompareBaseWorkTypeAVG().multiply(new BigDecimal(100)).divide(maxPoint,2, BigDecimal.ROUND_HALF_UP).setScale(0,BigDecimal.ROUND_UP);
 
			     
			      //  data1 =weight100;
			      //  data1 =weight100AVG;
			        data1=typeTmp.getTotalInPercentCompareBaseWorkTypeAVG();
			       
			        // if(loop==0){
			        //	data1 =typeTmp.getTotalInPercentCompareBaseWorkType().multiply(new BigDecimal(2)).setScale(0,BigDecimal.ROUND_UP);
			       // }
					
					loop++;
					//dataList.add(typeTmp.getTotalInPercentCompareBaseWorkType() .multiply(new BigDecimal(2)).setScale(0,BigDecimal.ROUND_UP));
							
					dataList.add(data1);
				}
				
			
				
				
				logger.info(" Data List Value  ");
				for(Number datax :dataList){
					logger.info("    "+datax);
				}
				
			   	 
				
		        RadarPlot plot = Plots.newRadarPlot(Data.newData(dataList));
		       // RadarPlot plot = Plots.newRadarPlot(Data.newData(80, 50, 50, 80, 60,80));
		       // RadarPlot plot = Plots.newRadarPlot(Data.newData(0.76, 51.28,55,15.4, 5,0.76));
		       
		        Color plotColor = Color.newColor("CC3366");
		        plot.addShapeMarkers(Shape.SQUARE, plotColor, 5);
		        plot.addShapeMarkers(Shape.SQUARE, plotColor, 3);
		        plot.setColor(plotColor);
		        plot.setLineStyle(LineStyle.newLineStyle(2, 1, 0));
		        RadarChart chart = GCharts.newRadarChart(plot);
		      //  chart.setTitle("����������ҹ", BLACK, 20);
		        chart.setSize(500, 500);
		       // RadialAxisLabels radialAxisLabels = AxisLabelsFactory.newRadialAxisLabels("Maths", "Arts", "French", "German", "Music");
		        RadialAxisLabels radialAxisLabels = AxisLabelsFactory.newRadialAxisLabels(axisLabelList);
		        radialAxisLabels.setRadialAxisStyle(BLACK, 12);
		        chart.addRadialAxisLabels(radialAxisLabels);
		         AxisLabels contrentricAxisLabels = AxisLabelsFactory.newNumericAxisLabels(Arrays.asList(0, 20, 40, 60, 80, 100));
		       
		        contrentricAxisLabels.setAxisStyle(AxisStyle.newAxisStyle(BLACK, 12, AxisTextAlignment.RIGHT));
		        chart.addConcentricAxisLabels(contrentricAxisLabels);
		        String url = chart.toURLString();				
				
				 
		        logger.info(" radarURL :"+url); 
		       
		      
		        department.setRadarURL(url)	;	 
				
				mav.addObject("department", department);	
			}				  
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}	
	
	
	
	@RequestMapping(value="markDepartmentRecalInit.htm", method = RequestMethod.GET)
	public ModelAndView markDepartmentRecalInit() {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("markDepartmentRecal");
		try{
			BuckWaRequest request = new BuckWaRequest(); 			 
			String headUserName = BuckWaUtils.getUserNameFromContext();
			String academicYear =schoolUtil.getCurrentAcademicYear();	
			String departmentName =schoolUtil.getDepartmentByHeadUserName(headUserName, academicYear);
			mav.addObject("departmentName",departmentName);
			mav.addObject("academicYear",academicYear);
 			  
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}		
	
//	@RequestMapping(value="markDepartmentRecal.htm", method = RequestMethod.GET)
//	public ModelAndView markDepartmentRecal() {
//		logger.info(" Start  ");
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("markDepartmentRecal");
//		try{
//			BuckWaRequest request = new BuckWaRequest(); 			 
//			String headUserName = BuckWaUtils.getUserNameFromContext();
//			String academicYear =schoolUtil.getCurrentAcademicYear();	
//			String departmentName =schoolUtil.getDepartmentByUserName(headUserName, academicYear);
// 			request.put("departmentName",departmentName);
//			request.put("headUserName",headUserName);
//			request.put("academicYear",academicYear);
//			request.put("status",""); 
//			BuckWaResponse response = headService.markDepartmentRecal(request);
//			if(response.getStatus()==BuckWaConstants.SUCCESS){	
//				mav.addObject("successCode", response.getSuccessCode()); 
//			}				  
//		}catch(Exception ex){
//			ex.printStackTrace();
//			mav.addObject("errorCode", "E001"); 
//		}
//		return mav;
//	}	
	
	@RequestMapping(value="markDepartmentRecal.htm", method = RequestMethod.GET)
	public ModelAndView markDepartmentRecal() {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("markDepartmentRecal");
		try{
			BuckWaRequest request = new BuckWaRequest(); 
			 
			String headUserName = BuckWaUtils.getUserNameFromContext();
			String academicYear =schoolUtil.getCurrentAcademicYear();
			
			request.put("headUserName",headUserName);
			request.put("academicYear",academicYear);
			request.put("status",""); 
			BuckWaResponse response = headService.getDepartmentMark(request);
			//BuckWaResponse response = headService.getDepartmentMarkByDepCode(request);
			
			if(response.getStatus()==BuckWaConstants.SUCCESS){	
				Department department = (Department)response.getResObj("department"); 
				department.setAcademicYear(academicYear);
				 request = new BuckWaRequest(); 
				 String facultyCode =department.getFacultyCode();
				request.put("academicYear",academicYear);
				request.put("facultyCode",facultyCode);
				 //response = pBPWorkTypeService.getByAcademicYear(request);
				 response = pBPWorkTypeService.getByAcademicYearFacultyCode(request);
				if(response.getStatus()==BuckWaConstants.SUCCESS){	
					PBPWorkTypeWrapper pBPWorkTypeWrapper = (PBPWorkTypeWrapper)response.getResObj("pBPWorkTypeWrapper"); 
					List<PBPWorkType> pBPWorkTypeList = pBPWorkTypeWrapper.getpBPWorkTypeList();
					
					
					for(PBPWorkType typeTmp:pBPWorkTypeList){
					 
						String shortDesc ="";
						StringTokenizer st = new StringTokenizer(typeTmp.getName(), " ");
						int numberOfSt =1;
				        while (st.hasMoreElements()) { 
				        
				        	String stStr = st.nextElement().toString();
				        	logger.info(" numberOfSt:"+numberOfSt+"  stStr:"+ stStr);
				            if(numberOfSt==1){
				            	shortDesc = stStr;
				            }
				            if(numberOfSt==2){
				            	//axisLables = axisLables +" "
				            	//st.nextElement();
				            }
				            numberOfSt++;
				        } 	
				        
				        typeTmp.setShortDesc(shortDesc);
				        
				        
				 
				        // Sum total mark
				     List<AcademicPerson>  academicPersonListMark = department.getAcademicPersonList();
				     BigDecimal totalMark = new BigDecimal(0.00);
				     int totalPerson =0;
				     for(AcademicPerson personTmp: academicPersonListMark){
				    	 
				    	List<PBPWorkType> pBPWorkTypeListTotalMark	= personTmp.getpBPWorkTypeWrapper().getpBPWorkTypeList();
				    	
				    	if(pBPWorkTypeListTotalMark!=null){
				    		
				    	
					      for(PBPWorkType totalMarkTmp:pBPWorkTypeListTotalMark){
					    	//  System.out.print(" totalMarkTmp id:"+totalMarkTmp.getWorkTypeId());
					    	  
					    	  if(typeTmp.getWorkTypeId().intValue()==totalMarkTmp.getWorkTypeId().intValue()){ 
					  			
						 
									//totalMark = totalMark.add(totalMarkTmp.getTotalInPercentCompareBaseWorkType());
									totalMark = totalMark.add(totalMarkTmp.getTotalInWorkType());
									typeTmp.setTotalInWorkType(totalMark);
									 logger.info(" Controller TotalInWorkType:"+totalMarkTmp.getTotalInWorkType());
					    	  }
					    	  
					      }
					      
				    	}
					      totalPerson++;  
					       
				     }
				     
				     
			 
				     
				     if(totalPerson==0){
				    	 totalPerson=1;
				     }
				     logger.info(" totalmark Faculty:"+totalMark+"  totalperson:"+totalPerson);
				   //  BigDecimal totalInPercentCompareBaseWorkTypeAVG = totalMark.divide(new BigDecimal(totalPerson) ,2, BigDecimal.ROUND_HALF_UP);
 
				     typeTmp.setTotalAllWorkType(totalMark); 
				    // typeTmp.setTotalInPercentCompareBaseWorkType(totalMark);
				    // typeTmp.setTotalInPercentCompareBaseWorkTypeAVG(totalInPercentCompareBaseWorkTypeAVG);
				 
					}
					
					department.setpBPWorkTypeList(pBPWorkTypeList);
					
					// Save Department Summary to DB
					
					
					request.put("academicYear",academicYear);
					request.put("facultyCode",department.getFacultyCode());
					response =  facultyService.getFacultyByCodeAndYear(request);
					if(response.getStatus()==BuckWaConstants.SUCCESS){	
						Faculty faculty = (Faculty)response.getResObj("faculty");  
						logger.info(" #### Faculty:"+ BeanUtils.getBeanString(faculty));
						department.setFaculty(faculty);
						
						request.put("department",department);
						headService.saveDepartmentReportSummary(request);
					}
					 
				}	 
				 
				
				
				List<String> axisLabelList =new ArrayList();
				List<Number> dataList = new ArrayList();				
				BigDecimal data1 = null;				
				List<PBPWorkType> pBPWorkTypeList = department.getpBPWorkTypeList();		
				
				
				List<BigDecimal> pointList  = new ArrayList();
				for(PBPWorkType typeTmp:pBPWorkTypeList){
		 
					//pointList.add(typeTmp.getTotalInPercentCompareBaseWorkType()) ;
					pointList.add(typeTmp.getTotalInPercentCompareBaseWorkTypeAVG()) ;
		 
			
				}
				
				BigDecimal maxPoint =Collections.max(pointList);
				
				
				int loop =0;
				for(PBPWorkType typeTmp:pBPWorkTypeList){
					logger.info(" loop:"+loop);
					String tempLabel ="";
					StringTokenizer st = new StringTokenizer(typeTmp.getName(), " ");
					int numberOfSt =1;
			        while (st.hasMoreElements()) { 			        
			        	String stStr = st.nextElement().toString();
			        	logger.info(" numberOfSt:"+numberOfSt+"  stStr:"+ stStr);
			            if(numberOfSt==1){
			            	tempLabel = stStr;
			            }
			            if(numberOfSt==2){
			            	//axisLables = axisLables +" "
			            	//st.nextElement();
			            }
			            numberOfSt++;
			        }
					
			        axisLabelList.add(tempLabel);
			        
			        logger.info("typeTmp.getTotalInPercentCompareBaseWorkTypeAVG():"+typeTmp.getTotalInPercentCompareBaseWorkTypeAVG()+" data1:"+data1+"  maxPoint:"+ maxPoint);
			     //   BigDecimal weight100  = typeTmp.getTotalInPercentCompareBaseWorkType().multiply(new BigDecimal(100)).setScale(2,BigDecimal.ROUND_UP).divide(maxPoint).setScale(2,BigDecimal.ROUND_UP);
			      //  BigDecimal weight100AVG  = typeTmp.getTotalInPercentCompareBaseWorkTypeAVG().multiply(new BigDecimal(100)).divide(maxPoint,2, BigDecimal.ROUND_HALF_UP).setScale(0,BigDecimal.ROUND_UP);
 
			     
			      //  data1 =weight100;
			      //  data1 =weight100AVG;
			        data1=typeTmp.getTotalInPercentCompareBaseWorkTypeAVG();
			       
			        // if(loop==0){
			        //	data1 =typeTmp.getTotalInPercentCompareBaseWorkType().multiply(new BigDecimal(2)).setScale(0,BigDecimal.ROUND_UP);
			       // }
					
					loop++;
					//dataList.add(typeTmp.getTotalInPercentCompareBaseWorkType() .multiply(new BigDecimal(2)).setScale(0,BigDecimal.ROUND_UP));
							
					dataList.add(data1);
				}
				
			
				
				
				logger.info(" Data List Value  ");
				for(Number datax :dataList){
					logger.info("    "+datax);
				}
				
			   	 
				
		        RadarPlot plot = Plots.newRadarPlot(Data.newData(dataList));
		       // RadarPlot plot = Plots.newRadarPlot(Data.newData(80, 50, 50, 80, 60,80));
		       // RadarPlot plot = Plots.newRadarPlot(Data.newData(0.76, 51.28,55,15.4, 5,0.76));
		       
		        Color plotColor = Color.newColor("CC3366");
		        plot.addShapeMarkers(Shape.SQUARE, plotColor, 5);
		        plot.addShapeMarkers(Shape.SQUARE, plotColor, 3);
		        plot.setColor(plotColor);
		        plot.setLineStyle(LineStyle.newLineStyle(2, 1, 0));
		        RadarChart chart = GCharts.newRadarChart(plot);
		      //  chart.setTitle("����������ҹ", BLACK, 20);
		        chart.setSize(500, 500);
		       // RadialAxisLabels radialAxisLabels = AxisLabelsFactory.newRadialAxisLabels("Maths", "Arts", "French", "German", "Music");
		        RadialAxisLabels radialAxisLabels = AxisLabelsFactory.newRadialAxisLabels(axisLabelList);
		        radialAxisLabels.setRadialAxisStyle(BLACK, 12);
		        chart.addRadialAxisLabels(radialAxisLabels);
		         AxisLabels contrentricAxisLabels = AxisLabelsFactory.newNumericAxisLabels(Arrays.asList(0, 20, 40, 60, 80, 100));
		       
		        contrentricAxisLabels.setAxisStyle(AxisStyle.newAxisStyle(BLACK, 12, AxisTextAlignment.RIGHT));
		        chart.addConcentricAxisLabels(contrentricAxisLabels);
		        String url = chart.toURLString();				
				
				 
		        logger.info(" radarURL :"+url); 
		       
		      
		        department.setRadarURL(url)	;	 
				
				mav.addObject("department", department);	
			}
			
			//response.setSuccessCode("S100");	
			mav.addObject("successCode", "S100"); 
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}		
	
	
	@RequestMapping(value="replyMessage.htm", method = RequestMethod.POST)
	public ModelAndView replyMessage(HttpServletRequest httpRequest, @ModelAttribute AcademicKPIUserMappingWrapper academicKPIUserMappingWrapper , BindingResult result) {
		ModelAndView mav = new ModelAndView();
		try{			
			logger.info(" ## replyMessage:"+academicKPIUserMappingWrapper.getReplyMessage());
			 
			new ReplyPBPMessageValidator().validate(academicKPIUserMappingWrapper, result);			
			if (result.hasErrors()) {				
				mav.setViewName("viewImportWork");
			}else {					
				BuckWaRequest request = new BuckWaRequest();
				 
				
				Message newMessage = new Message();
				newMessage.setMessageDetail(academicKPIUserMappingWrapper.getReplyMessage());
				newMessage.setTopicId(academicKPIUserMappingWrapper.getAcademicKPIUserMapping().getKpiUserMappingId());
				newMessage.setStatus("1");				
				newMessage.setCreateBy(BuckWaUtils.getFullNameFromContext());
				request.put("message", newMessage);
				logger.info(" replyMessage newMessage:"+BeanUtils.getBeanString(newMessage));
				BuckWaResponse response = webboardTopicService.replyPBPMessage(request);
				if(response.getStatus()==BuckWaConstants.SUCCESS){		
				 
					mav.addObject("successCode", response.getSuccessCode()); 
					academicKPIUserMappingWrapper.setReplyMessage("");
					mav = viewWork(academicKPIUserMappingWrapper.getAcademicKPIUserMapping().getKpiUserMappingId()+"");	
				}else {
					mav.addObject("errorCode", response.getErrorCode()); 
					 
				}				
			}							
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}	
	
	
}
