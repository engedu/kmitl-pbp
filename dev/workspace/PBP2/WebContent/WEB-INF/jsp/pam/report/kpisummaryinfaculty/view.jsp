<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page import="com.buckwa.util.PAMConstants"%>

<form:form name="mainForm">
<div class="post">
<h2 class="title"><spring:message code="label.report.kpisummary.title.infaculty" /> - ${requestScope.facultyName}</h2>
<div class="entry">
<br/>

<span style="color: black;">
	<strong>ประเภทบุคคลากร: </strong>
	<c:if test="${requestScope.isExistOfficer}">
		<% if (PAMConstants.PERSON_TYPE_CODE_OFFICER.equals(request.getAttribute("selectedPersonType"))) { %>
			<a href="#" onclick="callKpiInFaculty(<%= PAMConstants.PERSON_TYPE_CODE_GOV_OFFICER %>)">
		<% } %>
			<spring:message code="person_type0"/>
		<% if (PAMConstants.PERSON_TYPE_CODE_OFFICER.equals(request.getAttribute("selectedPersonType"))) { %>
			</a>
		<% } %>
	</c:if>
	<c:if test="${requestScope.isExistOfficer && requestScope.isExistGovOfficer}"> | </c:if>
	<c:if test="${requestScope.isExistGovOfficer}">
		<% if (PAMConstants.PERSON_TYPE_CODE_GOV_OFFICER.equals(request.getAttribute("selectedPersonType"))) { %>
			<a href="#" onclick="callKpiInFaculty(<%= PAMConstants.PERSON_TYPE_CODE_OFFICER %>)">
		<% } %>
			<spring:message code="person_type1"/>
		<% if (PAMConstants.PERSON_TYPE_CODE_GOV_OFFICER.equals(request.getAttribute("selectedPersonType"))) { %>
			</a>
		<% } %>
	</c:if>
</span>
<br/>
<br/>
<table class="tableSearchResult" style="border: none;">
<thead >
	<tr>
		<th class="headerTH" width="150px">ภาระงาน</th>
		<th class="headerTH">ประเภทงาน</th>
		<th class="headerTH" width="100px">เกณฑ์คะแนน<br>ของภาระงาน</th>
<!-- 		<th class="headerTH" width="80px">คะแนนที่<br>นับได้</th> -->
<!-- 		<th class="headerTH" width="80px">คะแนน<br>ประเภทงาน</th> -->
<!-- 		<th class="headerTH" width="80px">คะแนน<br>ของภาระงาน</th> -->
		<th class="headerTH" width="80px">น้ำหนัก (%)</th>
		<th class="headerTH" width="80px">คะแนน<br>ถ่วงน้ำหนัก</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${requestScope.kpiSummaryList}" var="kpiSummary">
	<tr style="border: none;">
		<td>
			<c:choose>
				<c:when test="${kpiSummary.nameWithNoHtml == null || kpiSummary.nameWithNoHtml =='' }">
					<a onclick="callKpiByTopic(${kpiSummary.kpiId}, ${requestScope.selectedPersonType})" href="#"><c:out value="${kpiSummary.name}"/></a>
				</c:when>
				<c:otherwise>
					<c:out value="${kpiSummary.name}"/>
				</c:otherwise>
			</c:choose>
		</td>
		<td>
			<c:out value="${kpiSummary.nameWithNoHtml}"/>
		</td>
		<td align="center">
			<c:out value="${kpiSummary.markDesc}"/>
		</td>
<!-- 		<td align="right"> -->
<%-- 			<c:out value="${kpiSummary.uploadScore}"/> --%>
<!-- 		</td> -->
<!-- 		<td align="right"> -->
<%-- 			<c:out value="${kpiSummary.secondLevelScore}"/> --%>
<!-- 		</td> -->
<!-- 		<td align="right"> -->
<%-- 			<c:out value="${kpiSummary.firstLevelScore}"/> --%>
<!-- 		</td> -->
		<td align="right">
			<c:out value="${kpiSummary.weight}"/>
		</td>
		<td align="right">
			<c:out value="${kpiSummary.weightScore}"/>
		</td>
	</tr>
	</c:forEach>
	<tr style="border: none;">
		<td>&nbsp; </td>
		<td>&nbsp; </td>
		<td>&nbsp; </td>
		<td align="right"><strong>รวม</strong></td>
<%-- 		<td align="right"><strong>${requestScope.sumUploadScore}</strong></td> --%>
<%-- 		<td align="right"><strong>${requestScope.sumSecondLevelScore}</strong></td> --%>
<%-- 		<td align="right"><strong>${requestScope.sumFirstLevelScore}</strong></td> --%>
		<td align="right"><strong>${requestScope.sumWeightScore}</strong></td>
	</tr>
</tbody>
</table>
<br/>
<br/>

<div style="clear: both;">&nbsp;</div>
	<table>
	<tr>
		<td align="center">
			<input class="btn btn-primary" value="<spring:message code="label.button.excel"/> สรุปของสาขา" type="button" id="exportToExcelBtn" rel='notLoading'>
			<%-- <input class="btn btn-primary" value="ดูสรุปรายบุคคล" type="button" id="viewByPersonBtn" rel='notLoading'> --%>
		</td>
	</tr>
	</table>
</div>
</div>

<input type="hidden" name="yearId" value="${requestScope.yearId}">
<input type="hidden" name="facultyId" value="${requestScope.facultyId}">
<input type="hidden" id="selectedPersonType" name="selectedPersonType" value="${requestScope.selectedPersonType}">

</form:form>

<script type="text/javascript">

	$(document).ready( function() {
	
		$("#exportToExcelBtn").click(function(){
			var form = document.forms['mainForm'];
			form.action = "<%=request.getContextPath()%>/pam/report/kpisummaryinfaculty/exportToExcel.htm";
			form.method = 'POST';
			form.submit();
		});
	
		$("#viewByPersonBtn").click(function(){
			var form = document.forms['mainForm'];
			form.action = "<%=request.getContextPath()%>/pam/report/kpisummaryinfaculty/initByPerson.htm";
			form.method = 'POST';
			form.submit();
		});
	
	});
	
	function callKpiInFaculty(selectedPersonType){
		var form = document.forms['mainForm'];
		form.action = "<%=request.getContextPath()%>/pam/report/kpisummaryinfaculty/init.htm";
		form.method = 'GET';
		$("#selectedPersonType").val(selectedPersonType);
		form.submit();
	}
	
	function callKpiByTopic(kpiId, personType){
		var form = document.forms['mainForm'];
		form.action = "<%=request.getContextPath()%>/pam/report/kpisummaryinfaculty/initByTopic.htm";
		form.method = 'POST';
		
		var inputKpiId = document.createElement('input');
		inputKpiId.type = 'hidden';
		inputKpiId.name = 'kpiId';
		inputKpiId.value = kpiId;
		form.appendChild(inputKpiId);
		
		var inputPersonType = document.createElement('input');
		inputPersonType.type = 'hidden';
		inputPersonType.name = 'personType';
		inputPersonType.value = personType;
		form.appendChild(inputPersonType);
		
		form.submit();
	}

</script>