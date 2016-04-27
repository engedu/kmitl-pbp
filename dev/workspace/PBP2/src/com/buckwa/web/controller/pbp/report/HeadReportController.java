package com.buckwa.web.controller.pbp.report;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pbp.report.MinMaxBean;
import com.buckwa.service.intf.pbp.HeadService;
import com.buckwa.util.BuckWaConstants;
import com.buckwa.util.BuckWaUtils;
import com.buckwa.util.school.SchoolUtil;
 
 
@Controller
@RequestMapping("/headReport") 
public class HeadReportController { 
	private static Logger logger = Logger.getLogger(HeadReportController.class);
	
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
		mav.addObject("departmentName", schoolUtil.getDepartmentByHeadUserName(BuckWaUtils.getUserNameFromContext(),academicYear));	
		}catch(Exception ex){
			ex.printStackTrace();
		}
		mav.setViewName("headBarchartInit");
		logger.info(" End  ");
		return mav;
	}
	
	@RequestMapping(value = "/workTypeBarChart.htm", method = RequestMethod.GET)
	public ModelAndView workTypeBarChart() {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		
		String academicYear =schoolUtil.getCurrentAcademicYear();
		try{
			
		mav.addObject("departmentName", schoolUtil.getDepartmentByHeadUserName(BuckWaUtils.getUserNameFromContext(),academicYear));	

		
		String userName = BuckWaUtils.getUserNameFromContext();
		
		String departmentName = schoolUtil.getDepartmentByHeadUserName(userName, academicYear);
		String departmentCode  = schoolUtil.getDepartmentCodeByDepartmentName(departmentName, academicYear);
	 
		String facultyCode = schoolUtil.getFacultyCodeByDepartmentName(departmentName, academicYear);
		
		
		BuckWaRequest request = new BuckWaRequest();
		request.put("academicYear", academicYear);
		request.put("facultyCode", facultyCode);
		request.put("departmentCode", departmentCode);
		
		
		
		request.put("worktypeCode", "1");
		BuckWaResponse response =headService.getDepartmentMeanByWorkTypeCode(request);	 
		if (response.getStatus() == BuckWaConstants.SUCCESS) {
			MinMaxBean minMaxBean = (MinMaxBean) response.getResObj("minMaxBean");		
			
			mav.addObject("mean1", minMaxBean.getMeanValue());	
			mav.addObject("minValue1", minMaxBean.getMinValue());	
			mav.addObject("maxValue1", minMaxBean.getMaxValue());	
			mav.addObject("minDesc1", minMaxBean.getMinDesc());	
			mav.addObject("maxDesc1", minMaxBean.getMaxDesc());			 
		 
		}
		
		request.put("worktypeCode", "2");
		response =headService.getDepartmentMeanByWorkTypeCode(request);	 
		if (response.getStatus() == BuckWaConstants.SUCCESS) {
			MinMaxBean minMaxBean = (MinMaxBean) response.getResObj("minMaxBean");		
			
			mav.addObject("mean2", minMaxBean.getMeanValue());	
			mav.addObject("minValue2", minMaxBean.getMinValue());	
			mav.addObject("maxValue2", minMaxBean.getMaxValue());	
			mav.addObject("minDesc2", minMaxBean.getMinDesc());	
			mav.addObject("maxDesc2", minMaxBean.getMaxDesc());		
		}	
		
		request.put("worktypeCode", "3");
		response =headService.getDepartmentMeanByWorkTypeCode(request);	 
		if (response.getStatus() == BuckWaConstants.SUCCESS) {
			MinMaxBean minMaxBean = (MinMaxBean) response.getResObj("minMaxBean");		
			
			mav.addObject("mean3", minMaxBean.getMeanValue());	
			mav.addObject("minValue3", minMaxBean.getMinValue());	
			mav.addObject("maxValue3", minMaxBean.getMaxValue());	
			mav.addObject("minDesc3", minMaxBean.getMinDesc());	
			mav.addObject("maxDesc3", minMaxBean.getMaxDesc());		
		}		
		
		request.put("worktypeCode", "4");
		response =headService.getDepartmentMeanByWorkTypeCode(request);	 
		if (response.getStatus() == BuckWaConstants.SUCCESS) {
			MinMaxBean minMaxBean = (MinMaxBean) response.getResObj("minMaxBean");		
			
			mav.addObject("mean4", minMaxBean.getMeanValue());	
			mav.addObject("minValue4", minMaxBean.getMinValue());	
			mav.addObject("maxValue4", minMaxBean.getMaxValue());	
			mav.addObject("minDesc4", minMaxBean.getMinDesc());	
			mav.addObject("maxDesc4", minMaxBean.getMaxDesc());		
		}		
		
		request.put("worktypeCode", "5");
		response =headService.getDepartmentMeanByWorkTypeCode(request);	 
		if (response.getStatus() == BuckWaConstants.SUCCESS) {
			MinMaxBean minMaxBean = (MinMaxBean) response.getResObj("minMaxBean");		
			
			mav.addObject("mean5", minMaxBean.getMeanValue());	
			mav.addObject("minValue5", minMaxBean.getMinValue());	
			mav.addObject("maxValue5", minMaxBean.getMaxValue());
			mav.addObject("minDesc5", minMaxBean.getMinDesc());	
			mav.addObject("maxDesc5", minMaxBean.getMaxDesc());		
			
		
		}	
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		mav.setViewName("headWorkTypeBarchartInit");
		logger.info(" End  ");
		return mav;
	}

}
