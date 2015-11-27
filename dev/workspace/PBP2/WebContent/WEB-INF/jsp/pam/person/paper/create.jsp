<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
<div class="content100">
<div class="mainContent100">

<form:form modelAttribute="paper" action="create.htm" method="POST" name="mainForm">
<div class="searchFormNoBorder">
<div class="topicHeader">Paper/Create</div>

<table width="100%">
<tr>
	<td class="formLabel">ระดับการเผยแพร่/ประเภทการเผยแพร่:&nbsp;</td>
	<td class="formValue">
		<form:input cssClass="tb1" path="paperLevel" maxlength="50"/> <span class ="require">*</span> <form:errors path="paperLevel" cssClass="require" />
	</td>
</tr>
<tr>
	<td class="formLabel">ชื่อบทความวิชาการ:&nbsp;</td>
	<td class="formValue">
		<form:input cssClass="tb1" path="paperTitle" maxlength="100"/> <span class ="require">*</span> <form:errors path="paperTitle" cssClass="require" />
	</td>
</tr>
<tr>
	<td class="formLabel">สถานะตรวจสอบ:&nbsp;</td>
	<td class="formValue">
		<form:input cssClass="tb1" path="paperStatus" maxlength="100"/> <span class ="require">*</span> <form:errors path="paperStatus" cssClass="require" />
	</td>
</tr>
<tr>
	<td colspan="2">&nbsp; </td>
<tr>
	<td></td>
	<td align="left">
		<input class="btn_2" value="<spring:message code="label.button.save"/>"  type="submit" >
		<input class="btn_2" value="<spring:message code="label.button.back"/>"  type="button" onclick="init();">
	</td>
</tr>
</table>

<form:hidden path="personId"/>

</form:form>

</div>
</div>

<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm'];
		form.action ="<%=request.getContextPath()%>/pam/person/paper/init.htm";
		form.method='GET';
		form.submit();
	}
</script>