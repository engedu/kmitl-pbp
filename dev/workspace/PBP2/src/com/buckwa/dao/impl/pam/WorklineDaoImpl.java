package com.buckwa.dao.impl.pam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.buckwa.dao.intf.pam.WorklineDao;
import com.buckwa.domain.common.PagingBean;
import com.buckwa.domain.pam.Person;
import com.buckwa.domain.pam.Workline;
import com.buckwa.domain.pam.WorklineMapping;
import com.buckwa.domain.pam.WorklineMappingParent;
import com.buckwa.util.MySqlUtil;
/*
@Author : Teerawoot Charoenporn(Tor)
@Create : Aug 13, 2012 1:47:50 PM
 */
@Repository("WorklineDao")
public class WorklineDaoImpl implements WorklineDao{
	private static Logger logger = Logger.getLogger(WorklineDaoImpl.class);
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Workline> getAll() {
		List<Workline> returnList = new ArrayList<Workline>(); 
		String sql =" select p.id , p.workline_name, p.workline_code from workline p where p.status = 'A' " ;	
		logger.info(" sql:"+sql);
		returnList = this.jdbcTemplate.query(sql, WORKLINE_MAPPER);
		return returnList;
	}

	@Override
	public void update(Workline workline) {
		logger.info("  workline: " + workline);
		final String sql = "UPDATE workline set workline_name=?, workline_code=?, updated_date=CURRENT_TIMESTAMP WHERE id=? AND status = 'A'";
//		final String sql = "UPDATE workline set workline_name=?, updated_date=CURRENT_TIMESTAMP WHERE id=? AND status = 'A'";
		logger.info(" sql:"+sql);
		this.jdbcTemplate.update(sql,
				workline.getWorklineName(), 
				workline.getWorklineCode(),
				workline.getId()); 
	}
	
