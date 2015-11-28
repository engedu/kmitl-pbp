package com.buckwa.web.controller.pbp.report;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pbp.Faculty;
import com.buckwa.domain.pbp.report.DepartmentWorkTypeReport;
import com.buckwa.domain.pbp.report.WorkTypeCompareReport;
import com.buckwa.service.intf.pbp.DeanService;
import com.buckwa.service.intf.pbp.FacultyService;
import com.buckwa.util.BuckWaConstants;
import com.buckwa.util.BuckWaUtils;
import com.buckwa.util.school.SchoolUtil;
 
 
@Controller
@RequestMapping("/deanReport") 
public class DeanReportController { 
	private static Logger logger = Logger.getLogger(DeanReportController.class);
	
	@Autowired
	private SchoolUtil schoolUtil;

	@Autowired
	private FacultyService facultyService;
	
	@Autowired
	private DeanService deanService;
	
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
		mav.addObject("facultyName", schoolUtil.getFacutyByUserName(BuckWaUtils.getUserNameFromContext(),academicYear));	
		}catch(Exception ex){
			ex.printStackTrace();
		}
		mav.setViewName("deanBarchartInit");
		logger.info(" End  ");
		return mav;
	}
	
	@RequestMapping(value = "/workTypeBarChart.htm", method = RequestMethod.GET)
	public ModelAndView workTypeBarChart() {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		try{
			String academicYear =schoolUtil.getCurrentAcademicYear();
		mav.addObject("facultyName", schoolUtil.getFacutyByUserName(BuckWaUtils.getUserNameFromContext(),academicYear));	
		
		}catch(Exception ex){
			ex.printStackTrace();
		}
		mav.setViewName("deanWorkTypeBarchartInit");
		logger.info(" End  ");
		return mav;
	}
	
	@RequestMapping(value = "/workTypeCompareBarChart.htm", method = RequestMethod.GET)
	public ModelAndView workTypeCompareBarChart() {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		try {
			String academicYear =schoolUtil.getCurrentAcademicYear();
			mav.addObject("facultyName", schoolUtil.getFacutyByUserName(BuckWaUtils.getUserNameFromContext(),academicYear));
			
			WorkTypeCompareReport workTypeCompareReport = new WorkTypeCompareReport();
			workTypeCompareReport.setType1(false);
			workTypeCompareReport.setType2(false);
			workTypeCompareReport.setType3(false);
			workTypeCompareReport.setType4(false);
			workTypeCompareReport.setType5(false);
			mav.addObject("workTypeCompareReport", workTypeCompareReport);
			
			String rptObjJSON = JSONObject.valueToString(new String[0]);
			mav.addObject("rptObjJSON", rptObjJSON);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		mav.setViewName("deanWorkTypeCompareBarchartInit");
		logger.info(" End  ");
		return mav;
	}
	
	@RequestMapping(value = "/workTypeCompareBarChart.htm", method = RequestMethod.POST)
	public ModelAndView genWorkTypeCompareBarChart(@ModelAttribute WorkTypeCompareReport workTypeCompareReport) {
		logger.info(" Start  ");
		
		ModelAndView mav = new ModelAndView();
		
		
		try {
			String academicYear =schoolUtil.getCurrentAcademicYear();
			mav.addObject("facultyName", schoolUtil.getFacutyByUserName(BuckWaUtils.getUserNameFromContext(),academicYear));
			
			BuckWaRequest request = new BuckWaRequest();

			String userName = BuckWaUtils.getUserNameFromContext();
		 

			request.put("username", userName);
			request.put("academicYear", academicYear);
			BuckWaResponse response = facultyService.getFacultyByUserNameandYear(request);

			if (response.getStatus() == BuckWaConstants.SUCCESS) {
				Faculty faculty = (Faculty) response.getResObj("faculty");
				if (faculty != null) {
					request.put("faculty", faculty);
					response = deanService.getReportWorkTypeCompareFaculty(request);

					if (response.getStatus() == BuckWaConstants.SUCCESS) {
						List<DepartmentWorkTypeReport> reportWorkTypeDepartmentList = (List<DepartmentWorkTypeReport>) response.getResObj("facultyWorkTypeReportList");
						//int loopx = 0;
						WorkTypeCompareReport rptObj;
						List<WorkTypeCompareReport> returnList = new ArrayList<WorkTypeCompareReport>();
						for (DepartmentWorkTypeReport workType : reportWorkTypeDepartmentList) {
							
							if (workTypeCompareReport.isType1()) {
								rptObj = new WorkTypeCompareReport();
								rptObj.setOrderNo(1);
								rptObj.setCategoryName(workType.getDepartmentName());
								rptObj.setGroupName(workType.getTypeName1());
								rptObj.setAxisValue(workType.getMark1());
								returnList.add(rptObj);
							}
							if (workTypeCompareReport.isType2()) {
								rptObj = new WorkTypeCompareReport();
								rptObj.setOrderNo(2);
								rptObj.setCategoryName(workType.getDepartmentName());
								rptObj.setGroupName(workType.getTypeName2());
								rptObj.setAxisValue(workType.getMark2());
								returnList.add(rptObj);
							}
							if (workTypeCompareReport.isType3()) {
								rptObj = new WorkTypeCompareReport();
								rptObj.setOrderNo(3);
								rptObj.setCategoryName(workType.getDepartmentName());
								rptObj.setGroupName(workType.getTypeName3());
								rptObj.setAxisValue(workType.getMark3());
								returnList.add(rptObj);
							}
							if (workTypeCompareReport.isType4()) {
								rptObj = new WorkTypeCompareReport();
								rptObj.setOrderNo(4);
								rptObj.setCategoryName(workType.getDepartmentName());
								rptObj.setGroupName(workType.getTypeName4());
								rptObj.setAxisValue(workType.getMark4());
								returnList.add(rptObj);
							}
							if (workTypeCompareReport.isType5()) {
								rptObj = new WorkTypeCompareReport();
								rptObj.setOrderNo(5);
								rptObj.setCategoryName(workType.getDepartmentName());
								rptObj.setGroupName(workType.getTypeName5());
								rptObj.setAxisValue(workType.getMark5());
								returnList.add(rptObj);
							}
							//loopx++;
						}
						String rptObjJSON = JSONObject.valueToString(returnList);
						mav.addObject("rptObjJSON", rptObjJSON);
					}
				}
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		mav.setViewName("deanWorkTypeCompareBarchartInit");
		logger.info(" End  ");
		return mav;
	}

}