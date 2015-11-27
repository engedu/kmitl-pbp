package com.buckwa.web.controller.pbp;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pbp.AcademicKPI;
import com.buckwa.domain.pbp.AcademicKPIAttribute;
import com.buckwa.domain.pbp.AcademicKPIWrapper;
import com.buckwa.domain.pbp.AcademicUnitWrapper;
import com.buckwa.domain.pbp.PBPWorkType;
import com.buckwa.domain.pbp.PBPWorkTypeSub;
import com.buckwa.domain.pbp.PBPWorkTypeWrapper;
import com.buckwa.service.intf.pbp.AcademicKPIService;
import com.buckwa.service.intf.pbp.AcademicUnitService;
import com.buckwa.service.intf.pbp.PBPWorkTypeService;
import com.buckwa.util.BeanUtils;
import com.buckwa.util.BuckWaConstants;
import com.buckwa.util.school.SchoolUtil;

@Controller
@RequestMapping("/admin/pbp/academicKPI")
@SessionAttributes({"academicKPIWrapper","academicKPI"} ) 
public class AcademicKPIController {	
	private static Logger logger = Logger.getLogger(AcademicKPIController.class);	 
	@Autowired
	private AcademicKPIService academicKPIService;	
	
	@Autowired
	private PBPWorkTypeService pBPWorkTypeService;	
	@Autowired
	private SchoolUtil schoolUtil;
	
	@Autowired
	private AcademicUnitService academicUnitService;	
	
