<!--
	@Author : Teerawoot Charoenporn(Tor)
	@Create : Aug 13, 2012 5:32:27 PM
-->
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form modelAttribute="workline" action="create.htm" method="POST" name="mainForm">

<div class="post">
	<h2 class="title">สายการบังคับบัญชา > สร้าง</h2>
	<div class="entry">
			<div style="clear: both;">&nbsp;</div>
			<table width="100%">
<!-- 				<tr>	 -->
<!-- 					<td class="label-form"> -->
<!-- 						Code:&nbsp; -->
<!-- 					</td> -->
<!-- 					<td> -->
<%-- 					 	<form:input cssClass="input" path="worklineCode"  maxlength="50"/> <span class ="require"  >*</span> <form:errors path="worklineCode" cssClass="require" /> --%>
<!-- 					</td>  -->
<!-- 				</tr>	 -->
				<tr>	
					<td class="label-form">
						Name:&nbsp;
					</td>
					<td>
						 <form:input cssClass="input" path="worklineName" maxlength="100" /><span class ="require"  >*</span> <form:errors path="worklineName" cssClass="require" />
					</td> 
				</tr>												
				<tr> 
					<td> </td>
					<td align="left">
						<input class="btn btn-primary" value="<spring:message code="label.button.save"/>"  type="submit" >	
						<input class="btn btn-primary" value="<spring:message code="label.button.back"/>"  type="button" onclick="init();">	
				    </td>
			     </tr>			
			</table>
	</div>
</div>
</form:form>	
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/workline/init.htm";
		form.method='GET';	
		form.submit();	
	}
</script>