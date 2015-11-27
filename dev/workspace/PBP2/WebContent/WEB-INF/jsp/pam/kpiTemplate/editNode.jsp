<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form modelAttribute="kpiTemplate"	action="editNode.htm" method="POST" name="mainForm">   
<div class="post">
	<h2 class="title">ตัวชี้วัด > แก้ไข KPI </h2>
	<div class="entry">
		<table width="100%">
		<!--  
			<tr>
				<td class="label-form">Code:</td>
				<td><form:input cssClass="input" path="code"
					maxlength="50" /> <span class="require">*</span> <form:errors
					path="code" cssClass="require" /></td>
			</tr>
			-->
			<tr>
				<td class="label-form">KPI Name:</td>
				<td><form:input path="name"
					maxlength="100" cssClass="input"/> <span class="require">*</span> <form:errors
					path="name" cssClass="require" /></td>
			</tr>
			
		
		  <tr>
				<td colspan="2">&nbsp;</td>
		</tr>
				<tr>
				<td class="label-form">การคิดคะแนน:</td>
				<td>
				 <form:radiobutton  path="markType"  id="markType0"  value="0" />คะแนน <br>
				 
				<form:radiobutton path="markType" id="markType1" value="1"   />คะแนน/หน่วย <br>
 					<form:radiobutton path="markType" id="markType1" value="2"   /> N/A <br>
					
					</td>
			</tr>
			<tr>
				<td class="label-form">คะแนน:</td>
				<td>
					<form:input path="mark" 	maxlength="100" cssClass="input" onkeypress="return numberOnly_onkeypress()"/>
					
					<form:errors path="mark" cssClass="require" />
				</td>
			</tr>			
			
		</tr>
				<tr>
				<td class="label-form">หน่วย:</td>
				<td> 
			 
							<form:select path="unitId"   >
  									<form:option value="" label="--- กรุณาเลือกหน่วย---" />  
									<form:options items="${unitList}" itemValue="unitId" itemLabel="name" />
							</form:select>
							<form:errors path="unitId" cssClass="require" /> 
				 
					
					</td>
			</tr>			
			
			
			
			<tr>
				<td></td>
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
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/kpiTemplate/init.htm";
		form.method='GET';	
		form.submit();	
	}
</script>