package com.buckwa.dao.intf.pbp;

import com.buckwa.domain.pbp.AcademicKPI;
import com.buckwa.domain.pbp.AcademicKPIAttribute;
import com.buckwa.domain.pbp.AcademicKPIUserMapping;
import com.buckwa.domain.pbp.AcademicKPIWrapper;

public interface AcademicKPIDao {
	

	public AcademicKPIWrapper getByAcademicYear(String academicYear); 
	public boolean isExistCreate(AcademicKPI academicKPI); 
	public Long create(AcademicKPI academicKPI); 
	public AcademicKPIWrapper getByAcademicYearWorkTypeCode(String academicYear,String typeCode); 
	public AcademicKPI getById(String id); 
	public void edit(AcademicKPI academicKPI); 
	public void deleteById(String id);
	public void deleteAttributeById(String id); 
	public boolean isAttributeExistCreate(AcademicKPIAttribute academicKPIAttribute); 
	public AcademicKPIAttribute addNewAttribute(AcademicKPIAttribute academicKPIAttribute);
	public AcademicKPI getByCodeAcademicYear(String code,String academicYear); 
	
	
	public Long importwork(AcademicKPIUserMapping academicKPIUserMapping); 
	
	public AcademicKPIWrapper getAllByAcademicYear( String getByAcademicYear) ;
	
}
