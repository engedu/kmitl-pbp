package com.buckwa.dao.impl.pbp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.buckwa.dao.intf.pbp.PersonTimetableDao;
import com.buckwa.domain.pbp.AcademicKPIUserMappingWrapper;
import com.buckwa.domain.pbp.report.PersonReport;
import com.buckwa.domain.pbp.report.TeacherReport;
import com.buckwa.domain.pbp.report.TimeTableReport;

@Repository("personTimetableDao")
public class PersonTimeTableDaoImpl implements PersonTimetableDao {
	private static Logger logger = Logger.getLogger(PersonTimeTableDaoImpl.class);
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
  
	 
	@Override
	public List<TimeTableReport> getTimeTable( String academicYear ,String userName,String semester) {	 
		
		
		List<TimeTableReport> returnList = new ArrayList<TimeTableReport>();
		
		
		AcademicKPIUserMappingWrapper   academicKPIUserMappingWrapper = new AcademicKPIUserMappingWrapper(); 
		// Get Department belong to head
		
		String sqlName = " select p.email,p.thai_name , p.thai_surname ,  concat(concat(p.thai_name,' '),p.thai_surname) as fullName ,p.reg_id"+
				" from person_pbp p  "+
				" where p.email='"+userName+"' ";
		
		List<PersonReport> personReportList = new ArrayList();
		try{
			logger.info(" sqlName:"+sqlName);
			personReportList = this.jdbcTemplate.query(sqlName,	new PersonReportMapper() );
			
		}catch (org.springframework.dao.EmptyResultDataAccessException ex){
			ex.printStackTrace();
		} 	
		
		if(personReportList==null||personReportList.size()==0){
			logger.info(" ############## Not Found User Name:"+userName+"  in pbp_person table ############");
		}else{
			
			PersonReport zeroPerson = personReportList.get(0);
			
			
			/*
			String fullName = zeroPerson.getThaiName().trim()+" "+zeroPerson.getThanSurName().trim();
			
			String sqlTeacher = " select * from staff s where s.full_name='"+fullName+"'";
			
			TeacherReport teacherReport = null;
			try{
				logger.info(" sqlTeacher:"+sqlTeacher);
				teacherReport = this.jdbcTemplate.queryForObject(sqlTeacher,	new TeacherReportMapper() );
				
			}catch (org.springframework.dao.EmptyResultDataAccessException ex){
				ex.printStackTrace();
			} 
			
			if(teacherReport==null){
				logger.info(" ############## Not Found Teacher name :"+fullName+"  in staff table ############");
			}else{
				
				logger.info(" ##############   Found Teacher name :"+fullName+"  in staff table ############");
				*/
				/*
				String sqlTimeTable = " select t.subject_id,t.year,s.section_cd,s.semester,staffmap.teacher_id as teacher_code,staff.full_name, t.eng_name,t.thai_name "+
						" from time_table t "+
						" left join section s on ( t.time_table_cd = s.time_table_id) "+
						" left join staff_mapping staffmap on (s.section_id=staffmap.section_id) "+
						" left join staff staff on (staffmap.teacher_id = staff.code) "+
						" where t.year ="+academicYear+" and staffmap.teacher_id="+teacherReport.getCode()+" and t.semester="+semester+" "+
						" order by t.subject_id ,s.section_cd ";
	
				
				*/
				
				String sqlTimeTable = " SELECT * FROM time_table t where t.year='"+academicYear+"' and t.semester='"+semester+"' and t.teacher_id='"+zeroPerson.getRegId()+"'";
				logger.info(" ##############   sqlTimeTable:"+sqlTimeTable);
				try{
					logger.info(" sqlTimeTable:"+sqlTimeTable);
					returnList = this.jdbcTemplate.query(sqlTimeTable,	new TimeTableReportMapper() );
					
					/*
					for(TimeTableReport reportTmp:returnList){
						
						String teacherId = reportTmp.getTeacherId();
						logger.info(" teacherId:"+teacherId+ " regId:"+zeroPerson.getRegId());
						if(!zeroPerson.getRegId().equalsIgnoreCase(teacherId)){
							logger.info(" Set empty");
							reportTmp.setThaiName(" ");
						}else{
							logger.info("  Return Full Name");
						}
					}
					*/
				}catch (org.springframework.dao.EmptyResultDataAccessException ex){
					ex.printStackTrace();
				} 
				
				
			//} 
			
					
		} 
 
		
		return returnList;
	}
	
	 
	
	 
	@Override
	public List<TimeTableReport> getTimeTableShare( String academicYear ,String subjectId,String semester) {	 
		
		
		List<TimeTableReport> returnList = new ArrayList<TimeTableReport>();
		
	 try{
				
				String sqlTimeTable = " SELECT * FROM time_table t where t.year='"+academicYear+"' and t.semester='"+semester+"' and t.subject_id like '%"+subjectId+"%' GROUP BY t.sect ";
				logger.info(" ##############   sqlTimeTable:"+sqlTimeTable);
			 
					logger.info(" sqlTimeTable:"+sqlTimeTable);
					returnList = this.jdbcTemplate.query(sqlTimeTable,	new TimeTableReportMapper() );
		 
				}catch (org.springframework.dao.EmptyResultDataAccessException ex){
					ex.printStackTrace();
				} 
 

		
		return returnList;
	}
	
	
	
