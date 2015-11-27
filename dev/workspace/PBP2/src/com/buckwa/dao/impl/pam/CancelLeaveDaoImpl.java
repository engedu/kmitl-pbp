package com.buckwa.dao.impl.pam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.buckwa.dao.intf.pam.LeaveFlowDao;
import com.buckwa.dao.intf.pam.CancelLeaveDao;
import com.buckwa.domain.pam.Leave;
import com.buckwa.domain.pam.CancelLeave;
import com.buckwa.util.BuckWaDateUtils;
import com.buckwa.util.BuckWaUtils;

/*
@Author : Wichien Prommese(Pe)
@Create : Aug 5, 2012 2:38:05 PM
 */

@Repository("cancelLeaveDao")
public class CancelLeaveDaoImpl implements CancelLeaveDao {
	
	private static Logger logger = Logger.getLogger(CancelLeaveDaoImpl.class);
	
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private LeaveFlowDao leaveFlowDao;
	
	@Override
	public void flowProcess(Leave obj){
		
	}
	
	@Override
	public CancelLeave create(CancelLeave obj){
		logger.info(" #CancelLeaveDaoImpl.create # ");
		final CancelLeave finalObj = obj;
		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		//Get Doc no 
		finalObj.setDocNo(generateDocNo());
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(
					Connection connection) throws SQLException {
				PreparedStatement ps = connection
						.prepareStatement(
								""
								+ "  insert into leave_cancel (" +
								"docno," +
								"amount_day," +
								"fromdate," +
								"todate," +
								"leave_by_personId," +
								"create_by," +
								"created_date" +
								") " +
								"values (?,?,?,?,?,?,?)"
								+ "", Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, finalObj.getDocNo());
				ps.setInt(2, finalObj.getAmountDay());
				ps.setDate(3, BuckWaDateUtils.utilDateToSqlDate(finalObj.getFromDate()));
				ps.setDate(4,  BuckWaDateUtils.utilDateToSqlDate(finalObj.getToDate()));
				ps.setLong(5, finalObj.getLeaveByPersonId());
				ps.setString(6, finalObj.getCreateBy());
				ps.setTimestamp(7, new java.sql.Timestamp(new Date().getTime()));
				
				return ps;
			}
		}, keyHolder);
		
		Long returnid =  keyHolder.getKey().longValue();	
		finalObj.setLeaveCancelId(returnid);
		
		return finalObj;
	}
	
	@Override
	public CancelLeave getById(String id) {		 		
		StringBuffer sb = new StringBuffer();
		sb.append("  select * from leave_cancel where status='A' and leave_cancel_id = "+id);
		CancelLeave obj = this.jdbcTemplate.queryForObject(sb.toString(),new LeaveCancelMapper() );				
		return obj;
	}	
	
	@Override
	public CancelLeave getByDocNo(String docNo){
		StringBuffer sb = new StringBuffer();
		sb.append("  select * from leave_cancel where status='A' and docno = '"+docNo+"'");
		CancelLeave obj = this.jdbcTemplate.queryForObject(sb.toString(),new LeaveCancelMapper() );				
		return obj;
	}
	
	@Override
	public String generateDocNo(){
		String returnValue = null;
		try {
			String sqltmp = "SELECT max(leaveflow_id) as MaxId FROM leave_flow; ";
			logger.info(" sql:" + sqltmp);
			Long maxId = this.jdbcTemplate.queryForLong(sqltmp);
			returnValue = BuckWaUtils.generateDocNo(maxId);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return returnValue;
	}
	
	private class LeaveCancelMapper implements RowMapper<CancelLeave> {
		@Override
		public CancelLeave mapRow(ResultSet rs, int rowNum) throws SQLException {
			CancelLeave domain = new CancelLeave();
			domain.setLeaveCancelId(rs.getLong("leave_cancel_id"));
			domain.setDocNo(rs.getString("docno"));
			domain.setAmountDay(rs.getInt("amount_day"));
			domain.setFromDate(BuckWaDateUtils.sqlDateToutilDate(rs.getDate("fromdate")));
			domain.setToDate(BuckWaDateUtils.sqlDateToutilDate(rs.getDate("todate")));
			if(domain.getFromDate()!=null)
				domain.setFromDateStr(BuckWaDateUtils.get_ddMMyyyy_thai_from_date(domain.getFromDate()));
			if(domain.getToDate()!=null)
				domain.setToDateStr(BuckWaDateUtils.get_ddMMyyyy_thai_from_date(domain.getToDate()));
			domain.setLeaveByPersonId(rs.getLong("leave_by_personId"));
			return domain;
		}
	}
}

