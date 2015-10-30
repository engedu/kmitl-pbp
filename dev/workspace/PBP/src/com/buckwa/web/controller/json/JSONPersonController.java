package com.buckwa.web.controller.json;

import java.math.BigDecimal;
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
import com.buckwa.domain.pam.Paper;
import com.buckwa.domain.pam.Person;
import com.buckwa.domain.pbp.Department;
import com.buckwa.domain.pbp.PBPWorkType;
import com.buckwa.domain.pbp.PBPWorkTypeWrapper;
import com.buckwa.domain.pbp.report.DepartmentWorkTypeReport;
import com.buckwa.domain.pbp.report.RadarPlotReport;
import com.buckwa.service.intf.pam.PersonProfileService;
import com.buckwa.service.intf.pbp.FacultyService;
import com.buckwa.service.intf.pbp.HeadService;
import com.buckwa.service.intf.pbp.PBPWorkTypeService;
import com.buckwa.util.BuckWaConstants;
import com.buckwa.util.BuckWaUtils;
import com.buckwa.util.school.SchoolUtil;
import com.buckwa.web.util.AcademicYearUtil;

@RestController
@RequestMapping("/person")
public class JSONPersonController {
	private static Logger logger = Logger.getLogger(JSONPersonController.class);

	@Autowired
	private PersonProfileService personProfileService;

	@Autowired
	private FacultyService facultyService;

	@Autowired
	private PBPWorkTypeService pBPWorkTypeService;

	@Autowired
	private SchoolUtil schoolUtil;

	@Autowired
	private AcademicYearUtil academicYearUtil;

	@Autowired
	private HeadService headService;

	@RequestMapping(value = "/getRadarPlot", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<RadarPlotReport> radarPlot() {

		List<RadarPlotReport> returnList = new ArrayList<RadarPlotReport>();
		logger.info(" Start  academicYear:" + academicYearUtil.getAcademicYear());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("initPerson");
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.PERSON_INIT);
		try {

			String academicYear = academicYearUtil.getAcademicYear();
			BuckWaUser user = BuckWaUtils.getUserFromContext();
			logger.info("viewUserProfile  username :" + user.getUsername());

			BuckWaRequest request = new BuckWaRequest();
			request.put("username", user.getUsername());
			request.put("academicYear", academicYearUtil.getAcademicYear());
			BuckWaResponse response = personProfileService.getByUsername(request);

			if (response.getStatus() == BuckWaConstants.SUCCESS) {
				Person person = (Person) response.getResObj("person");
				user.setFirstLastName(person.getThaiName() + " " + person.getThaiSurname());
				List<Paper> paperList = (List<Paper>) response.getResObj("paperList");

				// Set Date format
				// person.setBirthdateStr(BuckWaDateUtils.get_current_ddMMMMyyyy_thai_from_date(person.getBirthdate()));
				// person.setWorkingDateStr(BuckWaDateUtils.get_current_ddMMMMyyyy_thai_from_date(person.getWorkingDate()));
				// person.setAssignDateStr(BuckWaDateUtils.get_current_ddMMMMyyyy_thai_from_date(person.getAssignDate()));
				// person.setRetireDateStr(BuckWaDateUtils.get_current_ddMMMMyyyy_thai_from_date(person.getRetireDate()));

				person.setAcademicYear(academicYear);
				person.setAcademicYearList(academicYearUtil.getAcademicYearList());
				person.setEvaluateRound("1");
				user.setPersonProfile(person);
				mav.addObject("person", person);
				mav.addObject("paperList", paperList);

				request.put("academicYear", academicYear);
				request.put("userName", BuckWaUtils.getUserNameFromContext());
				request.put("round", person.getEvaluateRound());
				request.put("employeeType", person.getEmployeeTypeNo());

				// response = pBPWorkTypeService.getByAcademicYear(request);
				response = pBPWorkTypeService.getCalculateByAcademicYear(request);

				if (response.getStatus() == BuckWaConstants.SUCCESS) {
					PBPWorkTypeWrapper pBPWorkTypeWrapper = (PBPWorkTypeWrapper) response.getResObj("pBPWorkTypeWrapper");
					pBPWorkTypeWrapper.setAcademicYear(academicYear);
					person.setpBPWorkTypeWrapper(pBPWorkTypeWrapper);
				}

				List<PBPWorkType> pBPWorkTypeList = person.getpBPWorkTypeWrapper().getpBPWorkTypeList();
				int loop = 0;
				for (PBPWorkType typeTmp : pBPWorkTypeList) {

					RadarPlotReport radartmp = new RadarPlotReport();
					logger.info(" loop:" + loop);
					String tempLabel = "";
					StringTokenizer st = new StringTokenizer(typeTmp.getName(), " ");
					int numberOfSt = 1;
					while (st.hasMoreElements()) {
						String stStr = st.nextElement().toString();
						logger.info(" numberOfSt:" + numberOfSt + "  stStr:" + stStr);
						if (numberOfSt == 1) {
							tempLabel = stStr;
						}
						if (numberOfSt == 2) {
							// axisLables = axisLables +" "
							// st.nextElement();
						}
						numberOfSt++;
					}
					radartmp.setAxisName(tempLabel);

					loop++;
					radartmp.setAxisValue(typeTmp.getTotalInPercentCompareBaseWorkType().setScale(0, BigDecimal.ROUND_UP) + "");

					returnList.add(radartmp);
				}

			}

		} catch (Exception ex) {
			ex.printStackTrace();
			mav.addObject(BuckWaConstants.ERROR_CODE, BuckWaConstants.ERROR_E001);
		}

		return returnList;
	}

