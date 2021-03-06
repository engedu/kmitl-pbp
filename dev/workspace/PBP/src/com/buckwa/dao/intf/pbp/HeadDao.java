package com.buckwa.dao.intf.pbp;

import java.util.List;

import com.buckwa.domain.pbp.AcademicKPIUserMappingWrapper;
import com.buckwa.domain.pbp.Department;
import com.buckwa.domain.pbp.report.DepartmentWorkTypeReport;

public interface HeadDao {
	
	public AcademicKPIUserMappingWrapper getByHeadAcademicYear( String headUserName ,String academicYear,String status);
	public Department getDepartmentMark( String headUserName , String academicYear );
	public AcademicKPIUserMappingWrapper getByUserAcademicYear( String headUserName ,String academicYear,String status,String userName);
	public Department getDepartmentMarkByUser( String userName , String academicYear );
	
	public void saveDepartmentReportSummary( Department department   );
	
	public List<DepartmentWorkTypeReport> getReportWorkTypeDepartment(String worktype, Department dep);
	
	
}
