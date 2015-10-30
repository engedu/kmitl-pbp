package com.buckwa.service.impl.pam;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.buckwa.dao.intf.pam.WorklineDao;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.common.PagingBean;
import com.buckwa.domain.pam.Person;
import com.buckwa.domain.pam.Workline;
import com.buckwa.domain.pam.WorklineMapping;
import com.buckwa.domain.pam.WorklineMappingParent;
import com.buckwa.service.intf.pam.WorklineService;
import com.buckwa.util.BuckWaConstants;

/*
@Author : Teerawoot Charoenporn(Tor)
@Create : Aug 13, 2012 1:34:42 PM
 */
@Service("WorklineService")
public class WorklineServiceImpl implements WorklineService{
	private static Logger logger = Logger.getLogger(WorklineServiceImpl.class);
	
	@Autowired
	private WorklineDao worklineDao;
	
	@Override
	public BuckWaResponse getAll() {
		BuckWaResponse response = new BuckWaResponse();
		try{		
			List<Workline> worklineList = worklineDao.getAll();			
			response.addResponse("worklineList", worklineList);				
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E001);			
		}
		return response;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse create(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{	
			Workline workline = (Workline)request.get("workline");		
			
			boolean isWorklineExist = worklineDao.isExist(workline.getWorklineName(), workline.getWorklineCode());
			if(isWorklineExist){
				response.setStatus(BuckWaConstants.FAIL);
				response.setErrorCode(BuckWaConstants.ERROR_E002);		
			}else{
				workline.setWorklineCode("");
				Long id = worklineDao.create(workline);
				workline.setId(id);
				workline.setWorklineCode(StringUtils.leftPad(id.toString(), BuckWaConstants.MAX_LEFT_PADDING , BuckWaConstants.LEFT_PADDING_CHAR));
				worklineDao.update(workline);
				response.setStatus(BuckWaConstants.SUCCESS);
				response.setSuccessCode(BuckWaConstants.MSGCODE_IMPORT_SUCESS);
			}

		}catch(DuplicateKeyException dx){			
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E002);			
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E001);			
		}
	 
		return response;
	}
	


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse update(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{	
			Workline workline = (Workline)request.get("workline");
			boolean isWorklineExist = worklineDao.isExistForUpdate(workline.getWorklineName(),workline.getWorklineCode(),workline.getId());
			if(isWorklineExist){
				response.setStatus(BuckWaConstants.FAIL);
				response.setErrorCode("E002");		
			}else{
				worklineDao.update(workline);	
				response.setStatus(BuckWaConstants.SUCCESS);
				response.setSuccessCode(BuckWaConstants.MSGCODE_EDIT_SUCESS);	
			}
						
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E001);			
		}	 
		return response;
	}


	@Override
	public BuckWaResponse getByOffset(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{					
			logger.info(" Start");
			PagingBean pagingBean = (PagingBean)request.get("pagingBean");			 
			PagingBean returnBean = worklineDao.getByOffset(pagingBean);			
			response.addResponse("pagingBean",returnBean);				
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E001);			
		}	
		return response;
	}


	@Override
	public BuckWaResponse getById(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{					
			logger.info(" Start");
			String id =  (String) request.get("id");			
			Workline workline = worklineDao.getById(id);						
			if(workline != null){
				response.addResponse("workline", workline);
			}else{
				
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E001);			
		}
		return response;
	}

	@Override
	public BuckWaResponse deleteById(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{		
			String id = (String)request.get("id");
			
			// Check is this id still using
			boolean isKpiCategoryAlreadyUsege = worklineDao.isAlreadyUsege(id);
			if(isKpiCategoryAlreadyUsege){
				response.setStatus(BuckWaConstants.FAIL);
				response.setErrorCode("E010");	
			}else{
				worklineDao.deleteById(id);	
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E001);			
		}
		return response;
	}

	@Override
	public BuckWaResponse getHierarchy() {
		BuckWaResponse response = new BuckWaResponse();
		String worklineCode = null;
		try{		
			// Level 0
			List<WorklineMappingParent> worklineParentList = worklineDao.getWorklineMappingByWorklineCode(worklineCode);
			if(worklineParentList != null && worklineParentList.size() > 0){
				for (int i = 0; i < worklineParentList.size(); i++) {
					// Level 1
					List<WorklineMappingParent> childListLv1 = getWorklineChildList(worklineParentList.get(i).getWorklineCode());
					if(childListLv1 != null && childListLv1.size() > 0){
						for (int j = 0; j < childListLv1.size(); j++) {
							// Level 2
							List<WorklineMappingParent> childListLv2 = getWorklineChildList(childListLv1.get(j).getWorklineCode());
							if(childListLv2 != null && childListLv2.size() > 0){
								for (int k = 0; k < childListLv2.size(); k++) {
									// Level 3
									List<WorklineMappingParent> childListLv3 = getWorklineChildList(childListLv2.get(k).getWorklineCode());
									if(childListLv3 != null && childListLv3.size() > 0){
										for (int l = 0; l < childListLv3.size(); l++) {
											// Level 4
											List<WorklineMappingParent> childListLv4 = getWorklineChildList(childListLv3.get(l).getWorklineCode());
											if(childListLv4 != null && childListLv4.size() > 0){
												for (int m = 0; m < childListLv4.size(); m++) {
													// Level 5
													List<WorklineMappingParent> childListLv5 = getWorklineChildList(childListLv4.get(m).getWorklineCode());
													if(childListLv5 != null && childListLv5.size() > 0){
														childListLv4.get(m).setChildWorklineList(childListLv5);
													}
												}
											}
											childListLv3.get(l).setChildWorklineList(childListLv4);
										}
									}
									childListLv2.get(k).setChildWorklineList(childListLv3);
								}
							}
							childListLv1.get(j).setChildWorklineList(childListLv2);
						}
					}
					worklineParentList.get(i).setChildWorklineList(childListLv1);
				}
				
				response.addResponse("worklineParentList", worklineParentList);
			}else{
				response.setStatus(BuckWaConstants.SUCCESS);
				response.setSuccessCode(BuckWaConstants.NO_DATA_FOUND);	
			}
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E001);			
		}
		
		return response;
	}
	
	@Override
	public List<WorklineMappingParent> getWorklineChildList(String worklineCode){
		List<WorklineMappingParent> worklineMappingChildList = worklineDao.getWorklineMappingByWorklineCode(worklineCode);
		return worklineMappingChildList;
	}

	@Override
	public BuckWaResponse getUnassignedPersonWorkline() {
		BuckWaResponse response = new BuckWaResponse();
		try{		
			List worklineList = worklineDao.getUnassignedPersonWorkline();
			response.addResponse("worklineList", worklineList);				
			
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E001);			
		}
		return response;
	}
	
	@Override
	public BuckWaResponse getUnassignedWorkline() {
		BuckWaResponse response = new BuckWaResponse();
		try{		
			List worklineList = worklineDao.getUnassignedWorkline();
			response.addResponse("worklineList", worklineList);				
			
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E001);			
		}
		return response;
	}

	@Override
	public BuckWaResponse deleteWorklineMapping(BuckWaRequest request) {
		String worklineCode = (String) request.get("worklineCode");
		BuckWaResponse response = new BuckWaResponse();
		try{	
			boolean isAlreadyUsage = worklineDao.isAlreadyUsege(worklineCode, true);
			if(isAlreadyUsage){
				response.setStatus(BuckWaConstants.FAIL);
				response.setErrorCode("E010");	
			}else{
				worklineDao.deleteWorklineMapping(worklineCode);
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E001);			
		}
		return response;
	}

	@Override
	public BuckWaResponse addWorklineMapping(BuckWaRequest request) {
		WorklineMapping worklineMapping = (WorklineMapping) request.get("worklineMapping");
		if( StringUtils.isEmpty(worklineMapping.getParentCode()) ){
			worklineMapping.setParentCode(null);
		}
		BuckWaResponse response = new BuckWaResponse();
		try{	
			boolean isAlreadyUsage = worklineDao.isAlreadyUsege(worklineMapping.getWorklineCode(), false);
			if(isAlreadyUsage){
				response.setStatus(BuckWaConstants.FAIL);
				response.setErrorCode("E002");	
			}else{
				worklineDao.addWorklineMapping(worklineMapping.getWorklineCode(), worklineMapping.getParentCode());
				response.setStatus(BuckWaConstants.SUCCESS);
				response.setSuccessCode(BuckWaConstants.MSGCODE_IMPORT_SUCESS);
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E001);			
		}
		return response;
	}

	@Override
	public BuckWaResponse updateWorklineMapping(BuckWaRequest request) {
		WorklineMapping worklineMapping = (WorklineMapping) request.get("worklineMapping");
		BuckWaResponse response = new BuckWaResponse();
		try{	
			boolean isAlreadyUsage = worklineDao.isAlreadyUsege(worklineMapping.getWorklineCode(), false);
			if(isAlreadyUsage){
				response.setStatus(BuckWaConstants.FAIL);
				response.setErrorCode("E002");	
			}else{
				worklineDao.updateWorklineMapping(worklineMapping.getWorklineCode(), worklineMapping.getParentCode());
				response.setStatus(BuckWaConstants.SUCCESS);
				response.setSuccessCode(BuckWaConstants.MSGCODE_EDIT_SUCESS);	
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E001);			
		}
		return response;
	}

	@Override
	public BuckWaResponse getWorklinePersonByOffset(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try {
			logger.info("WorklineServiceImpl.getWorklinePersonByOffset");
			PagingBean pagingBean = (PagingBean) request.get("pagingBean");
			PagingBean returnBean = worklineDao.getWorklinePersonByOffset(pagingBean);
			response.addResponse("pagingBean", returnBean);
		}
		catch (Exception ex) {
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E001);
		}
		return response;
	}

	@Override
	public BuckWaResponse addWorklinePerson(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try {
			logger.info(" WorklineServiceImpl.addWorklinePerson");
			Person domain = (Person) request.get("person");
			worklineDao.addWorklinePerson(domain);
			response.setStatus(BuckWaConstants.SUCCESS);
			response.setSuccessCode(BuckWaConstants.MSGCODE_IMPORT_SUCESS);
		}
		catch(Exception e) {
			e.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E001);
		}
		return response;
	}

	@Override
	public BuckWaResponse editWorklinePerson(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try {
			logger.info(" WorklineServiceImpl.editWorklinePerson");
			Person domain = (Person) request.get("person");
			worklineDao.updateWorklinePerson(domain);
			response.setStatus(BuckWaConstants.SUCCESS);
			response.setSuccessCode(BuckWaConstants.MSGCODE_EDIT_SUCESS);
		}
		catch(Exception e) {
			e.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E001);
		}
		return response;
	}

	@Override
	public BuckWaResponse deleteWorklinePerson(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try {
			logger.info(" WorklineServiceImpl.editWorklinePerson");
			Person domain = (Person) request.get("person");
			worklineDao.deleteWorklinePerson(domain);
			response.setStatus(BuckWaConstants.SUCCESS);
			response.setSuccessCode(BuckWaConstants.MSGCODE_DELETE_SUCESS);
		}
		catch(Exception e) {
			e.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode(BuckWaConstants.ERROR_E001);
		}
		return response;
	}
}
