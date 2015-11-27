<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<div id="logo">
	
</div>
<div id="head-profile">
<sec:authorize ifAnyGranted="ROLE_USER">
	<p> <span><security:authentication property="principal.firstLastName"/>  |  </span><a id="logout" href="<%=request.getContextPath()%>/j_spring_security_logout"><spring:message code="label.logout"/> </a></p>
</sec:authorize>
</div>

			


