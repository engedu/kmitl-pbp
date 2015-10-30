<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<form:form modelAttribute="holiday"	action="edit.htm" method="POST" name="mainForm">  
<div class="post">
	<h2 class="title">วันหยุดประจำปี > แก้ไข </h2>
	<div class="entry">
		<table width="100%">
			<tr>
				<td class="label-form">ปี:</td>
				<td>
					<form:select path="yearId" id="yearId" onchange="setTimeout(carlendarUtil.setCarlendarInput, 0)">
						<form:options items="${yearList}" itemValue="yearId" itemLabel="name" />
					</form:select>
					<form:errors path="yearId" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันที่:</td>
				<td><form:input cssClass="input" path="holidayDate"  readonly="true" /><span class ="require"  >*</span> <form:errors path="holidayDate" cssClass="require" /></td>
			</tr>
			<tr>
				<td class="label-form">ชื่อวันหยุด:</td>
				<td><form:input cssClass="input" path="holidayName" /><span class ="require"  >*</span> <form:errors path="holidayName" cssClass="require" /></td>
			</tr>
			<tr>
				<td class="label-form">รายละเอียด:</td>
				<td><form:input cssClass="input" path="holidayDesc" /></td>
			</tr>
			<tr>
				<td class="label-form"></td>
				<td class="text">
					<form:checkbox path="enable" value="false" /> เปิดใช้งาน
				</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td align="left">
					<span class='yearSelect'>
						<input value="<spring:message code="label.button.save"/>" class="btn btn-primary" id="saveBtn"  type="submit">
					</span>
					<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init();">

				</td>
			</tr>
		</table>
	</div>
</div>
</form:form>	
 
 <script type="text/javascript">
 	
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/holiday/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	$(document).ready( function() {
		carlendarUtil.setCarlendarInput();
	});
</script>