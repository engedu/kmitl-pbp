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
import com.buckwa.dao.intf.pam.ResearchLeaveDao;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pam.Leave;
import com.buckwa.domain.pam.LeaveComment;
import com.buckwa.domain.pam.ResearchLeave;
import com.buckwa.service.intf.pam.ResearchLeaveService;
import com.buckwa.util.BuckWaConstants;

/*
 @Author : Wichien Prommese(Pe)
 @Create : Aug 5, 2012 10:05:04 AM
 */
@Service("researchLeaveService")

public class ResearchLeaveServiceImpl implements ResearchLeaveService {

	private static Logger logger = Logger.getLogger(ResearchLeaveServiceImpl.class);

	@Autowired
	private ResearchLeaveDao researchLeaveDao;
	
	@Autowired
	private LeaveFlowDao leaveFlowDao;
	
	@Autowired
	private LeaveCommentDao leaveCommentDao;
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse create(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try {
			ResearchLeave obj = (ResearchLeave) request.get("researchLeave");
			
			//create leave Research
			obj = researchLeaveDao.create(obj);
			
			//create leave comment
			if(obj.getLeaveComment()!=null&&StringUtils.isNotEmpty(obj.getLeaveComment().getComment().trim())){
				LeaveComment leaveComment = obj.getLeaveComment();
				leaveComment.setCreateBy(obj.getCreateBy());
				leaveComment.setDocno(obj.getDocNo());
				leaveComment.setLeaveTypeCode(BuckWaConstants.LEAVE_RESEARCH);
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
			leave.setLeaveTypeCode(BuckWaConstants.LEAVE_RESEARCH);
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
		BuckWaResponse response = new BuckWaResponse();
		try{					
			logger.info("LeaveResearchServiceImpl.getById");
			String researchLeaveId =  request.get("researchLeaveId")+"";			
			ResearchLeave obj = researchLeaveDao.getById(researchLeaveId);						
			if(obj!=null){
				response.addResponse("researchLeave",obj);
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
		BuckWaResponse response = new BuckWaResponse();
		try{					
			logger.info("LeaveResearchServiceImpl.getByDocNo");
			String docNo = request.get("docno")+"";			
			ResearchLeave obj = researchLeaveDao.getByDocNo(docNo);						
			if(obj!=null){
				response.addResponse("researchLeave",obj);
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
