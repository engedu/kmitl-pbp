<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form modelAttribute="kpiTemplate"	action="edit.htm" method="POST" name="mainForm">   
<div class="post">
	<h2 class="title">ตัวชี้วัด > แก้ไข </h2>
	<div class="entry">
		<table width="100%">
			<tr>
				<td class="label-form">Code:</td>
				<td><form:input cssClass="input" path="code"
					maxlength="50" /> <span class="require">*</span> <form:errors
					path="code" cssClass="require" /></td>
			</tr>
			<tr>
				<td class="label-form">Name:</td>
				<td><form:input path="name"
					maxlength="100" cssClass="input"/> <span class="require">*</span> <form:errors
					path="name" cssClass="require" /></td>
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