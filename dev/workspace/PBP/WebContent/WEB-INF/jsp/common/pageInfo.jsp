<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="post-msg">
<c:if test="${not empty authenStatus}">
	<div class="notice-error">
	<ul>
		<li><c:out value="${authenStatus}" /></li>
	</ul>
	</div>
</c:if>
<c:if test="${not empty errorCode}">
	<div class="notice-error">
	
	<ul>
		<li style="text-align: left; padding-left: 100px;"><img src="<c:url value="/images/warning.png"/>" /> <spring:message code="${errorCode}" /></li>
	</ul>
	</div>
</c:if>
<c:if test="${not empty successCode}">
	<div class="notice-success">
		<ul>
			<li style="text-align: left; padding-left: 100px;"><img src="<c:url value="/images/success.png"/>" /> <spring:message code="${successCode}" /></li>
		</ul>
	</div>
</c:if>
</div>
 
 
<c:if test="${not empty userResetpass}"> 
	<div id="post-reset">
		<div class="notice-reset">
			<ul>
				<li>User: ${userResetpass}</li>
				<c:if test="${not empty newPass}"> 
					<li>New Password: ${newPass}</li>
				</c:if>
			</ul>
		</div>
	</div>
</c:if>
<%
	request.getSession().setAttribute("successCode",null); 
	request.getSession().setAttribute("errorCode",null); 
	request.getSession().setAttribute("authenStatus",null); 
%>

