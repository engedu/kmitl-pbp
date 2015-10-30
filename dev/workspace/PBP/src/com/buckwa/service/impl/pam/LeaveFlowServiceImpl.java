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
import com.buckwa.dao.intf.pam.SummaryLeaveDao;
import com.buckwa.domain.admin.User;
import com.buckwa.domain.admin.address.Aumphur;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.common.PagingBean;
import com.buckwa.domain.pam.Leave;
import com.buckwa.domain.pam.LeaveComment;
import com.buckwa.domain.pam.SummaryLeave;
import com.buckwa.service.intf.admin.AdminUserService;
import com.buckwa.service.intf.pam.LeaveFlowService;
import com.buckwa.util.BuckWaConstants;
import com.buckwa.util.BuckWaUtils;

/*
 @Author : Wichien Prommese(Pe)
 @Create : Aug 5, 2012 10:05:04 AM
 */
@Service("leaveFlowService")

public class LeaveFlowServiceImpl implements LeaveFlowService {

	private static Logger logger = Logger.getLogger(LeaveFlowServiceImpl.class);

	@Autowired
	private LeaveFlowDao leaveFlowDao;
	
	@Autowired
	private AdminUserService userService;
	
	@Autowired
	private LeaveCommentDao leaveCommentDao;
	
	@Autowired
	private SummaryLeaveDao summaryLeaveDao;
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse create(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try {
			Leave leaveFlow = (Leave) request.get("leave");
			leaveFlowDao.create(leaveFlow);
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
			Leave leaveFlow = (Leave) request.get("leave");
			leaveFlowDao.flowProcess(leaveFlow);
			
			//create comment
			if(leaveFlow.getLeaveComments()!=null&&leaveFlow.getLeaveComments().size()>0){
				for(LeaveComment leaveComment : leaveFlow.getLeaveComments()){
					if(StringUtils.isNotEmpty(leaveComment.getComment())){
						leaveCommentDao.create(leaveComment);
					}
				}
			}
			
			//update summary for vacation
			if(leaveFlow.getSummaryLeaves()!=null&&leaveFlow.getSummaryLeaves().size()>0){
				for(SummaryLeave summaryLeave : leaveFlow.getSummaryLeaves()){
					summaryLeaveDao.update(summaryLeave);
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");
		}
		return response;
	}

	@Override
	public BuckWaResponse getByOffset(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try {
			logger.info("");
			PagingBean pagingBean = (PagingBean) request.get("pagingBean");	
			boolean isOfficer = (Boolean)request.get("isOfficer");	
			String officerApprove = String.valueOf(request.get("officerApprove"));
			PagingBean returnBean = leaveFlowDao
					.getAllLeaveFlowByOffset(pagingBean,isOfficer,officerApprove);
			response.addResponse("pagingBean", returnBean);
		} catch (Exception ex) {
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");
		}
		return response;
	}
	@Override
	public BuckWaResponse getLeaveBalance(BuckWaRequest request){
		BuckWaResponse response = new BuckWaResponse();
		try{					
			logger.info("LeaveFlowServiceImpl.getLeaveBalance");
			String year =  request.get("year")+"";			
			String leaveType =  request.get("leaveType")+"";	
			String userId = request.get("userid")+"";	
			int leaveBalance = 0; 
			leaveBalance = leaveFlowDao.getLeaveBalance(Long.parseLong(userId),leaveType,Integer.parseInt(year));		
			/*if(!leaveType.equals(BuckWaConstants.LEAVE_VACATION)){
				leaveBalance = leaveFlowDao.getLeaveBalance(Long.parseLong(userId),leaveType,Integer.parseInt(year));		
			}else{
				leaveBalance = leaveFlowDao.getVacationLeaveBalance(Long.parseLong(userId));		
			}*/
						
			response.addResponse("leaveBalance",leaveBalance);
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
	
	@Override
	public BuckWaResponse getTotalLeave(BuckWaRequest request){
		BuckWaResponse response = new BuckWaResponse();
		try{					
			logger.info("LeaveFlowServiceImpl.getLeaveTotal");
			String year =  request.get("year")+"";			
			String leaveType =  request.get("leaveType")+"";	
			String userId = request.get("userid")+"";	
			int leaveBalance = leaveFlowDao.getTotalLeave(Long.parseLong(userId),leaveType,Integer.parseInt(year));					
			response.addResponse("leaveBalance",leaveBalance);
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
	
	@Override
	public BuckWaResponse getBalanceVacationLeaveSummary(BuckWaRequest request){
		BuckWaResponse response = new BuckWaResponse();
		try{					
			logger.info("LeaveFlowServiceImpl.getLeaveTotal");
			String year =  request.get("year")+"";			
			String userId = request.get("userid")+"";	
			int leaveBalance = leaveFlowDao.getBalanceVacationLeaveSummary(Long.parseLong(userId),Integer.parseInt(year));					
			response.addResponse("leaveBalance",leaveBalance);
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
	
	@Override
	public BuckWaResponse getTotalVacationLeaveOfYear(BuckWaRequest request){
		BuckWaResponse response = new BuckWaResponse();
		try{					
			logger.info("LeaveFlowServiceImpl.getLeaveTotal");
			String year =  request.get("year")+"";			
			String userId = request.get("userid")+"";	
			int leaveBalance = leaveFlowDao.getTotalVacationLeaveOfYear(Long.parseLong(userId),Integer.parseInt(year));					
			response.addResponse("leaveBalance",leaveBalance);
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
			logger.info("LeaveFlowServiceImpl.getById");
			String leaveFlowId =  request.get("leaveFlowId")+"";			
			Leave obj = leaveFlowDao.getById(leaveFlowId);						
			if(obj!=null){
				response.addResponse("leave",obj);
			}
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
}
