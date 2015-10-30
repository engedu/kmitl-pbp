<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form modelAttribute="group"	action="edit.htm" method="POST" name="mainForm"> 
<div class="post">
	<h2 class="title">กลุ่มผู้ใช้งาน > แก้ไข </h2>
		<div class="entry">
		<table width="100%">
			<tr>
				<td class="label-form">Group Name:&nbsp;</td>
				<td><form:input cssClass="input" path="groupName" />
				<span class="require">*</span><form:errors path="groupName" cssClass="require" /></td>
			</tr>
			<tr>
				<td class="label-form">Group Description:&nbsp;</td>
				<td><form:input cssClass="input" path="groupDesc" /></td>
			</tr>
			<tr>
				<td colspan="2"><div class="line">&nbsp;</div></td>
			</tr>
			<tr>
				<td class="label-form">Authorize:</td>
				<td class="text"> 
					<form:checkboxes items="${group.roleList}" path="authorizes"  itemValue="roleId" itemLabel="roleName"  delimiter="<br/>"/> 
				</td>
			</tr>
	
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td align="left"><input class="btn btn-primary"
					value="<spring:message code="label.button.save"/>" type="submit" >
				<input class="btn btn-primary"
					value="<spring:message code="label.button.back"/>" type="button"
					onclick="init();"></td>
			</tr>
		</table>
	</div>
</div>
</form:form>	
 
 <script type="text/javascript">

	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/group/init.htm";
		form.method='GET';	
		form.submit();	
	}
</script>