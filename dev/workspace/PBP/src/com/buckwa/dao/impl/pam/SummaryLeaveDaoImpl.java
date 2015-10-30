package com.buckwa.dao.impl.pam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.buckwa.dao.intf.pam.SummaryLeaveDao;
import com.buckwa.domain.common.BuckWaRequest;
import com.buckwa.domain.common.PagingBean;
import com.buckwa.domain.pam.Leave;
import com.buckwa.domain.pam.SummaryLeave;
import com.buckwa.util.BeanUtils;
import com.buckwa.util.BuckWaConstants;
import com.buckwa.util.BuckWaDateUtils;
import com.buckwa.util.BuckWaException;
import com.buckwa.util.BuckWaUtils;

/*
@Author : Wichien Prommese(Pe)
@Create : Aug 5, 2012 2:38:05 PM
 */

@Repository("summaryLeaveDao")
public class SummaryLeaveDaoImpl implements SummaryLeaveDao {
	
	private static Logger logger = Logger.getLogger(SummaryLeaveDaoImpl.class);
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
		
	@Override
	public void create(SummaryLeave obj){
		logger.info(" #SummaryLeaveDaoImpl.create # ");
		final SummaryLeave finalObj = obj;
				
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(
					Connection connection) throws SQLException {
				PreparedStatement ps = connection
						.prepareStatement(
								""
								+ "  insert into leave_summary (" +
								"leavetype_code," +
								"year," +
								"total," +
								"amount," +
								"userid," +
								"create_by," +
								"created_date," +
								"accumulate," +
								"workYear" +
								") " +
								"values (?,?,?,?,?,?,?,?,?)");
				ps.setString(1, finalObj.getLeaveTypeCode());
				ps.setInt(2, finalObj.getYear());
				ps.setInt(3, finalObj.getTotal());
				ps.setInt(4, finalObj.getAmount());
				ps.setLong(5, finalObj.getUserId());
				ps.setString(6, finalObj.getCreateBy());
				ps.setTimestamp(7, new java.sql.Timestamp(new Date().getTime()));
				ps.setInt(8, finalObj.getAccumulate());
				ps.setInt(9, finalObj.getWorkYear());
				return ps;
			}
		});
	}
	
	@Override
	public void deleteByYear(int year) {	
		this.jdbcTemplate.update(" delete from leave_summary where year = "+year);
	}	
	
	@Override
	public void update(SummaryLeave obj){
		this.jdbcTemplate.update(
				"update leave_summary set amount=? where year=? and leavetype_code= ? and userid = ? ",
				obj.getAmount(),obj.getYear(),obj.getLeaveTypeCode(),obj.getUserId());
	}
	
	@Override
	public void updateByYearLeaveTypeCode(SummaryLeave obj){
		this.jdbcTemplate.update(
				"update leave_summary set total=? where year=? and leavetype_code= ?",
				obj.getTotal(),obj.getYear(),obj.getLeaveTypeCode());
	}
	
	@Override
	public void updateFlagAccumulate(){
		this.jdbcTemplate.update(
				"update person set flag_accumulate=1");
	}
	
	@Override
	public List<SummaryLeave> getSummary(int year,String leaveTypeCode,Long userid){
		StringBuffer sb = new StringBuffer();
		List<SummaryLeave> returnList = new ArrayList<SummaryLeave>(); 
		sb.append("  select * from leave_summary where status='A' and userid="+userid+" and year = "+year+" and leavetype_code = '"+leaveTypeCode+"' order by created_date desc");
		returnList = this.jdbcTemplate.query(sb.toString(),new SummaryLeaveMapper());
		return returnList;
	}
	
	@Override
	public List<SummaryLeave> getSummaryByUserAndYear(int year,Long userid){
		StringBuffer sb = new StringBuffer();
		List<SummaryLeave> returnList = new ArrayList<SummaryLeave>(); 
		sb.append("  select a.*,b.name from leave_summary a inner join leave_type b on a.leavetype_code=b.code where a.status='A' and a.userid="+userid+" and a.year = "+year+" order by a.leavetype_code");
		returnList = this.jdbcTemplate.query(sb.toString(),new SummaryLeaveQuotaMapper());
		return returnList;
	}
	
	@Override
	public List<SummaryLeave> getSummaryByUser(Long userid){
		StringBuffer sb = new StringBuffer();
		List<SummaryLeave> returnList = new ArrayList<SummaryLeave>(); 
		sb.append("  select a.*,b.name from leave_summary a inner join leave_type b on a.leavetype_code=b.code where a.status='A' and a.userid="+userid+" order by a.leavetype_code");
		returnList = this.jdbcTemplate.query(sb.toString(),new SummaryLeaveQuotaMapper());
		return returnList;
	}
	
	public List<SummaryLeave> getSummaryAllByYear(int year){
		StringBuffer sb = new StringBuffer();
		List<SummaryLeave> returnList = new ArrayList<SummaryLeave>(); 
		sb.append("  select a.*,b.name from leave_summary a inner join leave_type b on a.leavetype_code=b.code where a.status='A' and a.year = "+year+" order by a.leavetype_code");
		returnList = this.jdbcTemplate.query(sb.toString(),new SummaryLeaveQuotaMapper());
		return returnList;
	}
	
	public List<SummaryLeave> getSummaryVacationByYear(int year){
		StringBuffer sb = new StringBuffer();
		List<SummaryLeave> returnList = new ArrayList<SummaryLeave>(); 
		sb.append("  select a.*,b.name from leave_summary a inner join leave_type b on a.leavetype_code=b.code where a.status='A' and a.year = "+year+" and a.leavetype_code='"+BuckWaConstants.LEAVE_VACATION+"' order by a.leavetype_code");
		returnList = this.jdbcTemplate.query(sb.toString(),new SummaryLeaveQuotaMapper());
		return returnList;
	}
	
	@Override
	public int getSummaryLeaveByYear(int year,int yearCurrent){
		StringBuffer sb = new StringBuffer();
		sb.append("  select count(year) as total from leave_summary where status='A' and year = "+year+" and year<="+yearCurrent);
		int obj = 0;
		try {
			obj = this.jdbcTemplate.queryForInt(sb.toString());	 		
		} catch (EmptyResultDataAccessException e) {

		}
		return obj;
	}
	
	
	private class SummaryLeaveMapper implements RowMapper<SummaryLeave> {
		@Override
		public SummaryLeave mapRow(ResultSet rs, int rowNum) throws SQLException {
			SummaryLeave domain = new SummaryLeave();
			domain.setSummaryLeaveId(rs.getLong("leave_summary_id"));
			domain.setLeaveTypeCode(rs.getString("leavetype_code"));
			domain.setTotal(rs.getInt("total"));
			domain.setYear(rs.getInt("year"));
			domain.setAmount(rs.getInt("amount"));
			domain.setUserId(rs.getLong("userid"));
			return domain;
		}
	}
	
	private class SummaryLeaveQuotaMapper implements RowMapper<SummaryLeave> {
		@Override
		public SummaryLeave mapRow(ResultSet rs, int rowNum) throws SQLException {
			SummaryLeave domain = new SummaryLeave();
			domain.setSummaryLeaveId(rs.getLong("leave_summary_id"));
			domain.setLeaveTypeCode(rs.getString("leavetype_code"));
			domain.setTotal(rs.getInt("total"));
			domain.setYear(rs.getInt("year"));
			domain.setAmount(rs.getInt("amount"));
			domain.setUserId(rs.getLong("userid"));
			domain.setLeaveName(rs.getString("name"));
			domain.setBalance(domain.getTotal()-domain.getAmount());
			domain.setAccumulate(rs.getInt("accumulate"));
			domain.setWorkYear(rs.getInt("workYear"));
			return domain;
		}
	}

	@Override
	public List<Map<String, Object>> getAllLeaveSummaryByYear(String year) {
		
			StringBuffer sql = new StringBuffer();
			sql.append(" SELECT                                           ");
			sql.append("   p.citizen_id AS citizenId,                     ");
			sql.append("   p.thai_name AS NAME,                           ");
			sql.append("   p.thai_surname AS surname,                     ");
			sql.append("   (SELECT NAME                                   ");
			sql.append("    FROM leave_type                               ");
			sql.append("    WHERE CODE = lf.leavetype_code) AS leaveType, ");
			sql.append("   lf.from_date AS fromDate,                      ");
			sql.append("   lf.to_date AS toDate,                          ");
			sql.append("   YEAR(lf.from_date) fromYear,                   ");
			sql.append("   YEAR(lf.to_date) toYear,                       ");
			sql.append("   lf.flow_status,                                ");
			sql.append("   lf.isCancel                                    ");
			sql.append(" FROM leave_flow lf                               ");
			sql.append("   INNER JOIN buckwauser us                       ");
			sql.append("     ON (us.user_id = lf.owner_id)                ");
			sql.append("   INNER JOIN person p                            ");
			sql.append("     ON p.email = us.username                     ");
			sql.append(" WHERE lf.status = 'A'                            ");
			
			if(BeanUtils.isNotEmpty(year)){
				sql.append(" and YEAR(lf.from_date) ="+year);
			}
			
			sql.append(" ORDER BY lf.docno,lf.created_date  ");
			
			logger.info(" sql:" + sql.toString());
			
			List<Map<String, Object>> maps = this.jdbcTemplate.queryForList(sql.toString());
			
			return maps;
			
	}

	@Override
	public List<Map<String, Object>> getAllLeaveSummaryByCriteria(BuckWaRequest request) {
		
		List<Map<String, Object>> maps = new ArrayList<Map<String,Object>>();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT DISTINCT(ls.userid) userid,  ");
		sql.append(" p.thai_name,                                                                 ");
		sql.append(" p.thai_surname,                                                               ");
		sql.append(" p.faculty  ,                                                             ");
		sql.append(" (SELECT lov.NAME FROM lov_detail lov WHERE lov.lov_header_id=5 AND lov.CODE=p.faculty)  facultyName    ");
		sql.append(" FROM leave_summary ls                                                        ");
		sql.append(" INNER JOIN person p                                                          ");
		sql.append(" ON p.email = (SELECT b.USERNAME FROM buckwauser b WHERE b.user_id=ls.userid) ");
		sql.append(" WHERE 1=1 ");
		
		if(BeanUtils.isNotEmpty(request.get("yearId"))){
			sql.append(" AND ls.year="+Integer.parseInt(request.get("yearId").toString().trim()) );
		}
		
		if(BeanUtils.isNotEmpty(request.get("facultyCode"))){
			sql.append(" AND p.faculty ="+request.get("facultyCode").toString().trim() );
		}
		
		logger.info(" sql :" + sql.toString());
		
		maps = this.jdbcTemplate.queryForList(sql.toString());
		
		for (Map<String, Object> map : maps) {
			if(BeanUtils.isNotEmpty(map.get("userid"))&&BeanUtils.isNotEmpty(request.get("yearId"))){
				 List<SummaryLeave> list = this.getSummaryByUserAndYear(
						 Integer.parseInt(request.get("yearId").toString()), 
						 Long.parseLong(map.get("userid").toString()));
				 map.put("summaryLeaveList", list);
			}
		}
		
		return maps;
	}
}

