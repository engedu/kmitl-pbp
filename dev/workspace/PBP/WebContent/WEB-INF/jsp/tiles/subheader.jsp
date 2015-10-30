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
<ul id="tab-menu">
	<sec:authorize ifAnyGranted="ROLE_USER">
		<li id="person_init"><a href="<%=request.getContextPath()%>/pam/person/init.htm"><spring:message
			code="label.menu.header.profile" /></a></li>
	</sec:authorize>
	<sec:authorize ifAnyGranted="ROLE_ADMIN">
		<li id="admin_init"><a href="<%=request.getContextPath()%>/admin/role/init.htm"><spring:message
			code="label.menu.header.admin" /></a></li>
	</sec:authorize>
	<sec:authorize ifAnyGranted="ROLE_OFFICER">
		<li id="leave_init"><a href="<%=request.getContextPath()%>/leave/initOfficer.htm"><spring:message
			code="label.menu.header.leave" /></a></li>
	</sec:authorize>
	<sec:authorize ifAnyGranted="ROLE_EVALUATE">
		<li id="evaluate_init"><a href="<%=request.getContextPath()%>/pam/evaluate/init.htm"><spring:message
			code="label.menu.header.estimate" /></a></li>
	</sec:authorize>
	<sec:authorize ifAnyGranted="ROLE_ADMIN,ROLE_EVALUATE">
		<li id="report_init"><a href="<%=request.getContextPath()%>/pam/report/personsummary/init.htm"><spring:message
			code="label.menu.header.report" /></a></li>
	</sec:authorize>
</ul>
<script>
	$(document).ready(function(){
		$("#tab-menu li").removeClass("current_page_item");
		var page_select = '<%=request.getAttribute(BuckWaConstants.PAGE_SELECT)%>';
		if(page_select=='<%=BuckWaConstants.ADMIN_INIT%>')
			$("#admin_init").addClass("current_page_item");
		else if(page_select=='<%=BuckWaConstants.PERSON_INIT%>')
			$("#person_init").addClass("current_page_item");
		else if(page_select=='<%=BuckWaConstants.LEAVE_INIT%>')
			$("#leave_init").addClass("current_page_item");
		else if(page_select=='<%=BuckWaConstants.EVALUATE_INIT%>')
			$("#evaluate_init").addClass("current_page_item");
		else if(page_select=='<%=BuckWaConstants.REPORT_INIT%>')
			$("#report_init").addClass("current_page_item");
	});
</script>
