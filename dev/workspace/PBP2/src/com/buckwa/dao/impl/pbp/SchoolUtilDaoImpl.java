package com.buckwa.dao.impl.pbp;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.buckwa.service.intf.pbp.SchoolUtilDao;

@Repository("schoolUtilDao")
public class SchoolUtilDaoImpl implements SchoolUtilDao {
	private static Logger logger = Logger.getLogger(SchoolUtilDaoImpl.class);
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public String getCurrentAcademicYear () {  
			String currentAcademicYearSQL =" SELECT name FROM academic_year where year_status='Y' ";								 
			String currentAcademicYear = (String)this.jdbcTemplate.queryForObject(	currentAcademicYearSQL , String.class); 
		return currentAcademicYear;
	}
	
	
	
	public String getCourseNameByCourseId (Long courseId) {  
		 
		String sql =" SELECT name FROM course where course_id="+courseId;	
		logger.info("  getCourseNameByCourseId sql: "+sql);
		String returnStr = (String)this.jdbcTemplate.queryForObject(	sql , String.class); 
	
	return returnStr;
}
	
	
	public String getDepartmentByUserName (String  regId,String academic_year) {  
		 String userName = null;		 
		 try{
		String sql =" SELECT department_desc FROM person_pbp where email like '%"+regId+"%' and academic_year="+academic_year;	
		logger.info("  getDepartmentByUserName sql: "+sql);
		userName = (String)this.jdbcTemplate.queryForObject(	sql , String.class); 
	 
		 }catch(Exception ex){
			 ex.printStackTrace();
		 }
	     return userName;
}
	
	
	public String getFacutyByUserName (String  regId,String academicYear) {  
		 String userName = null;		 
		 try{
		String sql =" SELECT faculty_desc FROM person_pbp where email like '%"+regId+"%' and academic_year="+academicYear;	
		logger.info("  getFacutyByUserName sql: "+sql);
		userName = (String)this.jdbcTemplate.queryForObject(	sql , String.class); 
	 
		 }catch(Exception ex){
			 ex.printStackTrace();
		 }
	     return userName;
}
	
	
	public String getUserNameFromRegId (String  regId,String academicYear) {  
		 String userName = null;
		 
		 try{
		String sql =" SELECT email FROM person_pbp where reg_id='"+regId+"' and academic_year="+academicYear;	
		logger.info("  getUserNameFromRegId sql: "+sql);
		userName = (String)this.jdbcTemplate.queryForObject(	sql , String.class); 
	 
		 }catch(Exception ex){
			 ex.printStackTrace();
		 }
	     return userName;
}
	
	public String getRegIdFromUserName (String  email,String academicYear) {  
		 String userName = null;
		 
		 try{
		String sql =" SELECT reg_id FROM person_pbp where email='"+email+"' and academic_year="+academicYear;	
		logger.info("  getRegIdFromUserName sql: "+sql);
		userName = (String)this.jdbcTemplate.queryForObject(	sql , String.class); 
	 
		 }catch(Exception ex){
			 ex.printStackTrace();
		 }
	     return userName;
}
	
	public String getUnitDescMyCode (String code,String acedemicYear) {  
		String returnStr ="";
		
		try{
		//String sql =" SELECT name FROM academic_unit where code='"+code+"' and academic_year='"+acedemicYear+"'";	
			String sql =" SELECT name FROM academic_unit where code='"+code+"'" ;	
		logger.info("  getMarkDescMyCode sql: "+sql);
		 returnStr = (String)this.jdbcTemplate.queryForObject(	sql , String.class);
		
		}catch(org.springframework.dao.EmptyResultDataAccessException ex){
			ex.printStackTrace();
		}
	
	return returnStr;
}
	
	 
 
}
	
 
