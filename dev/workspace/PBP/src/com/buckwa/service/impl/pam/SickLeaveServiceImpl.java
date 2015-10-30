package com.buckwa.service.impl.pam;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.buckwa.dao.intf.pam.LeaveCommentDao;
import com.buckwa.dao.intf.pam.LeaveFlowDao;
import com.buckwa.dao.intf.pam.SickLeaveDao;
import com.buckwa.dao.intf.pam.VacationLeaveDao;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pam.Leave;
import com.buckwa.domain.pam.LeaveComment;
import com.buckwa.domain.pam.SickLeave;
import com.buckwa.domain.pam.VacationLeave;
import com.buckwa.service.intf.pam.SickLeaveService;
import com.buckwa.util.BuckWaConstants;

/*
 @Author : Wichien Prommese(Pe)
 @Create : Aug 5, 2012 10:05:04 AM
 */
@Service("sickLeaveService")
public class SickLeaveServiceImpl implements SickLeaveService {

	private static Logger logger = Logger.getLogger(SickLeaveServiceImpl.class);

	@Autowired
	private SickLeaveDao sickLeaveDao;
	
	@Autowired
	private LeaveFlowDao leaveFlowDao;
	
	@Autowired
	private LeaveCommentDao leaveCommentDao;
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse create(BuckWaRequest request) {
		logger.info("SickLeaveServiceImpl.flowProcess");
		BuckWaResponse response = new BuckWaResponse();
		try {
			SickLeave obj = (SickLeave) request.get("sickLeave");
			
			//create leave Research
			obj = sickLeaveDao.create(obj);
			
			//create leave comment
			if(obj.getLeaveComment()!=null&&StringUtils.isNotEmpty(obj.getLeaveComment().getComment().trim())){
				LeaveComment leaveComment = obj.getLeaveComment();
				leaveComment.setCreateBy(obj.getCreateBy());
				leaveComment.setDocno(obj.getDocNo());
				leaveComment.setLeaveTypeCode(BuckWaConstants.LEAVE_SICK);
				leaveCommentDao.create(leaveComment);
			}
			
			//create leave Flow
			Leave leave = new Leave();
			leave.setDocNo(obj.getDocNo());
			leave.setFromDate(obj.getFromDate());
			leave.setToDate(obj.getToDate());
			leave.setOwnerId(obj.getLeaveByPersonId());
			leave.setFlowStatus(BuckWaConstants.L_INPROCESS);
			leave.setCreateBy(obj.getCreateBy());
			leave.setLeaveTypeCode(BuckWaConstants.LEAVE_SICK);
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
		logger.info("SickLeaveServiceImpl.flowProcess");
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
		logger.info("SickLeaveServiceImpl.getById");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			String sickLeaveId =  request.get("sickLeaveId")+"";			
			SickLeave obj = sickLeaveDao.getById(sickLeaveId);						
			if(obj!=null){
				response.addResponse("leaveSick",obj);
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
		logger.info("SickLeaveServiceImpl.getByDocNo");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			String docNo = request.get("docno")+"";			
			SickLeave obj = sickLeaveDao.getByDocNo(docNo);						
			if(obj!=null){
				response.addResponse("sickLeave",obj);
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
	public BuckWaResponse getLeaveLastDate(BuckWaRequest request){
		logger.info("SickLeaveServiceImpl.getLeaveLast");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			SickLeave obj = sickLeaveDao.getLastDate();						
			if(obj!=null){
				response.addResponse("sickLeave",obj);
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
