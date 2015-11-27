package com.buckwa.service.impl.admin;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.buckwa.dao.intf.admin.LeaveQuotaDao;
import com.buckwa.dao.intf.pam.LeaveTypeDao;
import com.buckwa.dao.intf.pam.SummaryLeaveDao;
import com.buckwa.domain.admin.LeaveQuota;
import com.buckwa.domain.admin.LeaveQuotaForm;
import com.buckwa.domain.admin.LeaveYearQuota;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.common.PagingBean;
import com.buckwa.domain.pam.LeaveType;
import com.buckwa.domain.pam.SummaryLeave;
import com.buckwa.domain.pam.WorkPerson;
import com.buckwa.domain.pam.WorkPersonKpi;
import com.buckwa.service.intf.admin.LeaveQuotaService;
import com.buckwa.util.BuckWaConstants;

@Service("leaveQuotaService") 
public class LeaveQuotaServiceImpl implements LeaveQuotaService {	
	
	private static Logger logger = Logger.getLogger(LeaveQuotaServiceImpl.class);
	
	@Autowired
	private LeaveQuotaDao leaveQuotaDao;
	
	@Autowired
	private LeaveTypeDao leaveTypeDao;
	
	@Autowired
	private SummaryLeaveDao summaryDao;
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse create(BuckWaRequest request) {
		logger.info("LeaveQuotaServiceImpl.create");
		BuckWaResponse response = new BuckWaResponse();
		try {
			LeaveYearQuota leaveYearQuota = (LeaveYearQuota)request.get("leaveYearQuota");
			if(leaveYearQuota!=null){
								
				if(leaveYearQuota.getLeaveQuoList()!=null&&leaveYearQuota.getLeaveQuoList().size()>0){
					for(LeaveQuota leaveQuota : leaveYearQuota.getLeaveQuoList()){
						leaveQuotaDao.create(leaveQuota);
					}
				}
				
				//insert summary leave
				if(leaveYearQuota.getSummaryLeaveList()!=null&&leaveYearQuota.getSummaryLeaveList().size()>0){
					for(SummaryLeave summaryLeave : leaveYearQuota.getSummaryLeaveList()){
						summaryLeave.setTotal(summaryLeave.getTotal()+summaryLeave.getAccumulate());
						summaryDao.create(summaryLeave);
					}
				}
				
				//update flag accumulate
				summaryDao.updateFlagAccumulate();
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
	public BuckWaResponse excuteJob(BuckWaRequest request) {
		logger.info("LeaveQuotaServiceImpl.excuteJob");
		BuckWaResponse response = new BuckWaResponse();
		try {
			LeaveYearQuota leaveYearQuota = (LeaveYearQuota)request.get("leaveYearQuota");
			String newYear = (String)request.get("newYear");
			if(leaveYearQuota!=null){
				List<SummaryLeave> summaryLeaveOldList = null;
				List<SummaryLeave> summaryLeaveVacationList = null;
				
				if("true".equals(newYear)){
					summaryLeaveVacationList = summaryDao.getSummaryVacationByYear(leaveYearQuota.getYear()-1);
				}else{
					summaryLeaveOldList = summaryDao.getSummaryAllByYear(leaveYearQuota.getYear());
				}
				
				//delete summary
				summaryDao.deleteByYear(leaveYearQuota.getYear());
				
				int total=0;
				int accumulate=0;
				int amountOld=0;
				int totalOld=0;
				int accumulateOld=0;
				if(leaveYearQuota.getSummaryLeaveList()!=null&&leaveYearQuota.getSummaryLeaveList().size()>0){
					for(SummaryLeave summaryLeave : leaveYearQuota.getSummaryLeaveList()){
						amountOld=0;
						totalOld=0;
						accumulateOld=0;
						total=0;
						accumulate=0;
						if(summaryLeaveOldList!=null&&summaryLeaveOldList.size()>0){
							boolean notUpdate=false;
							for(SummaryLeave summaryLeaveOld :summaryLeaveOldList){
								if(summaryLeaveOld.getUserId()==summaryLeave.getUserId() && 
										summaryLeaveOld.getLeaveTypeCode().equals(summaryLeave.getLeaveTypeCode())){
									amountOld = summaryLeaveOld.getAmount();
									totalOld = summaryLeaveOld.getTotal();
									accumulateOld = summaryLeaveOld.getAccumulate();
									break;
								}
							}
							if(summaryLeave.getLeaveTypeCode().equals(BuckWaConstants.LEAVE_VACATION)){
								total = summaryLeave.getTotal() + accumulateOld;
								summaryLeave.setAccumulate(accumulateOld);
							}else{
								total = summaryLeave.getTotal();
							}
							if(total<amountOld)
								total = totalOld;
							summaryLeave.setTotal(total);
							summaryLeave.setAmount(amountOld);
						}else if(summaryLeaveVacationList!=null&&summaryLeaveVacationList.size()>0){
							boolean notUpdate = false;
							for(SummaryLeave summaryLeaveVacation :summaryLeaveVacationList){
								if(summaryLeaveVacation.getUserId()==summaryLeave.getUserId() && 
										summaryLeaveVacation.getLeaveTypeCode().equals(summaryLeave.getLeaveTypeCode())&&
										summaryLeave.getLeaveTypeCode().equals(BuckWaConstants.LEAVE_VACATION)){
									amountOld = summaryLeaveVacation.getAmount();
									totalOld = summaryLeaveVacation.getTotal();
									accumulateOld = summaryLeaveVacation.getAccumulate();
									if((summaryLeaveVacation.getWorkYear()==2 && summaryLeave.getWorkYear()==2)||
											(summaryLeaveVacation.getWorkYear()==12 && summaryLeave.getWorkYear()==12)){
										notUpdate = true;
									}else{
										if(summaryLeaveVacation.getAmount() - summaryLeaveVacation.getAccumulate() >0){
											accumulate  = summaryLeaveVacation.getAccumulate() - (summaryLeaveVacation.getAmount() - summaryLeaveVacation.getAccumulate());
										}else{
											accumulate = summaryLeaveVacation.getAccumulate();
										}
									}
									
									break;
								}
							}
							
							if(summaryLeave.getLeaveTypeCode().equals(BuckWaConstants.LEAVE_VACATION)){
								if(notUpdate){
									total = summaryLeave.getTotal() + accumulateOld;
									accumulate = accumulateOld;
								}else{
									total = summaryLeave.getTotal() + summaryLeave.getAccumulate() + accumulate;
									accumulate = accumulate + summaryLeave.getAccumulate();
								}
								summaryLeave.setAccumulate(accumulate);
							}else{
								total = summaryLeave.getTotal();
							}
							summaryLeave.setTotal(total);
						}else{
							summaryLeave.setTotal(summaryLeave.getTotal()+summaryLeave.getAccumulate());
						}
						
						summaryDao.create(summaryLeave);
					}
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
	public BuckWaResponse getByLeaveYearQuotaId(BuckWaRequest request) {
		logger.info("LeaveQuotaServiceImpl.getByLeaveYearQuotaId");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			String leaveYearQuotaId =  request.get("leaveYearQuotaId")+"";			
			LeaveYearQuota leaveYearQuota  = leaveQuotaDao.getYearQuotaById(leaveYearQuotaId);		
			if(leaveYearQuota!=null){
				List<LeaveQuota> leaveQuotaList = leaveQuotaDao.getByLeaveYearQuotaId(String.valueOf(leaveYearQuota.getLeaveYearQuotaId()));
				leaveYearQuota.setLeaveQuoList(leaveQuotaList);
				
				List<LeaveType> leaveTypeList = leaveTypeDao.getAll();
				leaveYearQuota.setLeaveTypeList(leaveTypeList);
			}
			response.addResponse("leaveYearQuota",leaveYearQuota);
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
	
	@Override
	public BuckWaResponse getByYear(BuckWaRequest request) {
		logger.info("LeaveQuotaServiceImpl.getByYear");
		BuckWaResponse response = new BuckWaResponse();
		try{					
		    String year =  request.get("year")+"";		
			LeaveYearQuota leaveYearQuota = new LeaveYearQuota();
			
			List<LeaveQuota> leaveQuotaList = leaveQuotaDao.getByYear(year);
			leaveYearQuota.setLeaveQuoList(leaveQuotaList);
			
			List<LeaveType> leaveTypeList = leaveTypeDao.getAll();
			leaveYearQuota.setLeaveTypeList(leaveTypeList);
			
			response.addResponse("leaveYearQuota",leaveYearQuota);
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
	
	@Override
	public BuckWaResponse getAll(BuckWaRequest request) {
		logger.info("LeaveQuotaServiceImpl.getByYear");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			LeaveYearQuota leaveYearQuota = new LeaveYearQuota();
			
			List<LeaveQuota> leaveQuotaList = leaveQuotaDao.getAll();
			leaveYearQuota.setLeaveQuoList(leaveQuotaList);
			
			List<LeaveType> leaveTypeList = leaveTypeDao.getAll();
			leaveYearQuota.setLeaveTypeList(leaveTypeList);
			
			response.addResponse("leaveYearQuota",leaveYearQuota);
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
	
	@Override
	public List<LeaveQuota> getLeaveQuotaList(){
		logger.info("LeaveQuotaServiceImpl.getLeaveQuotaList");
		try{					
			List<LeaveQuota> leaveQuotaList = leaveQuotaDao.getAll();
			return leaveQuotaList;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
	
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse update(BuckWaRequest request) {
		logger.info("LeaveQuotaServiceImpl.update");
		BuckWaResponse response = new BuckWaResponse();
		try{	
			LeaveYearQuota leaveYearQuota = (LeaveYearQuota)request.get("leaveYearQuota");
			
			//delete leave quota
			leaveQuotaDao.deleteAll();
			
			//update year quota
			if(leaveYearQuota!=null){
				//update leave quota
				if(leaveYearQuota.getLeaveQuoList()!=null&&leaveYearQuota.getLeaveQuoList().size()>0){
					for(LeaveQuota leaveQuota : leaveYearQuota.getLeaveQuoList()){
						leaveQuotaDao.create(leaveQuota);
					}
				}
			}
			
			List<SummaryLeave> summaryLeaveList = summaryDao.getSummaryAllByYear(leaveYearQuota.getYear());
			
			//delete summary
			summaryDao.deleteByYear(leaveYearQuota.getYear());
			
			//update summary leave
			if(leaveYearQuota.getSummaryLeaveList()!=null&&leaveYearQuota.getSummaryLeaveList().size()>0){
				for(SummaryLeave summaryLeave : leaveYearQuota.getSummaryLeaveList()){
					if(summaryLeaveList!=null&&summaryLeaveList.size()>0){
						for(SummaryLeave summaryLeaveOld :summaryLeaveList){
							if(summaryLeaveOld.getUserId()==summaryLeave.getUserId() && 
									summaryLeaveOld.getLeaveTypeCode().equals(summaryLeave.getLeaveTypeCode())){
								summaryLeave.setAmount(summaryLeaveOld.getAmount());
								int total = summaryLeave.getTotal()+summaryLeaveOld.getAccumulate();
								if(total<summaryLeave.getAmount()){
									summaryLeave.setTotal(summaryLeaveOld.getTotal());
								}else{
									summaryLeave.setTotal(total);
								}
								summaryLeave.setAccumulate(summaryLeaveOld.getAccumulate());
							}
						}
					}
					summaryDao.create(summaryLeave);
				}
			}
			
			//update flag accumulate
			summaryDao.updateFlagAccumulate();
			
			response.setSuccessCode(BuckWaConstants.MSGCODE_EDIT_SUCESS);
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public BuckWaResponse deleteByLeaveYearQuotaId(BuckWaRequest request) {
		logger.info("LeaveQuotaServiceImpl.delete");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			String leaveYearQuotaId = (String)request.get("leaveYearQuotaId");
			leaveQuotaDao.deleteAllLeaveQuota(leaveYearQuotaId);
			LeaveYearQuota leaveYearQuota  = leaveQuotaDao.getYearQuotaById(leaveYearQuotaId);
			if(leaveYearQuota!=null)
				summaryDao.deleteByYear(leaveYearQuota.getYear());
			leaveQuotaDao.deleteYearQuota(leaveYearQuotaId);
			response.setSuccessCode(BuckWaConstants.MSGCODE_DELETE_SUCESS);
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
	
	@Override
	public BuckWaResponse getAllByOffset(BuckWaRequest request) {
		BuckWaResponse response = new BuckWaResponse();
		try{					
			logger.info("");
			PagingBean pagingBean = (PagingBean)request.get("pagingBean");			 
			PagingBean returnBean = leaveQuotaDao.getAllByOffset(pagingBean);			
			response.addResponse("pagingBean",returnBean);				
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}	
		return response;
	}
	
	@Override
	public BuckWaResponse checkYearAlready(BuckWaRequest request){
		logger.info("LeaveQuotaServiceImpl.checkYearAlready");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			String year =  request.get("year")+"";		
			String leave_year_quota_id =  request.get("leave_year_quota_id")+"";	
			boolean obj = leaveQuotaDao.checkYearAlready(leave_year_quota_id, year);		
			if(obj)
				response.setStatus(BuckWaConstants.FAIL);
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
	
	@Override
	public BuckWaResponse checkCanChange(BuckWaRequest request){
		logger.info("LeaveQuotaServiceImpl.checkCanChange");
		BuckWaResponse response = new BuckWaResponse();
		try{					
			String year =  request.get("year")+"";	
			String yearCurrent =  request.get("yearCurrent")+"";	
			int count = summaryDao.getSummaryLeaveByYear(Integer.parseInt(year),Integer.parseInt(yearCurrent));
			
			if(count>0)
				response.setStatus(BuckWaConstants.FAIL);
		}catch(Exception ex){
			ex.printStackTrace();
			response.setStatus(BuckWaConstants.FAIL);
			response.setErrorCode("E001");			
		}
		return response;
	}
}
