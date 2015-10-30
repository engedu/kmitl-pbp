package com.buckwa.service.intf.pam;

import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;

/*
@Author : Wichien Prommese(Pe)
@Create : Aug 5, 2012 9:32:08 AM
 */
public interface SummaryLeaveService {
	public BuckWaResponse create(BuckWaRequest request);
	public BuckWaResponse update(BuckWaRequest request);
	public BuckWaResponse getSummaryLeave(BuckWaRequest request);
	public BuckWaResponse getSummaryLeaveByUserAndYear(BuckWaRequest request);
	public BuckWaResponse getSummaryLeaveByUser(BuckWaRequest request);
	public BuckWaResponse getAllLeaveSummaryByCriteria(BuckWaRequest request);
	public BuckWaResponse getAllLeaveSummary(BuckWaRequest request);
	
}


