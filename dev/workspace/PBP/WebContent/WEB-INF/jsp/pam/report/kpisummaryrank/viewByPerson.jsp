<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page import="com.buckwa.util.PAMConstants"%>

<form:form name="mainForm">
<div class="post">
<h2 class="title"><spring:message code="label.report.kpisummary.title.rank.byPerson" /> - ${requestScope.facultyName}</h2>
<div class="entry">

<br/>
<span style="color: black;"><strong>ชื่อ: </strong>${requestScope.person.fullName}</span>

<br/>
<br/>
<div style="clear: both;">&nbsp;</div>
<div align="center">
	<img src="<%= request.getContextPath() %>/pam/report/kpisummaryrank/chartByPerson.htm?yearId=${requestScope.yearId}
		&facultyId=${requestScope.person.faculty}
		&personId=${requestScope.person.personId}
		&personType=${requestScope.person.personType}" />
</div>
<div style="clear: both;">&nbsp;</div>

<br>
<br>
<div align="center">
	<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" id="cancelBtn">
</div>

</div>
</div>

</form:form>

<script type="text/javascript">
	
	$(document).ready( function() {

		$("#cancelBtn").click(function(){
			window.location = "<%=request.getContextPath()%>/pam/person/init.htm";
		});

	});
</script>