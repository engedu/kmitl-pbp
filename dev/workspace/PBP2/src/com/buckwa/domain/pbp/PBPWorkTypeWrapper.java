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
	
	private BigDecimal totalMarkPredic = new BigDecimal(0.00);
	private BigDecimal totalMarkCompareBasePredic = new BigDecimal(0.00);
	private BigDecimal totalPercentMarkPredic = new BigDecimal(0.00);
	private BigDecimal totalPercentMarkCompareBasePredic = new BigDecimal(0.00);
	
	private int increaseSalaryRate;
	private List<AcademicYear> academicYearList;
	
	private List<Faculty> facultyList ;
	private String facultyCodeSelect;
	private String facultyName;
	
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
	public List<AcademicYear> getAcademicYearList() {
		return academicYearList;
	}
	public void setAcademicYearList(List<AcademicYear> academicYearList) {
		this.academicYearList = academicYearList;
	}
	public List<Faculty> getFacultyList() {
		return facultyList;
	}
	public void setFacultyList(List<Faculty> facultyList) {
		this.facultyList = facultyList;
	}
	public String getFacultyCodeSelect() {
		return facultyCodeSelect;
	}
	public void setFacultyCodeSelect(String facultyCodeSelect) {
		this.facultyCodeSelect = facultyCodeSelect;
	}
	public String getFacultyName() {
		return facultyName;
	}
	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}
	public BigDecimal getTotalMarkPredic() {
		return totalMarkPredic;
	}
	public void setTotalMarkPredic(BigDecimal totalMarkPredic) {
		this.totalMarkPredic = totalMarkPredic;
	}
	public BigDecimal getTotalMarkCompareBasePredic() {
		return totalMarkCompareBasePredic;
	}
	public void setTotalMarkCompareBasePredic(BigDecimal totalMarkCompareBasePredic) {
		this.totalMarkCompareBasePredic = totalMarkCompareBasePredic;
	}
	public BigDecimal getTotalPercentMarkPredic() {
		return totalPercentMarkPredic;
	}
	public void setTotalPercentMarkPredic(BigDecimal totalPercentMarkPredic) {
		this.totalPercentMarkPredic = totalPercentMarkPredic;
	}
	public BigDecimal getTotalPercentMarkCompareBasePredic() {
		return totalPercentMarkCompareBasePredic;
	}
	public void setTotalPercentMarkCompareBasePredic(
			BigDecimal totalPercentMarkCompareBasePredic) {
		this.totalPercentMarkCompareBasePredic = totalPercentMarkCompareBasePredic;
	}
 
	

}
