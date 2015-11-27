package com.buckwa.framework.schedule;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.buckwa.domain.admin.LeaveQuota;
import com.buckwa.domain.admin.LeaveYearQuota;
import com.buckwa.domain.admin.User;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pam.LeaveType;
import com.buckwa.domain.pam.SummaryLeave;
import com.buckwa.service.intf.admin.AdminUserService;
import com.buckwa.service.intf.admin.LeaveQuotaService;
import com.buckwa.service.intf.pam.LeaveTypeService;
import com.buckwa.util.BuckWaConstants;
import com.buckwa.util.BuckWaDateUtils;
import com.buckwa.util.BuckWaUtils;

public class LeaveQuotaJob {
	private Logger logger = Logger.getLogger(LeaveQuotaJob.class);
	
	@Autowired
	private AdminUserService adminUserService;
	
	@Autowired
	private LeaveQuotaService leaveQuotaService;	
	
	//Execute Leave Quota Job 
	public void execute(){
		logger.info("Leave Quota Job is Starting...");
		Date now = new Date();
		int date = now.getDate();
		int month = now.getMonth(); 
		boolean newyear = (date==1&&month==0?true:false);
		generateSummaryLeave(newyear);
		logger.info("Leave Quota Job Ended");
	}
	
	private void generateSummaryLeave(boolean newYear){
		
		List<SummaryLeave> summaryLeaveList = new ArrayList<SummaryLeave>();
		try{
			// binding leave summary for leave
			BuckWaRequest request = new BuckWaRequest();
			List<LeaveQuota> leaveQuotaList = leaveQuotaService.getLeaveQuotaList();
			BuckWaResponse response = adminUserService.getUserAll(request);
			if (response.getStatus() == BuckWaConstants.SUCCESS) {
				List<User> userList = (List) response.getResObj("userList");
				int yearCurrent = BuckWaDateUtils.getYearCurrent();
				if (userList != null && userList.size() > 0
						&& leaveQuotaList!= null
						&& leaveQuotaList.size() > 0) {
					for (User userObj : userList) {
						for (LeaveQuota leaveQuota : leaveQuotaList) {
							SummaryLeave summaryLeave = new SummaryLeave();
							summaryLeave.setLeaveTypeCode(leaveQuota.getLeaveTypeCode());
							summaryLeave.setYear(yearCurrent);
							int quota = leaveQuota.getQuota() != null ? leaveQuota.getQuota(): 0;
							if (summaryLeave.getLeaveTypeCode().equals(BuckWaConstants.LEAVE_VACATION)&& userObj.getAssignDate() != null) {
								long countDay = BuckWaUtils.countAllDay(BuckWaDateUtils.convertDateToDateEn(userObj.getAssignDate()),BuckWaDateUtils.getCurrentDateTime());
								long countSum = (countDay / 365);
								if ( countSum > 1 && countSum < 12 ){
									summaryLeave.setWorkYear(2);
									summaryLeave.setAccumulate(10);
								}else if ( countSum > 11 ){
									summaryLeave.setWorkYear(12);
									summaryLeave.setAccumulate(10);
								}else{
									summaryLeave.setWorkYear(1);
									summaryLeave.setAccumulate(0);
								}
								summaryLeave.setTotal(quota);
							} else {
								summaryLeave.setTotal(quota);
							}
							summaryLeave.setUserId(Long.parseLong(String.valueOf(userObj.getUser_id())));
							summaryLeaveList.add(summaryLeave);
						}
					}
					LeaveYearQuota leaveYearQuota = new LeaveYearQuota();
					leaveYearQuota.setYear(new Integer(yearCurrent));
					leaveYearQuota.setSummaryLeaveList(summaryLeaveList);
					request.put("leaveYearQuota",leaveYearQuota);
					request.put("newYear", newYear?"true":"false");
					response = leaveQuotaService.excuteJob(request);
					if(response.getStatus()==BuckWaConstants.SUCCESS){		
						logger.info("Leave Quota Job Successed.");
					}else {
						logger.error("Leave Quota Job Failed.");
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			logger.error("Leave Quota Job Failed.");
		}
	}
}
