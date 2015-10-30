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
import com.buckwa.dao.intf.pam.PersonalLeaveDao;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pam.Leave;
import com.buckwa.domain.pam.LeaveComment;
import com.buckwa.domain.pam.PersonalLeave;
import com.buckwa.domain.pam.SickLeave;
import com.buckwa.service.intf.pam.PersonalLeaveService;
import com.buckwa.util.BuckWaConstants;

/*
 @Author : Wichien Prommese(Pe)
 @Create : Aug 5, 2012 10:05:04 AM
 */
@Service("personalLeaveService")
public class PersonalLeaveServiceImpl implements PersonalLeaveService {

	private static Logger logger = Logger.getLogger(PersonalLeaveServiceImpl.class);

	@Autowired
	private PersonalLeaveDao personalLeaveDao;
	
	@Autowired
	private LeaveFlowDao leaveFlowDao;
	
	@Autowired 
	private LeaveCommentDao leaveCommentDao; 
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse create(BuckWaRequest request) {
		logger.info("PersonalLeaveServiceImpl.flowProcess");
		BuckWaResponse response = new BuckWaResponse();
		try {
			PersonalLeave obj = (PersonalLeave) request.get("personalLeave");
			
			//create leave Research
			obj = personalLeaveDao.create(obj);
			
			//create leave comment
			if(obj.getLeaveComment()!=null&&StringUtils.isNotEmpty(obj.getLeaveComment().getComment().trim())){
				LeaveComment leaveComment = obj.getLeaveComment();
				leaveComment.setCreateBy(obj.getCreateBy());
				leaveComment.setDocno(obj.getDocNo());
				leaveComment.setLeaveTypeCode(BuckWaConstants.LEAVE_PERSONAL);
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
			leave.setLeaveTypeCode(BuckWaConstants.LEAVE_PERSONAL);
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
		logger.info("PersonalLeaveServiceImpl.flowProcess");
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
		logger.info("PersonalLeaveServiceImpl.getById");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			String personalLeaveId =  request.get("personalLeaveId")+"";			
			PersonalLeave obj = personalLeaveDao.getById(personalLeaveId);						
			if(obj!=null){
				response.addResponse("leavePersonal",obj);
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
		logger.info("PersonalLeaveServiceImpl.getByDocNo");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			String docNo = request.get("docno")+"";			
			PersonalLeave obj = personalLeaveDao.getByDocNo(docNo);						
			if(obj!=null){
				response.addResponse("personalLeave",obj);
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
		logger.info("PersonalLeaveServiceImpl.getLeaveLastDate");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			PersonalLeave obj = personalLeaveDao.getLastDate();						
			if(obj!=null){
				response.addResponse("personalLeave",obj);
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
