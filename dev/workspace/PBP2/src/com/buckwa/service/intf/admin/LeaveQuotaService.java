package com.buckwa.service.intf.admin;

import java.util.List;

import com.buckwa.domain.admin.LeaveQuota;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;

public interface LeaveQuotaService {

	public BuckWaResponse update(BuckWaRequest request);
	public BuckWaResponse create(BuckWaRequest request);
	public BuckWaResponse deleteByLeaveYearQuotaId(BuckWaRequest request);
	public BuckWaResponse getByLeaveYearQuotaId(BuckWaRequest request);
	public BuckWaResponse getAllByOffset(BuckWaRequest request);
	public BuckWaResponse checkYearAlready(BuckWaRequest request);
	public BuckWaResponse checkCanChange(BuckWaRequest request);
	public BuckWaResponse getByYear(BuckWaRequest request) ;
	public BuckWaResponse getAll(BuckWaRequest request);
	public List<LeaveQuota> getLeaveQuotaList();
	public BuckWaResponse excuteJob(BuckWaRequest request);
}
