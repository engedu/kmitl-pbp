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
<div class="header"> 
<table width="100%"  cellspacing="1" cellpadding="0" >	
  <tr> 
		<td align="left" width="80%"  style="padding-left: 10px;" > 
		  
		 <div >
		 <!-- 
		 <img src="<c:url value="/images/logo1.png"/>" width="20%" height="20%"/> 
		
		  <img src="<c:url value="/images/logo3.png"/>"  />  
		    --> 
		 </div> 
		</td> 
		
		<td>
		 
    		<sec:authorize ifAnyGranted="ROLE_USER">
		   <span class="logoutText"><a href="<%=request.getContextPath()%>/user/userProfile.htm"> <sec:authentication property="principal.username" /></a></span>	 &nbsp;|&nbsp; 
		
		<span class="logoutText"><a href="<%=request.getContextPath()%>/j_spring_security_logout"><spring:message code="label.logout"/> </a>	</span> &nbsp;&nbsp; 
			</sec:authorize>    
    	<sec:authorize ifNotGranted="ROLE_USER">	
			 <span class="logoutText"><a href="<%=request.getContextPath()%>/preLogin.htm"><spring:message code="label.login"/></a></span>   &nbsp;&nbsp;  &nbsp;&nbsp; 
			  | <span class="logoutText"> <a href="<%=request.getContextPath()%>/userregistration/init.htm"> สมัครสชมาชิก</a></span>&nbsp;&nbsp; 
		
		</sec:authorize>		
		</td>  
  </tr>
</table> 
</div>