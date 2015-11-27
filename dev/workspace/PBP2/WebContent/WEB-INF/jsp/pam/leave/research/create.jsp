<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form modelAttribute="researchLeave" action="create.htm" method="POST"
	name="mainForm">
<div class="post">
	<h2 class="title">ยื่นใบลา > ใบลาไป ศึกษา ฝึกอบรม ปฎิบัติการวิจัย ดูงาน ราชการ</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table width="100%">
			<tr>
				<td class="label-form">มีความประสงค์ขอลาไป:</td>
				<td class="text"><form:checkboxes
					items="${researchLeave.researchTypes}" path="researchTypeCode"
					id="researchTypeCode" itemValue="code" itemLabel="name"
					delimiter="&nbsp;&nbsp;" /></td>
			</tr>
		</table>
		<div class="line">&nbsp;</div>
		<table class="researchTbl" style="display: none;">
				<tr class="researchType1">
					<td class="label-form" width="25%">ศึกษาวิชา :</td>
					<td><form:input cssClass="input" path="study"
						maxlength="255" /><span class="require">*</span> <form:errors
						path="study" cssClass="require" /></td>
				</tr>
				<tr class="researchType1">
					<td class="label-form" width="25%">ขั้นปริญญา :</td>
					<td><form:input cssClass="input" path="degree"
						maxlength="255" /><span class="require">*</span> <form:errors
						path="degree" cssClass="require" /></td>
				</tr>
				<tr class="researchType1">
					<td class="label-form" width="25%">ณ สถานศึกษา :</td>
					<td><form:input cssClass="input"
						path="education" maxlength="255" /><span class="require">*</span>
					<form:errors path="education" cssClass="require" /></td>
				</tr>
				<tr class="researchType2">
					<td class="label-form" width="25%">ด้าน/หลักสูตร:</td>
					<td><form:input cssClass="input" path="course"
						maxlength="255" /><span class="require">*</span> <form:errors
						path="course" cssClass="require" /></td>
				</tr>
				<tr class="researchType2">
					<td class="label-form" width="25%">ณ :</td>
					<td><form:input cssClass="input" path="location"
						maxlength="255" /><span class="require">*</span> <form:errors
						path="location" cssClass="require" /></td>
				</tr>
				<tr>
					<td class="label-form" width="25%">ประเทศ :</td>
					<td><form:input cssClass="input" path="country"
						maxlength="255" /><span class="require">*</span> <form:errors
						path="country" cssClass="require" /></td>
				</tr>
				<tr>
					<td class="label-form" width="25%">ด้วยทุน :</td>
					<td><form:input cssClass="input"
						path="bycapital" maxlength="255" /><span class="require">*</span>
					<form:errors path="bycapital" cssClass="require" /></td>
				</tr>
				<tr>
					<td class="label-form" width="25%">ตั้งแต่วันที่ :</td>
					<td><form:input cssClass="input"
						path="fromDateStr" id="fromDate" readonly="true" onchange="resetAmountDay()"/><span
						class="require">*</span> <form:errors path="fromDateStr"
						cssClass="require" /></td>
				</tr>
				<tr>
					<td class="label-form" width="25%">ถึงวันที่ :</td>
					<td><form:input cssClass="input"
						path="toDateStr" id="toDate" readonly="true" onchange="resetAmountDay()"/>&nbsp;<input class="btn btn-primary" value="<spring:message code="label.leave.button.getday"/>" type="button" id="getDays"><span class="require">*</span>
					<form:errors path="toDateStr" cssClass="require" /></td>
				</tr>
		
				<tr>
					<td class="label-form" width="25%">มีกำหนด (ปี/เดือน/วัน) :</td>
					<td><form:input cssClass="input-short"
						path="amountYear" id="amountYear" maxlength="3" readonly="true"/>/<form:input
						cssClass="input-short" path="amountMonth" id="amountMonth" maxlength="3" readonly="true"/>/<form:input
						cssClass="input-short" path="amountDay" id="amountDay" maxlength="3" readonly="true"/>
						
						<span class="require">*</span>
					<form:errors path="amountDay" cssClass="require" /></td>
				</tr>
				<tr>
					<td class="label-form" width="25%">ในระหว่างลาจะติดต่อข้าพเจ้าได้ที่ :</td>
					<td><form:input cssClass="input"
						path="contactBy" id="contactBy" maxlength="100" /></td>
				</tr>
				<tr>
					<td class="label-form" width="25%">หมายเลขที่โทรศัพท์ :</td>
					<td><form:input cssClass="input"
						path="contactNo" id="contactNo" maxlength="50" /></td>
				</tr>
				<tr>
					<td class="label-form" width="25%">ข้อมูลเพิ่มเติม :</td>
					<td><form:textarea path="leaveComment.comment" id="comment" /></td>
				</tr>
				<tr>
					<td></td>
					<td align="left"><input
						value="<spring:message code="label.button.save"/>" class="btn btn-primary" type="submit" onclick="create();">
					<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init();"></td>
				</tr>
			</table>
		</div>
</div>
<form:hidden path="leaveBalance" id="leaveBalance"/>
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
		$("#amountDay,#amountYear,#amountMonth").val("0"); 
	}

	function clearData(){
		$("input[name=study]").val('');
		$("input[name=degree]").val('');
		$("input[name=education]").val('');
		$("input[name=course]").val('');
		$("input[name=location]").val('');
		$("input[name=country]").val('');
		$("input[name=bycapital]").val('');
		$("input[name=fromDateStr]").val('');
		$("input[name=toDateStr]").val('');
		$("input[name=amountYear]").val('');
		$("input[name=amountMonth]").val('');
		$("input[name=amountDay]").val('');
		$("input[name=contactBy]").val('');
		$("input[name=contactNo]").val('');
		$("input[name=contactNo]").val('');
		$("textarea#comment").val('');
	}

	$(document).ready( function() {

		if($("input[name=leaveResearch.researchTypeCode]:checked").length>0){
			 if($("input[name=leaveResearch.researchTypeCode]:checked").val()=='R001'){
				 $(".researchTbl").show();
				 $(".researchType1").show();
				 $(".researchType2").hide();
			 }else{
				 $(".researchTbl").show();
				 $(".researchType1").hide();
				 $(".researchType2").show();	
			 }
		 }

		$("input[name=researchTypeCode]").click( function() {
			clearData();
			var value = $(this).val();
			$("input[name=researchTypeCode]").each( function(index) {
				if ($(this).val() != value)
					$(this).removeAttr("checked");
			});
			if ($("input[name=researchTypeCode]:checked").length > 0) {
				if (value == 'R001') {
					$(".researchTbl").show();
					$(".researchType1").show();
					$(".researchType2").hide();
				} else {
					$(".researchTbl").show();
					$(".researchType1").hide();
					$(".researchType2").show();
				}
			} else {
				$(".researchTbl,.researchType1,.researchType2").hide();
			}
		});

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
					    $("#amountYear").val($(xml).find('year').text());
					    $("#amountMonth").val($(xml).find('month').text());
					    $("#amountDay").val($(xml).find('day').text());
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