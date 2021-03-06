package com.buckwa.web.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.buckwa.dao.intf.pbp.AcademicYearDao;
import com.buckwa.domain.pam.Semester;
import com.buckwa.domain.pbp.AcademicYear;
import com.buckwa.domain.pbp.Faculty;
import com.buckwa.util.BuckWaDateUtils;

@Controller
@RequestMapping("/initialAcademicYear")
public class InitialAcademicYearController implements InitializingBean , BeanFactoryAware{
	private static Logger logger = Logger.getLogger(InitialAcademicYearController.class);
 
		
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private AcademicYearUtil academicYearUtil;
	
	@Autowired
	private AcademicYearDao academicYearDao;
	
	  public void setBeanFactory(BeanFactory context) {
 
		  logger.info(" ##### InitialAcademicYearController ##### ");
			 
		  }
	
	
	public void afterPropertiesSet() throws Exception { 
		
		logger.info("############# Start InitialAcademicYearController #############"); 
		String currentAcademicYearStr ="";
		try{
			
			String currentAcademicYearSQL =" SELECT name FROM academic_year where year_status='Y' ";								 
			  String academicYear = (String)this.jdbcTemplate.queryForObject(	currentAcademicYearSQL , String.class);
			  currentAcademicYearStr =academicYear;
			academicYearUtil.setAcademicYear(academicYear);
			logger.info(" #############  AcademicYear:"+academicYear); 
			
			 List<AcademicYear> academicYearList =new ArrayList();
			 
				String sql =" select *  from academic_year ";  
				logger.info(" sqlxx:"+sql);
				academicYearList  = this.jdbcTemplate.query(sql,	new AcademicYearMapper() );		
				
				for(AcademicYear ayeartmp:academicYearList){
					
					String sqlSemester =" select *  from semester where academic_year='"+ayeartmp.getName()+"'"; 
					logger.info(" sqlSemester:"+sql);
					List<Semester> semesterList = this.jdbcTemplate.query(sqlSemester,	new SemesterMapper() );	
					
					ayeartmp.setSemesterList(semesterList);
				}
		 
			
			academicYearUtil.setAcademicYearList(academicYearList);
		}catch(Exception ex){
			logger.info(ex.toString());;
		}
	
		
		logger.info("#############  Load Faculty Dropdown #############"); 
		try{
			
			String facultySQL =" SELECT name,code FROM faculty where academic_year='"+currentAcademicYearStr+"' ";								 
			 
			
			 List<Faculty> facultyList =new ArrayList();
		 
				logger.info(" facultySQL:"+facultySQL);
				facultyList  = this.jdbcTemplate.query(facultySQL,	new FacultyMapper() );	 
			academicYearUtil.setFacultyList(facultyList);
		}catch(Exception ex){
			logger.info(ex.toString());;
		}
		
		
	}
	
	private class SemesterMapper implements RowMapper<Semester> {
        @Override
		public Semester mapRow(ResultSet rs, int rowNum) throws SQLException {
			Semester domain = new Semester();
			domain.setSemesterId(rs.getLong("semester_id"));
			domain.setName(rs.getString("name"));
			domain.setStartDate(rs.getTimestamp("start_date"));
			domain.setEndDate(rs.getTimestamp("end_date"));
			domain.setYearId(rs.getLong("year_id"));
			return domain;
	    }
	}
	
	private class AcademicYearMapper implements RowMapper<AcademicYear> {   						
        @Override
		public AcademicYear mapRow(ResultSet rs, int rowNum) throws SQLException {
        	AcademicYear domain = new AcademicYear(); 
        	domain.setAcademicYearId(rs.getLong("academic_year_id"));
			domain.setName(rs.getString("name"));		
			domain.setStartDate(rs.getTimestamp("start_date"));
			domain.setEndDate(rs.getTimestamp("end_date"));	
			domain.setStartDateStr(BuckWaDateUtils.get_ddMMyyyy_from_date(rs.getTimestamp("start_date")));
			domain.setEndDateStr(BuckWaDateUtils.get_ddMMyyyy_from_date(rs.getTimestamp("end_date")));
		return domain;
    }
	}
	private class FacultyMapper implements RowMapper<Faculty> {   						
        @Override
		public Faculty mapRow(ResultSet rs, int rowNum) throws SQLException {
        	Faculty domain = new Faculty(); 
        	domain.setName(rs.getString("name"));
        	domain.setCode(rs.getString("code"));
		 
		return domain;
    }
	}
}