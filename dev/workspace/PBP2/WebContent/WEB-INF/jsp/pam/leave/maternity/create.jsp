<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form
	modelAttribute="maternityLeave" action="create.htm" method="POST"
	name="mainForm">
	
<div class="post">
	<h2 class="title">ยื่นใบลา > ใบลาคลอด</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
			<table class="researchTbl">
				<tr>
					<td class="label-form">ตั้งแต่วันที่ :</td>
					<td><form:input cssClass="input"
						path="fromDateStr" id="fromDate" readonly="true" onchange="resetAmountDay()"/><span
						class="require">*</span> <form:errors path="fromDateStr"
						cssClass="require" /></td>
				</tr>
				<tr>
					<td class="label-form">ถึงวันที่ :</td>
					<td><form:input cssClass="input"
						path="toDateStr" id="toDate" readonly="true" onchange="resetAmountDay()"/>
						&nbsp;<input class="btn btn-primary" value="<spring:message code="label.leave.button.getday"/>" type="button" id="getDays">
						<span class="require">*</span>
					<form:errors path="toDateStr" cssClass="require" /></td>
				</tr>
		
				<tr>
					<td class="label-form">มีกำหนด (วัน) :</td>
					<td><form:input cssClass="input-short" path="amountDay" id="amountDay" maxlength="3" readonly="true"/><span class="require">*</span>
					<form:errors path="amountDay" cssClass="require" /></td>
				</tr>
				<tr>
					<td class="label-form">มีวันลาคลอดคงเหลือ (วัน) :</td>
					<td><form:input cssClass="input-short" path="leaveBalance" id="leaveBalance" maxlength="3" readonly="true" /></td>
				</tr>
				<tr>
					<td class="label-form">เนื่องจาก :</td>
					<td><form:textarea path="reason" id="reason"/></td>
				</tr>
				<tr>
					<td class="label-form">ในระหว่างลาจะติดต่อข้าพเจ้าได้ที่ :</td>
					<td><form:input cssClass="input"
						path="contactBy" id="contactBy" maxlength="100" /></td>
				</tr>
				<tr>
					<td class="label-form">ข้อมูลเพิ่มเติม :</td>
					<td><form:textarea path="leaveComment.comment" id="leaveComment.comment"/></td>
				</tr>
				<tr>
					<td></td>
					<td align="left"><input value="<spring:message code="label.button.save"/>" class="btn btn-primary" type="submit" onclick="create();">
					<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init();"></td>
				</tr>
			</table>
		</div>
</div>

</form:form>

<script type="text/javascript">

	function init (){
		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/leave/init.htm";
		form.method = 'GET';
		form.submit();
	}

	function create() {
		
		return true;
	}

	function resetAmountDay(){
		$("#amountDay").val("0"); 
	}

	$(document).ready( function() {
		$('#fromDate,#toDate').datepicker( {
			showOn : 'both',
			buttonText : 'Choose a date',
			buttonImage : '<c:url value="/images/calendar.jpg"/>',
			buttonImageOnly : true,
			showButtonPanel : true
		});
		$('#fromDate,#toDate').datepicker($.datepicker.regional['th']);

		$("#getDays").click(function(){
			if($('#fromDate').val()!=''&&$('#toDate').val()!=''){
				$.ajax({
					type: 'GET',
					url: '<%=request.getContextPath()%>/leave/getTotalLeave.htm',
					data: {dateFrom: $('#fromDate').val(),dateTo: $('#toDate').val() },
					success: function(xml) {
					    $("#amountDay").val($(xml).find('dayTotal').text());
					}
				}).done(function() { 
					closeWaiting();
				});
			}else{
				$("#amountDay").val("0");
				closeWaiting();
			}			
		});

	});
</script>