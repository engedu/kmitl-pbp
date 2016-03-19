package com.buckwa.web.controller.pbp.report;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeUtility;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPdfExporter;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pam.MaternityLeave;
import com.buckwa.util.BuckWaConstants;

@Controller
@RequestMapping("/report")
@SessionAttributes(types = MaternityLeave.class)
public class ReportYearPersonController{
	
	private static Logger logger = Logger.getLogger(ReportYearPersonController.class);	
	
	@RequestMapping(value="/printReportYear.htm", method = RequestMethod.GET)
	public void printReportYear(HttpServletRequest httpRequest, HttpServletResponse httpResponse) {	
//		Person person = null;
		Map<String, Object> params = new HashMap<String, Object>();
		try {
			
			BuckWaRequest request = new BuckWaRequest();
			BuckWaResponse response = null;
			
			ServletOutputStream outputStream = httpResponse.getOutputStream();
			httpResponse.setHeader("Content-Disposition", "attachment; filename=Person_Report.pdf");
			httpResponse.setContentType("application/pdf");
			
			// Do 
//			if(response.getStatus()==BuckWaConstants.SUCCESS){			
			
			
			
//			}
			
//			params.put("todayDate", BuckWaDateUtils.getCurrentDateTime());
//			params.put("thaiName", StringUtils.trimToEmpty(person.getThaiName()));
//			params.put("thaiSurname", StringUtils.trimToEmpty(person.getThaiSurname()));
//			params.put("position", StringUtils.trimToEmpty(person.getPosition()));
//			params.put("workline", StringUtils.trimToEmpty(person.getWorkLine()));
			
			String reportFile = "report//person_yearly_report.jasper";
			String inputFile = httpRequest.getSession().getServletContext().getRealPath(reportFile);
			// debug
			JasperPrint jasperPrint = JasperFillManager.fillReport(inputFile, params, new JREmptyDataSource());
			
			JasperExportManager.exportReportToPdfStream(jasperPrint,  httpResponse.getOutputStream()); 
			
//			JRExporter exporter = new JRPdfExporter();
//			exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, outputStream);
//			exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
//			exporter.exportReport();
			outputStream.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
//	@RequestMapping(value="print.htm", method = RequestMethod.GET)
//	public void genReport(@RequestParam("leaveFlowId") String leaveFlowId,HttpServletRequest httpRequest, HttpServletResponse httpResponse) {	
//		Leave leave=null;
//		Person person = null;
//		Map<String, Object> params = new HashMap<String, Object>();
//		try {
//			BuckWaRequest request = new BuckWaRequest();
//			BuckWaResponse response = null;
//			
//			ServletOutputStream outputStream = httpResponse.getOutputStream();
//			httpResponse.setHeader("Content-Disposition", "attachment; filename=maternity_leave.pdf");
//			httpResponse.setContentType("application/pdf");
//			
//			request.put("leaveFlowId", leaveFlowId);	
//			response = getLeaveFlowService().getById(request);
//			if(response.getStatus()==BuckWaConstants.SUCCESS){			
//				leave = (Leave)response.getResObj("leave");
//			}
//			response.getResObj().clear();
//			
//			if(leave!=null){
//				// Person
//				request.put("userid", leave.getOwnerId());
//				response = getPersonProfileService().getByUserId(request);
//				if (response.getStatus() == BuckWaConstants.SUCCESS) {
//					person = (Person) response.getResObj("person");
//				}
//				
//				params.put("todayDate", BuckWaDateUtils.getCurrentDateTime());
//				params.put("thaiName", StringUtils.trimToEmpty(person.getThaiName()));
//				params.put("thaiSurname", StringUtils.trimToEmpty(person.getThaiSurname()));
//				params.put("position", StringUtils.trimToEmpty(person.getPosition()));
//				params.put("workline", StringUtils.trimToEmpty(person.getWorkLine()));
//				
//				//Details
//				if (leave.getIsCancel()==0 && BuckWaConstants.LEAVE_MATERNITY.equals(leave.getLeaveTypeCode())) {
//					// Get Research Leave
//					request.put("docno", leave.getDocNo());
//					response = leaveMaternityService.getByDocNo(request);
//					MaternityLeave maternityLeave = new MaternityLeave();
//					if (response.getStatus() == BuckWaConstants.SUCCESS) {
//						maternityLeave = (MaternityLeave) response.getResObj("maternityLeave");
//						response.getResObj().clear();
//						
//						MaternityLeave maternityLeaveLastDate = null;
//						response = leaveMaternityService.getLeaveLastDate(request);
//						if (response.getStatus() == BuckWaConstants.SUCCESS) {
//							maternityLeaveLastDate = (MaternityLeave)response.getResObj("maternityLeave");
//						}
//						if(maternityLeave!=null){
//							params.put("leaveType", ProjectConstant.REPORT_MATERNITY_LEAVE_TYPE);
//							params.put("fromDate", maternityLeave.getFromDate());
//							params.put("toDate", maternityLeave.getToDate());
//							params.put("amountDay", maternityLeave.getAmountDay());
//							params.put("contactBy", StringUtils.trimToEmpty(maternityLeave.getContactBy()));
//							params.put("reason", StringUtils.trimToEmpty(maternityLeave.getReason()));
//							if(maternityLeaveLastDate!=null){
//								params.put("lastLeaveType", ProjectConstant.REPORT_MATERNITY_LEAVE_TYPE);
//								params.put("lastFromDate", maternityLeaveLastDate.getFromDate());
//								params.put("lastToDate", maternityLeaveLastDate.getToDate());
//								params.put("lastAmountDay", maternityLeaveLastDate.getAmountDay());
//							}
//							params = summarySickPersonalMaternityLeave(params,leave.getOwnerId(),null,maternityLeave,null);
//						}
//					}
//				}
//			}
//			
//			String inputFile = httpRequest.getSession().getServletContext().getRealPath("report//sick_pserson_maternity_leave.jasper");
//			// debug
//			JasperPrint jasperPrint = JasperFillManager.fillReport(inputFile, params, new JREmptyDataSource());
//			
//			JRExporter exporter = new JRPdfExporter();
//			exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, outputStream);
//			exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
//			exporter.exportReport();
//			outputStream.close();
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		}
//	}
	
	
	public static void main(String[] args) {


//		JasperPrint jasperPrint = JasperFillManager.fillReport(inputJasperFile, params , new JREmptyDataSource());
//		
//		httpResponse.setContentType(REPORT_CONTENT_TYPE);
//		// Check For IE OR NOT for Encoder fileName !
//		String user_agent = httpRequest.getHeader("user-agent");
//		boolean isInternetExplorer = (user_agent.indexOf(BuckWaConstants.BROWSER_MSIE) > -1);
//		if (isInternetExplorer) {
//			httpResponse.setHeader("Content-disposition", "attachment; filename=\"" + URLEncoder.encode(printReportName, "utf-8") + "\"");
//		} else {
//			httpResponse.setHeader("Content-disposition", "attachment; filename=\"" + MimeUtility.encodeWord(printReportName) + "\"");
//		}
			
//		JasperExportManager.exportReportToPdfStream(jasperPrint,  httpResponse.getOutputStream()); 
		
//		httpResponse.flushBuffer();
		
		
	}
}

