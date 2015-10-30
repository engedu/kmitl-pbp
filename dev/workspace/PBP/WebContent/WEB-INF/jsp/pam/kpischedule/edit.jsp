<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<form:form modelAttribute="kpiSchedule" action="edit.htm" method="POST" name="mainForm">  
<div class="post">
	<h2 class="title">กำหนดช่วงเวลาประเมิน > แก้ไข </h2>
	<div class="entry">
		<table width="100%">
			<tr>
				<td class="label-form">ปีการศึกษา (พ.ศ.):</td>
				<td>
					<c:out value="${kpiSchedule.yearName}"></c:out>
				</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			
			<tr>
				<td colspan="2" class="label-form">ประเมินข้าราชการ ครั้งที่ 1</td>
			</tr>
			<tr>
				<td class="label-form">วันที่เริ่ม Upload:</td>
				<td>
					<form:input cssClass="input" path="teacherUploadStartDate1Str" id="teacherUploadStartDate1" readonly="true" />
					<span class="require">*</span>
					<form:errors path="teacherUploadStartDate1Str" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันที่สิ้นสุด Upload:</td>
				<td>
					<form:input cssClass="input" path="teacherUploadEndDate1Str" id="teacherUploadEndDate1" readonly="true" />
					<span class="require">*</span>
					<form:errors path="teacherUploadEndDate1Str" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันที่เริ่มการประเมิน:</td>
				<td>
					<form:input cssClass="input" path="teacherEvaluateStartDate1Str" id="teacherEvaluateStartDate1" readonly="true" />
					<span class="require">*</span>
					<form:errors path="teacherEvaluateStartDate1Str" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันที่สิ้นสุดการประเมิน:</td>
				<td>
					<form:input cssClass="input" path="teacherEvaluateEndDate1Str" id="teacherEvaluateEndDate1" readonly="true" />
					<span class="require">*</span>
					<form:errors path="teacherEvaluateEndDate1Str" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			
			<tr>
				<td colspan="2" class="label-form">ประเมินข้าราชการ ครั้งที่ 2</td>
			</tr>
			<tr>
				<td class="label-form">วันที่เริ่ม Upload:</td>
				<td>
					<form:input cssClass="input" path="teacherUploadStartDate2Str" id="teacherUploadStartDate2" readonly="true" />
					<span class="require">*</span>
					<form:errors path="teacherUploadStartDate2Str" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันที่สิ้นสุด Upload:</td>
				<td>
					<form:input cssClass="input" path="teacherUploadEndDate2Str" id="teacherUploadEndDate2" readonly="true" />
					<span class="require">*</span>
					<form:errors path="teacherUploadEndDate2Str" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันที่เริ่มการประเมิน:</td>
				<td>
					<form:input cssClass="input" path="teacherEvaluateStartDate2Str" id="teacherEvaluateStartDate2" readonly="true" />
					<span class="require">*</span>
					<form:errors path="teacherEvaluateStartDate2Str" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันที่สิ้นสุดการประเมิน:</td>
				<td>
					<form:input cssClass="input" path="teacherEvaluateEndDate2Str" id="teacherEvaluateEndDate2" readonly="true" />
					<span class="require">*</span>
					<form:errors path="teacherEvaluateEndDate2Str" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			
			<tr>
				<td colspan="2" class="label-form">ประเมินพนักงาน ครั้งที่ 1</td>
			</tr>
			<tr>
				<td class="label-form">วันที่เริ่ม Upload:</td>
				<td>
					<form:input cssClass="input" path="staffUploadStartDateStr" id="staffUploadStartDate" readonly="true" />
					<span class="require">*</span>
					<form:errors path="staffUploadStartDateStr" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันที่สิ้นสุด Upload:</td>
				<td>
					<form:input cssClass="input" path="staffUploadEndDateStr" id="staffUploadEndDate" readonly="true" />
					<span class="require">*</span>
					<form:errors path="staffUploadEndDateStr" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันที่เริ่มการประเมิน:</td>
				<td>
					<form:input cssClass="input" path="staffEvaluateStartDateStr" id="staffEvaluateStartDate" readonly="true" />
					<span class="require">*</span>
					<form:errors path="staffEvaluateStartDateStr" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันที่สิ้นสุดการประเมิน:</td>
				<td>
					<form:input cssClass="input" path="staffEvaluateEndDateStr" id="staffEvaluateEndDate" readonly="true" />
					<span class="require">*</span>
					<form:errors path="staffEvaluateEndDateStr" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="left"><input
					value="<spring:message code="label.button.save"/>" class="btn btn-primary" type="submit" >
				<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init();"></td>
			</tr>
		</table>
	</div>
</div> 	
</form:form>	
 <script type="text/javascript">

	function init (){
		window.location = "<%=request.getContextPath()%>/admin/kpiSchedule/init.htm";
	}
	
 
	$(document).ready(function() {
		$('#teacherUploadStartDate1, #teacherUploadEndDate1, #teacherEvaluateStartDate1, #teacherEvaluateEndDate1,' +
		  '#teacherUploadStartDate2, #teacherUploadEndDate2, #teacherEvaluateStartDate2, #teacherEvaluateEndDate2,' +
		  '#staffUploadStartDate, #staffUploadEndDate, #staffEvaluateStartDate, #staffEvaluateEndDate').datepicker({
			showOn : 'both',
			buttonText : 'Choose a date',
			buttonImage : '<c:url value="/images/calendar.jpg"/>',
			buttonImageOnly : true,
			showButtonPanel : true
		});

		$('#teacherUploadStartDate1, #teacherUploadEndDate1, #teacherEvaluateStartDate1, #teacherEvaluateEndDate1,' +
		  '#teacherUploadStartDate2, #teacherUploadEndDate2, #teacherEvaluateStartDate2, #teacherEvaluateEndDate2,' +
		  '#staffUploadStartDate, #staffUploadEndDate, #staffEvaluateStartDate, #staffEvaluateEndDate')
		.datepicker($.datepicker.regional['th']);
	});
</script>