<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form modelAttribute="message"	action="edit.htm" method="POST" name="mainForm">   
 
		
<div class="post">
 
	<div class="entry"> 
	
		 <div class="pbptableWrapper">
            <div class="pbp-header"> ข้อความ > แก้ไข  </div>		
		
		<table width="100%">
	 
			<tr>
				<td class="label-form">ข้อความ:&nbsp;</td>
				<td>	   		 <div class="messageReply"> 
   		 
   		 	<form:textarea path="messageDetail" cssClass="tinymce" rows="10" cols="80" />
   		 	 <span class ="require"  >*</span> 
   		 	 <form:errors path="messageDetail" cssClass="require" />
   		 </div>	</td>
			</tr>
			<tr>
				<td colspan="2"><div class="line">&nbsp;</div></td>
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
</div>

</form:form>	
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/message/init.htm";
		form.method='GET';	
		form.submit();	
	}
</script>