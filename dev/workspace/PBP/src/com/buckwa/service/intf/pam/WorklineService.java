package com.buckwa.service.intf.pam;

import java.util.List;

import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.BuckWaResponse;
import com.buckwa.domain.pam.WorklineMappingParent;

/*
@Author : Teerawoot Charoenporn(Tor)
@Create : Aug 13, 2012 1:35:00 PM
 */
public interface WorklineService {
	public BuckWaResponse getAll();
	public BuckWaResponse create(BuckWaRequest request);
	public BuckWaResponse update(BuckWaRequest request);
	public BuckWaResponse getByOffset(BuckWaRequest request);	
	public BuckWaResponse getById(BuckWaRequest request);
	public BuckWaResponse deleteById(BuckWaRequest request);
	
	public BuckWaResponse getHierarchy();
	public List<WorklineMappingParent> getWorklineChildList(String worklineCode);
	public BuckWaResponse getUnassignedPersonWorkline();
	public BuckWaResponse getUnassignedWorkline();
	public BuckWaResponse addWorklineMapping(BuckWaRequest request);
	public BuckWaResponse updateWorklineMapping(BuckWaRequest request);
	public BuckWaResponse deleteWorklineMapping(BuckWaRequest request);
	
	public BuckWaResponse getWorklinePersonByOffset(BuckWaRequest request);
	public BuckWaResponse addWorklinePerson(BuckWaRequest request);
	public BuckWaResponse editWorklinePerson(BuckWaRequest request);
	public BuckWaResponse deleteWorklinePerson(BuckWaRequest request);
}
