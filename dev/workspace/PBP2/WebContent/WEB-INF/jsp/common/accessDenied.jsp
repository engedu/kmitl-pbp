
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %> 
<br>
<br>
<div class="content100">  
<div class="mainContent100"> 
<form:form modelAttribute="user"	action="register.htm" method="POST" name="mainForm">  
	<div class="searchForm">
	<div class="subTopicHeaderNoBorder">
	<img src="<c:url value="/images/warning.gif"/>"/> 
	<span  class="errorMessage">URL Access Denied &nbsp;<a href="<%=request.getContextPath()%>/welcome.htm">Back to Main Page</a></span></div>   
	</div>
	<br>
	<br> 
</form:form>	
</div>
</div>
 
