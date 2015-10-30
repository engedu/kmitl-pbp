package com.buckwa.dao.impl.pam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.buckwa.dao.intf.pam.PaperDao;
import com.buckwa.domain.common.PagingBean;
import com.buckwa.domain.pam.Paper;
import com.buckwa.util.MySqlUtil;

/*
@Author : Taechapon Himarat (Su)
@Create : Aug 6, 2012 12:11:56 AM
 */
@Repository("paperDao")
public class PaperDaoImpl implements PaperDao {
	
	private static Logger logger = Logger.getLogger(PaperDaoImpl.class);

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	
	public List<Paper> getForPersonProfile(String personId, PagingBean pagingBean) {
		
		StringBuffer sql = new StringBuffer(SQL_GET_ALL);
		sql.append(" LIMIT 0, 3 ");
		logger.info(" sql:"+sql);
		List<Paper> paperList = this.jdbcTemplate.query(sql.toString(), paperMapper, new Object[]{
			personId
		});
		
		return paperList;
	}
	
	private static final String SQL_GET_ALL = 
		" SELECT paper_id, paper_level, paper_title, paper_status, person_id, file_id " +
		" FROM paper " +
		" WHERE person_id = ? ";
	
	@Override
	public List<Paper> getAll(String personId) {
		List<Paper> returnList = new ArrayList<Paper>();
		returnList = this.jdbcTemplate.query(SQL_GET_ALL, paperMapper, new Object[] {
			personId
		});
		return returnList;
	}

	@Override
	public PagingBean getByOffset(PagingBean pagingBean) {
		
		StringBuilder sql = new StringBuilder();
		List<Object> params = new LinkedList<Object>();
		
		Paper paper = (Paper) pagingBean.get("paper");
		
		sql.append(SQL_GET_ALL);
		params.add(paper.getPersonId());
		
		if (StringUtils.hasText(paper.getPaperTitle())) {
			sql.append(" AND title LIKE ? ");
			params.add("%" + paper.getPaperTitle().trim() + "%");
		}
		int rows_totalItem = jdbcTemplate.queryForInt(MySqlUtil.genTotalCountSql(sql.toString()), params.toArray());
		pagingBean.setTotalItems(rows_totalItem);
		
		logger.info(" sql:"+sql);
		
		List<Paper> returnList = this.jdbcTemplate.query(MySqlUtil.genPagingSql(sql.toString(), pagingBean), paperMapper, params.toArray());
		pagingBean.setCurrentPageItem(returnList);

		return pagingBean;
	}
	
	
	private static final String SQL_GET_BY_ID =
		" SELECT paper_id, paper_level, paper_title, paper_status, person_id, file_id " +
		" FROM paper " +
		" WHERE paper_id = ? ";
	
	@Override
	public Paper getById(String id) {
		Paper paper = this.jdbcTemplate.queryForObject(SQL_GET_BY_ID, paperMapper, new Object[] {
			id
		});
		return paper;
	}
	
	
	private static final String SQL_CREATE =
		" INSERT INTO paper ( " +
		"   paper_id, " +
		"   paper_level, " +
		"   paper_title, " +
		"   paper_status, " +
		"   person_id, " +
		"   file_id, " +
		"   status, " +
		"   create_by, " +
		"   create_date, " +
		"   update_by, " +
		"   update_date " +
		" ) " +
		" VALUES ( " +
		"   NULL, ?, ?, ?, ?, NULL, " +
		"   NULL, ?, CURRENT_TIMESTAMP, ?, CURRENT_TIMESTAMP) ";
	
	@Override
	public Long create(final Paper domain) {
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
				PreparedStatement ps = connection.prepareStatement(SQL_CREATE, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, domain.getPaperLevel());
				ps.setString(2, domain.getPaperTitle());
				ps.setString(3, domain.getPaperStatus());
				ps.setLong(4, domain.getPersonId());
				ps.setString(5, domain.getCreateBy());
				ps.setString(6, domain.getCreateBy());
				return ps;
			}
		}, keyHolder);
		Long returnid = keyHolder.getKey().longValue();
		
	   return returnid;
	}
	
	
	private static final String SQL_UPDATE =
		" UPDATE paper " +
		" SET paper_level = ?, " +
		"     paper_title = ?, " +
		"     paper_status = ?, " +
		"     update_by = ?, " +
		"     update_date = CURRENT_TIMESTAMP " +
		" WHERE paper_id = ? ";
	
	@Override
	public void update(Paper domain) {
		
		int result = this.jdbcTemplate.update(SQL_UPDATE, new Object[] {
			domain.getPaperLevel(),
			domain.getPaperTitle(),
			domain.getPaperStatus(),
			domain.getCreateBy(),
			domain.getPaperId()
		});
	}

	@Override
	public void deleteById(String id) {
		// TODO Auto-generated method stub

	}
	
	
	private static final PaperMapper paperMapper = new PaperMapper();
	private static class PaperMapper implements RowMapper<Paper> {
		@Override
		public Paper mapRow(ResultSet rs, int rowNum) throws SQLException {
			Paper domain = new Paper();
			domain.setPaperId(rs.getLong("paper_id"));
			domain.setPaperLevel(rs.getString("paper_level"));
			domain.setPaperTitle(rs.getString("paper_title"));
			domain.setPaperStatus(rs.getString("paper_status"));
			domain.setPersonId(rs.getLong("person_id"));
			domain.setFileId(rs.getLong("file_id"));
			return domain;
		}
	}

}
