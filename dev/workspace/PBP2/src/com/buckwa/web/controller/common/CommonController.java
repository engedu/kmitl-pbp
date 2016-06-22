package com.buckwa.web.controller.common;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.buckwa.dao.intf.pbp.AcademicYearDao;
import com.buckwa.domain.BuckWaUser;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pam.Person;
import com.buckwa.domain.pbp.AcademicYearWrapper;
import com.buckwa.service.intf.pam.PersonProfileService;
import com.buckwa.service.intf.pbp.AcademicYearService;
import com.buckwa.util.BuckWaConstants;
import com.buckwa.util.BuckWaUtils;
import com.buckwa.util.school.SchoolUtil;

@Controller
public class CommonController {  
	private static Logger logger = Logger.getLogger(CommonController.class);
	
	@Autowired
	private PersonProfileService personProfileService;
	
	@Autowired
	private AcademicYearService academicYearService;	
	
	
	@Autowired
	private AcademicYearDao academicYearDao;
	
	@Autowired
	private SchoolUtil schoolUtil;
	
	@RequestMapping(value = "/preLogin.htm")
	public ModelAndView preLogin(HttpServletRequest httpRequest) {
		logger.info(" # preLogin ");
		ModelAndView mav = new ModelAndView();
		
		String currentAcademicYear =schoolUtil.getCurrentAcademicYear();
		mav.addObject("academicYearStr", currentAcademicYear);
		mav.setViewName("preLogin");
		
		//String url = httpRequest.getContextPath() + "/anonymous.htm";
		//mav.setView(new RedirectView(url));
		return mav;
	}
	
	@RequestMapping(value = "/login.htm")
	public ModelAndView login(@RequestParam(value="login_error") String login_error ) {
		logger.info("  # login login_error:"+login_error);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("preLogin");
		if("true".equals(login_error)){
			mav.addObject("authenStatus", "Invalid User name/Password ");
		}
		//Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
 
		return mav;
	}	
	
	
	@RequestMapping(value = "/welcome.htm", method = RequestMethod.GET)
	public ModelAndView welcome(HttpServletRequest httpRequest) {			
		ModelAndView mav = new ModelAndView();		 
	//	mav.setViewName("welcome"); 
		
		String url = "";
		if(BuckWaUtils.isRole("ROLE_ADMIN")){
			url = httpRequest.getContextPath() + "/admin/pbp/academicKPI/init.htm";
		//} else 	if(BuckWaUtils.isRole("ROLE_DEAN")){
		//	url = httpRequest.getContextPath() + "/headMaintenance/init.htm";
		//} else if(BuckWaUtils.isRole("ROLE_HEAD")){
		//	url = httpRequest.getContextPath() + "/officerMaintenance/init.htm";				 
		}else if(BuckWaUtils.isRole("ROLE_USER")){
			url = httpRequest.getContextPath() + "/pam/person/init.htm";
		} else{
			url = httpRequest.getContextPath() + "/preLogin.htm";
		}
		
		String currentAcademicYear =schoolUtil.getCurrentAcademicYear();
		mav.addObject("academicYearStr", currentAcademicYear);
		logger.info(" ### URL by Role:"+url);
		mav.setView(new RedirectView(url));
		return mav;	
		 
	}	
 
	
	/*
	@RequestMapping(value = "/loginSuccess.htm", method = RequestMethod.GET)
	public ModelAndView loginSuccess(HttpServletRequest httpRequest) {			
		ModelAndView mav = new ModelAndView();
		String url = httpRequest.getContextPath() + "/pam/person/init.htm";
		mav.setView(new RedirectView(url));
		return mav;	
		 
	}
	
	 */
		@RequestMapping(value = "/loginSuccess.htm", method = RequestMethod.GET)
		public ModelAndView loginSuccess(HttpServletRequest httpRequest) {			
			ModelAndView mav = new ModelAndView(); 
			try {
				
				AcademicYearWrapper academicYearWrapper =academicYearDao.getCurrentAcademicYear();
				
				String academicYear = academicYearWrapper.getAcademicYear().getName();
				
				httpRequest.getSession().setAttribute("academicYearStr", academicYear);
				
				BuckWaUser user = BuckWaUtils.getUserFromContext();
				logger.info("viewUserProfile  username :"+user.getUsername());
				BuckWaRequest request = new BuckWaRequest();
				request.put("username", user.getUsername());
				request.put("academicYear", academicYear);
				BuckWaResponse response = personProfileService.getByUsername(request);
				if (response.getStatus() == BuckWaConstants.SUCCESS) {
					Person person = (Person) response.getResObj("person");
					user.setFirstLastName(person.getThaiName()+" "+person.getThaiSurname()); 
				} 
				
				
				response = academicYearService.getCurrentEvalulateRoundStr(request);
				if (response.getStatus() == BuckWaConstants.SUCCESS) {
					String currentRoundStr = (String) response.getResObj("currentRoundStr");
					user.setCurrentRoundStr(currentRoundStr);
				} 
				
			} catch(Exception ex) {
				ex.printStackTrace();
				mav.addObject(BuckWaConstants.ERROR_CODE, BuckWaConstants.ERROR_E001);
			}			 
			
			String url = httpRequest.getContextPath() + "/pam/person/init.htm";
			if(BuckWaUtils.isRole("ROLE_ADMIN")){
				url = httpRequest.getContextPath() + "/admin/pbp/academicKPI/init.htm";
			//} else 	if(BuckWaUtils.isRole("ROLE_DEAN")){
			//	url = httpRequest.getContextPath() + "/headMaintenance/init.htm";
			//} else if(BuckWaUtils.isRole("ROLE_HEAD")){
			//	url = httpRequest.getContextPath() + "/officerMaintenance/init.htm";				 
			}else if(BuckWaUtils.isRole("ROLE_USER")){
				url = httpRequest.getContextPath() + "/pam/person/init.htm";
			}  
			
			logger.info(" ### URL by Role:"+url);
			mav.setView(new RedirectView(url));
			return mav;	
			 
		}
	
	@RequestMapping("/sessionTimeout.htm")
	public ModelAndView sessionTimeout(HttpServletRequest httpRequest) {
		logger.info(" ### in sessionTimeout");
		ModelAndView mav = new ModelAndView();
		String url = httpRequest.getContextPath() + "/preLogin.htm";
		mav.setView(new RedirectView(url));
		//mav.setViewName("preLogin");
		return mav;
	}	
 
	@RequestMapping("/forgotPASS.htm")
	public ModelAndView forgotPASS() {	 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("preLogin");
		mav.addObject("errorCode", "E011");
		return mav;
	}
	
	
	@RequestMapping("/error404.htm")
	public ModelAndView erorr404() {
		//logger.info(" ### in error404");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("error404");
		return mav;
	}	
	
	
	@RequestMapping("/error500.htm")
	public ModelAndView erorr500() {
		logger.info(" ### in error500");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("error500");
		return mav;
	}	
	
	@RequestMapping("/testConCurrency.htm")
	public ModelAndView testConCurrency(@RequestParam(value="number") String number ) {
		logger.info(" ### testConCurrency on server number:"+number);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("error404");
		return mav;
	}

	@RequestMapping("/framework.htm")
	public ModelAndView framework( ) {
		logger.info(" ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("framework");
		return mav;
		
	}
	
}
