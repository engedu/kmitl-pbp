<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page import="com.buckwa.util.PAMConstants"%>

<form:form name="mainForm">
<div class="post">
<h2 class="title"><spring:message code="label.report.kpisummary.title.allfaculty.bytopic" /> (4)</h2>
<div class="entry">
<br/>

<span style="color: black;"><strong>ประเภทบุคคลากร: </strong>
<%
	if (request.getParameter("personType").equals(PAMConstants.PERSON_TYPE_CODE_GOV_OFFICER)) {
%>
		<spring:message code="person_type0"/>
<%
	}
	else if (request.getParameter("personType").equals(PAMConstants.PERSON_TYPE_CODE_OFFICER)) {
%>
		<spring:message code="person_type1"/>
<%
	}
%>
</span>
<br/>
<br/>
<table class="tableSearchResult" style="border: none;">
<c:forEach items="${requestScope.kpiSummaryList}" var="kpiSummary" varStatus="row">
<c:if test="${row.index == 0}">
<c:set var="kpiSummaryListSize" value="${fn:length(kpiSummary.childList)}"/>
<thead>
	<tr>
		<th class="headerTH" width="20px" rowspan="2">#</th>
		<th class="headerTH" width="250px" rowspan="2">สาขา</th>
		<c:choose>
			<c:when test="${fn:length(kpiSummary.childList) > 0}">
				<th class="headerTH" colspan="${kpiSummaryListSize}">${kpiSummary.name}</th>
			</c:when>
			<c:otherwise>
				<th class="headerTH" rowspan="2">${kpiSummary.name}</th>
			</c:otherwise>
		</c:choose>
	</tr>
	<c:if test="${fn:length(kpiSummary.childList) > 0}">
	<tr>
		<c:forEach items="${kpiSummary.childList}" var="childKpiSummary" varStatus="childRow">
			<th class="headerTH" width="100px">${childKpiSummary.name}</th>
		</c:forEach>
	</tr>
	</c:if>
<thead>
</c:if>
<c:if test="${row.index > 0}">
<tbody>
	<tr style="border: none;">
		<td align="center">${row.count - 1}</td>
		<td>${kpiSummary.name}</td>
		<c:choose>
			<c:when test="${fn:length(kpiSummary.childList) > 0}">
				<c:forEach items="${kpiSummary.childList}" var="childKpiSummary" varStatus="childRow">
					<td align="right">${childKpiSummary.weightScore}</td>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<td align="right">${kpiSummary.weightScore}</td>
			</c:otherwise>
		</c:choose>
	</tr>
</tbody>
</c:if>

</c:forEach>
</table>

<div style="clear: both;">&nbsp;</div>
	<table>
	<tr>
		<td align="center">
			<input class="btn btn-primary" value="<spring:message code="label.button.excel"/> สรุปตามภาระงาน" type="button" id="exportToExcelByTopicBtn" rel='notLoading'>
			<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" id="backBtn" rel='notLoading'>
		</td>
	</tr>
	</table>
</div>
</div>

<input type="hidden" name="kpiId" value="${requestScope.kpiId}">
<input type="hidden" name="yearId" value="${requestScope.yearId}">
<input type="hidden" name="personType" value="${requestScope.personType}">

</form:form>

<script type="text/javascript">

	$(document).ready( function() {
	
		$("#exportToExcelByTopicBtn").click(function(){
			var form = document.forms['mainForm'];
			form.action = "<%=request.getContextPath()%>/pam/report/kpisummaryallfaculty/exportToExcelByTopic.htm";
			form.method = 'POST';
			form.submit();
		});
	
		$("#backBtn").click(function(){
			window.location = "<%=request.getContextPath()%>/pam/report/kpisummaryallfaculty/init.htm";
		});
	
	});

</script>