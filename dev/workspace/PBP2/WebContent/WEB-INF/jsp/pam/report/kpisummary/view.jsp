<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form modelAttribute="kpiSummaryList" action="edit.htm" method="POST" name="mainForm">
<div class="post">
<h2 class="title">รายงานตัวชี้วัด</h2>
<div class="entry">
<br/>
<table class="tableSearchResult" style="border: none;">
<thead >
	<tr>
		<th class="headerTH" width="120px">ภาระงาน</th>
		<th class="headerTH" width="180px" >ประเภทงาน</th>
		<th class="headerTH" width="80px">เกณฑ์คะแนน<br>ของภาระงาน</th>
		<th class="headerTH" width="60px">คะแนนที่<br>นับได้</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${kpiSummaryList}" var="kpiSummary">
	<tr style="border: none;">
		<td>
			<c:out value="${kpiSummary.name}"/>
		</td>
		<td>
			<c:out value="${kpiSummary.nameWithNoHtml}"/>
		</td>
		<td align="center">
			<c:out value="${kpiSummary.markDesc}"/>
		</td>
		<td align="right">
			<c:out value="${kpiSummary.uploadScore}"/>
		</td>
	</tr>
	</c:forEach>
	<tr style="border: none;">
		<td>&nbsp; </td>
		<td>&nbsp; </td>
		<td align="right"><strong>รวม</strong></td>
		<td align="right">
			<%= (Integer) request.getAttribute("sumUploadScore") %>
		</td>
	</tr>
</tbody>
</table>
	
		
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
</form:form>

<script type="text/javascript">

	$(document).ready( function() {
	
		$("#exportBtn").click(function(){
			var form = document.forms['mainForm']; 
			form.action ="<%=request.getContextPath()%>/pam/report/kpisummary/exportToExcel.htm";
			form.method='POST';	
			form.submit();
		});
	
	});

</script>