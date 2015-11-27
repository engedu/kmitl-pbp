package com.buckwa.service.intf.pam;

import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;

/*
@Author : Taechapon Himarat (Su)
@Create : Aug 6, 2012 12:38:38 AM
 */
public interface PaperService {
	
	public BuckWaResponse getAll();
	public BuckWaResponse getByOffset(BuckWaRequest request);	
	public BuckWaResponse getById(BuckWaRequest request);
	public BuckWaResponse create(BuckWaRequest request);
	public BuckWaResponse update(BuckWaRequest request);
	public BuckWaResponse deleteById(BuckWaRequest request);
	
}