	@RequestMapping(value = "/getBarchart", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<RadarPlotReport> getWorkTypeBarChartReport() {

		List<RadarPlotReport> returnList = new ArrayList<RadarPlotReport>();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("markDepartment");
		try {
			BuckWaRequest request = new BuckWaRequest();

			String userName = BuckWaUtils.getUserNameFromContext();
			String academicYear = schoolUtil.getCurrentAcademicYear();

			request.put("username", userName);
			request.put("academicYear", academicYear);
			BuckWaResponse response = facultyService.getDepartmentByUserNameandYear(request);

			if (response.getStatus() == BuckWaConstants.SUCCESS) {
				Department department = (Department) response.getResObj("department");

				if (department != null) {

					request.put("department", department);
					request.put("academicYear", academicYear);
					response = headService.getReportWorkTypeDepartment(request);

					if (response.getStatus() == BuckWaConstants.SUCCESS) {
						List<DepartmentWorkTypeReport> reportWorkTypeDepartmentList = (List<DepartmentWorkTypeReport>) response.getResObj("departmentWorkTypeReportList");

						request.put("username", userName);
						request.put("academicYear", academicYear);
						response = personProfileService.getByUsername(request);
						if (response.getStatus() == BuckWaConstants.SUCCESS) {
							Person person = (Person) response.getResObj("person");
							String firstLast = person.getThaiName() + " " + person.getThaiSurname();

							int loopx = 1;
							for (DepartmentWorkTypeReport personTmp : reportWorkTypeDepartmentList) {
								String tmpRegId = personTmp.getPersonName();
								RadarPlotReport reportTmp = new RadarPlotReport();
								if (!firstLast.equalsIgnoreCase(tmpRegId)) {
									reportTmp.setAxisName(" ");
								} else {
									reportTmp.setAxisName(personTmp.getPersonName());
								}

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

	/*
	 * @RequestMapping(value = "/getBarchart", method =
	 * RequestMethod.GET,headers="Accept=application/json") public
	 * List<RadarPlotReport> getBarChartReport( ) {
	 * 
	 * List<RadarPlotReport> returnList = new ArrayList(); ModelAndView mav =
	 * new ModelAndView(); mav.setViewName("markDepartment"); try{ BuckWaRequest
	 * request = new BuckWaRequest();
	 * 
	 * String userName = BuckWaUtils.getUserNameFromContext(); String
	 * academicYear =schoolUtil.getCurrentAcademicYear();
	 * 
	 * request.put("userName",BuckWaUtils.getUserNameFromContext());
	 * request.put("academicYear",academicYear); request.put("status","");
	 * BuckWaResponse response = headService.getDepartmentMarkByUser(request);
	 * if(response.getStatus()==BuckWaConstants.SUCCESS){ Department department
	 * = (Department)response.getResObj("department");
	 * department.setAcademicYear(academicYear); request = new BuckWaRequest();
	 * request.put("academicYear",academicYear); response =
	 * pBPWorkTypeService.getByAcademicYear(request);
	 * if(response.getStatus()==BuckWaConstants.SUCCESS){ PBPWorkTypeWrapper
	 * pBPWorkTypeWrapper =
	 * (PBPWorkTypeWrapper)response.getResObj("pBPWorkTypeWrapper");
	 * List<PBPWorkType> pBPWorkTypeList =
	 * pBPWorkTypeWrapper.getpBPWorkTypeList();
	 * 
	 * 
	 * for(PBPWorkType typeTmp:pBPWorkTypeList){ String shortDesc ="";
	 * StringTokenizer st = new StringTokenizer(typeTmp.getName(), " "); int
	 * numberOfSt =1; while (st.hasMoreElements()) {
	 * 
	 * String stStr = st.nextElement().toString();
	 * logger.info(" numberOfSt:"+numberOfSt+"  stStr:"+ stStr);
	 * if(numberOfSt==1){ shortDesc = stStr; } if(numberOfSt==2){ //axisLables =
	 * axisLables +" " //st.nextElement(); } numberOfSt++; }
	 * 
	 * typeTmp.setShortDesc(shortDesc);
	 * 
	 * // Sum total mark List<AcademicPerson> academicPersonListMark =
	 * department.getAcademicPersonList(); BigDecimal totalMark = new
	 * BigDecimal(0.00); for(AcademicPerson personTmp: academicPersonListMark){
	 * 
	 * List<PBPWorkType> pBPWorkTypeListTotalMark =
	 * personTmp.getpBPWorkTypeWrapper().getpBPWorkTypeList();
	 * 
	 * for(PBPWorkType totalMarkTmp:pBPWorkTypeListTotalMark){
	 * System.out.print(" totalMarkTmp id:"+totalMarkTmp.getWorkTypeId());
	 * 
	 * if(typeTmp.getWorkTypeId().intValue()==totalMarkTmp.getWorkTypeId().intValue
	 * ()){
	 * 
	 * 
	 * totalMark =
	 * totalMark.add(totalMarkTmp.getTotalInPercentCompareBaseWorkType());
	 * 
	 * }
	 * 
	 * } }
	 * 
	 * typeTmp.setTotalAllWorkType(totalMark);
	 * typeTmp.setTotalInPercentCompareBaseWorkType(totalMark);
	 * 
	 * }
	 * 
	 * department.setpBPWorkTypeList(pBPWorkTypeList);
	 * 
	 * } List<AcademicPerson> personListtmp =department.getAcademicPersonList();
	 * //BuckWaUser user = BuckWaUtils.getUserFromContext();
	 * request.put("username",userName);
	 * request.put("academicYear",academicYear); response
	 * =personProfileService.getByUsername(request);
	 * if(response.getStatus()==BuckWaConstants.SUCCESS){ Person person =
	 * (Person) response.getResObj("person"); String personRegId =
	 * person.getRegId();
	 * 
	 * int loopx =0; for(AcademicPerson personTmp: personListtmp){ String
	 * tmpRegId = personTmp.getRegId(); RadarPlotReport reportTmp = new
	 * RadarPlotReport(); if(!personRegId.equalsIgnoreCase(tmpRegId)){
	 * reportTmp.setAxisName( " " ); }else{
	 * reportTmp.setAxisName(personTmp.getThaiName()+" "+
	 * personTmp.getThaiSurname()); }
	 * reportTmp.setAxisValue(personTmp.getpBPWorkTypeWrapper
	 * ().getTotalPercentMarkCompareBase()+"");
	 * 
	 * returnList.add(reportTmp);
	 * 
	 * } }
	 * 
	 * 
	 * mav.addObject("department", department); } }catch(Exception ex){
	 * ex.printStackTrace(); mav.addObject("errorCode", "E001"); } return
	 * returnList; }
	 */

	@RequestMapping(value = "/getWorkTypeBarchart/{worktypecode}", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<RadarPlotReport> getWorkTypeBarChartReport(@PathVariable String worktypecode) {

		List<RadarPlotReport> returnList = new ArrayList();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("markDepartment");
		try {
			BuckWaRequest request = new BuckWaRequest();

			String userName = BuckWaUtils.getUserNameFromContext();
			String academicYear = schoolUtil.getCurrentAcademicYear();

			request.put("username", userName);
			request.put("academicYear", academicYear);
			BuckWaResponse response = facultyService.getDepartmentByUserNameandYear(request);

			if (response.getStatus() == BuckWaConstants.SUCCESS) {
				Department department = (Department) response.getResObj("department");

				if (department != null) {

					request.put("department", department);
					request.put("academicYear", academicYear);
					response = headService.getReportWorkTypeDepartment(request);

					if (response.getStatus() == BuckWaConstants.SUCCESS) {
						List<DepartmentWorkTypeReport> reportWorkTypeDepartmentList = (List<DepartmentWorkTypeReport>) response.getResObj("departmentWorkTypeReportList");

						request.put("username", userName);
						request.put("academicYear", academicYear);
						response = personProfileService.getByUsername(request);
						if (response.getStatus() == BuckWaConstants.SUCCESS) {
							Person person = (Person) response.getResObj("person");
							String firstLast = person.getThaiName() + " " + person.getThaiSurname();

							int loopx = 0;
							for (DepartmentWorkTypeReport personTmp : reportWorkTypeDepartmentList) {
								String tmpRegId = personTmp.getPersonName();
								RadarPlotReport reportTmp = new RadarPlotReport();
								if (!firstLast.equalsIgnoreCase(tmpRegId)) {
									reportTmp.setAxisName(" ");
								} else {
									reportTmp.setAxisName(personTmp.getPersonName());
								}

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

							}

							mav.addObject("department", department);
						}
					}

				}
			}
			logger.info(" worktypecode in :" + worktypecode);
		} catch (Exception ex) {
			ex.printStackTrace();
			mav.addObject("errorCode", "E001");
		}
		return returnList;
	}

}
