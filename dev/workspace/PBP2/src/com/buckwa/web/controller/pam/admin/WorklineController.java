package com.buckwa.web.controller.pam.admin;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.util.UriUtils;

import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.common.PagingBean;
import com.buckwa.domain.pam.KpiCategory;
import com.buckwa.domain.pam.Person;
import com.buckwa.domain.pam.Workline;
import com.buckwa.domain.pam.WorklineMapping;
import com.buckwa.domain.pam.WorklineMappingParent;
import com.buckwa.domain.validator.pam.WorklineMappingValidator;
import com.buckwa.domain.validator.pam.WorklinePersonMappingValidator;
import com.buckwa.domain.validator.pam.WorklineValidator;
import com.buckwa.service.intf.pam.PersonProfileService;
import com.buckwa.service.intf.pam.WorklineService;
import com.buckwa.util.BuckWaConstants;

/*
@Author : Teerawoot Charoenporn(Tor)
@Create : Aug 12, 2012 1:52:27 AM
 */
@Controller
@RequestMapping("/admin/workline")
@SessionAttributes(types = {Person.class, Workline.class})
public class WorklineController {
	private static Logger logger = Logger.getLogger(WorklineController.class);	
	
	@Autowired
	private WorklineService worklineService;
	@Autowired
	private PersonProfileService personProfileService;
	
