package com.buckwa.dao.impl.uitl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("rejectSubjectUtil") 
public class RejectSubjectUtil {
	
	private Map<String,String> rejectMap = new HashMap<>();

	public Map<String, String> getRejectMap() {
		return rejectMap;
	}

	public void setRejectMap(Map<String, String> rejectMap) {
		this.rejectMap = rejectMap;
	}
	
	
}
