package com.buckwa.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.buckwa.domain.BuckWaUser;

public class BuckWaUserDetailsService implements UserDetailsService {
	private static  Logger logger = Logger.getLogger(BuckWaUserDetailsService.class);
	@Autowired
	private JdbcTemplate jdbcTemplate;	
	
    @Override
    public UserDetails loadUserByUsername(String username)        throws UsernameNotFoundException, DataAccessException {   
    	logger.info(" username:"+username);
    	BuckWaUser user  =null;
        try{        	
        	if(!isUserEnable(username)){
        		  logger.info("   Found user:"+username+" but not enable ");
        		  throw new Exception();
        	}
       	 List<GrantedAuthority> authorities = getAuthorities(username);     	 
         String sql = "SELECT user_id,username, password FROM buckwauser  WHERE  username = '"+username+"' and enable =1 ";      
         logger.info(" loadUserByUsername:"+sql);
	        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql);	       
	        while (rs.next()) {
	        	user = new BuckWaUser(
	        			rs.getString("username"), 
	            		rs.getString("password"), 
	            		true, 
	            		true, 
	            		true, 
	            		true, 
	            		authorities 
	        	);
	        	user.setUserId(rs.getLong("user_id"));
	        }	
	       if(user==null){
	    	   throw new Exception();
	       }
	       
	       
           // Load Menu
	       /*
	       StringBuffer sb = new StringBuffer();
	       sb.append("  select   code,name,url from buckwamenu menu\n") ;
	       sb.append("   left join buckwarolemenu rolemenu on (menu.menu_id = rolemenu.menu_id)\n") ;
	       sb.append("  left join buckwarole role on (role.role_id = rolemenu.role_id)\n") ;
	       sb.append("   left join buckwagrouprole grouprole on (grouprole.role_id = role.role_id)\n") ;
	       sb.append("  left join buckwagroup groupx on (groupx.group_id =grouprole.group_id)\n") ;
	       sb.append("  left join buckwausergroup usergroup on (usergroup.group_id =groupx.group_id)\n") ;
	       sb.append("   left join buckwauser userx on (userx.username =usergroup.username) \n") ;
	       sb.append("   where userx.username ='"+username+"' and  order_no is not null and status ='"+BuckWaConstants.ENABLE+"' \n") ;
	       sb.append("   group by code \n") ;
	       sb.append("   order by order_no \n") ;
	       
			List<Menu> menuList = this.jdbcTemplate.query(
					sb.toString(),
					new RowMapper<Menu>() {
						public Menu mapRow(ResultSet rs, int rowNum) throws SQLException {
							Menu menu = new Menu();				 							 
							menu.setCode(rs.getString("code"));
							menu.setName(rs.getString("name"));							 
							menu.setUrl(rs.getString("url"));	
						return menu;
					}
					});
	       logger.info(" menuList:"+menuList);
		  if(menuList!=null){
			  user.setMenuList(menuList);
		  }
		  */
		  // Load Project
	 		  /*
		  StringBuffer sb_project = new StringBuffer();
		  sb_project.append("  select p.* from project p \n");
		  sb_project.append("  left join project_user_mapping u \n");
		  sb_project.append("   on (p.project_id = u.project_id) \n");
		  sb_project.append("  where u.user_name='"+username+"'  \n");		  
		  logger.info(" ## project List sql :"+sb_project.toString());		  
			List<Project> projectList = this.jdbcTemplate.query(
					sb_project.toString(),
					new RowMapper<Project>() {
						public Project mapRow(ResultSet rs, int rowNum) throws SQLException {
							Project domain = new Project();				 							 
							domain.setProjectId(rs.getLong("project_id"));
							domain.setProjectName(rs.getString("project_name")); 
						return domain;
					}
					});
			  if(projectList!=null){
				  user.setProjectList(projectList);
			  }
		  */
        }catch(Exception ex){
        	  logger.info("Login Error, Not Found user:"+username);
        	ex.printStackTrace();
        	throw new UsernameNotFoundException("User "+username+" Not Found");        	
        }
        logger.info(" Found user:"+username);
        return user; 
    } 
    
  
    private List<GrantedAuthority> getAuthorities(String username) {   
    	String sql ="";
    	//String sql =" SELECT users.username, authorities.authority as authorities FROM buckwauser users, buckwaauthorities authorities WHERE users.username = '"+username+"' AND users.username = authorities.username ";    	
    	StringBuffer sb = new StringBuffer();
    	sb.append("  select u.username , r.role_name as authorities \n") ;
    	sb.append("  from buckwauser u   \n") ;
    	sb.append("  left outer join buckwausergroup  ug on u.username = ug.username  \n") ;
    	sb.append("  left outer join buckwagroup  g on ug.group_id = g.group_id  \n") ;
    	sb.append("  left outer join buckwagrouprole  gr on g.group_id = gr.group_id   \n") ;
    	sb.append("  left outer join buckwarole r   on gr.role_id = r.role_id  \n") ;
    	sb.append("  where u.username= '"+username+"'");     	
    	sql = sb.toString();    	
    	logger.info(" sql get Authorize: "+sql);    	
    	List<GrantedAuthority> authList = findAllAuthority(sql);
    	return authList;
    } 
    
    public List<GrantedAuthority> findAllAuthority(String sql) {
	    	logger.info(" jdbcTemplate:"+jdbcTemplate);
	    	return jdbcTemplate.query( sql, new AuthorityrMapper());
    }
    
    
    private class AuthorityrMapper implements RowMapper<GrantedAuthority> {
	    	public GrantedAuthority mapRow(ResultSet rs, int rowNum) throws SQLException {
	    		GrantedAuthorityImpl authority = new GrantedAuthorityImpl(rs.getString("authorities"));
	    		logger.info(" sql get Authorize: "+rs.getString("authorities"));
	    		return authority;
	    	}
    }    
    	
    	  /*
        private class UserMapper implements RowMapper<User> {   
            @Override
            public BuckWaUser mapRow(ResultSet rs, int arg1) throws SQLException {         	 
                return new BuckWaUser(
                		rs.getString("username"), 
                		rs.getString("password"), 
                		true, 
                		true, 
                		true, 
                		true, 
                		new GrantedAuthority [0],
                		rs.getString("customer_no")); 
            }   
        }     
        */ 
    	
    	public boolean isUserEnable(String username){
    		boolean result = false;
    		try{
    	        String sql = "SELECT enable  FROM buckwauser  WHERE  username = '"+username+"'";
    	        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql);	
    	        boolean enable =false;
    	        while (rs.next()) {    	        	 
    	        	enable = rs.getBoolean("enable");
    	        	logger.info(" isUserEnable:"+enable);
    	        }    	        
    	        if(enable ==true){
    	        	result = true;
    	        }
    	        logger.info(" isUserEnable:"+enable+" result:"+result);
    		}catch(Exception ex){
    			ex.printStackTrace();
    		}    		
    		return result;
    	}
}