	@RequestMapping(value="init.htm", method = RequestMethod.GET)
	public ModelAndView initList(HttpServletRequest httpRequest) {
		logger.info(" Start");
		ModelAndView mav = new ModelAndView();
		String successCode = (String) httpRequest.getParameter("successCode");
		if(!StringUtils.isEmpty(successCode)){
			mav.addObject("successCode", successCode);
		}
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.ADMIN_INIT);
		gotoWorkLineList(mav);			
		return mav;
	}	
	
	private ModelAndView gotoWorkLineList(ModelAndView mav){
		try{
			PagingBean bean = new PagingBean();
			mav.addObject("workline", new Workline());	
			mav.addObject("pagingBean", bean);		
			mav.setViewName("worklineList");
			// Search with initial
			int offset = 0;	
			bean.setOffset(offset);	 
			bean.put("workline", new Workline());	
			BuckWaRequest request = new BuckWaRequest();		
			request.put("pagingBean", bean);	
					 
			BuckWaResponse response = worklineService.getByOffset(request);
			if(response.getStatus()==BuckWaConstants.SUCCESS){	
				logger.info(" Success ");
				PagingBean beanReturn = (PagingBean)response.getResObj("pagingBean");
				bean.setCurrentPageItem(beanReturn.getCurrentPageItem());
				bean.setTotalItems(beanReturn.getTotalItems());
//				mav.addObject("pagingBean", bean);				
			}else {	 
				mav.addObject("errorCode", response.getErrorCode()); 
			}			
		}catch(Exception e){
			
		}
		return mav;
	}
	
	@RequestMapping(value="create.htm", method = RequestMethod.GET)
	public ModelAndView initCreate() {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.ADMIN_INIT);
		mav.setViewName("worklineCreate");
		Workline workline = new Workline();
		 
		mav.addObject("workline", workline);	
		return mav;
	}		

	@RequestMapping(value="create.htm", method = RequestMethod.POST)
	public ModelAndView createWorkline(HttpServletRequest httpRequest, @ModelAttribute Workline workline, BindingResult result) {	
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		try{			
			new WorklineValidator().validate(workline, result);			
			if (result.hasErrors()) {				
				mav.setViewName("worklineCreate");
			}else {					
				BuckWaRequest request = new BuckWaRequest();
				request.put("workline", workline);
				BuckWaResponse response = worklineService.create(request);
				if(response.getStatus() == BuckWaConstants.SUCCESS){									
					mav.addObject("successCode", response.getSuccessCode()); 
					mav.setView(new RedirectView(httpRequest.getContextPath() + "/admin/workline/init.htm"));
				}else {
					mav.addObject("errorCode", response.getErrorCode()); 
					mav.setViewName("worklineCreate");
				}				
			}							
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
		}
		return mav;
	}
	
	@RequestMapping(value="search.htm")
	public ModelAndView search(HttpServletRequest httpRequest,@ModelAttribute Workline workline) {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();	
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.ADMIN_INIT);
		mav.setViewName("worklineList");
		try{		
			int offset = ServletRequestUtils.getIntParameter(httpRequest, "pager.offset", 0);	
			PagingBean bean = new PagingBean();
			bean.setOffset(offset);						 
			bean.put("workline", workline);			
			BuckWaRequest request = new BuckWaRequest();		
			request.put("pagingBean", bean);	
			BuckWaResponse response = worklineService.getByOffset(request);
			if(response.getStatus() == BuckWaConstants.SUCCESS){					
				bean = (PagingBean)response.getResObj("pagingBean");
				mav.addObject("pagingBean", bean);	
				mav.addObject("doSearch","true");
			}else {			
				mav.addObject("errorCode", response.getErrorCode()); 
			}						
		}catch(Exception ex){
			ex.printStackTrace();
			 
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
		}
		return mav;
	}	
	
	
	@RequestMapping(value="edit.htm", method = RequestMethod.GET)
	public ModelAndView initEdit(@RequestParam("id") String id) {	
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.ADMIN_INIT);
		BuckWaRequest request = new BuckWaRequest();
		request.put("id", id);	
		BuckWaResponse response = worklineService.getById(request);
		if(response.getStatus() == BuckWaConstants.SUCCESS){			
			Workline workline = (Workline)response.getResObj("workline");			
			 
			mav.addObject("workline", workline);				
		}else {
			logger.info("  Fail !!!! :"+response.getErrorCode()+" : "+response.getErrorDesc());
			mav.addObject("errorCode", response.getErrorCode()); 
		}	
		mav.setViewName("worklineEdit");

		return mav;
	}	

	@RequestMapping(value="edit.htm", method = RequestMethod.POST)
	public ModelAndView submitEdit(HttpServletRequest httpRequest, @ModelAttribute Workline workline, BindingResult result) {		
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		try{		
			new WorklineValidator().validate(workline, result);
			mav.setViewName("worklineEdit");
			if (result.hasErrors()) {			
//				mav.setViewName("worklineEdit");
			}else {
				BuckWaRequest request = new BuckWaRequest();
				request.put("workline", workline);
				BuckWaResponse response = worklineService.update(request);
				if(response.getStatus() == BuckWaConstants.SUCCESS){				
					mav.addObject("workline",workline);					
					mav.addObject("successCode", response.getSuccessCode()); 
					mav.setView(new RedirectView(httpRequest.getContextPath() + "/admin/workline/init.htm"));
//					gotoWorkLineList(mav);
				}else {				
					mav.addObject("errorCode", response.getErrorCode()); 
				}		
			}					
			
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
		}
		return mav;
	}
	
	
	@RequestMapping(value="delete.htm", method = RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest httpRequest, @RequestParam("id") String id, @ModelAttribute Workline workline, @ModelAttribute PagingBean bean) {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();		
		try{
			mav.setViewName("worklineList");
			BuckWaRequest request = new BuckWaRequest();
			request.put("id", id);	
			BuckWaResponse response = worklineService.deleteById(request);
			
			if(response.getStatus() == BuckWaConstants.SUCCESS){					
				mav.addObject("successCode","S004"); 
				gotoWorkLineList(mav);
			}else {	
				mav.addObject("errorCode", response.getErrorCode()); 
				mav.addObject("pagingBean", bean);
				gotoWorkLineList(mav);
			}	
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
		}
	
		return mav;
	}	
	
	
	@RequestMapping(value="hierarchy.htm", method = RequestMethod.GET)
	public ModelAndView getHierarchy(HttpServletRequest httpRequest) {
		logger.info(" Start");
		ModelAndView mav = new ModelAndView();
		String successCode = (String) httpRequest.getParameter("successCode");
		if(!StringUtils.isEmpty(successCode)){
			mav.addObject("successCode", successCode);
		}
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.ADMIN_INIT);
		WorklineMapping worklineMapping = new WorklineMapping();
		mav.addObject("worklineMapping", worklineMapping);
		
		gotoHierarchy(mav);
		
		return mav;
	}
	public ModelAndView gotoHierarchy(ModelAndView mav){
		try{
			List<WorklineMappingParent> hierarchy = new ArrayList<WorklineMappingParent>();
			mav.setViewName("hierarchy");
			BuckWaResponse response = worklineService.getHierarchy();
			
			if(response.getStatus() == BuckWaConstants.SUCCESS){					
				hierarchy = (List<WorklineMappingParent>)response.getResObj("worklineParentList");
				mav.addObject("hierarchy", hierarchy);	
				if(StringUtils.isEmpty((String) mav.getModelMap().get("successCode"))){
					mav.addObject("successCode", response.getSuccessCode()); 
				}
			}else {			 
				mav.addObject("errorCode", response.getErrorCode()); 
			}						
			
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
		}
		
		return mav;
	}
	
	@RequestMapping(value="addworklinehierarchy.htm", method = RequestMethod.GET)
	public ModelAndView addWorklineHierarchy(HttpServletRequest httpRequest, @RequestParam("parentCode") String parentCode, @RequestParam("worklineName") String worklineName) throws UnsupportedEncodingException {
		logger.info(" Start");
		ModelAndView mav = new ModelAndView();	
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.ADMIN_INIT);
		WorklineMapping worklineMapping = new WorklineMapping();
		parentCode = StringUtils.isEmpty(parentCode)? null : parentCode;
		worklineMapping.setParentCode(parentCode);
		worklineName = StringUtils.isEmpty(worklineName)? "" : worklineName;
		worklineMapping.setWorklineName(UriUtils.encodeUri(worklineName, "UTF-8"));
		mav.addObject("worklineMapping", worklineMapping);
		
		try{
			mav.setViewName("worklineHierarchyAdd");
			BuckWaResponse response = worklineService.getUnassignedWorkline();
			
			if(response.getStatus() == BuckWaConstants.SUCCESS){			
				List<Workline> worklineList = (List<Workline>) response.getResObj("worklineList");
				mav.addObject("worklineList", worklineList);
			}else {			 
				mav.addObject("errorCode", response.getErrorCode()); 
			}						
			
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
		}
		
		return mav;
	}
	
	@RequestMapping(value="addworklinehierarchy.htm", method = RequestMethod.POST)
	public ModelAndView submitAddWorklineHierarchy(HttpServletRequest httpRequest, @ModelAttribute WorklineMapping worklineMapping, BindingResult result) {
		logger.info(" Start");
		ModelAndView mav = new ModelAndView();	
		BuckWaRequest request = new BuckWaRequest();
		request.put("worklineMapping", worklineMapping);
		mav.setViewName("worklineHierarchyAdd");
		
		try{
			new WorklineMappingValidator().validate(worklineMapping, result);			
			if (!result.hasErrors()) {
				BuckWaResponse response = worklineService.addWorklineMapping(request);
				
				if(response.getStatus() == BuckWaConstants.SUCCESS){	
					mav.addObject("successCode", response.getSuccessCode()); 
					mav.setView(new RedirectView(httpRequest.getContextPath() + "/admin/workline/hierarchy.htm"));
				}else {			 
					mav.addObject("errorCode", response.getErrorCode()); 
				}						
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
		}
		
		return mav;
	}
	
	@RequestMapping(value="editworklinehierarchy.htm", method = RequestMethod.GET)
	public ModelAndView editworklinehierarchy(HttpServletRequest httpRequest, @RequestParam("worklineCode") String worklineCode, @RequestParam("worklineName") String worklineName) throws UnsupportedEncodingException {
		logger.info(" Start");
		ModelAndView mav = new ModelAndView();	
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.ADMIN_INIT);
		WorklineMapping worklineMapping = new WorklineMapping();
		worklineMapping.setParentCode(worklineCode);
		worklineMapping.setWorklineName(UriUtils.encodeUri(worklineName, "UTF-8"));
		mav.addObject("worklineMapping", worklineMapping);
		
		try{
			mav.setViewName("worklineHierarchyEdit");
			BuckWaResponse response = worklineService.getUnassignedWorkline();
			
			if(response.getStatus() == BuckWaConstants.SUCCESS){			
				List<Workline> worklineList = (List<Workline>) response.getResObj("worklineList");
				mav.addObject("worklineList", worklineList);
			}else {			 
				mav.addObject("errorCode", response.getErrorCode()); 
			}						
			
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
			gotoHierarchy(mav);
		}
		
		return mav;
	}
	
	@RequestMapping(value="editworklinehierarchy.htm", method = RequestMethod.POST)
	public ModelAndView submitEditworklinehierarchy(HttpServletRequest httpRequest, @ModelAttribute WorklineMapping worklineMapping, BindingResult result) {
		logger.info(" Start");
		ModelAndView mav = new ModelAndView();	
		BuckWaRequest request = new BuckWaRequest();
		request.put("worklineMapping", worklineMapping);
		mav.setViewName("worklineHierarchyEdit");
		try{
			new WorklineMappingValidator().validate(worklineMapping, result);			
			if (!result.hasErrors()) {
				BuckWaResponse response = worklineService.updateWorklineMapping(request);
				
				if(response.getStatus() == BuckWaConstants.SUCCESS){	
					mav.addObject("successCode", response.getSuccessCode()); 
					mav.setView(new RedirectView(httpRequest.getContextPath() + "/admin/workline/hierarchy.htm"));
				}else {			 
					mav.addObject("errorCode", response.getErrorCode()); 
				}		
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
		}
		
		return mav;
	}
	
	@RequestMapping(value="deleteworklinehierarchy.htm", method = RequestMethod.GET)
	public ModelAndView deleteWorklineHierarchy(@RequestParam("worklineCode") String worklineCode) {
		logger.info(" Start");
		ModelAndView mav = new ModelAndView();	
		
		BuckWaRequest request = new BuckWaRequest();
		WorklineMapping worklineMapping = new WorklineMapping();
		mav.addObject("worklineMapping", worklineMapping);
		
		try{
			request.put("worklineCode", worklineCode);
			BuckWaResponse response = worklineService.deleteWorklineMapping(request);
			if(response.getStatus() == BuckWaConstants.SUCCESS){	
				mav.addObject("successCode","S004");
				gotoHierarchy(mav);
			}else {			 
				mav.addObject("errorCode", response.getErrorCode()); 
			}	
						
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
		}
		
		return mav;
	}
	
	@RequestMapping(value="listpersonworkline.htm", method = RequestMethod.GET)
	public ModelAndView listAllPerson(HttpServletRequest httpRequest) {
		logger.info(" Start");
		ModelAndView mav = new ModelAndView();
		String successCode = (String) httpRequest.getParameter("successCode");
		if(!StringUtils.isEmpty(successCode)){
			mav.addObject("successCode", successCode);
		}
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.ADMIN_INIT);
		gotoPersonList(mav);
		return mav;
	}
	
	private ModelAndView gotoPersonList(ModelAndView mav){
		try{
			mav.setViewName("personWorklineList");
			BuckWaRequest request = new BuckWaRequest();
			Person person = new Person();
			mav.addObject("person", person);
			PagingBean bean = new PagingBean();
			int offset = 0;	
			bean.setOffset(offset);		
			bean.put("person", person);
			request.put("pagingBean", bean);
			BuckWaResponse response = worklineService.getWorklinePersonByOffset(request);
			if(response.getStatus() == BuckWaConstants.SUCCESS){					
				bean = (PagingBean)response.getResObj("pagingBean");
				mav.addObject("pagingBean", bean);				
			}else {			 
				mav.addObject("errorCode", response.getErrorCode()); 
			}			
		}catch(Exception e){
			e.printStackTrace();
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
		}
		return mav;
	}
	
	@RequestMapping(value="searchpersonworkline.htm" )
	public ModelAndView searchPersonWorkline(HttpServletRequest httpRequest, @ModelAttribute Person person) {
		logger.info(" Start");
		ModelAndView mav = new ModelAndView();		
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.ADMIN_INIT);
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.ADMIN_INIT);
		mav.setViewName("personWorklineList");
		try{			
			PagingBean bean = new PagingBean();
			int offset = ServletRequestUtils.getIntParameter(httpRequest, "pager.offset", 0);	
			bean.setOffset(offset);		
			bean.put("person", person);
			
			BuckWaRequest request = new BuckWaRequest();
			request.put("pagingBean", bean);		
			BuckWaResponse response = worklineService.getWorklinePersonByOffset(request);
			if(response.getStatus() == BuckWaConstants.SUCCESS){			
				PagingBean beanReturn = (PagingBean)response.getResObj("pagingBean");
				mav.addObject("pagingBean", beanReturn);	
				mav.addObject("doSearch", "true");
			}else {				
				mav.addObject("errorCode", response.getErrorCode()); 
			}						
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
		}
		return mav;
	}		
	
	@RequestMapping(value="editpersonworkline.htm", method = RequestMethod.GET)
	public ModelAndView initEditPersonWorkline(@RequestParam("username") String username, @RequestParam("oldWorklineCode") String oldWorklineCode) {
		logger.info(" Start");
		ModelAndView mav = new ModelAndView();	
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.ADMIN_INIT);
		mav.setViewName("personWorklineEdit");
		BuckWaRequest request = new BuckWaRequest();
		Person person = new Person();

		request.put("username", username);
		
		try{
			BuckWaResponse response = personProfileService.getByUsername(request);
			if(response.getStatus() == BuckWaConstants.SUCCESS){	
				person = (Person) response.getResObj("person");
				person.setWorklineCode(null);
				person.setOldWorklineCode(oldWorklineCode);
//				person.setPersonId(personId);
				mav.addObject("person", person);
			}else {			 
				mav.addObject("errorCode", response.getErrorCode()); 
			}	
			
			response = worklineService.getUnassignedPersonWorkline();
			if(response.getStatus() == BuckWaConstants.SUCCESS){			
				List<Workline> worklineList = (List<Workline>) response.getResObj("worklineList");
				mav.addObject("worklineList", worklineList);
			}else {			 
				mav.addObject("errorCode", response.getErrorCode()); 
			}		
			
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
		}
		
		return mav;
	}
	
	@RequestMapping(value="editpersonworkline.htm", method = RequestMethod.POST)
	public ModelAndView editPersonWorkline(HttpServletRequest httpRequest, @ModelAttribute Person person, BindingResult result) {		
		logger.info(" Start");
		ModelAndView mav = new ModelAndView();
		try{		
			new WorklinePersonMappingValidator().validate(person, result);
			mav.setView(new RedirectView(httpRequest.getContextPath() + "/admin/workline/listpersonworkline.htm"));
			if (result.hasErrors()){
				mav.setViewName("personWorklineEdit");
			}
			else if (!result.hasErrors()){
				BuckWaRequest request = new BuckWaRequest();
				request.put("person", person);
				BuckWaResponse response = worklineService.editWorklinePerson(request);
				if(response.getStatus() == BuckWaConstants.SUCCESS){	
					mav.addObject("successCode", response.getSuccessCode());  
//					gotoPersonList(mav);			
				}else {				
					mav.addObject("errorCode", response.getErrorCode()); 
				}	
			}					
			
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
		}
		return mav;
	}
	
	@RequestMapping(value="addpersonworkline.htm", method = RequestMethod.GET)
	public ModelAndView initAddPersonWorkline(@RequestParam("username") String username) {
		logger.info(" Start");
		ModelAndView mav = new ModelAndView();	
		mav.addObject(BuckWaConstants.PAGE_SELECT, BuckWaConstants.ADMIN_INIT);
		mav.setViewName("personWorklineEdit");
		BuckWaRequest request = new BuckWaRequest();
		Person person = new Person();

		request.put("username", username);
		
		try{
			BuckWaResponse response = personProfileService.getByUsername(request);
			if(response.getStatus() == BuckWaConstants.SUCCESS){	
				person = (Person) response.getResObj("person");
				person.setWorklineCode(null);
				mav.addObject("person", person);
			}else {			 
				mav.addObject("errorCode", response.getErrorCode()); 
			}	
			
			response = worklineService.getUnassignedPersonWorkline();
			if(response.getStatus() == BuckWaConstants.SUCCESS){			
				List<Workline> worklineList = (List<Workline>) response.getResObj("worklineList");
				mav.addObject("worklineList", worklineList);
			}else {			 
				mav.addObject("errorCode", response.getErrorCode()); 
			}		
			
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
		}
		
		return mav;
	}
	
	@RequestMapping(value="addpersonworkline.htm", method = RequestMethod.POST)
	public ModelAndView addPersonWorkline(HttpServletRequest httpRequest, @ModelAttribute Person person, BindingResult result) {		
		logger.info(" Start");
		ModelAndView mav = new ModelAndView();
		try{		
			new WorklinePersonMappingValidator().validate(person, result);
			mav.setView(new RedirectView(httpRequest.getContextPath() + "/admin/workline/listpersonworkline.htm"));
			if (result.hasErrors()){
				mav.setViewName("personWorklineEdit");
			}else if (!result.hasErrors()){
				BuckWaRequest request = new BuckWaRequest();
				request.put("person", person);
				BuckWaResponse response = worklineService.addWorklinePerson(request);
				if(response.getStatus() == BuckWaConstants.SUCCESS){	
					mav.addObject("successCode", response.getSuccessCode());  
//					gotoPersonList(mav);			
				}else {				
					mav.addObject("errorCode", response.getErrorCode()); 
				}	
			}					
			
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
		}
		return mav;
	}
	
	@RequestMapping(value="deletepersonworkline.htm", method = RequestMethod.GET)
	public ModelAndView editPersonWorkline(HttpServletRequest httpRequest, @RequestParam("personId") Long personId, @RequestParam("worklineCode") String worklineCode) {		
		
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();		
		Person person = new Person();
		person.setPersonId(personId);
		person.setWorklineCode(worklineCode);
		mav.setView(new RedirectView(httpRequest.getContextPath() + "/admin/workline/listpersonworkline.htm"));
		try{
			BuckWaRequest request = new BuckWaRequest();
			request.put("person", person);	
			BuckWaResponse response = worklineService.deleteWorklinePerson(request);
			
			if(response.getStatus() == BuckWaConstants.SUCCESS){					
				mav.addObject("successCode", response.getSuccessCode());  
			}else {	
				mav.addObject("errorCode", response.getErrorCode()); 
			}	
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", BuckWaConstants.ERROR_E001); 
		}
	
		return mav;
	}
	
	
}
