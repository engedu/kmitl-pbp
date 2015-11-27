package com.buckwa.service.intf.pam;

import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;

/*
@Author : Wichien Prommese(Pe)
@Create : Aug 5, 2012 9:32:08 AM
 */
public interface SickLeaveService {
	public BuckWaResponse flowProcess(BuckWaRequest request);
	public BuckWaResponse create(BuckWaRequest request);
	public BuckWaResponse getById(BuckWaRequest request);
	public BuckWaResponse getByDocNo(BuckWaRequest request);
	public BuckWaResponse getLeaveLastDate(BuckWaRequest request);
}

