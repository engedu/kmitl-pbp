<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form name="mainForm">
<div class="post">
<h2 class="title"><spring:message code="label.report.kpisummary.title.allfaculty.byfaculty" /> (3)</h2>
<div class="entry">
<br/>


<!-- Government Officer -->
<span style="color: black;"><strong>ประเภทบุคคลากร: </strong><spring:message code="person_type0"/></span>
<br/>
<br/>
<table class="tableSearchResult" style="border: none;">
<thead >
	<tr>
		<th class="headerTH" width="20">#</th>
		<th class="headerTH" width="250">สาขา</th>
		<th class="headerTH" width="100">คะแนน<br>ถ่วงน้ำหนัก</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${requestScope.govOfficerKpiSummaryList}" var="kpiSummary" varStatus="row">
	<tr style="border: none;">
		<td align="center">${row.count}</td>
		<td>
			<a onclick="callKpiInFaculty(${requestScope.yearId}, ${kpiSummary.nameId})" href="#">${kpiSummary.name}</a>
		</td>
		<td align="right">
			<c:out value="${kpiSummary.weightScore}"/>
		</td>
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


<!-- Officer -->
<span style="color: black;"><strong>ประเภทบุคคลากร: </strong><spring:message code="person_type1"/></span>
<br/>
<br/>
<table class="tableSearchResult" style="border: none;">
<thead >
	<tr>
		<th class="headerTH" width="20">#</th>
		<th class="headerTH" width="250">สาขา</th>
		<th class="headerTH" width="100">คะแนนที่นับได้</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${requestScope.officerKpiSummaryList}" var="kpiSummary" varStatus="row">
	<tr style="border: none;">
		<td align="center">${row.count}</td>
		<td>
			<a onclick="callKpiInFaculty(${requestScope.yearId}, ${kpiSummary.nameId})" href="#">${kpiSummary.name}</a>
		</td>
		<td align="right">
			<c:out value="${kpiSummary.weightScore}"/>
		</td>
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

<div style="clear: both;">&nbsp;</div>
	<table>
	<tr>
		<td align="center">
			<input class="btn btn-primary" value="<spring:message code="label.button.excel"/> สรุปภาพรวมของทุกสาขา" type="button" id="exportToExcelByFacultyBtn" rel='notLoading'>
			<%-- <input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" id="backBtn" rel='notLoading'> --%>
		</td>
	</tr>
	</table>
</div>
</div>

<input type="hidden" name="yearId" value="${requestScope.yearId}">

</form:form>

<script type="text/javascript">

	$(document).ready( function() {
		
		$("#exportToExcelByFacultyBtn").click(function(){
			var form = document.forms['mainForm'];
			form.action = "<%=request.getContextPath()%>/pam/report/kpisummaryallfaculty/exportToExcelByFaculty.htm";
			form.method = 'POST';
			form.submit();
		});
	
		$("#backBtn").click(function(){
			window.location = "<%=request.getContextPath()%>/pam/report/kpisummaryallfaculty/init.htm";
		});
	});
	
	function callKpiInFaculty(yearId, nameId){
		var form = document.forms['mainForm'];
		form.action = "<%=request.getContextPath()%>/pam/report/kpisummaryinfaculty/init.htm";
		form.method = 'GET';
		
		var inputFacultyId = document.createElement('input');
		inputFacultyId.type = 'hidden';
		inputFacultyId.name = 'facultyId';
		inputFacultyId.value = nameId;
		form.appendChild(inputFacultyId);
		
		form.submit();
	}

</script>