<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
	 
<div class="content">  
<div class="mainContent"> 
<form:form  modelAttribute="project" 	action="search.htm" method="POST" name="mainForm"> 
	<div class="subTopicHeader">Deployment</div> 	
	<div class="searchFormNoBorder">	 
		<div class="usecaseHeaderTxt">
 
 	</div> 
</div>
</form:form>
</div>
</div>

 
	