	@Override
	public Long create(final Workline workline) {
		logger.info(" Start");
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(
						"INSERT INTO workline (workline_name, workline_code, status, created_date) values (?, ?,'A',CURRENT_TIMESTAMP)",
//						"INSERT INTO workline (workline_name, status, created_date) values (?,'A',CURRENT_TIMESTAMP)",
						Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, workline.getWorklineName());
				ps.setString(2, workline.getWorklineCode());
				return ps;
			}
		}, keyHolder);
		Long returnid = keyHolder.getKey().longValue();

		return returnid;
	}
	
	public PagingBean getByOffset(PagingBean pagingBean) {	 
		LinkedList<Object> params = new LinkedList<Object>();
		Workline workline = (Workline)pagingBean.get("workline");		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT ");
		sql.append(" p.id, p.workline_name, p.workline_code, p.status FROM workline p ");
		if(!StringUtils.isEmpty(workline.getWorklineName())){
			sql.append(" WHERE ");	
			sql.append(" p.workline_name LIKE ? ");
			params.add("%"+StringEscapeUtils.escapeSql(workline.getWorklineName().trim())+"%");
			sql.append(" OR p.workline_code LIKE ? ");
			params.add("%"+StringEscapeUtils.escapeSql(workline.getWorklineName().trim())+"%");
		}
		sql.append(" HAVING p.status = 'A'");
		
		int rows_totalItem = jdbcTemplate.queryForInt(MySqlUtil.genTotalCountSql(sql.toString()), params.toArray()); 
		pagingBean.setTotalItems(rows_totalItem);
		
		logger.info(" sql:" + sql + " "+ params.toString());			
		List<Workline> returnList = this.jdbcTemplate.query(MySqlUtil.genPagingSql(sql.toString(), pagingBean), params.toArray(), WORKLINE_MAPPER);
		pagingBean.setCurrentPageItem(returnList);

		return pagingBean;
	}
	
	@Override
	public Workline getById(String id) {		 		
		final String sql =" SELECT id, workline_code, workline_name FROM workline WHERE id = ? AND status = 'A'";
		Workline workline = this.jdbcTemplate.queryForObject(sql,new Object[]{id}, WORKLINE_MAPPER );				
 		
		return workline;
	}	
	
	@Override
	public void deleteById(String id) {
		final String sql = " UPDATE workline SET status = 'I', updated_date=CURRENT_TIMESTAMP WHERE id = ? AND status = 'A'";
		this.jdbcTemplate.update(sql,id);			 
	}
	
	@Override
	public boolean isAlreadyUsege(String id) {
		 boolean isUsage = false;
		try{
			String sql = "SELECT COUNT(1) FROM workline p INNER JOIN workline_mapping wm " +
					"ON (p.workline_code = wm.workline_code AND wm.status = 'A') WHERE p.id =? AND p.status='A'";			
			logger.info(" sql:"+sql);
			Long total = this.jdbcTemplate.queryForLong(sql, id);
			if(total != null && total.intValue() > 0){
				isUsage = true;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}			
		return isUsage;
	}
	
	@Override
	public boolean isAlreadyUsege(String worklineCode, boolean isParent) {
		boolean isUsage = false;
		try{
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT COUNT(1) FROM workline p INNER JOIN workline_mapping wm ");
			sql.append("ON (p.workline_code = wm.workline_code AND wm.status = 'A' ");
			if(isParent){
				sql.append("   AND wm.parent_code = ? ");
			}
			sql.append(") WHERE p.status='A' ");
			if(!isParent){
				sql.append("AND p.workline_code = ? ");	
			}
			
			logger.info(" sql:"+sql);
			Integer total = this.jdbcTemplate.queryForInt(sql.toString(), worklineCode);
			if(total != null && total.intValue() > 0){
				isUsage = true;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}			
		return isUsage;
	}	
	
	@Override
	public boolean isExist(String name, String code) {
		 boolean isExist = false;
		try{
//			String sql = "SELECT p.status FROM workline p WHERE p.workline_name = ? OR p.workline_code = ? HAVING p.STATUS = 'A'";
			String sql = "SELECT p.status FROM workline p WHERE p.workline_name = ? HAVING p.STATUS = 'A'";
			Long total = this.jdbcTemplate.queryForLong(MySqlUtil.genTotalCountSql(sql), name);
			if(total != null && total.intValue() > 0){
				isExist = true;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}			
		return isExist;
	}	
	
	@Override
	public boolean isExistForUpdate(String name, String code, Long id) {
		 boolean isExist = false;
		try{
//			String sql = "SELECT p.id, p.status FROM workline p WHERE p.workline_name=? OR p.workline_code=? HAVING p.id <> ? AND p.STATUS = 'A'";
			String sql = "SELECT p.id, p.status FROM workline p WHERE p.workline_name=? HAVING p.id <> ? AND p.STATUS = 'A'";
			logger.info(" sql:"+sql);	
			Long total = this.jdbcTemplate.queryForLong(MySqlUtil.genTotalCountSql(sql), new Object[]{name, id});
			if(total != null && total.intValue() > 0){
				isExist = true;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}			
		return isExist;
	}
	
	private static final WorklineMapper WORKLINE_MAPPER = new WorklineMapper();
	private static class WorklineMapper implements RowMapper<Workline> {   						
        @Override
		public Workline mapRow(ResultSet rs, int rowNum) throws SQLException {
        	Workline domain = new Workline(); 					
			domain.setId(rs.getLong("id"));		
			domain.setWorklineCode(rs.getString("workline_code"));
			domain.setWorklineName(rs.getString("workline_name"));	
			return domain;
	    }
	}

	@Override
	public List<WorklineMappingParent> getWorklineMappingByWorklineCode(String worklineCode) {
		LinkedList<Object> params = new LinkedList<Object>();
		StringBuilder sql = new StringBuilder();
		if(worklineCode != null){
			sql.append("SELECT wm.id, wm.workline_code, p.workline_name, wm.parent_code ");
			sql.append("FROM workline_mapping wm ");
			sql.append("INNER JOIN workline p ON p.workline_code = wm.workline_code ");
			sql.append("WHERE wm.status = 'A' ");
			sql.append("AND p.status = 'A' ");
			sql.append("AND wm.parent_code = ?");                            
			params.add(worklineCode);
		}else{
			sql.append("SELECT wm.id, wm.workline_code, p.workline_name, wm.parent_code ");
			sql.append("FROM workline_mapping wm ");
			sql.append("INNER JOIN workline p ON p.workline_code = wm.workline_code ");
			sql.append("WHERE wm.status = 'A' ");
			sql.append("AND p.status = 'A' ");
			sql.append("AND wm.parent_code IS NULL");      
		}
		logger.info("sql : " + sql + params);
		List<WorklineMappingParent> returnList = this.jdbcTemplate.query(sql.toString(), params.toArray(), WORKLINE_MAPPING_PARENT_MAPPER);
		return returnList;
	}
	
	private static final WorklineMappingParentMapper WORKLINE_MAPPING_PARENT_MAPPER = new WorklineMappingParentMapper();
	private static class WorklineMappingParentMapper implements RowMapper<WorklineMappingParent> {   						
        @Override
		public WorklineMappingParent mapRow(ResultSet rs, int rowNum) throws SQLException {
        	WorklineMappingParent domain = new WorklineMappingParent(); 					
			domain.setId(rs.getLong("id"));		
			domain.setWorklineCode(rs.getString("workline_code"));
			domain.setWorklineName(rs.getString("workline_name"));	
			domain.setParentCode(rs.getString("parent_code"));	
			return domain;
	    }
	}
	
	private static final WorklineMappingMapper WORKLINE_MAPPNG_MAPPER = new WorklineMappingMapper();
	private static class WorklineMappingMapper implements RowMapper<WorklineMapping> {   						
		@Override
		public WorklineMapping mapRow(ResultSet rs, int rowNum) throws SQLException {
			WorklineMapping domain = new WorklineMapping(); 					
			domain.setId(rs.getLong("id"));		
			domain.setWorklineCode(rs.getString("workline_code"));
			domain.setParentCode(rs.getString("parent_code"));	
			return domain;
		}
	}
	
	@Override
	public List<Workline> getUnassignedWorkline() {
		StringBuilder sql = new StringBuilder();
		List<Workline> worklineList = null;
		sql.append("SELECT  ");
		sql.append("  p.id, ");
		sql.append("  p.workline_code, ");
		sql.append("  p.workline_name ");
		sql.append("FROM ");
		sql.append("  workline p  ");   
		sql.append("WHERE p.workline_code NOT IN ");   
		sql.append("	(SELECT wm.workline_code  ");   
		sql.append("	FROM workline_mapping wm ");   
		sql.append("	WHERE wm.status = 'A') ");   
		sql.append("AND p.status = 'A' ");   
		logger.info(" sql:"+sql);	
		
		worklineList = (List<Workline>) this.jdbcTemplate.query(sql.toString(), WORKLINE_MAPPER);
		
		return worklineList;
	} 
	
	@Override
	public List<Workline> getUnassignedPersonWorkline() {
		StringBuilder sql = new StringBuilder();
		List<Workline> worklineList = null;
		sql.append("SELECT w.id, w.workline_code, w.workline_name ");
		sql.append("FROM workline w ");
		sql.append("WHERE w.status = 'A' ");
		sql.append("AND w.workline_code NOT IN ");
		sql.append("	(SELECT wpm.workline_code ");                                 
		sql.append("	FROM workline_person_mapping wpm ");                         	                             
		sql.append("	WHERE wpm.status = 'A') ");                  	                       
//		sql.append("	AND wpm.person_id = ?)");       	
		
		worklineList = (List<Workline>) this.jdbcTemplate.query(sql.toString(), WORKLINE_MAPPER);
		
		return worklineList;
	} 
	
	@Override
	public Workline getByWorklineCode(String worklineCode) {
		StringBuilder sql = new StringBuilder();
		Workline workline = null;
		if(worklineCode != null){
			sql.append("SELECT  ");
			sql.append("  p.id, ");
			sql.append("  p.workline_code, ");
			sql.append("  p.workline_name ");
			sql.append("FROM ");
			sql.append("  workline p ");
			sql.append("WHERE p.workline_code = ? ");
			sql.append("AND p.status = 'A' ");
			
			workline = (Workline) this.jdbcTemplate.query(sql.toString(), new Object[]{worklineCode}, WORKLINE_MAPPER);
		}
		
		return workline;
	}

	@Override
	public void addWorklineMapping(String worklineCode, String parentCode) {
		String sql = "INSERT INTO workline_mapping(workline_code, parent_code, status, created_date, created_by) VALUES ( ?,?,'A',CURRENT_TIMESTAMP,NULL)"; 
		this.jdbcTemplate.update(sql, new Object[] { worklineCode, parentCode });

	}
	
	@Override
	public void updateWorklineMapping(String newWorklineCode, String oldWorklineCode) {
		String sql = "UPDATE workline_mapping SET workline_code = ?, updated_date=CURRENT_TIMESTAMP WHERE workline_code = ? AND status = 'A'";
		this.jdbcTemplate.update(sql, new Object[]{newWorklineCode, oldWorklineCode});	
		
		sql = "UPDATE workline_mapping SET parent_code = ?, updated_date=CURRENT_TIMESTAMP WHERE parent_code = ? AND status = 'A'";
		this.jdbcTemplate.update(sql, new Object[]{newWorklineCode, oldWorklineCode});	
		
	}

	@Override
	public void deleteWorklineMapping(String worklineCode) {
		String sql = "UPDATE workline_mapping SET status = 'I', updated_date=CURRENT_TIMESTAMP WHERE workline_code = ? AND status = 'A'";
		this.jdbcTemplate.update(sql, worklineCode);	
		
	}

	@Override
	public PagingBean getWorklinePersonByOffset(PagingBean pagingBean) {
		StringBuilder sql = new StringBuilder();
		List<Object> params = new LinkedList<Object>();
		
		Person person = (Person) pagingBean.get("person");
		
		sql.append("SELECT ");
		sql.append(" 	p.person_id,");
		sql.append(" 	p.thai_name,");
		sql.append(" 	p.thai_surname,");
		sql.append(" 	p.email,");
		sql.append(" 	wpm.workline_code,");
		sql.append(" 	w.workline_name,");
		sql.append(" 	p.STATUS");
		sql.append(" FROM person p");
		sql.append(" LEFT JOIN workline_person_mapping wpm ON p.person_id = wpm.person_id");
		sql.append(" 	AND wpm.STATUS = 'A'");
		sql.append(" 	OR wpm.STATUS IS NULL");
		sql.append(" LEFT JOIN workline w ON wpm.workline_code = w.workline_code AND w.status = 'A' "); 
	
		if (!StringUtils.isEmpty(person.getEmail())) {
			sql.append(" WHERE ");
			sql.append(" p.thai_name LIKE ? ");
			params.add("%" + StringEscapeUtils.escapeSql(person.getEmail().trim()) + "%");
			
			sql.append(" OR p.thai_surname LIKE ? ");
			params.add("%" + StringEscapeUtils.escapeSql(person.getEmail().trim()) + "%");
			
			sql.append(" OR p.email LIKE ? ");
			params.add("%" + StringEscapeUtils.escapeSql(person.getEmail().trim()) + "%");
		}
		sql.append(" HAVING p.status = 'A'");
		
		int rows_totalItem = jdbcTemplate.queryForInt(MySqlUtil.genTotalCountSql(sql.toString()), params.toArray());
		pagingBean.setTotalItems(rows_totalItem);
		
		logger.info(" sql:"+sql+params);
		
		List<Person> returnList = this.jdbcTemplate.query(MySqlUtil.genPagingSql(sql.toString(), pagingBean), worklinePersonMapper, params.toArray());
		pagingBean.setCurrentPageItem(returnList);

		return pagingBean;
	}
	
	private static final WorklinePersonMapper worklinePersonMapper = new WorklinePersonMapper();
	private static class WorklinePersonMapper implements RowMapper<Person> {
		@Override
		public Person mapRow(ResultSet rs, int rowNum) throws SQLException {
			Person domain = new Person();
			domain.setPersonId(rs.getLong("person_id"));
			domain.setThaiName(rs.getString("thai_name"));
			domain.setThaiSurname(rs.getString("thai_surname"));
			domain.setEmail(rs.getString("email"));
			domain.setWorklineCode(rs.getString("workline_code"));
			domain.setWorklineName(rs.getString("workline_name"));
			return domain;
		}
	}

	@Override
	public void updateWorklinePerson(Person person) {
		final StringBuilder sql = new StringBuilder()
			.append("UPDATE workline_person_mapping ")
			.append("SET workline_code = ?, ")
			.append("	updated_by = ?, ")
			.append("	updated_date = CURRENT_TIMESTAMP ")
			.append("WHERE person_id = ? ")
			.append("AND workline_code = ? ")
			.append("AND status = 'A'");
		
		jdbcTemplate.update(sql.toString(), new Object[] {
				person.getWorklineCode(),
				person.getEmail(),
				person.getPersonId(),
				person.getOldWorklineCode()
		});
		
	}

	@Override
	public void addWorklinePerson(Person person) {
		final String sql = "INSERT INTO workline_person_mapping (person_id,workline_code,status,created_date,created_by) VALUES ( ?,?,'A',CURRENT_TIMESTAMP,'admin')";
		logger.info(" sql:"+sql);
		this.jdbcTemplate.update(sql, new Object[] { person.getPersonId(), person.getWorklineCode() });
		
	}

	@Override
	public void deleteWorklinePerson(Person person) {
		final StringBuilder sql = new StringBuilder()
			.append("UPDATE workline_person_mapping ")
			.append("SET status = 'I', ")
			.append("	updated_by = 'admin', ")
			.append("	updated_date = CURRENT_TIMESTAMP ")
			.append("WHERE person_id = ? ")
			.append("AND workline_code = ?")
			.append("AND status = 'A'");
	
		jdbcTemplate.update(sql.toString(), new Object[] {
//				person.getEmail(),
				person.getPersonId(),
				person.getWorklineCode()
		});
		
	}

}
