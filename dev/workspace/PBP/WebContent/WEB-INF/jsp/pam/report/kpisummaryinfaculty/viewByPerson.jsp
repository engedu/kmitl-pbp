<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page import="com.buckwa.util.PAMConstants"%>

<form:form name="mainForm">
<div class="post">
<h2 class="title"><spring:message code="label.report.kpisummary.title.infaculty.byperson" /> - ${requestScope.facultyName} (1)</h2>
<div class="entry">
<br/>

<c:if test="${requestScope.isExistGovOfficer}">
<span style="color: black;"><strong>ประเภทบุคคลากร: </strong><spring:message code="person_type0"/></span>
<br/>
<br/>
<table class="tableSearchResult" style="border: none;">
<thead >
	<tr>
		<th class="headerTH" width="20">#</th>
		<th class="headerTH" width="250">ชื่อ-สกุล</th>
		<th class="headerTH" width="100">คะแนน<br>ถ่วงน้ำหนัก</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${requestScope.govOfficerKpiSummaryList}" var="kpiSummary" varStatus="row">
	<tr style="border: none;">
		<td align="center">${row.count}</td>
		<td><a onclick="callKpiByUser(${requestScope.yearId}, ${kpiSummary.nameId}, <%= PAMConstants.PERSON_TYPE_CODE_GOV_OFFICER %>)" href="#">${kpiSummary.name}</a></td>
		<td align="right">${kpiSummary.weightScore}</td>
	</tr>
	</c:forEach>
	<tr style="border: none;">
		<td>&nbsp;</td>
		<td align="right"><strong>รวม</strong></td>
		<td align="right"><strong>${requestScope.govOfficerSummaryScore}</strong></td>
	</tr>
</tbody>
</table>
<br/>
<br/>
</c:if>


<c:if test="${requestScope.isExistOfficer}">
<span style="color: black;"><strong>ประเภทบุคคลากร: </strong><spring:message code="person_type1"/></span>
<br/>
<br/>
<table class="tableSearchResult" style="border: none;">
<thead >
	<tr>
		<th class="headerTH" width="20">#</th>
		<th class="headerTH" width="250">ชื่อ-สกุล</th>
		<th class="headerTH" width="100">คะแนนที่นับได้</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${requestScope.officerKpiSummaryList}" var="kpiSummary" varStatus="row">
	<tr style="border: none;">
		<td align="center">${row.count}</td>
		<td><a onclick="callKpiByUser(${requestScope.yearId}, ${kpiSummary.nameId}, <%= PAMConstants.PERSON_TYPE_CODE_OFFICER %>)" href="#">${kpiSummary.name}</a></td>
		<td align="right">${kpiSummary.weightScore}</td>
	</tr>
	</c:forEach>
	<tr style="border: none;">
		<td>&nbsp;</td>
		<td align="right"><strong>รวม</strong></td>
		<td align="right"><strong>${requestScope.officerSummaryScore}</strong></td>
	</tr>
</tbody>
</table>
<br/>
<br/>
</c:if>

<div style="clear: both;">&nbsp;</div>
	<table>
	<tr>
		<td align="center">
			<input class="btn btn-primary" value="<spring:message code="label.button.excel"/> สรุปรายบุคคล" type="button" id="exportToExcelByPersonBtn" rel='notLoading'>
			<%-- <input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" id="backBtn" rel='notLoading'> --%>
		</td>
	</tr>
	</table>
</div>
</div>

<input type="hidden" name="yearId" value="${requestScope.yearId}">
<input type="hidden" name="facultyId" value="${requestScope.facultyId}">
<input type="hidden" name="isExistGovOfficer" value="${requestScope.isExistGovOfficer}">
<input type="hidden" name="isExistOfficer" value="${requestScope.isExistOfficer}">

</form:form>

<script type="text/javascript">

	$(document).ready( function() {
		
		$("#exportToExcelByPersonBtn").click(function(){
			var form = document.forms['mainForm'];
			form.action = "<%=request.getContextPath()%>/pam/report/kpisummaryinfaculty/exportToExcelByPerson.htm";
			form.method = 'POST';
			form.submit();
		});
	
		$("#backBtn").click(function(){
			window.location = "<%=request.getContextPath()%>/pam/report/kpisummaryinfaculty/init.htm";
		});
	});

	function callKpiByUser(yearId, nameId, personType){
		var form = document.forms['mainForm'];
		form.action = "<%=request.getContextPath()%>/pam/report/kpisummaryinfaculty/gotoUserHistoryEvaluate.htm";
		form.method = 'POST';
		
		var inputPersonId = document.createElement('input');
		inputPersonId.type = 'hidden';
		inputPersonId.name = 'personId';
		inputPersonId.value = nameId;
		form.appendChild(inputPersonId);
		
		var inputPersonType = document.createElement('input');
		inputPersonType.type = 'hidden';
		inputPersonType.name = 'personType';
		inputPersonType.value = personType;
		form.appendChild(inputPersonType);
		
		form.submit();
	}
</script>