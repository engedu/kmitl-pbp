package com.buckwa.domain.pam;

import java.util.Date;

import com.buckwa.domain.BaseDomain;

/*
@Author : Wichien Prommese(Pe)
@Create : Aug 5, 2012 2:20:20 PM
 */
public class CancelLeave extends BaseDomain{
	
	  private Long leaveCancelId;
	  private String docNo;
	  private int amountDay;
	  private Date fromDate;
	  private Date toDate;
	  private Long leaveByPersonId;
	  private String fromDateStr;
	  private String toDateStr;
	  
	public Long getLeaveCancelId() {
		return leaveCancelId;
	}
	public void setLeaveCancelId(Long leaveCancelId) {
		this.leaveCancelId = leaveCancelId;
	}
	public String getDocNo() {
		return docNo;
	}
	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}
	public int getAmountDay() {
		return amountDay;
	}
	public void setAmountDay(int amountDay) {
		this.amountDay = amountDay;
	}
	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	public Long getLeaveByPersonId() {
		return leaveByPersonId;
	}
	public void setLeaveByPersonId(Long leaveByPersonId) {
		this.leaveByPersonId = leaveByPersonId;
	}
	public String getFromDateStr() {
		return fromDateStr;
	}
	public void setFromDateStr(String fromDateStr) {
		this.fromDateStr = fromDateStr;
	}
	public String getToDateStr() {
		return toDateStr;
	}
	public void setToDateStr(String toDateStr) {
		this.toDateStr = toDateStr;
	}
 
}

