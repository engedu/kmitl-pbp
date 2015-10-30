package com.buckwa.dao.impl.pam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.buckwa.dao.intf.pam.LeaveFlowDao;
import com.buckwa.domain.common.PagingBean;
import com.buckwa.domain.pam.Leave;
import com.buckwa.util.BeanUtils;
import com.buckwa.util.BuckWaConstants;
import com.buckwa.util.BuckWaDateUtils;
import com.buckwa.util.BuckWaUtils;

/*
 @Author : Wichien Prommese(Pe)
 @Create : Aug 5, 2012 10:08:53 AM
 */

@Repository("leaveFlowDao")
public class LeaveFlowDaoImpl implements LeaveFlowDao {
	private static Logger logger = Logger.getLogger(LeaveFlowDaoImpl.class);

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void flowProcess(Leave leaveFlow) {
		logger.info(" #LeaveFlowDaoImpl.flowProcess leave flow: "
				+ BeanUtils.getBeanString(leaveFlow));
		this.jdbcTemplate
				.update(
						"update leave_flow set flow_status=?,isCancel=?,update_by=?,updated_date=? where leaveflow_id=? ",
						leaveFlow.getFlowStatus(), leaveFlow.getIsCancel(),
						leaveFlow.getUpdateBy(), new java.sql.Timestamp(
								new Date().getTime()), leaveFlow
								.getLeaveFlowId());
	}