	@Override
	public TimeTableReport getTimeTableById( String timetableId ) {	 
		
		
		TimeTableReport returnObj =  new TimeTableReport();
		
	 try{
				
				String sqlTimeTable = " SELECT * FROM time_table t where t.time_table_cd='"+timetableId+"' ";
				logger.info(" ##############   sqlTimeTable:"+sqlTimeTable);
			 
					logger.info(" sqlTimeTable:"+sqlTimeTable);
					returnObj = this.jdbcTemplate.queryForObject(sqlTimeTable,	new TimeTableReportMapper() );
		 
				}catch (org.springframework.dao.EmptyResultDataAccessException ex){
					ex.printStackTrace();
				} 
 

		
		return returnObj;
	}
	
	
	
 

	private class TimeTableReportMapper implements RowMapper<TimeTableReport> {  
	 
        @Override
		public TimeTableReport mapRow(ResultSet rs, int rowNum) throws SQLException {
        	TimeTableReport domain = new TimeTableReport(); 
        	//domain.setDepartmentId(rs.getLong("department_id"));
        	//t.subject_id,t.year,s.section_cd,s.semester,staffmap.teacher_id as teacher_code,staff.full_name
        	domain.setTimetableId(rs.getString("time_table_cd"));
        	domain.setSubjectName(rs.getString("eng_name")==null?" ":rs.getString("eng_name"));
        	domain.setSubjectCode(rs.getString("subject_id"));
        	domain.setAcademicYear(rs.getString("year"));
        	domain.setSecNo(rs.getString("section"));
        	domain.setSemester(rs.getString("semester"));
        	//domain.setTeacherName(rs.getString("full_name"));
        	
        	domain.setEngName(rs.getString("eng_name")==null?" ":rs.getString("eng_name"));
        	domain.setThaiName(rs.getString("thai_name")==null?" ":rs.getString("thai_name"));
        	
        	if(rs.getString("thai_name")==null||rs.getString("thai_name").trim().length()==0){
        		domain.setThaiName(rs.getString("eng_name")==null?" ":rs.getString("eng_name"));
        	}
//        	domain.setCount("20");
        	
        	domain.setTotalStudent(rs.getString("student_total"));
        	domain.setDegree(rs.getString("degree"));
        	domain.setTeachTime1(rs.getString("teach_time"));
        	domain.setTeachTime2(rs.getString("teach_time2"));
        	domain.setTeachDay(rs.getString("teach_day"));
        	domain.setCredit(rs.getString("credit"));
        	domain.setLecOrPrac(rs.getString("lect_or_prac"));;
        	domain.setLectHr(rs.getString("lect_hr"));
        	domain.setPracHr(rs.getString("prac_hr"));
        	domain.setTeacherId(rs.getString("teacher_id"));
        	domain.setFacultyId(rs.getString("faculty_id"));
        	domain.setDeptId(rs.getString("dept_id"));
		return domain;
    }
	}
	 

	private class PersonReportMapper implements RowMapper<PersonReport> {   						
        @Override
		public PersonReport mapRow(ResultSet rs, int rowNum) throws SQLException {
        	PersonReport domain = new PersonReport(); 
        	domain.setThaiName(rs.getString("thai_name"));
			 domain.setThanSurName(rs.getString("thai_surname"));
			 domain.setRegId(rs.getString("reg_id"));
		return domain;
    }
	}
 
	private class TeacherReportMapper implements RowMapper<TeacherReport> {   						
        @Override
		public TeacherReport mapRow(ResultSet rs, int rowNum) throws SQLException {
        	TeacherReport domain = new TeacherReport(); 
        	domain.setCode(rs.getString("code"));
			 domain.setFullName(rs.getString("full_name"));
		return domain;
    }
	}
}
