<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<form:form modelAttribute="holidayCriteria"	action="create.htm" method="POST" name="mainForm">  
<div class="post">
	<h2 class="title">วันหยุดประจำปี > สร้าง </h2>
	<div class="entry">
		<table width="100%">
			<tr>
				<td class="label-form">ปี:</td>
				<td>
					<form:select path="yearId" id="yearId" onchange="setTimeout(carlendarUtil.setCarlendarInput, 0)">
						<form:option value="" label="--- กรุณาเลือกปี ---" /> 
						<form:options items="${yearList}" itemValue="yearId" itemLabel="name" />
					</form:select>
					<span class ="require"  >*</span> <form:errors path="yearId" cssClass="require" />
				</td>
			</tr>
			<tr class='yearSelect'>
				<td></td>
				<td class="label-form">
					<form:hidden path="isDurationDate" id="isDurationDate" />
					<input type="checkbox" name="isDurationDateTemp" id="isDurationDateTemp"
						value="false" onclick="setTimeout(isDurationDateEvent, 0)" /> แบบเป็นระยะเวลา
				</td>
			</tr>
			
			<!--begin: singleDate -->
			<tr id='singleDate'>
				<td class="label-form">วันที่:</td>
				<td>
					<form:input cssClass="input" path="holidayDate" id="holidayDate" readonly="true" />
					<span class ="require"  >*</span>
					<form:errors path="holidayDate" cssClass="require" />
				</td>
			</tr>
			<!--end: singleDate -->
			
			<!--begin: durationDate -->
			<tr id='durationDate-begin'>	
				<td class="label-form">วันที่เริ่ม:	</td>
				<td>
					<form:input cssClass="input" path="minDate" id="startDate" onchange="setTimeout(carlendarUtil.startDateWasChange,0)"/> 
					<span class ="require"  >*</span><form:errors path="minDate" cssClass="require" />
				</td>
			</tr>
			<tr id='durationDate-end'>
				<td class="label-form">วันที่สิ้นสุด:</td>
				<td>
					<form:input cssClass="input" path="maxDate" id="endDate" onchange="setTimeout(carlendarUtil.endDateWasChange,0)"/>
					<span class ="require"  >*</span><form:errors path="maxDate" cssClass="require" />
				</td>
			</tr>
			<!--end: durationDate -->
			
			<tr class='yearSelect'>
				<td class="label-form">ชื่อวันหยุด:</td>
				<td>
					<form:input cssClass="input" path="holidayName" />
					<span class ="require"  >*</span> 
					<form:errors path="holidayName" cssClass="require" />
				</td>
			</tr>
			<tr class='yearSelect'>
				<td class="label-form">รายละเอียด:</td>
				<td><form:input cssClass="input" path="holidayDesc" /></td>
			</tr>
			<tr class='yearSelect'>
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
					<span class='yearSelect' >
						<input value="<spring:message code="label.button.save"/>" class="btn btn-primary" id="saveBtn" type="submit">
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
	
	var isDurationDateEvent = function(){
 		Utility.setChkboxDataBoolean('isDurationDate');
		carlendarUtil.toggleIsSingleDate();
	};
	
	
	$(document).ready( function() {
		if($('#isDurationDate').val()=='true'){
			carlendarUtil.isSingleDate = false;
			$('#isDurationDateTemp').attr('checked', 'checked');
			
			if($('#startDate').val().length>0){
				//logger.info("start: "+$('#startDate').val());
				
				setTimeout(carlendarUtil.startDateWasChange, 0);
			}else if($('#endDate').val().length>0){
				//logger.info("end: "+$('#endDate').val());
				setTimeout(carlendarUtil.endDateWasChange, 0);
			}
		}else{
			carlendarUtil.isSingleDate = true;
		}
		carlendarUtil.setCarlendarInput();
	});
</script>