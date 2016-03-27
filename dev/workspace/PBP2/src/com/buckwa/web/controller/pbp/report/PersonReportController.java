package com.buckwa.web.controller.pbp.report;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pam.Person;
import com.buckwa.service.intf.pbp.HeadService;
import com.buckwa.util.BuckWaConstants;
import com.buckwa.util.BuckWaUtils;
import com.buckwa.util.school.SchoolUtil;
 
 
@Controller
@RequestMapping("/personReport") 
public class PersonReportController { 
	private static Logger logger = Logger.getLogger(PersonReportController.class);
	
	@Autowired
	private SchoolUtil schoolUtil;
	
	@Autowired
	private HeadService headService;
	
	

	
	
	@RequestMapping(value = "/init.htm", method = RequestMethod.GET)
	public ModelAndView radarChart() {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		//mav.addObject("user", new User());	
		mav.setViewName("personReportInit");
		logger.info(" End  ");
		return mav;
	}
 
	
	
	@RequestMapping(value = "/barChart.htm", method = RequestMethod.GET)
	public ModelAndView barChart() {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		try{
			String academicYear =schoolUtil.getCurrentAcademicYear();
			String userName = BuckWaUtils.getUserNameFromContext();
			String facultyName = schoolUtil.getFacutyByUserName(userName, academicYear);
			String departmentName = schoolUtil.getDepartmentByUserName(userName, academicYear);
			
			String facultyCode = schoolUtil.getFacultyCodeByFacultyName(facultyName, academicYear);
			String departmentCode  = schoolUtil.getDepartmentCodeByDepartmentName(departmentName, academicYear);
			
			
		    mav.addObject("departmentName", schoolUtil.getDepartmentByUserName(userName,academicYear));	
		    
		     
		    // Get Mean Value (faculty_code,department_code,academic_year)
			 
			BuckWaRequest request = new BuckWaRequest();
			request.put("academicYear", academicYear);
			request.put("facultyCode", facultyCode);
			request.put("departmentCode", departmentCode);
			
			BuckWaResponse response =headService.getDepartmentMean(request);
		 
			if (response.getStatus() == BuckWaConstants.SUCCESS) {
				String mean = (String) response.getResObj("meanValue");
				logger.info(" mean value = "+mean);
				mav.addObject("mean", mean);	
			}
		    
		    
		}catch(Exception ex){
			ex.printStackTrace();
		}
		mav.setViewName("personBarchartInit");
		logger.info(" End  ");
		return mav;
	}
	
	@RequestMapping(value = "/workTypeBarChart.htm", method = RequestMethod.GET)
	public ModelAndView workTypeBarChart() {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		try{
			String academicYear =schoolUtil.getCurrentAcademicYear();
		mav.addObject("departmentName", schoolUtil.getDepartmentByUserName(BuckWaUtils.getUserNameFromContext(),academicYear));	
		}catch(Exception ex){
			ex.printStackTrace();
		}
		mav.setViewName("personWorkTypeBarchartInit");
		logger.info(" End  ");
		return mav;
	}

}
