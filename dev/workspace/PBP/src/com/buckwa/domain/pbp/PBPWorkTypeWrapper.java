package com.buckwa.domain.pbp;

import java.math.BigDecimal;
import java.util.List;

import com.buckwa.domain.BaseDomain;

public class PBPWorkTypeWrapper  extends BaseDomain{
	
	private List<PBPWorkType> pBPWorkTypeList;
	private String academicYear;
	
	private BigDecimal totalMark = new BigDecimal(0.00);
	private BigDecimal totalMarkCompareBase = new BigDecimal(0.00);
	private BigDecimal totalPercentMark = new BigDecimal(0.00);
	private BigDecimal totalPercentMarkCompareBase = new BigDecimal(0.00);
	private int increaseSalaryRate;
	
	public List<PBPWorkType> getpBPWorkTypeList() {
		return pBPWorkTypeList;
	}
	public void setpBPWorkTypeList(List<PBPWorkType> pBPWorkTypeList) {
		this.pBPWorkTypeList = pBPWorkTypeList;
	}
	public String getAcademicYear() {
		return academicYear;
	}
	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}
	public BigDecimal getTotalMark() {
		return totalMark;
	}
	public void setTotalMark(BigDecimal totalMark) {
		this.totalMark = totalMark;
	}
	public BigDecimal getTotalPercentMark() {
		return totalPercentMark;
	}
	public void setTotalPercentMark(BigDecimal totalPercentMark) {
		this.totalPercentMark = totalPercentMark;
	}
	public int getIncreaseSalaryRate() {
		return increaseSalaryRate;
	}
	public void setIncreaseSalaryRate(int increaseSalaryRate) {
		this.increaseSalaryRate = increaseSalaryRate;
	}
	public BigDecimal getTotalMarkCompareBase() {
		return totalMarkCompareBase;
	}
	public void setTotalMarkCompareBase(BigDecimal totalMarkCompareBase) {
		this.totalMarkCompareBase = totalMarkCompareBase;
	}
	public BigDecimal getTotalPercentMarkCompareBase() {
		return totalPercentMarkCompareBase;
	}
	public void setTotalPercentMarkCompareBase(
			BigDecimal totalPercentMarkCompareBase) {
		this.totalPercentMarkCompareBase = totalPercentMarkCompareBase;
	}
 
	

}
