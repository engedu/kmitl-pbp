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
import com.buckwa.dao.intf.pam.VacationLeaveDao;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pam.Leave;
import com.buckwa.domain.pam.LeaveComment;
import com.buckwa.domain.pam.VacationLeave;
import com.buckwa.service.intf.pam.VacationLeaveService;
import com.buckwa.util.BuckWaConstants;

/*
 @Author : Wichien Prommese(Pe)
 @Create : Aug 5, 2012 10:05:04 AM
 */
@Service("vacationLeaveService")
public class VacationLeaveServiceImpl implements VacationLeaveService {

	private static Logger logger = Logger.getLogger(VacationLeaveServiceImpl.class);

	@Autowired
	private VacationLeaveDao vacationLeaveDao;
	
	@Autowired
	private LeaveFlowDao leaveFlowDao;
	
	@Autowired
	private LeaveCommentDao leaveCommentDao;
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse create(BuckWaRequest request) {
		logger.info("VacationLeaveServiceImpl.flowProcess");
		BuckWaResponse response = new BuckWaResponse();
		try {
			VacationLeave obj = (VacationLeave) request.get("vacationLeave");
			
			//create leave Research
			obj = vacationLeaveDao.create(obj);
			
			//create leave comment
			if(obj.getLeaveComment()!=null&&StringUtils.isNotEmpty(obj.getLeaveComment().getComment().trim())){
				LeaveComment leaveComment = obj.getLeaveComment();
				leaveComment.setCreateBy(obj.getCreateBy());
				leaveComment.setDocno(obj.getDocNo());
				leaveComment.setLeaveTypeCode(BuckWaConstants.LEAVE_VACATION);
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
			leave.setLeaveTypeCode(BuckWaConstants.LEAVE_VACATION);
			leaveFlowDao.create(leave);
			
			
			response.addResponse("leaveFlowId", leave.getLeaveFlowId());
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
		logger.info("VacationLeaveServiceImpl.flowProcess");
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
		logger.info("VacationLeaveServiceImpl.getById");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			String vacationLeaveId =  request.get("vacationLeaveId")+"";			
			VacationLeave obj = vacationLeaveDao.getById(vacationLeaveId);						
			if(obj!=null){
				response.addResponse("leaveVacation",obj);
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
		logger.info("VacationLeaveServiceImpl.getByDocNo");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			String docNo = request.get("docno")+"";			
			VacationLeave obj = vacationLeaveDao.getByDocNo(docNo);						
			if(obj!=null){
				response.addResponse("vacationLeave",obj);
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
