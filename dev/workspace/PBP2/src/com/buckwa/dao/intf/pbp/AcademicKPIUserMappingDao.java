package com.buckwa.dao.intf.pbp;

import com.buckwa.domain.pbp.AcademicKPIUserMappingWrapper;

public interface AcademicKPIUserMappingDao {
	

	public AcademicKPIUserMappingWrapper getById(String id); 
	public void approve(String id); 
	public void update(AcademicKPIUserMappingWrapper academicKPIUserMappingWrapper); 
	public void delete(String id); 
	public void changeKPI(AcademicKPIUserMappingWrapper academicKPIUserMappingWrapper); 
	
	
}
