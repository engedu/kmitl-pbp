package com.buckwa.ws.dao;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("timetableWSDao")
public class TimeTableWSDao   {
	private static Logger logger = Logger.getLogger(TimeTableWSDao.class);
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

 
	public void syncTimeTable (){
		logger.info(" ---- Start---" );
		
		
		
		
		logger.info(" ---- End---" );
	}
	 
 
}
