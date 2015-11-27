package com.buckwa.domain.pam;

import java.util.Date;

import com.buckwa.domain.BaseDomain;

/*
 @Author : Wichien Prommese(Pe)
 @Create : Aug 5, 2012 2:20:20 PM
 */
public class SickLeave extends BaseDomain {

	private Long leaveSickId;
	private String docNo;
	private int amountDay;
	private String contactBy;
	private Date fromDate;
	private Date toDate;
	private Long leaveByPersonId;
	private String fromDateStr;
	private String toDateStr;
	private int canSickDay;
	private LeaveComment leaveComment;
	private int leaveBalance;
	private String reason;
	 private int flagExpired;
	

	public int getFlagExpired() {
		return flagExpired;
	}

	public void setFlagExpired(int flagExpired) {
		this.flagExpired = flagExpired;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getLeaveBalance() {
		return leaveBalance;
	}

	public void setLeaveBalance(int leaveBalance) {
		this.leaveBalance = leaveBalance;
	}

	public LeaveComment getLeaveComment() {
		return leaveComment;
	}

	public void setLeaveComment(LeaveComment leaveComment) {
		this.leaveComment = leaveComment;
	}

	public Long getLeaveSickId() {
		return leaveSickId;
	}

	public void setLeaveSickId(Long leaveSickId) {
		this.leaveSickId = leaveSickId;
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

	public String getContactBy() {
		return contactBy;
	}

	public void setContactBy(String contactBy) {
		this.contactBy = contactBy;
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

	public int getCanSickDay() {
		return canSickDay;
	}

	public void setCanSickDay(int canSickDay) {
		this.canSickDay = canSickDay;
	}

}
