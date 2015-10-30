package com.buckwa.web.controller.pam.person;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.common.PagingBean;
import com.buckwa.domain.pam.Paper;
import com.buckwa.service.intf.pam.PaperService;
import com.buckwa.util.BuckWaConstants;
import com.buckwa.util.BuckWaUtils;

/*
@Author : Taechapon Himarat (Su)
@Create : Aug 5, 2012 11:20:09 PM
 */
@Controller
@RequestMapping("/pam/person/paper")
public class PaperController {
	
	private static Logger logger = Logger.getLogger(PersonProfileController.class);

	@Autowired
	private PaperService paperService;
	
	
	@RequestMapping(value="init.htm", method = RequestMethod.GET)
	public ModelAndView initList(@RequestParam("personId") String personId) {
		logger.info(" Start ");
		
		ModelAndView mav = new ModelAndView();
		Paper paper = new Paper();
		paper.setPersonId(Long.valueOf(personId));
		PagingBean pagingBean = new PagingBean();
		
		mav.setViewName("initPaper");
		mav.addObject("paper", paper);
		
		try {
			
			// Search with initial
			int offset = 0;
			pagingBean.setOffset(offset);
			pagingBean.put("paper", paper);
			
			BuckWaRequest request = new BuckWaRequest();
			request.put("pagingBean", pagingBean);
			
			BuckWaResponse response = paperService.getByOffset(request);
			if (response.getStatus() == BuckWaConstants.SUCCESS) {
				PagingBean returnBean = (PagingBean) response.getResObj("pagingBean");
				pagingBean.setCurrentPageItem(returnBean.getCurrentPageItem());
				pagingBean.setTotalItems(returnBean.getTotalItems());
			}
			else {
				mav.addObject("errorCode", response.getErrorCode());
			}
			
			mav.addObject("pagingBean", pagingBean);
			
		} catch(Exception ex) {
			ex.printStackTrace();
			mav.addObject("errorCode", "E001");
		}

		return mav;
	}
	
	
	
	
	@RequestMapping(value="create.htm", method = RequestMethod.GET)
	public ModelAndView initCreate(@RequestParam("personId") String personId) {
		logger.info(" Start ");
		
		Paper paper = new Paper();
		paper.setPersonId(Long.valueOf(personId));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("createPaper");
		mav.addObject("paper", paper);
		
		return mav;
	}
	
	
	@RequestMapping(value="create.htm", method = RequestMethod.POST)
	public ModelAndView submitCreate(HttpServletRequest httpRequest, @ModelAttribute Paper paper, BindingResult result) {
		logger.info(" Start ");
		ModelAndView mav = new ModelAndView();
		mav.setView(new RedirectView(httpRequest.getContextPath() + "/pam/person/paper/init.htm?personId=" + paper.getPersonId()));

		try {
			String username = BuckWaUtils.getUserNameFromContext();
			paper.setCreateBy(username);
			
			BuckWaRequest request = new BuckWaRequest();
			request.put("domain", paper);

			BuckWaResponse response = paperService.create(request);

			if (response.getStatus() == BuckWaConstants.SUCCESS) {

			}
			else {
				logger.info(" Fail !!!! :"+response.getErrorCode()+" : "+response.getErrorDesc());
				mav.addObject("errorCode", response.getErrorCode());
			}


//			logger.info("paper.level: " + paper.getPaperLevel());
//			logger.info("paper.title: " + paper.getPaperTitle());
//			logger.info("paper.status: " + paper.getPaperStatus());

		} catch(Exception ex) {
			ex.printStackTrace();
			mav.addObject("errorCode", "E001");
		}

		return mav;
	}
	
	
	@RequestMapping(value="edit.htm", method = RequestMethod.GET)
	public ModelAndView initEdit(@RequestParam("paperId") String paperId) {
		logger.info(" Start ");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("editPaper");
		
		try {
			BuckWaRequest request = new BuckWaRequest();
			request.put("id", paperId);
			BuckWaResponse response = paperService.getById(request);

			if (response.getStatus() == BuckWaConstants.SUCCESS) {
				Paper paper = (Paper) response.getResObj("paper");
				mav.addObject("paper", paper);
			}
			else {
				logger.info(" Fail !!!! :"+response.getErrorCode()+" : "+response.getErrorDesc());
				mav.addObject("errorCode", response.getErrorCode());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
			mav.addObject("errorCode", "E001");
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="edit.htm", method = RequestMethod.POST)
	public ModelAndView submitEdit(HttpServletRequest httpRequest, @ModelAttribute Paper paper, BindingResult result) {
		logger.info(" Start ");
		ModelAndView mav = new ModelAndView();
		mav.setView(new RedirectView(httpRequest.getContextPath() + "/pam/person/paper/init.htm?personId=" + paper.getPersonId()));
		
		try {
			String username = BuckWaUtils.getUserNameFromContext();
			paper.setCreateBy(username);
			
			BuckWaRequest request = new BuckWaRequest();
			request.put("domain", paper);

			BuckWaResponse response = paperService.update(request);

			if (response.getStatus() == BuckWaConstants.SUCCESS) {

			}
			else {
				logger.info(" Fail !!!! :"+response.getErrorCode()+" : "+response.getErrorDesc());
				mav.addObject("errorCode", response.getErrorCode());
			}
			
			
//			logger.info("paper.level: " + paper.getPaperLevel());
//			logger.info("paper.title: " + paper.getPaperTitle());
//			logger.info("paper.status: " + paper.getPaperStatus());
			
		} catch(Exception ex) {
			ex.printStackTrace();
			mav.addObject("errorCode", "E001");
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="report.htm", method = RequestMethod.GET)
	public void genReport(HttpServletRequest request, HttpServletResponse response,
		@RequestParam("personId") String personId) {

		try {

			ServletOutputStream outputStream = response.getOutputStream();
			response.setHeader("Content-Disposition", "attachment; filename=CurriculumReport.pdf");
			response.setContentType("application/pdf");
//			ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
			
			InputStream reportStream = request.getSession().getServletContext().getResourceAsStream("/reports/reports.jasper");
			logger.info(request.getSession().getServletContext().getRealPath("report//leave_study.jasper"));
			Map<String, Object> parameterMap = new HashMap<String, Object>();
//			parameterMap.put("paramName", "paramValue");
			
			
			String inputFile = request.getSession().getServletContext().getRealPath("report//leave_study.jasper");
	 
			
//			outputStream.write(exporter.);
			outputStream.close();
//			byteArrayOutputStream.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
