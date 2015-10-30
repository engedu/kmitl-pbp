package com.buckwa.domain.pbp.report;

import java.io.Serializable;

public class RadarPlotReport implements Serializable{
	
	private int orderNo;
	private String axisName;
	private String axisValue;
	public String getAxisName() {
		return axisName;
	}
	public void setAxisName(String axisName) {
		this.axisName = axisName;
	}
	public String getAxisValue() {
		return axisValue;
	}
	public void setAxisValue(String axisValue) {
		this.axisValue = axisValue;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
 
 

}