	@RequestMapping(value="init.htm", method = RequestMethod.GET)
	public ModelAndView initList() {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("academicKPIList");
		try{
			BuckWaRequest request = new BuckWaRequest();
			String academicYear =schoolUtil.getCurrentAcademicYear();
			request.put("academicYear",academicYear);
			
			request.put("academicYear",academicYear);
			BuckWaResponse  response = pBPWorkTypeService.getByAcademicYear(request);
			if(response.getStatus()==BuckWaConstants.SUCCESS){	
				PBPWorkTypeWrapper pBPWorkTypeWrapper = (PBPWorkTypeWrapper)response.getResObj("pBPWorkTypeWrapper");
				List<PBPWorkType> workTypeList = pBPWorkTypeWrapper.getpBPWorkTypeList();
				
				if(workTypeList!=null&&workTypeList.size()>0){
					PBPWorkType workType0 =	 workTypeList.get(0) ;
					request.put("workTypeCode",workType0.getCode());
				}
				
				response = academicKPIService.getByAcademicYearWorkTypeCode(request);
				if(response.getStatus()==BuckWaConstants.SUCCESS){	
					AcademicKPIWrapper academicKPIWrapper = (AcademicKPIWrapper)response.getResObj("academicKPIWrapper");			 
					academicKPIWrapper.setAcademicYear(academicYear); 
					academicKPIWrapper.setpBPWorkType(workTypeList.get(0));
					academicKPIWrapper.setpBPWorkTypeList(workTypeList);	
					mav.addObject("academicKPIWrapper", academicKPIWrapper);	
				}

			}	 
			 
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		logger.info(" end view: "+mav.getViewName());
		return mav;
	}	
	@RequestMapping(value="listByWorktype.htm", method = RequestMethod.GET)
	public ModelAndView listByWorktype(@RequestParam("workTypeCode") String workTypeCode,@RequestParam("academicYear") String academicYear) {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("academicKPIList");
		try{
			BuckWaRequest request = new BuckWaRequest();
			 
			request.put("academicYear",academicYear);
			request.put("workTypeCode",workTypeCode);
			BuckWaResponse response = academicKPIService.getByAcademicYearWorkTypeCode(request);
			if(response.getStatus()==BuckWaConstants.SUCCESS){	
				AcademicKPIWrapper academicKPIWrapper = (AcademicKPIWrapper)response.getResObj("academicKPIWrapper");			 
				academicKPIWrapper.setAcademicYear(academicYear);
				
				request.put("academicYear",academicYear);
				 response = pBPWorkTypeService.getByAcademicYear(request);
				if(response.getStatus()==BuckWaConstants.SUCCESS){	
					PBPWorkTypeWrapper pBPWorkTypeWrapper = (PBPWorkTypeWrapper)response.getResObj("pBPWorkTypeWrapper");
					academicKPIWrapper.setpBPWorkTypeList(pBPWorkTypeWrapper.getpBPWorkTypeList());
				} 
				request.put("workTypeCode",workTypeCode);
				 response = pBPWorkTypeService.getByCode(request);
				if(response.getStatus()==BuckWaConstants.SUCCESS){	
					PBPWorkType pBPWorkType  = (PBPWorkType)response.getResObj("pBPWorkType");
					 
					academicKPIWrapper.setpBPWorkType(pBPWorkType);
					
					
					List<PBPWorkTypeSub> workTypeSubList  =pBPWorkType.getpBPWorkTypeSubList();
					if(workTypeSubList!=null&&workTypeSubList.size()>0){
						// Set
					}
					 
				}				 
				mav.addObject("academicKPIWrapper", academicKPIWrapper);	
			}	 

		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}	
	
	@RequestMapping(value="create.htm", method = RequestMethod.GET)
	public ModelAndView createKPI(@RequestParam("workTypeCode") String workTypeCode,@RequestParam("academicYear") String academicYear) {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("academicKPICreate");
		try{
			AcademicKPI academicKPI = new AcademicKPI();
			academicKPI.setAcademicYear(academicYear);
			academicKPI.setWorkTypeCode(workTypeCode);
			mav.addObject("academicKPI",academicKPI);
			
			
			BuckWaRequest request = new BuckWaRequest(); 
			request.put("academicYear",academicYear);
			BuckWaResponse response = academicUnitService.getByAcademicYear(request);
			if(response.getStatus()==BuckWaConstants.SUCCESS){	
				AcademicUnitWrapper academicUnitWrapper = (AcademicUnitWrapper)response.getResObj("academicUnitWrapper");
				academicKPI.setAcademicUnitList(academicUnitWrapper.getAcademicUnitList());
	 
			}	 
           

		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}	
	
	
	@RequestMapping(value="create.htm", method = RequestMethod.POST)
	public ModelAndView createKPI(HttpServletRequest httpRequest,@ModelAttribute AcademicKPI academicKPI, BindingResult result) {
		logger.info(" Start   academicKPI:"+BeanUtils.getBeanString(academicKPI));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("academicKPICreate");
		try{
			
			BuckWaRequest request = new BuckWaRequest(); 
			request.put("academicKPI",academicKPI);
			BuckWaResponse response = academicKPIService.create(request);
			if(response.getStatus()==BuckWaConstants.SUCCESS){ 
		 
				String url = httpRequest.getContextPath() + "/admin/pbp/academicKPI/listByWorktype.htm?workTypeCode="+academicKPI.getWorkTypeCode()+"&academicYear="+academicKPI.getAcademicYear();
				logger.info(" Redirect URL:"+url);
				 
				mav.setView(new RedirectView(url));
			}	
            

		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}
	
	
	@RequestMapping(value="edit.htm", method = RequestMethod.GET)
	public ModelAndView editKPI(@RequestParam("academicKPIId") String academicKPIId ) {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("academicKPIEdit");
		try{
		 
			BuckWaRequest request = new BuckWaRequest(); 
			 
			request.put("academicKPIId",academicKPIId);
			BuckWaResponse response = academicKPIService.getById(request);
			AcademicKPI academicKPI = (AcademicKPI)response.getResObj("academicKPI");
			
			request.put("academicYear",academicKPI.getAcademicYear());
			 response = academicUnitService.getByAcademicYear(request);
			if(response.getStatus()==BuckWaConstants.SUCCESS){	
				AcademicUnitWrapper academicUnitWrapper = (AcademicUnitWrapper)response.getResObj("academicUnitWrapper");
				academicKPI.setAcademicUnitList(academicUnitWrapper.getAcademicUnitList());
	 
			}	
	 
			mav.addObject("academicKPI",academicKPI);
	 
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}	
	
	@RequestMapping(value="edit.htm", method = RequestMethod.POST)
	public ModelAndView editKPI(HttpServletRequest httpRequest,@ModelAttribute AcademicKPI academicKPI, BindingResult result) {
		logger.info(" Start   editKPI:"+BeanUtils.getBeanString(academicKPI));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("academicKPIEdit");
		try{
			
			BuckWaRequest request = new BuckWaRequest(); 
			request.put("academicKPI",academicKPI);
			BuckWaResponse response = academicKPIService.edit(request);
			if(response.getStatus()==BuckWaConstants.SUCCESS){ 
				request.put("academicKPIId",academicKPI.getAcademicKPIId());
				 response = academicKPIService.getById(request);
				 academicKPI = (AcademicKPI)response.getResObj("academicKPI");
				String url = httpRequest.getContextPath() + "/admin/pbp/academicKPI/listByWorktype.htm?workTypeCode="+academicKPI.getWorkTypeCode()+"&academicYear="+academicKPI.getAcademicYear();
				logger.info(" Redirect URL:"+url);
				 
				mav.setView(new RedirectView(url));
			}	
            

		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}	
	
	@RequestMapping(value="delete.htm", method = RequestMethod.GET)
	public ModelAndView deleteKPI(HttpServletRequest httpRequest,@RequestParam("academicKPIId") String academicKPIId ,@RequestParam("workTypeCode") String workTypeCode,@RequestParam("academicYear") String academicYear) {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("academicKPIList");
		try{
		 
			BuckWaRequest request = new BuckWaRequest(); 
			 
			request.put("academicKPIId",academicKPIId);
			BuckWaResponse response = academicKPIService.deleteById(request); 
			String url = httpRequest.getContextPath() + "/admin/pbp/academicKPI/listByWorktype.htm?workTypeCode="+workTypeCode+"&academicYear="+academicYear;
			logger.info(" Redirect URL:"+url);
			 
			mav.setView(new RedirectView(url));
		 
	 
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}	
	
	
	@RequestMapping(value="addNewAttribute.htm", method = RequestMethod.GET)
	public ModelAndView addNewAttribute(HttpServletRequest httpRequest,@RequestParam("academicKPIId") String academicKPIId ) {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("academicKPIEdit");
		try{
		 
			BuckWaRequest request = new BuckWaRequest();  
			request.put("academicKPIId",academicKPIId);
			BuckWaResponse response = academicKPIService.getById(request);
			AcademicKPI academicKPI = (AcademicKPI)response.getResObj("academicKPI"); 
			request.put("academicYear",academicKPI.getAcademicYear());
			response = academicUnitService.getByAcademicYear(request);
			if(response.getStatus()==BuckWaConstants.SUCCESS){	
				AcademicUnitWrapper academicUnitWrapper = (AcademicUnitWrapper)response.getResObj("academicUnitWrapper");
				academicKPI.setAcademicUnitList(academicUnitWrapper.getAcademicUnitList()); 
				// Add new Attribute
				AcademicKPIAttribute newAcademicKPIAttribute = new AcademicKPIAttribute();
				newAcademicKPIAttribute.setAcademicKPIId(academicKPI.getAcademicKPIId());
				newAcademicKPIAttribute.setAcademicKPICode(academicKPI.getCode());
				newAcademicKPIAttribute.setAcademicYear(academicKPI.getAcademicYear());
				
				request.put("academicKPIAttribute",newAcademicKPIAttribute);
				response = academicKPIService.addNewAttribute(request);
				if(response.getStatus()==BuckWaConstants.SUCCESS){	
					AcademicKPIAttribute academicKPIAttribute = (AcademicKPIAttribute)response.getResObj("academicKPIAttribute");
					if(academicKPI.getAcademicKPIAttributeList()==null){
						List<AcademicKPIAttribute> attributeList = new ArrayList();
						attributeList.add(academicKPIAttribute);
						academicKPI.setAcademicKPIAttributeList(attributeList);
					}else{
						academicKPI.getAcademicKPIAttributeList().add(academicKPIAttribute);
					}
					 				
				}
				

			}	
	 
			mav.addObject("academicKPI",academicKPI); 
			String url = httpRequest.getContextPath() + "/admin/pbp/academicKPI/edit.htm?academicKPIId="+academicKPIId;
			logger.info(" Redirect URL:"+url);
			 
			mav.setView(new RedirectView(url));
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}
 
	@RequestMapping(value="deleteAttribute.htm", method = RequestMethod.GET)
	public ModelAndView deleteAttribute(@RequestParam("academicKPIAtributeId") String academicKPIAtributeId,@RequestParam("academicKPIId") String academicKPIId ) {
		logger.info(" Start  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("academicKPIEdit");
		try{
		 
			BuckWaRequest request = new BuckWaRequest(); 
			
			
			
			request.put("academicKPIAtributeId",academicKPIAtributeId);
			BuckWaResponse response = academicKPIService.deleteAttributeById(request);
			
			
			 
			request.put("academicKPIId",academicKPIId);
			 response = academicKPIService.getById(request);
			AcademicKPI academicKPI = (AcademicKPI)response.getResObj("academicKPI");
			
			request.put("academicYear",academicKPI.getAcademicYear());
			 response = academicUnitService.getByAcademicYear(request);
			if(response.getStatus()==BuckWaConstants.SUCCESS){	
				AcademicUnitWrapper academicUnitWrapper = (AcademicUnitWrapper)response.getResObj("academicUnitWrapper");
				academicKPI.setAcademicUnitList(academicUnitWrapper.getAcademicUnitList());
	 
			}	
	 
			mav.addObject("academicKPI",academicKPI);
	 
		}catch(Exception ex){
			ex.printStackTrace();
			mav.addObject("errorCode", "E001"); 
		}
		return mav;
	}	
	
	

	
}
