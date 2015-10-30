package com.buckwa.dao.intf.pam;

import java.util.List;

import com.buckwa.domain.common.PagingBean;
import com.buckwa.domain.pam.Paper;

/*
@Author : Taechapon Himarat (Su)
@Create : Aug 5, 2012 11:33:23 PM
 */
public interface PaperDao {
	
	public List<Paper> getForPersonProfile(String personId, PagingBean pagingBean);
	public List<Paper> getAll(String personId);
	public PagingBean getByOffset(PagingBean pagingBean);
	public Paper getById(String id);
	public Long create(Paper domain);
	public void update(Paper domain); 
	public void deleteById(String id);
	
}
