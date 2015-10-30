package com.buckwa.service.impl.pam;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.buckwa.dao.intf.pam.LeaveFlowDao;
import com.buckwa.dao.intf.pam.CancelLeaveDao;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pam.Leave;
import com.buckwa.domain.pam.CancelLeave;
import com.buckwa.service.intf.pam.CancelLeaveService;
import com.buckwa.util.BuckWaConstants;

/*
 @Author : Wichien Prommese(Pe)
 @Create : Aug 5, 2012 10:05:04 AM
 */
@Service("cancelLeaveService")
public class CancelLeaveServiceImpl implements CancelLeaveService {

	private static Logger logger = Logger.getLogger(CancelLeaveServiceImpl.class);

	@Autowired
	private CancelLeaveDao cancelLeaveDao;
	
	@Autowired
	private LeaveFlowDao leaveFlowDao;
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse create(BuckWaRequest request) {
		logger.info("CancelLeaveServiceImpl.flowProcess");
		BuckWaResponse response = new BuckWaResponse();
		try {
			CancelLeave obj = (CancelLeave) request.get("cancelLeave");
			
			//create leave Research
			obj = cancelLeaveDao.create(obj);
			
			//create leave Flow
			Leave leave = new Leave();
			leave.setDocNo(obj.getDocNo());
			leave.setFromDate(obj.getFromDate());
			leave.setToDate(obj.getToDate());
			leave.setOwnerId(obj.getLeaveByPersonId());
			leave.setFlowStatus(BuckWaConstants.L_INPROCESS);
			leave.setCreateBy(obj.getCreateBy());
			leave.setLeaveTypeCode(BuckWaConstants.LEAVE_CANCEL);
			leaveFlowDao.create(leave);
	
			response.setSuccessCode(BuckWaConstants.MSGCODE_IMPORT_SUCESS);
		} catch (DuplicateKeyException dx) {
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E002");
		} catch (Exception ex) {
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");
		}
		return response;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse flowProcess(BuckWaRequest request) {
		logger.info("CancelLeaveServiceImpl.flowProcess");
		BuckWaResponse response = new BuckWaResponse();
		try {
			Leave obj = (Leave) request.get("leave");
			leaveFlowDao.flowProcess(obj);
			response.setSuccessCode("S002");
		} catch (Exception ex) {
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");
		}
		return response;
	}
	
	
	@Override
	public BuckWaResponse getById(BuckWaRequest request) {
		logger.info("CancelLeaveServiceImpl.getById");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			String cancelLeaveId =  request.get("cancelLeaveId")+"";			
			CancelLeave obj = cancelLeaveDao.getById(cancelLeaveId);						
			if(obj!=null){
				response.addResponse("leaveCancel",obj);
				response.setSuccessCode("S002");
			}
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
	
	@Override
	public BuckWaResponse getByDocNo(BuckWaRequest request) {
		logger.info("CancelLeaveServiceImpl.getByDocNo");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			String docNo = request.get("docno")+"";			
			CancelLeave obj = cancelLeaveDao.getByDocNo(docNo);						
			if(obj!=null){
				response.addResponse("cancelLeave",obj);
				response.setSuccessCode("S002");
			}
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}

	
}
