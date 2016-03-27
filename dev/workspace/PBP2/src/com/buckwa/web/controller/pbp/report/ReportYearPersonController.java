package com.buckwa.web.controller.pbp.report;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
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
			
			ServletOutputStream outputStream = httpResponse.getOutputStream();
			httpResponse.setHeader("Content-Disposition", "attachment; filename=Person_Report.pdf");
			httpResponse.setContentType("application/pdf");
			
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
			
			response = pbpWorkTypeService.getCalculateByAcademicYear(request);
		 
			if(response.getStatus()==BuckWaConstants.SUCCESS){	
				PBPWorkTypeWrapper pBPWorkTypeWrapper = (PBPWorkTypeWrapper)response.getResObj("pBPWorkTypeWrapper"); 
				pBPWorkTypeWrapper.setAcademicYear(year);
				person.setpBPWorkTypeWrapper(pBPWorkTypeWrapper); 
				
				
				List<PersonReport>  reportList =getPersonReportList(pBPWorkTypeWrapper);
				
				
			}	
			
			
			
			
			String reportDate = new SimpleDateFormat("d").format(new Date())
				+" "+new SimpleDateFormat("MMMMM", new Locale("th", "TH")).format(new Date())
				+ " พ.ศ. " + new SimpleDateFormat("yyyy", new Locale("th", "TH")).format(new Date());
				
			String reportFrom= new SimpleDateFormat("d").format(new Date())
					+ " "+new SimpleDateFormat("MMMMM", new Locale("th", "TH")).format(new Date())
					+ new SimpleDateFormat("yyyy", new Locale("th", "TH")).format(new Date());
			
			String reportTo = new SimpleDateFormat("d").format(new Date())
					+ " "+new SimpleDateFormat("MMMMM", new Locale("th", "TH")).format(new Date())
					+ new SimpleDateFormat("yyyy", new Locale("th", "TH")).format(new Date());
			
			Date todayDate = new Date();
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
			params.put("salary", "40,000");
			params.put("unit", person.getFacultyDesc());
			params.put("degree", person.getMaxEducation());
			params.put("age",  age); 
			params.put("startWorkDay", person.getWorkingDate()==null?"-":person.getWorkingDate().getDay());
			params.put("startWorkMonth",person.getWorkingDate()==null?"-":person.getWorkingDate().getMonth());
			params.put("startWorkYear",person.getWorkingDate()==null?"-": person.getWorkingDate().getYear());
			
