package com.buckwa.web.controller.pbp.report;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.view.JasperViewer;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.buckwa.domain.BuckWaUser;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pam.MaternityLeave;
import com.buckwa.domain.pam.Person;
import com.buckwa.domain.pbp.AcademicKPIAttributeValue;
import com.buckwa.domain.pbp.AcademicKPIUserMapping;
import com.buckwa.domain.pbp.PBPWorkType;
import com.buckwa.domain.pbp.PBPWorkTypeWrapper;
import com.buckwa.service.intf.pam.PersonProfileService;
import com.buckwa.service.intf.pbp.PBPWorkTypeService;
import com.buckwa.util.BuckWaConstants;
import com.buckwa.util.BuckWaUtils;
import com.buckwa.util.PAMConstants;

@Controller
@RequestMapping("/report")
@SessionAttributes(types = MaternityLeave.class)
public class ReportYearPersonController{
	
	private static Logger logger = Logger.getLogger(ReportYearPersonController.class);	
	
	@Autowired
	private PersonProfileService personProfileService;
	
	@Autowired
	private PBPWorkTypeService pbpWorkTypeService;
	
	@RequestMapping(value="/printReportYear.htm", method = RequestMethod.GET)
	public void printReportYear(HttpServletRequest httpRequest, HttpServletResponse httpResponse) {
//		Person person = null;
		Map<String, Object> params = new HashMap<String, Object>();
		try {
			
			BuckWaRequest request = new BuckWaRequest();
			BuckWaResponse response = null;
			
			String year = httpRequest.getParameter("year");
			String round = httpRequest.getParameter("round");
			if(round==null){
				round ="1";
			}
			
			BuckWaUser user = BuckWaUtils.getUserFromContext();
			logger.info("username :" + user.getUsername());
			logger.info("year :" + year);
			


			request.put("username", user.getUsername());
			request.put("academicYear", year);
			

			Person person = new Person();
			response = personProfileService.getByUsername(request);
			if (response.getStatus() == BuckWaConstants.SUCCESS) {
				person = (Person) response.getResObj("person");
			}
			
			
			String facultyCode = person.getFacultyCode();
			 
			request.put("userName",BuckWaUtils.getUserNameFromContext());
			request.put("round",round);
			request.put("employeeType",person.getEmployeeTypeNo());
			request.put("facultyCode",facultyCode);
			
			String sumPoint1 = "0";
			String sumPoint2 = "0";
			String sumPoint3 = "0";
			String sumPoint4 = "0";
			String sumPoint5 = "0";
			String sumPointAll = "0";
			
			Date todayDate = new Date();
			String reportFrom = "-";
			String reportTo = "-";
			
			response = pbpWorkTypeService.getCalculateByAcademicYear(request);
			List<PersonReport>  reportList = new ArrayList<ReportYearPersonController.PersonReport>();
			if(response.getStatus()==BuckWaConstants.SUCCESS){	
				PBPWorkTypeWrapper pBPWorkTypeWrapper = (PBPWorkTypeWrapper)response.getResObj("pBPWorkTypeWrapper"); 
				pBPWorkTypeWrapper.setAcademicYear(year);
				person.setpBPWorkTypeWrapper(pBPWorkTypeWrapper); 
				reportList =getPersonReportList(pBPWorkTypeWrapper);
				sumPoint1 = getSumPoint(reportList,"1");
				sumPoint2 = getSumPoint(reportList,"2");
				sumPoint3 = getSumPoint(reportList,"3");
				sumPoint4 = getSumPoint(reportList,"4");
				sumPoint5 = getSumPoint(reportList,"5");
				
				sumPointAll = getSumPoint(reportList,"ALL");
				
				Date startRoundDate = pBPWorkTypeWrapper.getStartRoundDate();
				Date endRoundDate = pBPWorkTypeWrapper.getEndRoundDate();
				
				if(null!= startRoundDate){
					reportFrom = new SimpleDateFormat("d").format(startRoundDate)
						+ " "+new SimpleDateFormat("MMMMM", new Locale("th", "TH")).format(startRoundDate)
						+ new SimpleDateFormat("yyyy", new Locale("th", "TH")).format(startRoundDate);
				}
				
				if(null!= endRoundDate){
					reportTo = new SimpleDateFormat("d").format(endRoundDate)
						+ " "+new SimpleDateFormat("MMMMM", new Locale("th", "TH")).format(endRoundDate)
						+ new SimpleDateFormat("yyyy", new Locale("th", "TH")).format(endRoundDate);
				}
				
			}	
			
			String reportDate = new SimpleDateFormat("d").format(todayDate)
					+" "+new SimpleDateFormat("MMMMM", new Locale("th", "TH")).format(todayDate)
					+ " พ.ศ. " + new SimpleDateFormat("yyyy", new Locale("th", "TH")).format(todayDate);
					
			
			String age = "-";
			if(null!=person.getBirthdate()){
				age = todayDate.getYear() - person.getBirthdate().getYear() + "";
			}
			params.put("reportDate", reportDate);
			params.put("fullName", person.getTitleName()+" "+person.getThaiName()+" "+person.getThaiSurname());
			params.put("fromDate", reportFrom);
			params.put("toDate", reportTo);
			params.put("position", person.getAcademicRank());
			params.put("salaryNo", person.getRateNo());
			params.put("unit", person.getFacultyDesc());
			params.put("degree", person.getMaxEducation());
			params.put("age",  age); 

			if(null!=person.getWorkingDate()){
				params.put("startWorkDay", person.getWorkingDate().getDay());
				params.put("startWorkMonth",person.getWorkingDate().getMonth());
				String worintDateStr =  new SimpleDateFormat("yyyy", new Locale("th", "TH")).format(person.getWorkingDate());
				//params.put("startWorkYear", person.getWorkingDate().getYear());
				params.put("startWorkYear",worintDateStr);
 				int wyear = todayDate.getYear() - person.getWorkingDate().getYear();
				int wmont = todayDate.getMonth() - person.getWorkingDate().getMonth();
				wyear = wyear<0? 0:wyear;
				wmont = wmont<0? 0:wmont;
				params.put("sumWorkYear", wyear);
				params.put("sumWorkMonth", wmont);
			}else{
				params.put("startWorkDay","-");
				params.put("startWorkMonth","-");
				params.put("startWorkYear", "-");
				params.put("sumWorkYear", "-");
				params.put("sumWorkMonth", "-");
			}
			
			params.put("moreWorkReport", "");
			
			
			//-- sumpoint ---
			params.put("sumPoint1", sumPoint1);
			params.put("sumPoint2", sumPoint2);
			params.put("sumPoint3", sumPoint3);
			params.put("sumPoint4", sumPoint4);
			params.put("sumPoint5", sumPoint5);
			
			params.put("sumPointAll", sumPointAll);
			
			String reportPath = PAMConstants.rbApp.getString("report.path");	
			logger.info("reportPath :" + reportPath);
			String reportFile =  reportPath+"person_yearly_report.jasper";	
			logger.info("reportFile :" + reportFile);
			String subReportFileName = reportPath+"person_yearly_report_detail.jrxml";	
			logger.info("subReportFileName :" + subReportFileName);
			params.put("SUBREPORT_DIR", reportPath);
			
			JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile, params, new JRBeanCollectionDataSource(reportList));
			JasperReport reportDetail = JasperCompileManager.compileReport(subReportFileName);
			
			params.put("subreportParameter", reportDetail);
			
			JasperExportManager.exportReportToPdfStream(jasperPrint,  httpResponse.getOutputStream()); 
			
			String fileName = person.getThaiName()+"_"+person.getThaiSurname()+"_"+year+"_"+round;
			
			logger.info("Output File Name :" + fileName);
			ServletOutputStream outputStream = httpResponse.getOutputStream();
			//httpResponse.setHeader("Content-Disposition", "attachment; filename="+user.getUsername()+"_"+year+"_"+round+".pdf");
			httpResponse.setHeader("Content-Disposition", "attachment; filename="+fileName);
			httpResponse.setContentType("application/pdf");
			
			outputStream.close();
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	private String getSumPoint(List<PersonReport> reportList, String type){
		BigDecimal sum = BigDecimal.ZERO;
		for (PersonReport personReport : reportList) {
			String worktypeCode = personReport.getWorkGroup();
			if(type.equals(worktypeCode)){		
				return personReport.getSumPoint();
			}
			sum = sum.add(new BigDecimal(personReport.getSumPoint()));
		}
		return sum.toString();
	}
	


	private List<PersonReport> getPersonReportList(PBPWorkTypeWrapper pBPWorkTypeWrapper){
		 
			List<PBPWorkType> workTypeList =pBPWorkTypeWrapper.getpBPWorkTypeList();
			List<PersonReport> personReportList = new ArrayList();
			
			for(PBPWorkType  tmp:workTypeList){
				
				String worktypeCode =tmp.getCode();
				String worktypeName = tmp.getName();
				BigDecimal totalInworktype =tmp.getTotalInWorkType();
				
					PersonReport personReport = new PersonReport();						
					List<Map> workList = new ArrayList<Map>();				
					personReport.setWorkGroup(worktypeCode);
					personReport.setTitle(worktypeName);
					personReport.setSumPoint(totalInworktype+"");												
					List<AcademicKPIUserMapping> mappingList =tmp.getAcademicKPIUserMappingList();						
					for(AcademicKPIUserMapping mappingTmp:mappingList){			
						List<AcademicKPIAttributeValue> attributeList =	mappingTmp.getAcademicKPIAttributeValueList();
						AcademicKPIAttributeValue attributeTmp =attributeList.get(0);
						if("APPROVED".equals(mappingTmp.getStatus())){
							BigDecimal totalMark =mappingTmp.getTotalInMapping();;							
							System.out.println(" VAlue:"+attributeTmp.getValue()+ " Mark:"+totalMark);							
							Map<String, Object> workMap = new HashMap<String, Object>();
							workMap.put("work", attributeTmp.getValue());
							workMap.put("point", totalMark);
							workList.add(workMap);							
						}
					}						
					personReport.setWorkList(workList);
					personReportList.add(personReport);
			}
		 
		 return personReportList;
		
	}
	
	public static class PersonReport{
		private String workGroup;
		private String title;
		private String sumPoint;
		private List<Map> workList;
		
		public String getWorkGroup() {
			return workGroup;
		}
		public void setWorkGroup(String workGroup) {
			this.workGroup = workGroup;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getSumPoint() {
			return sumPoint;
		}
		public void setSumPoint(String sumPoint) {
			this.sumPoint = sumPoint;
		}
		public List<Map> getWorkList() {
			return workList;
		}
		public void setWorkList(List<Map> workList) {
			this.workList = workList;
		} 
	}
	
}

