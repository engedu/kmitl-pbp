<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

<A NAME="top"></A>
 
<div class="content100">  
<div class="topProject">
 
 
	  <table width="100%">
	  	<tr>
	  		<td width="80%"> 
               		  <%
 		  if(projectList!=null&&projectList.size()>0){
 			%> 
			<table>	
			<tr>
 			<%  
 	 		    for(Project projectmp :projectList){
 	 		    	%> 	 
 	 		    	<!-- 
 	 		    	<td>   
 	 		        &nbsp;|<span class="top"><a href="<%=request.getContextPath()%>/project/vision/init.htm?projectId=<%=projectmp.getProjectId()%>"> <%=projectmp.getProjectName()%>   </a></span>
   	 		    	 
   	 		    	</td>
   	 		    	 -->
   	 		    	
 	 		    	<% 
 	 		    }
 			%>
 			</tr>
 				</table>
 			<%  
 		  } 		  
 		  %>	
 		  
 		  <div class="frameworkHeaderNoBorder">
 		  <a href="<%=request.getContextPath()%>/project/vision/init.htm?projectId=<c:out value="${projectId}"/>">
 		  
 		  <c:out value="${projectName}"/> Project (Active)
 		  </a>
 		  </div> 
	  		</td>
	  		
	  		<td>
	  		<!--
 		  <span class="top"><a href="<%=request.getContextPath()%>/project/vision/init.htm?projectId=">Main</a> </span>| 
		 <span class="top"><a href="<%=request.getContextPath()%>/project/requirement/useCase/initAll.htm?moduleId=">Use Case</a> </span>|  
		 <span class="top"><a href="<%=request.getContextPath()%>/project/requirement/detailDesign/initAll.htm?moduleId=">Detail Design</a> </span>| 
		 <span class="top"><a href="<%=request.getContextPath()%>/project/development/init.htm">Development</a> </span>| 
		  <span class="top"><a href="<%=request.getContextPath()%>/project/testing/initAll.htm">Testing</a> </span> | 
		  <span class="top"><a href="<%=request.getContextPath()%>/project/team/init.htm">Team</a> </span> 	  	
		  
		    -->	  
		    
		     <a href="<%=request.getContextPath()%>/project/init.htm" class="expand">
				<img src="<c:url value="/images/icon/expand2.png"/>"/>
 			</a>
 			 <span class="subMenu"> 
 			 More Project 
 			 </span>
	 &nbsp;
	  		 <sec:authorize ifAnyGranted="ROLE_PROJECT_PM"> 	
 		 <span class="subMenu"> <a href="<%=request.getContextPath()%>/project/init.htm">| Manage	</a></span>	  		
 		 </sec:authorize> 	
	  		</td>
	  	</tr>
	  </table> 
 
</div>
</div>

 
	