package com.buckwa.web.controller.json;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.buckwa.domain.BuckWaUser;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pam.Person;
import com.buckwa.domain.pbp.Department;
import com.buckwa.domain.pbp.Faculty;
import com.buckwa.domain.pbp.report.DepartmentWorkTypeReport;
import com.buckwa.domain.pbp.report.FacultyReportLevel;
import com.buckwa.domain.pbp.report.RadarPlotReport;
import com.buckwa.service.intf.pam.PersonProfileService;
import com.buckwa.service.intf.pbp.DeanService;
import com.buckwa.service.intf.pbp.FacultyService;
import com.buckwa.service.intf.pbp.HeadService;
import com.buckwa.service.intf.pbp.PBPReportService;
import com.buckwa.util.BuckWaConstants;
import com.buckwa.util.BuckWaUtils;
import com.buckwa.util.school.SchoolUtil;
import com.buckwa.web.util.AcademicYearUtil;

@RestController
@RequestMapping("/dean")
public class JSONDeanController {

	private static Logger logger = Logger.getLogger(JSONDeanController.class);

	@Autowired
	private SchoolUtil schoolUtil;

	@Autowired
	private AcademicYearUtil academicYearUtil;

	@Autowired
	private DeanService deanService;

	@Autowired
	private PBPReportService pbpReportService;

	@Autowired
	private FacultyService facultyService;
	
	@Autowired
	private HeadService headService;
	
	@Autowired
	private PersonProfileService personProfileService;

	@RequestMapping(value = "/facultyReport", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<RadarPlotReport> facultyReport() {

		List<RadarPlotReport> returnList = new ArrayList<RadarPlotReport>();
		logger.info(" Start  academicYear:" + academicYearUtil.getAcademicYear());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("initPerson");
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.PERSON_INIT);
		try {

			BuckWaUser user = BuckWaUtils.getUserFromContext();
			logger.info("viewUserProfile  username :" + user.getUsername());

			BuckWaRequest request = new BuckWaRequest();

			request.put("username", user.getUsername());
			request.put("academicYear", academicYearUtil.getAcademicYear());

			BuckWaResponse response = facultyService.getFacultyByDeanUserNameandYear(request);
			if (response.getStatus() == BuckWaConstants.SUCCESS) {
				Faculty faculty = (Faculty) response.getResObj("faculty");

				request.put("facultyCode", faculty.getCode());
				request.put("academicYear", academicYearUtil.getAcademicYear());
				response = pbpReportService.getFacultyReportByAcademicYear(request);

				if (response.getStatus() == BuckWaConstants.SUCCESS) {

					returnList = (List<RadarPlotReport>) response.getResObj("radarPlotReportList");

				}

			}

		} catch (Exception ex) {
			ex.printStackTrace();
			mav.addObject(BuckWaConstants.ERROR_CODE, BuckWaConstants.ERROR_E001);
		}

		return returnList;
	}

