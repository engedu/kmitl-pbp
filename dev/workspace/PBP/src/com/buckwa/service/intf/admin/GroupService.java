package com.buckwa.service.intf.admin;

import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;

public interface GroupService {
	
	public BuckWaResponse getAll();
	public BuckWaResponse create(BuckWaRequest request);
	public BuckWaResponse update(BuckWaRequest request);
	public BuckWaResponse getByOffset(BuckWaRequest request);	
	public BuckWaResponse getById(BuckWaRequest request);
	public BuckWaResponse deleteById(BuckWaRequest request);
}
