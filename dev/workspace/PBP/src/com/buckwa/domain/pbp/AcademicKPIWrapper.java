package com.buckwa.domain.pbp;

import java.util.List;

public class AcademicKPIWrapper {
	
	private List<PBPWorkType> pBPWorkTypeList;
	private List<AcademicKPI> academicKPIList;
	private PBPWorkType pBPWorkType;
	
	private String academicYear;
	
    private String currentWorkTypeCode;
	
	private String workTypeCode;
	
	public String getWorkTypeCode() {
		return workTypeCode;
	}
	public void setWorkTypeCode(String workTypeCode) {
		this.workTypeCode = workTypeCode;
	}
	public String getCurrentWorkTypeCode() {
		return currentWorkTypeCode;
	}
	public void setCurrentWorkTypeCode(String currentWorkTypeCode) {
		this.currentWorkTypeCode = currentWorkTypeCode;
	}
	public PBPWorkType getpBPWorkType() {
		return pBPWorkType;
	}
	public void setpBPWorkType(PBPWorkType pBPWorkType) {
		this.pBPWorkType = pBPWorkType;
	}
	public String getAcademicYear() {
		return academicYear;
	}
	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}
	public List<PBPWorkType> getpBPWorkTypeList() {
		return pBPWorkTypeList;
	}
	public void setpBPWorkTypeList(List<PBPWorkType> pBPWorkTypeList) {
		this.pBPWorkTypeList = pBPWorkTypeList;
	}
	public List<AcademicKPI> getAcademicKPIList() {
		return academicKPIList;
	}
	public void setAcademicKPIList(List<AcademicKPI> academicKPIList) {
		this.academicKPIList = academicKPIList;
	}
	
	
	

}
