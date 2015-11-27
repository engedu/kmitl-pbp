package com.buckwa.dao.intf.pam;

import com.buckwa.domain.common.PagingBean;
import com.buckwa.domain.pam.Leave;

/*
@Author : Wichien Prommese(Pe)
@Create : Aug 5, 2012 10:06:32 AM
 */
public interface LeaveFlowDao {

	public void flowProcess(Leave leave);
	public Leave create(Leave leave);
	public Leave getById(String id);	
	public PagingBean getAllLeaveFlowByOffset(PagingBean pagingBean,boolean isOfficer);
	public PagingBean getAllLeaveFlowByOffset(PagingBean pagingBean,boolean isOfficer,String officerApprove);
	public int getLeaveBalance(Long userid,String leaveType,int year);
	public int getVacationLeaveBalance(Long userid);
	public int getTotalLeave(Long userid , String leaveType,int year);
	public int getBalanceVacationLeaveSummary(Long userid,int year);
	public int getTotalVacationLeaveOfYear(Long userid,int year);
	public int getSummaryTotalVacationLeave(Long userid,int year);
	public int getSummaryTotalVacationLeave(Long userid);

}

