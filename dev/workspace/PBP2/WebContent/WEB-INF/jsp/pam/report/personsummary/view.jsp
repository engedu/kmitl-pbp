<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form action="edit.htm" method="POST" name="mainForm">
<div class="post">
	<h2 class="title">รายงานประเภทบุคลากร</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<c:forEach items="${personSummaryList}" var="item">
			<div align="center">
				<img src="<%= request.getContextPath() %>/pam/report/personsummary/chart.htm?code=<c:out value="${item.code}"/>" />
			</div>
			<div style="clear: both;">&nbsp;</div>
		</c:forEach>
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
			form.action ="<%=request.getContextPath()%>/pam/report/personsummary/exportToExcel.htm";
			form.method='POST';	
			form.submit();
		});
	
	});

</script>