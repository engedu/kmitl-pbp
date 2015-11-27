<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<form:form modelAttribute="role" action="create.htm" method="POST" name="mainForm">  
<div class="post">
	<h2 class="title">สิทธิ์ในการใช้งาน > สร้าง </h2>
	<div class="entry">
		<table width="100%">
			<tr>
				<td class="label-form">Role Name:</td>
				<td><form:input cssClass="input" path="roleName"
					maxlength="50" /> <span class="require">*</span> <form:errors
					path="roleName" cssClass="require" /></td>
			</tr>
			<tr>
				<td class="label-form">Role Description:</td>
				<td><form:input path="roleDesc"
					maxlength="100" cssClass="input"/> <span class="require">*</span> <form:errors
					path="roleDesc" cssClass="require" /></td>
			</tr>
			
			<!--  
			<tr>
				<td colspan="2"><div class="line">&nbsp;</div></td>
			</tr>
			<tr>
				<td class="label-form" style="vertical-align: middle;">Menu:</td>
				<td class="text"><form:checkboxes items="${role.menuList}"
					path="menus" itemValue="menuId" itemLabel="name" delimiter="<br/>" />
				</td>
			</tr>
			
			-->
			<tr>
				<td colspan="2">&nbsp;</td>
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
	function init() {
		var form = document.forms['mainForm'];
		form.action = "<%=request.getContextPath()%>/admin/role/init.htm";
		form.method='GET';	
		form.submit();	
	}
</script>