	@Override
	public Leave create(Leave leaveFlow) {
		logger.info(" #LeaveFlowDaoImpl.create # ");
		final Leave finalLeaveFlow = leaveFlow;
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(
					Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(""
						+ "  insert into leave_flow (" + "docno,"
						+ "leavetype_code," + "from_date," + "to_date,"
						+ "owner_id," + "flow_status," + "create_by,"
						+ "created_date" + ") " + "values (?,?,?,?,?,?,?,?)"
						+ "", Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, finalLeaveFlow.getDocNo());
				ps.setString(2, finalLeaveFlow.getLeaveTypeCode());
				ps.setDate(3, BuckWaDateUtils.utilDateToSqlDate(finalLeaveFlow
						.getFromDate()));
				ps.setDate(4, BuckWaDateUtils.utilDateToSqlDate(finalLeaveFlow
						.getToDate()));
				ps.setLong(5, finalLeaveFlow.getOwnerId());
				ps.setString(6, finalLeaveFlow.getFlowStatus());
				ps.setString(7, finalLeaveFlow.getCreateBy());
				ps
						.setTimestamp(8, new java.sql.Timestamp(new Date()
								.getTime()));
				return ps;
			}
		}, keyHolder);
		finalLeaveFlow.setLeaveFlowId(keyHolder.getKey().longValue());
		return finalLeaveFlow;
	}

	@Override
	public PagingBean getAllLeaveFlowByOffset(PagingBean pagingBean,
			boolean isOfficer) {
		Leave leave = (Leave) pagingBean.get("leave");
		List<Leave> returnList = new ArrayList<Leave>();
		StringBuffer sqltotalsb = new StringBuffer();
		sqltotalsb
				.append("   select count(*) as total_item  from  leave_flow  lf \n");
		sqltotalsb.append(" where 1=1 ");
		if (StringUtils.hasText(leave.getDocNo())) {
			sqltotalsb.append(" and lf.docno like  '%"
					+ StringEscapeUtils.escapeSql(leave.getDocNo().trim()) + "%'");
		}

		int rows_totalItem = jdbcTemplate.queryForInt(sqltotalsb.toString());
		pagingBean.setTotalItems(rows_totalItem);
		StringBuffer sb = new StringBuffer();
		sb
				.append("  select lf.leaveflow_id , "
						+ "lf.docno, "
						+ "lf.leavetype_code,"
						+ "lf.from_date,"
						+ "lf.to_date,"
						+ "p.first_name,"
						+ "p.last_name,"
						+ "lf.flow_status,"
						+ "lf.isCancel "
						+ "from leave_flow lf inner join buckwauser p on (p.user_id = lf.owner_id) "
						+ "where lf.status='A' and 1=1 ");
		if (!isOfficer)
			sb.append(" and lf.owner_id= " + leave.getOwnerId());
		if (StringUtils.hasText(leave.getDocNo())) {
			sb
					.append(" and lf.docno like  '%" + StringEscapeUtils.escapeSql(leave.getDocNo().trim())
							+ "%'");
		}

		sb.append(" order by lf.docno,lf.created_date ");
		sb.append(" LIMIT " + pagingBean.getLimitItemFrom() + ","
				+ pagingBean.getLimitItemTo());
		String sql = sb.toString();
		logger.info(" sql:" + sql);
		returnList = this.jdbcTemplate.query(sql, new RowMapper<Leave>() {
			public Leave mapRow(ResultSet rs, int rowNum) throws SQLException {
				Leave leaveFlow = new Leave();
				leaveFlow.setLeaveFlowId(rs.getLong("leaveflow_id"));
				leaveFlow.setDocNo(rs.getString("docno"));
				leaveFlow.setLeaveTypeCode(rs.getString("leavetype_code"));
				leaveFlow.setFromDate(BuckWaDateUtils.sqlDateToutilDate(rs
						.getDate("from_date")));
				leaveFlow.setToDate(BuckWaDateUtils.sqlDateToutilDate(rs
						.getDate("to_date")));
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				leaveFlow.setOwnerFullName(BuckWaUtils.getFullName(firstName,
						lastName));
				leaveFlow.setFlowStatus(rs.getString("flow_status"));
				leaveFlow.setIsCancel(rs.getInt("isCancel"));
				if (leaveFlow.getIsCancel() == 1)
					leaveFlow.setCancelMsg(BuckWaConstants.LEAVE_CANCEL);
				else
					leaveFlow.setCancelMsg(BuckWaConstants.EMPTY);
				return leaveFlow;
			}
		});
		pagingBean.setCurrentPageItem(returnList);

		return pagingBean;
	}
	
	@Override
	public PagingBean getAllLeaveFlowByOffset(PagingBean pagingBean,
			boolean isOfficer,String officerApprove) {
		Leave leave = (Leave) pagingBean.get("leave");
		List<Leave> returnList = new ArrayList<Leave>();
		StringBuffer sqltotalsb = new StringBuffer();
		sqltotalsb
				.append("   select count(*) as total_item  from  leave_flow  lf inner join buckwauser us on (us.user_id = lf.owner_id) inner join person p on p.email = us.username  \n");
		sqltotalsb.append(" where 1=1 ");
		
		if (!isOfficer||(isOfficer&&"0".equals(officerApprove)))
			sqltotalsb.append(" and lf.owner_id= " + leave.getOwnerId());
		
		if("1".equals(officerApprove))
			sqltotalsb.append(" and lf.owner_id!="+leave.getOwnerId());
		
		if (StringUtils.hasText(leave.getLeaveTypeCode())) {
			sqltotalsb.append(" and lf.leavetype_code like  '%"
					+ StringEscapeUtils.escapeSql(leave.getLeaveTypeCode().trim()) + "%'");
		}
		
		if (StringUtils.hasText(leave.getDocNo())) {
			sqltotalsb.append(" and lf.docno like  '%"
					+ StringEscapeUtils.escapeSql(leave.getDocNo().trim()) + "%'");
		}
		
		if (StringUtils.hasText(leave.getFirstName())) {
			sqltotalsb.append(" and p.thai_name like  '%"
					+ StringEscapeUtils.escapeSql(leave.getFirstName().trim()) + "%'");
		}
		
		if (StringUtils.hasText(leave.getLastName())) {
			sqltotalsb.append(" and p.thai_surname like  '%"
					+ StringEscapeUtils.escapeSql(leave.getLastName().trim()) + "%'");
		}

		int rows_totalItem = jdbcTemplate.queryForInt(sqltotalsb.toString());
		pagingBean.setTotalItems(rows_totalItem);
		StringBuffer sb = new StringBuffer();
		sb
				.append("  select lf.leaveflow_id , "
						+ "lf.docno, "
						+ "lf.leavetype_code,"
						+ "lf.from_date,"
						+ "lf.to_date,"
						+ "p.thai_name,"
						+ "p.thai_surname,"
						+ "lf.flow_status,"
						+ "lf.isCancel "
						+ "from leave_flow lf inner join buckwauser us on (us.user_id = lf.owner_id) inner join person p on p.email = us.username "
						+ "where lf.status='A' and 1=1 ");
		
		if (!isOfficer||(isOfficer&&"0".equals(officerApprove)))
			sb.append(" and lf.owner_id= " + leave.getOwnerId());
		
		if("1".equals(officerApprove))
			sb.append(" and lf.owner_id!="+leave.getOwnerId());
		
		if (StringUtils.hasText(leave.getLeaveTypeCode())) {
			sb.append(" and lf.leavetype_code like  '%"
					+ StringEscapeUtils.escapeSql(leave.getLeaveTypeCode().trim()) + "%'");
		}
		
		if (StringUtils.hasText(leave.getDocNo())) {
			sb.append(" and lf.docno like  '%" + StringEscapeUtils.escapeSql(leave.getDocNo().trim())
							+ "%'");
		}
		
		if (StringUtils.hasText(leave.getFirstName())) {
			sb.append(" and p.thai_name like  '%"
					+ StringEscapeUtils.escapeSql(leave.getFirstName().trim()) + "%'");
		}
		
		if (StringUtils.hasText(leave.getLastName())) {
			sb.append(" and p.thai_surname like  '%"
					+ StringEscapeUtils.escapeSql(leave.getLastName().trim()) + "%'");
		}

		sb.append(" order by lf.docno,lf.created_date ");
		sb.append(" LIMIT " + pagingBean.getLimitItemFrom() + ","
				+ pagingBean.getLimitItemTo());
		String sql = sb.toString();
		logger.info(" sql:" + sql);
		returnList = this.jdbcTemplate.query(sql, new RowMapper<Leave>() {
			public Leave mapRow(ResultSet rs, int rowNum) throws SQLException {
				Leave leaveFlow = new Leave();
				leaveFlow.setLeaveFlowId(rs.getLong("leaveflow_id"));
				leaveFlow.setDocNo(rs.getString("docno"));
				leaveFlow.setLeaveTypeCode(rs.getString("leavetype_code"));
				leaveFlow.setFromDate(BuckWaDateUtils.sqlDateToutilDate(rs
						.getDate("from_date")));
				leaveFlow.setToDate(BuckWaDateUtils.sqlDateToutilDate(rs
						.getDate("to_date")));
				String firstName = rs.getString("thai_name");
				String lastName = rs.getString("thai_surname");
				leaveFlow.setOwnerFullName(BuckWaUtils.getFullName(firstName,
						lastName));
				leaveFlow.setFlowStatus(rs.getString("flow_status"));
				leaveFlow.setIsCancel(rs.getInt("isCancel"));
				if (leaveFlow.getIsCancel() == 1)
					leaveFlow.setCancelMsg(BuckWaConstants.LEAVE_CANCEL);
				else
					leaveFlow.setCancelMsg(BuckWaConstants.EMPTY);
				return leaveFlow;
			}
		});
		pagingBean.setCurrentPageItem(returnList);

		return pagingBean;
	}

	@Override
	public Leave getById(String id) {
		StringBuffer sb = new StringBuffer();
		sb
				.append("  select lf.leaveflow_id , "
						+ "lf.docno, "
						+ "lf.leavetype_code,"
						+ "lf.from_date,"
						+ "lf.to_date,"
						+ "p.thai_name,"
						+ "p.thai_surname,"
						+ "lf.owner_id,"
						+ "lf.flow_status,"
						+ "lf.isCancel, "
						+ "lf.created_date "
						+ "from leave_flow lf inner join buckwauser us on (us.user_id = lf.owner_id)  inner join person p on p.email = us.username "
						+ "where lf.status='A' and lf.leaveflow_id=" + id);
		Leave obj = this.jdbcTemplate.queryForObject(sb.toString(),
				new LeaveFlowMapper());
		return obj;
	}

	@Override
	public int getLeaveBalance(Long userid, String leaveType, int year) {
		StringBuffer sb = new StringBuffer();
		
		
		sb.append(" select (a.total) as leave_balance from leave_summary a where userid= "
				+ userid
				+ " and year = '"
				+ year
				+ "' and leavetype_code = '"
				+ leaveType
				+ "' and status='A'");

		// Get Total leave by year
		int leaveTotalYear = 0;
		try {
			leaveTotalYear = this.jdbcTemplate.queryForInt(sb.toString());
		} catch (EmptyResultDataAccessException e) {
		}

		// Get Amount leave
		sb = new StringBuffer();
		if (BuckWaConstants.LEAVE_RESEARCH.equals(leaveType))
			sb.append(" select sum((b.amount_year*365)+(b.amount_month*12)+b.amount_day) from leave_flow a  inner join leave_research b on a.docno = b.docno where a.isCancel=0 and (a.flow_status='"
							+ BuckWaConstants.L_APPROVE
							+ "' OR a.flow_status='"
							+ BuckWaConstants.L_INPROCESS
							+ "') and a.owner_id = "
							+ userid
							+ " and leavetype_code='" + leaveType + "' and YEAR(b.created_date) = "+year);
		else if (BuckWaConstants.LEAVE_MATERNITY.equals(leaveType))
			sb.append(" select sum(b.amount_day) from leave_flow a  inner join leave_maternity b on a.docno = b.docno where a.isCancel=0 and (a.flow_status='"
							+ BuckWaConstants.L_APPROVE
							+ "' OR a.flow_status='"
							+ BuckWaConstants.L_INPROCESS
							+ "') and a.owner_id = "
							+ userid
							+ " and leavetype_code='" + leaveType + "' and YEAR(b.created_date) = "+year);
		else if (BuckWaConstants.LEAVE_MONKHOOD.equals(leaveType))
			sb.append(" select sum(b.amount_day) from leave_flow a  inner join leave_monkhood b on a.docno = b.docno where  a.isCancel=0 and (a.flow_status='"
							+ BuckWaConstants.L_APPROVE
							+ "' OR a.flow_status='"
							+ BuckWaConstants.L_INPROCESS
							+ "') and a.owner_id = "
							+ userid
							+ " and leavetype_code='" + leaveType + "' and YEAR(b.created_date) = "+year);
		else if (BuckWaConstants.LEAVE_PERSONAL.equals(leaveType))
			sb.append(" select sum(b.amount_day) from leave_flow a  inner join leave_personal b on a.docno = b.docno where a.isCancel=0 and (a.flow_status='"
							+ BuckWaConstants.L_APPROVE
							+ "' OR a.flow_status='"
							+ BuckWaConstants.L_INPROCESS
							+ "') and a.owner_id = "
							+ userid
							+ " and leavetype_code='" + leaveType + "' and YEAR(b.created_date) = "+year);
		else if (BuckWaConstants.LEAVE_SICK.equals(leaveType))
			sb.append(" select sum(b.amount_day) from leave_flow a  inner join leave_sick b on a.docno = b.docno where a.isCancel=0 and (a.flow_status='"
							+ BuckWaConstants.L_APPROVE
							+ "' OR a.flow_status='"
							+ BuckWaConstants.L_INPROCESS
							+ "') and a.owner_id = "
							+ userid
							+ " and leavetype_code='" + leaveType + "' and YEAR(b.created_date) = "+year);
		else if (BuckWaConstants.LEAVE_VACATION.equals(leaveType)) {
			sb.append(" select sum(b.amount_day) from leave_flow a inner join leave_vacation b on a.docno = b.docno where a.isCancel=0 and (a.flow_status='"
							+ BuckWaConstants.L_APPROVE
							+ "' OR a.flow_status='"
							+ BuckWaConstants.L_INPROCESS
							+ "') and a.owner_id = "
							+ userid
							+ " and leavetype_code='" + leaveType + "' and YEAR(b.created_date) = "+year);
		}
		int leaveAmount = 0;
		try {
			leaveAmount = this.jdbcTemplate.queryForInt(sb.toString());
		} catch (EmptyResultDataAccessException e) {
		}

		int leaveBalance = 0;
		if (leaveTotalYear > 0 && leaveAmount <= leaveTotalYear) {
			leaveBalance = leaveTotalYear - leaveAmount;
		}

		return leaveBalance;

	}
	
	

	@Override
	public int getVacationLeaveBalance(Long userid) {
		StringBuffer sb = new StringBuffer();

		sb.append(" select sum(a.total-a.amount) as leave_balance from leave_summary a where userid= "
						+ userid
						+ "  and leavetype_code = '"
						+ BuckWaConstants.LEAVE_VACATION + "' and status='A'");

		// Get Total leave by year
		int leaveTotalYear = 0;
		try {
			leaveTotalYear = this.jdbcTemplate.queryForInt(sb.toString());
		} catch (EmptyResultDataAccessException e) {
		}

		// Get Amount leave
		sb = new StringBuffer();
		sb.append(" select sum(b.amount_day) from leave_flow a inner join leave_vacation b on a.docno = b.docno where a.isCancel=0 and (a.flow_status='"
					+ BuckWaConstants.L_INPROCESS
					+ "') and a.owner_id = "
					+ userid + " and leavetype_code='" + BuckWaConstants.LEAVE_VACATION  + "'");
		int leaveAmount = 0;
		try {
			leaveAmount = this.jdbcTemplate.queryForInt(sb.toString());
		} catch (EmptyResultDataAccessException e) {
		}

		int leaveBalance = 0;
		if (leaveTotalYear > 0 && leaveAmount <= leaveTotalYear) {
			leaveBalance = leaveTotalYear - leaveAmount;
		}

		return leaveBalance;
	}
	
	@Override
	public int getBalanceVacationLeaveSummary(Long userid,int year){
		StringBuffer sb = new StringBuffer();

		sb.append(" select sum(a.total-a.amount) as leave_balance from leave_summary a where userid= "
						+ userid
						+ "  and leavetype_code = '"
						+ BuckWaConstants.LEAVE_VACATION + "' and year < "+year+" and status='A'");

		// Get Total leave by year
		int leaveBalance = 0;
		try {
			leaveBalance = this.jdbcTemplate.queryForInt(sb.toString());
		} catch (EmptyResultDataAccessException e) {
		}
		return leaveBalance;
	}
	
	@Override
	public int getTotalVacationLeaveOfYear(Long userid,int year){
		StringBuffer sb = new StringBuffer();

		sb.append(" select sum(a.total) as leave_balance from leave_summary a where userid= "
						+ userid
						+ "  and leavetype_code = '"
						+ BuckWaConstants.LEAVE_VACATION + "' and year = "+year+" and status='A'");

		// Get Total leave by year
		int leaveBalance = 0;
		try {
			leaveBalance = this.jdbcTemplate.queryForInt(sb.toString());
		} catch (EmptyResultDataAccessException e) {
		}
		return leaveBalance;
	}
	
	@Override
	public int getSummaryTotalVacationLeave(Long userid,int year){
		StringBuffer sb = new StringBuffer();

		sb.append(" select sum(a.total-a.amount) as total from leave_summary a where userid= "
						+ userid
						+ "  and leavetype_code = '"
						+ BuckWaConstants.LEAVE_VACATION + "' and year< "+year+" and status='A'");

		// Get Total leave by year
		int total0 = 0;
		try {
			total0 = this.jdbcTemplate.queryForInt(sb.toString());
		} catch (EmptyResultDataAccessException e) {
		}
		sb = new StringBuffer();
		sb.append(" select sum(a.total) as total from leave_summary a where userid= "
				+ userid
				+ "  and leavetype_code = '"
				+ BuckWaConstants.LEAVE_VACATION + "' and year= "+year+" and status='A'");

		// Get Total leave by year
		int total1 = 0;
		try {
			total1 = this.jdbcTemplate.queryForInt(sb.toString());
		} catch (EmptyResultDataAccessException e) {
		}
		return total0+total1;
	}
	
	@Override
	public int getSummaryTotalVacationLeave(Long userid){
		StringBuffer sb = new StringBuffer();

		sb.append(" select sum(a.total-a.amount) as total from leave_summary a where userid= "
						+ userid
						+ "  and leavetype_code = '"
						+ BuckWaConstants.LEAVE_VACATION + "' and status='A'");

		// Get Total leave by year
		int total0 = 0;
		try {
			total0 = this.jdbcTemplate.queryForInt(sb.toString());
		} catch (EmptyResultDataAccessException e) {
		}
		sb = new StringBuffer();
		sb.append(" select sum(a.total) as total from leave_summary a where userid= "
				+ userid
				+ "  and leavetype_code = '"
				+ BuckWaConstants.LEAVE_VACATION + "' and status='A'");

		// Get Total leave by year
		int total1 = 0;
		try {
			total1 = this.jdbcTemplate.queryForInt(sb.toString());
		} catch (EmptyResultDataAccessException e) {
		}
		return total0+total1;
	}
	

	@Override
	public int getTotalLeave(Long userid, String leaveType, int year) {
		StringBuffer sb = new StringBuffer();

		// Get Amount leave
		sb = new StringBuffer();
		if (BuckWaConstants.LEAVE_RESEARCH.equals(leaveType))
			sb
					.append(" select sum((b.amount_year*365)+(b.amount_month*12)+b.amount_day) from leave_flow a  inner join leave_research b on a.docno = b.docno where a.isCancel=0 and  (a.flow_status='"
							+ BuckWaConstants.L_APPROVE
							+ "') and a.owner_id = "
							+ userid
							+ " and leavetype_code='" + leaveType + "'");
		else if (BuckWaConstants.LEAVE_MATERNITY.equals(leaveType))
			sb
					.append(" select sum(b.amount_day) from leave_flow a  inner join leave_maternity b on a.docno = b.docno where a.isCancel=0 and  (a.flow_status='"
							+ BuckWaConstants.L_APPROVE
							+ "') and a.owner_id = "
							+ userid
							+ " and leavetype_code='" + leaveType + "'");
		else if (BuckWaConstants.LEAVE_MONKHOOD.equals(leaveType))
			sb
					.append(" select sum(b.amount_day) from leave_flow a  inner join leave_monkhood b on a.docno = b.docno where a.isCancel=0 and  (a.flow_status='"
							+ BuckWaConstants.L_APPROVE
							+ "') and a.owner_id = "
							+ userid
							+ " and leavetype_code='" + leaveType + "'");
		else if (BuckWaConstants.LEAVE_PERSONAL.equals(leaveType))
			sb
					.append(" select sum(b.amount_day) from leave_flow a  inner join leave_personal b on a.docno = b.docno where a.isCancel=0 and  (a.flow_status='"
							+ BuckWaConstants.L_APPROVE
							+ "') and a.owner_id = "
							+ userid
							+ " and leavetype_code='" + leaveType + "'");
		else if (BuckWaConstants.LEAVE_SICK.equals(leaveType))
			sb
					.append(" select sum(b.amount_day) from leave_flow a  inner join leave_sick b on a.docno = b.docno where a.isCancel=0 and  (a.flow_status='"
							+ BuckWaConstants.L_APPROVE
							+ "') and a.owner_id = "
							+ userid
							+ " and leavetype_code='" + leaveType + "'");
		else if (BuckWaConstants.LEAVE_VACATION.equals(leaveType))
			sb
					.append(" select sum(b.amount_day) from leave_flow a  inner join leave_vacation b on a.docno = b.docno where a.isCancel=0 and  (a.flow_status='"
							+ BuckWaConstants.L_APPROVE
							+ "') and a.owner_id = "
							+ userid
							+ " and leavetype_code='" + leaveType + "'");
		int leaveAmount = 0;

		try {
			leaveAmount = this.jdbcTemplate.queryForInt(sb.toString());
		} catch (EmptyResultDataAccessException e) {

		}

		return leaveAmount;

	}

	private class LeaveFlowMapper implements RowMapper<Leave> {
		@Override
		public Leave mapRow(ResultSet rs, int rowNum) throws SQLException {
			Leave domain = new Leave();
			domain.setLeaveFlowId(rs.getLong("leaveflow_id"));
			domain.setDocNo(rs.getString("docno"));
			domain.setLeaveTypeCode(rs.getString("leavetype_code"));
			domain.setFromDate(BuckWaDateUtils.sqlDateToutilDate(rs
					.getDate("from_date")));
			domain.setToDate(BuckWaDateUtils.sqlDateToutilDate(rs
					.getDate("to_date")));
			String firstName = rs.getString("thai_name");
			String lastName = rs.getString("thai_surname");
			domain.setOwnerFullName(BuckWaUtils
					.getFullName(firstName, lastName));
			domain.setFlowStatus(rs.getString("flow_status"));
			domain.setOwnerId(rs.getLong("owner_id"));
			domain.setIsCancel(rs.getInt("isCancel"));
			if (domain.getIsCancel() == 1)
				domain.setCancelMsg(BuckWaConstants.LEAVE_CANCEL);
			else
				domain.setCancelMsg(BuckWaConstants.EMPTY);
			domain.setCreateDate(rs.getTimestamp("created_date"));
			return domain;
		}
	}
}
