package com.buckwa.dao.intf.pam;

import com.buckwa.domain.pam.Leave;
import com.buckwa.domain.pam.CancelLeave;

/*
@Author : Wichien Prommese(Pe)
@Create : Aug 5, 2012 2:36:23 PM
 */
public interface CancelLeaveDao {
	public void flowProcess(Leave obj);
	public CancelLeave create(CancelLeave obj);
	public String generateDocNo();
	public CancelLeave getById(String id);
	public CancelLeave getByDocNo(String docNo);
}

