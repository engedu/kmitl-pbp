package com.buckwa.web.controller.pbp.report;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.buckwa.util.BuckWaUtils;
import com.buckwa.util.school.SchoolUtil;
 
 
@Controller
@RequestMapping("/personReport") 
public class PersonReportController { 
	private static Logger logger = Logger.getLogger(PersonReportController.class);
	
	@Autowired
	private SchoolUtil schoolUtil;

	
	
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
		mav.addObject("departmentName", schoolUtil.getDepartmentByUserName(BuckWaUtils.getUserNameFromContext(),academicYear));	
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
