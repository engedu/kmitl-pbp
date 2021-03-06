package com.buckwa.domain.project;

import com.buckwa.domain.BaseDomain;

public class Util extends BaseDomain{
	
	private Long utilId;
	private String code;
	private String name;
	private String detail;
 
	private Long moduleId;
	private Long projectId;
 
	private String type;

	public Long getUtilId() {
		return utilId;
	}

	public void setUtilId(Long utilId) {
		this.utilId = utilId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Long getModuleId() {
		return moduleId;
	}

	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
	}

	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
	

}