//			int wyear = todayDate.getYear() - person.getWorkingDate().getYear();
//			int wmont = todayDate.getMonth() - person.getWorkingDate().getMonth();
//			wyear = wyear<0? 0:wyear;
//			wmont = wmont<0? 0:wmont;
			params.put("sumWorkYear", "-");
			params.put("sumWorkMonth", "-");
			
			params.put("moreWorkReport", "");
			params.put("reportList", getReportData());
			
			String reportFile = "report//person_yearly_report.jasper";
			String subDetailFileName = "report//person_yearly_report_detail.jrxml";
			//String inputFile = httpRequest.getSession().getServletContext().getRealPath(reportFile);
			String inputFile = httpRequest.getSession().getServletContext().getRealPath("report//person_yearly_report.jasper");
			
			ServletContext servletContext = httpRequest.getSession().getServletContext();
			logger.info("servletContext :" + servletContext);
			String relativeWebPath = "report/person_yearly_report.jasper";
			String absoluteDiskPath = servletContext.getRealPath(relativeWebPath);
			logger.info("absoluteDiskPath :" + absoluteDiskPath);
			 
			logger.info("inputFile :" + inputFile);
			
			JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile, params, new JRBeanCollectionDataSource(getReportData()));
			JasperReport reportDetail = JasperCompileManager.compileReport(subDetailFileName);
			params.put("subreportParameter", reportDetail);
			
			JasperExportManager.exportReportToPdfStream(jasperPrint,  httpResponse.getOutputStream()); 
			
			outputStream.close();
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	private List<PersonReport> getPersonReportList(PBPWorkTypeWrapper pBPWorkTypeWrapper){
		
		 
		 
			List<PBPWorkType> workTypeList =pBPWorkTypeWrapper.getpBPWorkTypeList();
			
			
			List<PersonReport> personReportList = new ArrayList();
			
			for(PBPWorkType  tmp:workTypeList){
				
				String worktypeCode =tmp.getCode();
				String worktypeName = tmp.getName();
				BigDecimal totalInworktype =tmp.getTotalInWorkType();
				
				
				
				
				
				if("1".equals(worktypeCode)){						
					PersonReport personReport = new PersonReport();						
					List<Map> workList = new ArrayList<Map>();				
					personReport.setWorkGroup(worktypeCode);
					personReport.setTitle(worktypeName);
					personReport.setSumPoint(totalInworktype+"");												
					List<AcademicKPIUserMapping> mappingList =tmp.getAcademicKPIUserMappingList();						
					for(AcademicKPIUserMapping mappingTmp:mappingList){							
						List<AcademicKPIAttributeValue> attributeList =	mappingTmp.getAcademicKPIAttributeValueList();
						AcademicKPIAttributeValue attributeTmp =attributeList.get(0);							
						BigDecimal totalMark =mappingTmp.getTotalInMapping();;							
						System.out.println(" VAlue:"+attributeTmp.getValue()+ " Mark:"+totalMark);							
						Map<String, Object> workMap = new HashMap<String, Object>();
						workMap.put("work", attributeTmp.getValue());
						workMap.put("point", totalMark);
						workList.add(workMap);							
					}						
					personReport.setWorkList(workList);
					personReportList.add(personReport);
				}else if("2".equals(worktypeCode)){
					
					PersonReport personReport = new PersonReport();						
					List<Map> workList = new ArrayList<Map>();				
					personReport.setWorkGroup(worktypeCode);
					personReport.setTitle(worktypeName);
					personReport.setSumPoint(totalInworktype+"");												
					List<AcademicKPIUserMapping> mappingList =tmp.getAcademicKPIUserMappingList();						
					for(AcademicKPIUserMapping mappingTmp:mappingList){							
						List<AcademicKPIAttributeValue> attributeList =	mappingTmp.getAcademicKPIAttributeValueList();
						AcademicKPIAttributeValue attributeTmp =attributeList.get(0);							
						BigDecimal totalMark =mappingTmp.getTotalInMapping();;							
						System.out.println(" VAlue:"+attributeTmp.getValue()+ " Mark:"+totalMark);							
						Map<String, Object> workMap = new HashMap<String, Object>();
						workMap.put("work", attributeTmp.getValue());
						workMap.put("point", totalMark);
						workList.add(workMap);							
					}						
					personReport.setWorkList(workList);						
					personReportList.add(personReport);
					
				}else if("3".equals(worktypeCode)){
					
					PersonReport personReport = new PersonReport();						
					List<Map> workList = new ArrayList<Map>();				
					personReport.setWorkGroup(worktypeCode);
					personReport.setTitle(worktypeName);
					personReport.setSumPoint(totalInworktype+"");												
					List<AcademicKPIUserMapping> mappingList =tmp.getAcademicKPIUserMappingList();						
					for(AcademicKPIUserMapping mappingTmp:mappingList){							
						List<AcademicKPIAttributeValue> attributeList =	mappingTmp.getAcademicKPIAttributeValueList();
						AcademicKPIAttributeValue attributeTmp =attributeList.get(0);							
						BigDecimal totalMark =mappingTmp.getTotalInMapping();;							
						System.out.println(" VAlue:"+attributeTmp.getValue()+ " Mark:"+totalMark);							
						Map<String, Object> workMap = new HashMap<String, Object>();
						workMap.put("work", attributeTmp.getValue());
						workMap.put("point", totalMark);
						workList.add(workMap);							
					}						
					personReport.setWorkList(workList);						
					personReportList.add(personReport);
					
				}else if("4".equals(worktypeCode)){
					
					PersonReport personReport = new PersonReport();						
					List<Map> workList = new ArrayList<Map>();				
					personReport.setWorkGroup(worktypeCode);
					personReport.setTitle(worktypeName);
					personReport.setSumPoint(totalInworktype+"");												
					List<AcademicKPIUserMapping> mappingList =tmp.getAcademicKPIUserMappingList();						
					for(AcademicKPIUserMapping mappingTmp:mappingList){							
						List<AcademicKPIAttributeValue> attributeList =	mappingTmp.getAcademicKPIAttributeValueList();
						AcademicKPIAttributeValue attributeTmp =attributeList.get(0);							
						BigDecimal totalMark =mappingTmp.getTotalInMapping();;							
						System.out.println(" VAlue:"+attributeTmp.getValue()+ " Mark:"+totalMark);							
						Map<String, Object> workMap = new HashMap<String, Object>();
						workMap.put("work", attributeTmp.getValue());
						workMap.put("point", totalMark);
						workList.add(workMap);							
					}						
					personReport.setWorkList(workList);						
					personReportList.add(personReport);
					
				}else if("5".equals(worktypeCode)){
					
					PersonReport personReport = new PersonReport();						
					List<Map> workList = new ArrayList<Map>();				
					personReport.setWorkGroup(worktypeCode);
					personReport.setTitle(worktypeName);
					personReport.setSumPoint(totalInworktype+"");												
					List<AcademicKPIUserMapping> mappingList =tmp.getAcademicKPIUserMappingList();						
					for(AcademicKPIUserMapping mappingTmp:mappingList){							
						List<AcademicKPIAttributeValue> attributeList =	mappingTmp.getAcademicKPIAttributeValueList();
						AcademicKPIAttributeValue attributeTmp =attributeList.get(0);							
						BigDecimal totalMark =mappingTmp.getTotalInMapping();;							
						System.out.println(" VAlue:"+attributeTmp.getValue()+ " Mark:"+totalMark);							
						Map<String, Object> workMap = new HashMap<String, Object>();
						workMap.put("work", attributeTmp.getValue());
						workMap.put("point", totalMark);
						workList.add(workMap);							
					}						
					personReport.setWorkList(workList);						
					personReportList.add(personReport);
					
				}
			}
		 
		
		 
		 return personReportList;
		
	}
	
	public static List<PersonReport> getReportData() {
		List<PersonReport> reportList = new ArrayList<PersonReport>(); 
		
		PersonReport personReport = new PersonReport();
		Map<String, Object> workMap = new HashMap<String, Object>();
		List<Map> workList = new ArrayList<Map>();
		
		personReport.setWorkGroup("1");
		personReport.setTitle("ผลงานด้านวิชาการ");
		personReport.setSumPoint("100");
		workMap.put("work", "00002345   Artificial Intelligent");
		workMap.put("point", "100");
		workList.add(workMap);
		personReport.setWorkList(workList);
		reportList.add(personReport);
		
		personReport = new PersonReport();
		workMap = new HashMap<String, Object>();
		workList = new ArrayList<Map>();
		personReport.setWorkGroup("2");
		personReport.setTitle("ผลงานด้านพัฒนาวิชาการ");
		personReport.setSumPoint("300");
		workMap.put("work", "00002345   แต่งตำราเรียน คอมพิวเตอร์เบื้องต้น");
		workMap.put("point", "300");
		workList.add(workMap);
		personReport.setWorkList(workList);
		reportList.add(personReport);
		
		personReport = new PersonReport();
		workMap = new HashMap<String, Object>();
		workList = new ArrayList<Map>();
		personReport.setWorkGroup("3");
		personReport.setTitle("ผลงานด้านวิจัยหรือสร้างสรรค์");
		personReport.setSumPoint("500");
		workMap.put("work", "00009999   แต่งตำราเรียน ด้านวิจัยหรือสร้างสรรค์ 2");
		workMap.put("point", "200");
		workList.add(workMap);
		workMap = new HashMap<String, Object>();
		workMap.put("work", "00001111   แต่งตำราเรียน ด้านวิจัยหรือสร้างสรรค์ 1");
		workMap.put("point", "300");
		workList.add(workMap);
		personReport.setWorkList(workList);
		reportList.add(personReport);
		
		personReport = new PersonReport();
		workMap = new HashMap<String, Object>();
		workList = new ArrayList<Map>();
		personReport.setWorkGroup("4");
		personReport.setTitle("ผลงานด้านวิจัยหรือสร้างสรรค์ 4");
		personReport.setSumPoint("500");
		workMap.put("work", "00009999   แต่งตำราเรียน ด้านวิจัยหรือสร้างสรรค์ 2");
		workMap.put("point", "200");
		workList.add(workMap);
		workMap = new HashMap<String, Object>();
		workMap.put("work", "00001111   แต่งตำราเรียน ด้านวิจัยหรือสร้างสรรค์ 1");
		workMap.put("point", "300");
		workList.add(workMap);
		personReport.setWorkList(workList);
		reportList.add(personReport);
		
		personReport = new PersonReport();
		workMap = new HashMap<String, Object>();
		workList = new ArrayList<Map>();
		personReport.setWorkGroup("5");
		personReport.setTitle("ผลงานด้านวิจัยหรือสร้างสรรค์ 5");
		personReport.setSumPoint("500");
		workMap.put("work", "00009999   แต่งตำราเรียน ด้านวิจัยหรือสร้างสรรค์ 2");
		workMap.put("point", "200");
		workList.add(workMap);
		workMap = new HashMap<String, Object>();
		workMap.put("work", "00001111   แต่งตำราเรียน ด้านวิจัยหรือสร้างสรรค์ 1");
		workMap.put("point", "300");
		workList.add(workMap);
		personReport.setWorkList(workList);
		reportList.add(personReport);
		
		return reportList;
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
	
	public static void main(String[] args) {
		
		String reportDate = new SimpleDateFormat("d").format(new Date())
				+" "+new SimpleDateFormat("MMMMM", new Locale("th", "TH")).format(new Date())
				+ " พ.ศ. " + new SimpleDateFormat("yyyy", new Locale("th", "TH")).format(new Date());
				
			String reportFrom= new SimpleDateFormat("d").format(new Date())
					+ " "+new SimpleDateFormat("MMMMM", new Locale("th", "TH")).format(new Date())
					+ new SimpleDateFormat("yyyy", new Locale("th", "TH")).format(new Date());
			
			String reportTo = new SimpleDateFormat("d").format(new Date())
					+ " "+new SimpleDateFormat("MMMMM", new Locale("th", "TH")).format(new Date())
					+ new SimpleDateFormat("yyyy", new Locale("th", "TH")).format(new Date());
			
			Date todayDate = new Date();
			
			Map<String, Object> params = new HashMap<String, Object>();
			
			params.put("reportDate", reportDate);
			params.put("fullName", "Mr. Test Report");
			params.put("fromDate", reportFrom);
			params.put("toDate", reportTo);
			params.put("position", "AAAAAAAAAAA");
			params.put("salaryNo", "123456789");
			params.put("salary", "40,000");
			params.put("unit", "ZZZZZZZZZZ");
			params.put("degree", "XXXXXXXXX");
			params.put("age",  "25"); 
			params.put("startWorkDay", "20");
			params.put("startWorkMonth","March");
			params.put("startWorkYear", "2016");
			params.put("sumWorkYear", "5");
			params.put("sumWorkMonth", "3");
			params.put("moreWorkReport", "");
			
		String reportFile = "J:\\WORK\\KMITL_WORK\\PBP2\\WebContent\\report\\person_yearly_report.jrxml";
		String subDetailFileName = "J:\\WORK\\KMITL_WORK\\PBP2\\WebContent\\report\\person_yearly_report_detail.jrxml";
		try{
			JasperReport report = JasperCompileManager.compileReport(reportFile);
			JasperReport reportDetail = JasperCompileManager.compileReport(subDetailFileName);
			params.put("subreportParameter", reportDetail);
			JasperPrint jasperPrint = JasperFillManager.fillReport(report, params, new JRBeanCollectionDataSource(getReportData()));
			
			JasperViewer.viewReport(jasperPrint, false);
			
		} catch (JRException e) {
			e.printStackTrace();
		}
	}
	
}

