<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<form:form modelAttribute="year"	action="create.htm" method="POST" name="mainForm">  
<div class="post">
	<h2 class="title">ปีการศึกษา > สร้าง </h2>
	<div class="entry">
		<table width="100%">
			<tr>
				<td class="label-form">ปีการศึกษา (พ.ศ.):</td>
				<td>
					<form:input cssClass="input" path="name" maxlength="4" onkeypress="return isNumberKey(event)"/>
					<span class="require">*</span>
					<form:errors path="name" cssClass="require" />
				</td>
			</tr>
			
			<tr>
				<td class="label-form">วันที่เริ่ม:</td>
				<td>
					<form:input cssClass="input" path="startDateStr" id="startDate" readonly="true" />
					<span class="require">*</span>
					<form:errors path="startDateStr" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันที่สิ้นสุด:</td>
				<td>
					<form:input cssClass="input" path="endDateStr" id="endDate" readonly="true" />
					<span class="require">*</span>
					<form:errors path="endDateStr" cssClass="require" />
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
		window.location = "<%=request.getContextPath()%>/admin/year/init.htm";
	}
	
 
	$(document).ready(function() {
		$('#startDate,#endDate').datepicker({
			showOn : 'both',
			buttonText : 'Choose a date',
			buttonImage : '<c:url value="/images/calendar.jpg"/>',
			buttonImageOnly : true,
			showButtonPanel : true
		});

		$('#startDate,#endDate').datepicker($.datepicker.regional['th']);
	});
</script>