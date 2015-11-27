package com.buckwa.dao.impl.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.test.jdbc.SimpleJdbcTestUtils;

import com.buckwa.dao.intf.admin.InitialSystemDao;

@Repository("initialSystemDao")
public class InitialSystemDaoImal implements InitialSystemDao {

	@Autowired
	private SimpleJdbcTemplate simpleJdbcTemplate;	
	
	@Override
	public boolean initialSystem() throws Exception {
		boolean result = false;
		try{
			Resource resource = new ClassPathResource("initialSystem.sql"); 
			SimpleJdbcTestUtils.executeSqlScript(simpleJdbcTemplate, resource, true); 
			result =true;
		}catch(Exception ex){
			ex.printStackTrace();
			throw ex;
		}
		return result;
	}
	
	
	 
}
