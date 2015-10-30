package com.buckwa.service.impl.pam;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.buckwa.dao.intf.pam.LeaveCommentDao;
import com.buckwa.dao.intf.pam.LeaveFlowDao;
import com.buckwa.dao.intf.pam.SummaryLeaveDao;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.common.PagingBean;
import com.buckwa.domain.pam.LeaveComment;
import com.buckwa.domain.pam.SummaryLeave;
import com.buckwa.service.intf.pam.LeaveCommentService;
import com.buckwa.service.intf.pam.SummaryLeaveService;
import com.buckwa.util.BuckWaConstants;

/*
 @Author : Wichien Prommese(Pe)
 @Create : Aug 5, 2012 10:05:04 AM
 */
@Service("summaryLeaveService")
public class SummaryLeaveServiceImpl implements SummaryLeaveService {

	private static Logger logger = Logger.getLogger(SummaryLeaveServiceImpl.class);

	@Autowired
	private SummaryLeaveDao summaryLeaveDao;
	
	@Autowired
	private LeaveFlowDao leaveFlowDao;
		
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse create(BuckWaRequest request) {
		logger.info("SummaryLeaveServiceImpl.create");
		BuckWaResponse response = new BuckWaResponse();
		try {
			List<SummaryLeave> objs = (List) request.get("summaryLeaves");
			if(objs!=null && objs.size()>0){
				for(SummaryLeave summaryLeave : objs){
					summaryLeaveDao.create(summaryLeave);
				}
			}
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
	public BuckWaResponse update(BuckWaRequest request) {
		logger.info("SummaryLeaveServiceImpl.update");
		BuckWaResponse response = new BuckWaResponse();
		try {
			List<SummaryLeave> objs = (List) request.get("summaryLeaves");
			int year = (Integer)request.get("year");
			if(objs!=null && objs.size()>0){
				summaryLeaveDao.deleteByYear(year);
				
				for(SummaryLeave summaryLeave : objs){
					summaryLeaveDao.create(summaryLeave);
				}
			}
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
	public BuckWaResponse getSummaryLeave(BuckWaRequest request) {
		logger.info("SummaryLeaveServiceImpl.getSummaryLeave");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			int year = (Integer)request.get("year");
			String leaveTypeCode =  request.get("leaveTypeCode")+"";	
			Long userid = (Long)request.get("userid");
			List<SummaryLeave> obj = summaryLeaveDao.getSummary(year, leaveTypeCode, userid);					
			if(obj!=null){
				response.addResponse("summaryLeaves",obj);
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
	public BuckWaResponse getSummaryLeaveByUserAndYear(BuckWaRequest request) {
		logger.info("SummaryLeaveServiceImpl.getSummaryLeave");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			int year = (Integer)request.get("year");
			String userid = request.get("userid")+"";
			List<SummaryLeave> obj = summaryLeaveDao.getSummaryByUserAndYear(year, Long.parseLong(userid));		
			if(obj==null ||obj.size()==0){
				
			}
			response.addResponse("summaryLeaves",obj);
			response.setSuccessCode("S002");
			/*if(obj!=null){
				for(SummaryLeave summaryLeave : obj){
					if(summaryLeave.getLeaveTypeCode().equals(BuckWaConstants.LEAVE_VACATION)){
						int total = leaveFlowDao.getSummaryTotalVacationLeave(Long.parseLong(userid), year);
						summaryLeave.setTotal(total);
						summaryLeave.setBalance(total-summaryLeave.getAmount());
						break;
					}
				}
				response.addResponse("summaryLeaves",obj);
				response.setSuccessCode("S002");
			}*/
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
	
	@Override
	public BuckWaResponse getSummaryLeaveByUser(BuckWaRequest request) {
		logger.info("SummaryLeaveServiceImpl.getSummaryLeave");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			String userid = request.get("userid")+"";
			List<SummaryLeave> obj = summaryLeaveDao.getSummaryByUser(Long.parseLong(userid));				
			response.addResponse("summaryLeaves",obj);
			response.setSuccessCode("S002");
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
	
	@Override
	public BuckWaResponse getAllLeaveSummary(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try {
			logger.info("");
//			PagingBean pagingBean = (PagingBean) request.get("pagingBean");	
//			boolean isOfficer = (Boolean)request.get("isOfficer");	
//			String officerApprove = String.valueOf(request.get("officerApprove"));
			String year = request.get("year").toString().trim();
			List<Map<String, Object>> leaveSummaryMaps = summaryLeaveDao.getAllLeaveSummaryByYear(year);
			response.addResponse("leaveSummaryMaps", leaveSummaryMaps);
		} catch (Exception ex) {
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");
		}
		return response;
	}

	@Override
	public BuckWaResponse getAllLeaveSummaryByCriteria(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try {
			List<Map<String, Object>> allLeaveMaps = summaryLeaveDao.getAllLeaveSummaryByCriteria(request);
			response.addResponse("allLeaveMaps", allLeaveMaps);
		} catch (Exception ex) {
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");
		}
		return response;
	}
	
}
