<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form name="mainForm">
<div class="post">
	<h2 class="title">รายงานบุคลากรตามตำแหน่งวิชาการและวุฒิการศึกษา</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<div align="center">
			<img src="<%= request.getContextPath() %>/pam/report/personbyfaculty/chartbyposition.htm" />
		</div>
		<div style="clear: both;">&nbsp;</div>
		<div align="center">
			<img src="<%= request.getContextPath() %>/pam/report/personbyfaculty/chartbyeducation.htm" />
		</div>
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
			form.action ="<%=request.getContextPath()%>/pam/report/personbyfaculty/exportToExcel.htm";
			form.method='POST';	
			form.submit();
		});
	
	});

</script>