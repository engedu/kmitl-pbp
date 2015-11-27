package com.buckwa.service.impl.pbp;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.buckwa.dao.intf.pbp.AcademicKPIDao;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pbp.AcademicKPI;
import com.buckwa.domain.pbp.AcademicKPIAttribute;
import com.buckwa.domain.pbp.AcademicKPIUserMapping;
import com.buckwa.domain.pbp.AcademicKPIWrapper;
import com.buckwa.service.intf.pbp.AcademicKPIService;
import com.buckwa.util.BuckWaConstants;

@Service("academicKPIService")
 
public class AcademicKPIServiceImpl implements AcademicKPIService {
	private static Logger logger = Logger.getLogger(AcademicKPIServiceImpl.class);
	
	@Autowired
	private AcademicKPIDao academicKPIDao;
 

	@Override	
	public BuckWaResponse getByAcademicYear(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{				 
			
			String academicYear = (String)request.get("academicYear");
			AcademicKPIWrapper academicKPIWrapper= ( AcademicKPIWrapper)academicKPIDao.getByAcademicYear(academicYear);
		 
			 response.addResponse("academicKPIWrapper",academicKPIWrapper);
 	
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
	@Override	
	public BuckWaResponse getByCodeAcademicYear(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{				 
			
			String academicYear = (String)request.get("academicYear");
			String academicKPICode = (String)request.get("academicKPICode");
			AcademicKPI academicKPI= ( AcademicKPI)academicKPIDao.getByCodeAcademicYear(academicKPICode,academicYear);
		 
			 response.addResponse("academicKPI",academicKPI);
 	
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
	
	@Override	
	public BuckWaResponse getAllByAcademicYear(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{				 
			
			String academicYear = (String)request.get("academicYear");
			 
			AcademicKPIWrapper academicKPIWrapper= ( AcademicKPIWrapper)academicKPIDao.getAllByAcademicYear( academicYear);
		 
			 response.addResponse("academicKPIWrapper",academicKPIWrapper);
 	
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
	
	
	@Override	
	public BuckWaResponse getById(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{				 
			
			String academicKPIId =  request.get("academicKPIId")+"";
			AcademicKPI academicKPI= ( AcademicKPI)academicKPIDao.getById(academicKPIId);
		 
			 response.addResponse("academicKPI",academicKPI);
 	
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
	
	@Override	
	public BuckWaResponse deleteById(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{				 
			
			String academicKPIId =  request.get("academicKPIId")+"";
			 academicKPIDao.deleteById(academicKPIId);
		 
 	
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
	
	@Override	
	public BuckWaResponse deleteAttributeById(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{				 
			
			String academicKPIAtributeId =  request.get("academicKPIAtributeId")+"";
			 academicKPIDao.deleteAttributeById(academicKPIAtributeId);
		 
 	
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
	
	
	@Override	
	public BuckWaResponse getByAcademicYearWorkTypeCode(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{				 
			
			String academicYear = (String)request.get("academicYear");
			String workTypeCode = (String)request.get("workTypeCode");
			AcademicKPIWrapper academicKPIWrapper= ( AcademicKPIWrapper)academicKPIDao.getByAcademicYearWorkTypeCode(academicYear,workTypeCode);
		 
			 response.addResponse("academicKPIWrapper",academicKPIWrapper);
 	
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
	
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse create(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{	
			AcademicKPI academicKPI = (AcademicKPI)request.get("academicKPI");		
			
			boolean isExist = academicKPIDao.isExistCreate(academicKPI);
			if(isExist){
				response.setStatus(BuckWaConstants.FAIL);
				response.setErrorCode("E002");		
			}else{
				academicKPIDao.create(academicKPI);
				response.setSuccessCode(BuckWaConstants.MSGCODE_IMPORT_SUCESS);
			}

		}catch(DuplicateKeyException dx){			
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E002");			
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse importwork(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{	
			AcademicKPIUserMapping academicKPIUserMapping = (AcademicKPIUserMapping)request.get("academicKPIUserMapping");		
 
				Long academicKPIId =academicKPIDao.importwork(academicKPIUserMapping);
				response.addResponse("academicKPIId", academicKPIId);
				response.setSuccessCode(BuckWaConstants.MSGCODE_IMPORT_SUCESS);
		 

		}catch(DuplicateKeyException dx){			
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E002");			
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
 
	
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse addNewAttribute(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{	
			AcademicKPIAttribute academicKPIAttribute = (AcademicKPIAttribute)request.get("academicKPIAttribute");		
			
			boolean isExist = academicKPIDao.isAttributeExistCreate(academicKPIAttribute);
			if(isExist){
				response.setStatus(BuckWaConstants.FAIL);
				response.setErrorCode("E002");		
			}else{
				academicKPIDao.addNewAttribute(academicKPIAttribute);
				response.setSuccessCode(BuckWaConstants.MSGCODE_IMPORT_SUCESS);
			}

		}catch(DuplicateKeyException dx){			
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E002");			
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
	
	
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse edit(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{	
			AcademicKPI academicKPI = (AcademicKPI)request.get("academicKPI");		
 
				academicKPIDao.edit(academicKPI);
				response.setSuccessCode(BuckWaConstants.MSGCODE_IMPORT_SUCESS);
		 

		}catch(DuplicateKeyException dx){			
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E002");			
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
	 
	
}