	@RequestMapping(value = "/getDepartmentBarchart/{headUserName}", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<RadarPlotReport> getDepartmentBarchart(@PathVariable String headUserName) {
		logger.info(" headUserName:" + headUserName);
		List<RadarPlotReport> returnList = new ArrayList<RadarPlotReport>();
		ModelAndView mav = new ModelAndView();
	 
		try {
			BuckWaRequest request = new BuckWaRequest();
//			StringTokenizer st2 = new StringTokenizer(headUserName, "@");
//			int loop =0;
//			while (st2.hasMoreElements()) {			
//				if(loop==0){
//					headUserName = headUserName+st2.nextElement()+"@kmilt.ac.th";
//				}
//				loop++;
//			}
//			
			
			headUserName =headUserName+"@kmitl.ac.th";
			
			String academicYear = schoolUtil.getCurrentAcademicYear();
 
			request.put("username", headUserName);
			request.put("academicYear", academicYear);
			BuckWaResponse response = facultyService.getDepartmentByHeadUserNameandYear(request);

			if (response.getStatus() == BuckWaConstants.SUCCESS) {
				Department department = (Department) response.getResObj("department");

				if (department != null) {

					request.put("department", department);
					request.put("academicYear", academicYear);
					response = headService.getReportWorkTypeDepartment(request);

					if (response.getStatus() == BuckWaConstants.SUCCESS) {
						List<DepartmentWorkTypeReport> reportWorkTypeDepartmentList = (List<DepartmentWorkTypeReport>) response.getResObj("departmentWorkTypeReportList");

						request.put("username", headUserName);
						request.put("academicYear", academicYear);
						response = personProfileService.getByUsername(request);
						if (response.getStatus() == BuckWaConstants.SUCCESS) {
							Person person = (Person) response.getResObj("person");
							String firstLast = person.getThaiName() + " " + person.getThaiSurname();

							int loopx = 1;
							for (DepartmentWorkTypeReport personTmp : reportWorkTypeDepartmentList) {
								String tmpRegId = personTmp.getPersonName();
								RadarPlotReport reportTmp = new RadarPlotReport();
								// if(!firstLast.equalsIgnoreCase(tmpRegId)){
								reportTmp.setAxisName(" ");
								// }else{
								reportTmp.setAxisName(personTmp.getPersonName());
								// }

								reportTmp.setAxisValue(personTmp.getMarkTotal());

								reportTmp.setOrderNo(loopx);
								returnList.add(reportTmp);
								loopx++;
							}

							mav.addObject("department", department);
						}
					}

				}
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			mav.addObject("errorCode", "E001");
		}
		return returnList;
	}

	
	@RequestMapping(value = "/getBarchart", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<RadarPlotReport> getBarchart() {

		List<RadarPlotReport> returnList = new ArrayList<RadarPlotReport>();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("markDepartment");
		try {
			BuckWaRequest request = new BuckWaRequest();

			String userName = BuckWaUtils.getUserNameFromContext();
			String academicYear = schoolUtil.getCurrentAcademicYear();

			request.put("username", userName);
			request.put("academicYear", academicYear);
			BuckWaResponse response = facultyService.getFacultyByDeanUserNameandYear(request);

			if (response.getStatus() == BuckWaConstants.SUCCESS) {
				Faculty faculty = (Faculty) response.getResObj("faculty");

				if (faculty != null) {

					request.put("faculty", faculty);
					request.put("academicYear", academicYear);
					response = deanService.getFacultyReportLevel(request);

					if (response.getStatus() == BuckWaConstants.SUCCESS) {
						List<FacultyReportLevel> reportWorkTypeDepartmentList = (List<FacultyReportLevel>) response.getResObj("facultyReportLevelList");
						int loop = 1;
						for (FacultyReportLevel personTmp : reportWorkTypeDepartmentList) {

							RadarPlotReport reportTmp = new RadarPlotReport();
							logger.info(" " + loop + "  " + personTmp.getDepartmentName() + " : " + personTmp.getMark());
							reportTmp.setAxisName(personTmp.getDepartmentName());

							reportTmp.setAxisValue(personTmp.getMark());
							reportTmp.setOrderNo(loop);
							returnList.add(reportTmp);

							loop++;

						}

						mav.addObject("faculty", faculty);
					}
				}

			}

		} catch (Exception ex) {
			ex.printStackTrace();
			mav.addObject("errorCode", "E001");
		}
		return returnList;
	}

	@RequestMapping(value = "/getWorkTypeBarchart/{worktypecode}", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<RadarPlotReport> getWorkTypeBarChartReport(@PathVariable String worktypecode) {

		List<RadarPlotReport> returnList = new ArrayList<RadarPlotReport>();
		// ModelAndView mav = new ModelAndView();
		// mav.setViewName("markDepartment");
		try {
			BuckWaRequest request = new BuckWaRequest();

			String userName = BuckWaUtils.getUserNameFromContext();
			String academicYear = schoolUtil.getCurrentAcademicYear();

			request.put("username", userName);
			request.put("academicYear", academicYear);
			BuckWaResponse response = facultyService.getFacultyByDeanUserNameandYear(request);

			if (response.getStatus() == BuckWaConstants.SUCCESS) {
				Faculty faculty = (Faculty) response.getResObj("faculty");

				if (faculty != null) {

					request.put("faculty", faculty);
					request.put("workType", worktypecode);
					response = deanService.getReportWorkTypeFaculty(request);

					if (response.getStatus() == BuckWaConstants.SUCCESS) {
						List<DepartmentWorkTypeReport> reportWorkTypeDepartmentList = (List<DepartmentWorkTypeReport>) response.getResObj("facultyWorkTypeReportList");

						// request.put("username",userName);
						// request.put("academicYear",academicYear);
						// response
						// =personProfileService.getByUsername(request);
						// if(response.getStatus()==BuckWaConstants.SUCCESS){
						// Person person = (Person)
						// response.getResObj("person");
						// String firstLast =
						// person.getThaiName()+" "+person.getThaiSurname();

						int loopx = 0;
						for (DepartmentWorkTypeReport personTmp : reportWorkTypeDepartmentList) {
							// String tmpRegId = personTmp.get
							RadarPlotReport reportTmp = new RadarPlotReport();
							// if(!firstLast.equalsIgnoreCase(tmpRegId)){
							// reportTmp.setAxisName( " " );
							// }else{
							reportTmp.setAxisName(personTmp.getDepartmentName());
							// }

							if ("1".equals(worktypecode)) {
								reportTmp.setAxisValue(personTmp.getMark1());
							} else if ("2".equals(worktypecode)) {
								reportTmp.setAxisValue(personTmp.getMark2());
							} else if ("3".equals(worktypecode)) {
								reportTmp.setAxisValue(personTmp.getMark3());
							} else if ("4".equals(worktypecode)) {
								reportTmp.setAxisValue(personTmp.getMark4());
							} else if ("5".equals(worktypecode)) {
								reportTmp.setAxisValue(personTmp.getMark5());
							}
							reportTmp.setOrderNo(loopx);
							returnList.add(reportTmp);
							loopx++;
						}

						// mav.addObject("faculty", faculty);
					}
				}

				// }
			}
			logger.info(" worktypecode in :" + worktypecode);
		} catch (Exception ex) {
			ex.printStackTrace();
			// mav.addObject("errorCode", "E001");
		}
		return returnList;
	}

}
