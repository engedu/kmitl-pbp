package com.buckwa.service.intf.pam;

import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;

/*
@Author : Wichien Prommese(Pe)
@Create : Aug 5, 2012 9:32:08 AM
 */
public interface LeaveFlowService {
	public BuckWaResponse flowProcess(BuckWaRequest request);
	public BuckWaResponse create(BuckWaRequest request);
	public BuckWaResponse getById(BuckWaRequest request);
	public BuckWaResponse getByOffset(BuckWaRequest request);
	public BuckWaResponse getLeaveBalance(BuckWaRequest request);	
	public BuckWaResponse getTotalLeave(BuckWaRequest request);	
	public BuckWaResponse getBalanceVacationLeaveSummary(BuckWaRequest request);
	public BuckWaResponse getTotalVacationLeaveOfYear(BuckWaRequest request);
}

