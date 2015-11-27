package com.buckwa.service.impl.pbp;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.buckwa.dao.intf.pbp.HeadDao;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pbp.AcademicKPIUserMappingWrapper;
import com.buckwa.domain.pbp.Department;
import com.buckwa.domain.pbp.report.DepartmentWorkTypeReport;
import com.buckwa.service.intf.pbp.HeadService;
import com.buckwa.util.BuckWaConstants;

@Service("headService")
 
public class HeadServiceImpl implements HeadService {
	private static Logger logger = Logger.getLogger(HeadServiceImpl.class);
	
	@Autowired
	private HeadDao headDao;
 

	@Override	
	public BuckWaResponse getByHeadAcademicYear(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		
		// String headUserName ,String academicYear,String status
		try{				 
			
			String headUserName = (String)request.get("headUserName");
			String academicYear = (String)request.get("academicYear");
			String status = (String)request.get("status");
			
			AcademicKPIUserMappingWrapper academicKPIUserMappingWrapper= ( AcademicKPIUserMappingWrapper)headDao.getByHeadAcademicYear(headUserName,academicYear,status);
		 
			 response.addResponse("academicKPIUserMappingWrapper",academicKPIUserMappingWrapper);
 	
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
	@Override	
	public BuckWaResponse saveDepartmentReportSummary(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		
		// String headUserName ,String academicYear,String status
		try{				 
			
			Department department = (Department)request.get("department");
		 
		 headDao.saveDepartmentReportSummary(department);
		 
	 
 	
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
	
	
	
	@Override	
	public BuckWaResponse getByUserAcademicYear(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		
		// String headUserName ,String academicYear,String status
		try{				 
			
			String headUserName = (String)request.get("headUserName");
			String academicYear = (String)request.get("academicYear");
			String status = (String)request.get("status");
			String userName = (String)request.get("userName");
			AcademicKPIUserMappingWrapper academicKPIUserMappingWrapper= ( AcademicKPIUserMappingWrapper)headDao.getByUserAcademicYear(headUserName,academicYear,status,userName);
		 
			 response.addResponse("academicKPIUserMappingWrapper",academicKPIUserMappingWrapper);
 	
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
	
	@Override	
	public BuckWaResponse getDepartmentMark(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		
		// String headUserName ,String academicYear,String status
		try{				  
			String academicYear = (String)request.get("academicYear");
			String headUserName = (String)request.get("headUserName");
			
			Department department= ( Department)headDao.getDepartmentMark(headUserName, academicYear);
		 
			 response.addResponse("department",department);
 	
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
	@Override	
	public BuckWaResponse getDepartmentMarkByUser(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		
		// String headUserName ,String academicYear,String status
		try{				  
			String academicYear = (String)request.get("academicYear");
			String userName = (String)request.get("userName");
			
			Department department= ( Department)headDao.getDepartmentMarkByUser(userName, academicYear);
		 
			 response.addResponse("department",department);
 	
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
	
	
	@Override	
	public BuckWaResponse getReportWorkTypeDepartment(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		
		// String headUserName ,String academicYear,String status
		try{				  
			Department department = (Department)request.get("department"); 
			String workType = (String)request.get("workType"); 
			
			List<DepartmentWorkTypeReport> departmentWorkTypeReportList= ( List<DepartmentWorkTypeReport>)headDao.getReportWorkTypeDepartment(workType, department);
		 
			 response.addResponse("departmentWorkTypeReportList",departmentWorkTypeReportList);
 	
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
	 
		return response;
	}
	
	
	
}
