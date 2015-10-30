<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.AuthenticationException"%> 
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="com.buckwa.util.*" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %> 
<%@ page import="com.buckwa.domain.project.*" %>  
<%@ page import="com.buckwa.domain.admin.Menu" %>  

<% 
Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
List<Menu> menuList = null;
List<Project> projectList = null;
if (principal instanceof BuckWaUser) {
	BuckWaUser  buckwauser = (BuckWaUser)principal;
    String username = buckwauser.getUsername();
    menuList = buckwauser.getMenuList();
    projectList = buckwauser.getProjectList();
} 
%>
<table width="960px;" border="0" cellspacing="0" cellpadding="0">
  <tr>  		   	
 		<td width="80%">
 		&nbsp;
 		<sec:authorize ifAnyGranted="ROLE_ADMIN">
 		  <%
 		  if(menuList!=null&&menuList.size()>0){
 	 		    for(Menu menutmp :menuList){
 	 		    	%>
 	 		    	<span class="topMenu">  <a href="<%=request.getContextPath()%><%=menutmp.getUrl()%>"> <%=menutmp.getName()%> </a></span> | 
   	 		    	
 	 		    	<% 
 	 		    }
 		  } 		  
 		  %>
 		  </sec:authorize>  
 		  
 		  <span class="topMenu"><a href="<%=request.getContextPath()%>/welcome.htm">Home</a> </span>| 
 		  <sec:authorize ifAnyGranted="ROLE_ADMIN">
 		   <span class="topMenu"><a href="<%=request.getContextPath()%>/admin/role/init.htm">Admin</a> </span>| 
 		   </sec:authorize>

 		   <span class="topMenu"> <a href="<%=request.getContextPath()%>/webboard/topic/init.htm?catType=GENERAL"> Webboard</a></span>  |
 
 
 <span class="topMenu"><a href="<%=request.getContextPath()%>/lab/initDefaultLabCat.htm"> Lab	</a></span>	
 </span>  		  

 		 </td> 
 		 
 		 <td> 		 
 		   <%
 		  if(projectList!=null&&projectList.size()>0){
 			%>
  		  <span class="topMenu"><a href="<%=request.getContextPath()%>/project/vision/initVisionDefaultProject.htm"> Project	</a></span>	 
 			<%  
 		  } 		  
 		  %> 		 
 		 </td>
 		 <sec:authorize ifAnyGranted="ROLE_PROJECT_PM">
 		 <td>
 		 <span class="topMenu"> | <a href="<%=request.getContextPath()%>/project/init.htm">	Manage Project	</a></span>	 
 		 </td>
 		 </sec:authorize> 
  </tr>	  
</table>
 