<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page import="com.buckwa.util.PAMConstants"%>

<form:form name="mainForm">
<div class="post">
	<h2 class="title"><spring:message code="label.report.kpisummary.title.rank" /> - ${requestScope.facultyName} (7)</h2>
	<div class="entry">
		<c:if test="${requestScope.isExistGovOfficer}">
			<div style="clear: both;">&nbsp;</div>
			<div align="center">
				<img src="<%= request.getContextPath() %>/pam/report/kpisummaryrank/chartInFaculty.htm?yearId=${requestScope.yearId}&facultyId=${requestScope.facultyId}&personType=<%= PAMConstants.PERSON_TYPE_CODE_GOV_OFFICER %>" />
			</div>
		</c:if>
		<c:if test="${requestScope.isExistOfficer}">
			<div style="clear: both;">&nbsp;</div>
			<div align="center">
				<img src="<%= request.getContextPath() %>/pam/report/kpisummaryrank/chartInFaculty.htm?yearId=${requestScope.yearId}&facultyId=${requestScope.facultyId}&personType=<%= PAMConstants.PERSON_TYPE_CODE_OFFICER %>" />
			</div>
		</c:if>
		<div style="clear: both;">&nbsp;</div>
		<table>
			<tr>
				<td align="center">
					<input class="btn btn-primary" value="<spring:message code="label.button.excel"/>" type="button" id="exportBtn" rel='notLoading'>
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
		
		$("#exportBtn").click(function(){
			var form = document.forms['mainForm'];
			form.action ="<%=request.getContextPath()%>/pam/report/kpisummaryrank/exportToExcel.htm";
			form.method='POST';
			form.submit();
		});
	});

</script>