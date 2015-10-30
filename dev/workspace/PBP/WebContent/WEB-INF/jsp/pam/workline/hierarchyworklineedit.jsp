<!--
	@Author : Teerawoot Charoenporn(Tor)
	@Create : Aug 23, 2012 22:54:21 PM
-->
<%@ page import="org.springframework.web.util.UriUtils"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form modelAttribute="worklineMapping"	action="editworklinehierarchy.htm" method="POST" name="mainForm">  
 <div class="post">
	<h2 class="title">ข้อมูลสายงานบุคลากร > แก้ไข </h2>
		<div class="entry">
		<table width="100%">
			<tr>
				<td class="label-form">สายบังคับบัญชาปัจจุบัน:</td>
				<td class="text">
					<form:hidden path="parentCode"/>
					<%=UriUtils.decode(request.getParameter("worklineName"), "UTF-8") %>&nbsp;
				</td>
			</tr>
			<tr>
				<td class="label-form">ตำแหน่งสายงาน:</td>
				<td class="text">
					<form:select path="worklineCode">
						<form:option value="" label="-- โปรดเลือก --" />
    					<form:options items="${worklineList}" itemValue="worklineCode" itemLabel="worklineName" />
					</form:select> 
					<form:errors path="worklineCode" cssClass="require" /> 
				</td>
			</tr>
	
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td align="left">
					<input class="btn btn-primary" value="<spring:message code="label.button.save"/>" type="submit" >
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
		form.action ="<%=request.getContextPath()%>/admin/workline/hierarchy.htm";
		form.method='GET';	
		form.submit();	
	}
</script>