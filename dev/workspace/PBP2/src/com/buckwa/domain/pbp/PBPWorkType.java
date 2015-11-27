package com.buckwa.domain.pbp;

import java.math.BigDecimal;
import java.util.List;

import com.buckwa.domain.BaseDomain;

public class PBPWorkType extends BaseDomain{
	
	 
	private Long workTypeId;
    private int minPercent;
    private int minHour;
    private int maxPercent;
    private int maxHour;
    private String shortDesc;
    private int limitBase;
    private BigDecimal totalAllWorkType;
    
    private List<AcademicKPI> academicKPIList;
    
	private BigDecimal totalInWorkType = new BigDecimal(0.0);
	private BigDecimal totalInWorkTypeCompareBase = new BigDecimal(0.0);
    private BigDecimal totalInPercentWorkType = new BigDecimal(0.0);
    private BigDecimal totalInPercentCompareBaseWorkType = new BigDecimal(0.0);
    private BigDecimal totalInPercentCompareBaseWorkTypeAVG = new BigDecimal(0.0);
    private String compareBaseStatus;
    
    
    
    public BigDecimal getTotalInPercentCompareBaseWorkTypeAVG() {
		return totalInPercentCompareBaseWorkTypeAVG;
	}
	public void setTotalInPercentCompareBaseWorkTypeAVG(
			BigDecimal totalInPercentCompareBaseWorkTypeAVG) {
		this.totalInPercentCompareBaseWorkTypeAVG = totalInPercentCompareBaseWorkTypeAVG;
	}
	public BigDecimal getTotalInWorkTypeCompareBase() {
		return totalInWorkTypeCompareBase;
	}
	public void setTotalInWorkTypeCompareBase(BigDecimal totalInWorkTypeCompareBase) {
		this.totalInWorkTypeCompareBase = totalInWorkTypeCompareBase;
	}
	public BigDecimal getTotalAllWorkType() {
		return totalAllWorkType;
	}
	public void setTotalAllWorkType(BigDecimal totalAllWorkType) {
		this.totalAllWorkType = totalAllWorkType;
	}
	public String getShortDesc() {
		return shortDesc;
	}
	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
	}

    
    
    public BigDecimal getTotalInPercentWorkType() {
		return totalInPercentWorkType;
	}
	public void setTotalInPercentWorkType(BigDecimal totalInPercentWorkType) {
		this.totalInPercentWorkType = totalInPercentWorkType;
	}
	public BigDecimal getTotalInWorkType() {
		return totalInWorkType;
	}
	public void setTotalInWorkType(BigDecimal totalInWorkType) {
		this.totalInWorkType = totalInWorkType;
	}
	private List<PBPWorkTypeSub> pBPWorkTypeSubList;
    
    private List<AcademicKPIUserMapping> academicKPIUserMappingList;
    
    
    public List<AcademicKPIUserMapping> getAcademicKPIUserMappingList() {
		return academicKPIUserMappingList;
	}
	public void setAcademicKPIUserMappingList(
			List<AcademicKPIUserMapping> academicKPIUserMappingList) {
		this.academicKPIUserMappingList = academicKPIUserMappingList;
	}
	private PBPWorkTypeSub pBPWorkTypeSub;
    private String academicYear;
	public Long getWorkTypeId() {
		return workTypeId;
	}
	public void setWorkTypeId(Long workTypeId) {
		this.workTypeId = workTypeId;
	}
	public int getMinPercent() {
		return minPercent;
	}
	public void setMinPercent(int minPercent) {
		this.minPercent = minPercent;
	}
	public int getMinHour() {
		return minHour;
	}
	public void setMinHour(int minHour) {
		this.minHour = minHour;
	}
	public int getMaxPercent() {
		return maxPercent;
	}
	public void setMaxPercent(int maxPercent) {
		this.maxPercent = maxPercent;
	}
	public int getMaxHour() {
		return maxHour;
	}
	public void setMaxHour(int maxHour) {
		this.maxHour = maxHour;
	}
	public String getAcademicYear() {
		return academicYear;
	}
	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}
	public List<PBPWorkTypeSub> getpBPWorkTypeSubList() {
		return pBPWorkTypeSubList;
	}
	public void setpBPWorkTypeSubList(List<PBPWorkTypeSub> pBPWorkTypeSubList) {
		this.pBPWorkTypeSubList = pBPWorkTypeSubList;
	}
	public PBPWorkTypeSub getpBPWorkTypeSub() {
		return pBPWorkTypeSub;
	}
	public void setpBPWorkTypeSub(PBPWorkTypeSub pBPWorkTypeSub) {
		this.pBPWorkTypeSub = pBPWorkTypeSub;
	}
	public List<AcademicKPI> getAcademicKPIList() {
		return academicKPIList;
	}
	public void setAcademicKPIList(List<AcademicKPI> academicKPIList) {
		this.academicKPIList = academicKPIList;
	}
	public int getLimitBase() {
		return limitBase;
	}
	public void setLimitBase(int limitBase) {
		this.limitBase = limitBase;
	}
	public BigDecimal getTotalInPercentCompareBaseWorkType() {
		return totalInPercentCompareBaseWorkType;
	}
	public void setTotalInPercentCompareBaseWorkType(
			BigDecimal totalInPercentCompareBaseWorkType) {
		this.totalInPercentCompareBaseWorkType = totalInPercentCompareBaseWorkType;
	}
	public String getCompareBaseStatus() {
		return compareBaseStatus;
	}
	public void setCompareBaseStatus(String compareBaseStatus) {
		this.compareBaseStatus = compareBaseStatus;
	}
    
 
    
    

}
