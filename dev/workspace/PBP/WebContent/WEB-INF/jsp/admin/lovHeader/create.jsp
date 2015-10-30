<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<form:form modelAttribute="lovHeader"	action="create.htm" method="POST" name="mainForm">  
 
<div class="post">
	<h2 class="title">ประเภทค่าคงที่ >> สร้าง </h2>
	<div class="entry">	
	 
<table width="100%">
			<tr>	
				<td class="formLabel">
					  Code:&nbsp;
				</td>
				<td class="formValue">
					&nbsp;<form:input cssClass="tb1" path="code"  maxlength="50"/> <span class ="require"  >*</span> <form:errors path="code" cssClass="require" />
				</td> 
			</tr>
			<tr>	
				<td class="formLabel">
					  Name:&nbsp;
				</td>
				<td class="formValue">
					&nbsp;<form:input cssClass="tb1" path="name"  maxlength="50"/> <span class ="require"  >*</span> <form:errors path="name" cssClass="require" />
				</td> 
			</tr>			
 
 			<tr>	
				<td class="formLabel">
					Status:&nbsp;
				</td>
				<td class="formValue">&nbsp;
				 <form:radiobutton  path="status"  id="status0"  value="0" />Enable
				<form:radiobutton path="status" id="status1" value="1"   />Disable
				</td> 
			</tr>						
 	 
			<tr>  <td colspan="2">&nbsp; </tr>								
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
		form.action ="<%=request.getContextPath()%>/admin/lovHeader/init.htm";
		form.method='GET';	
		form.submit();	
	}
</script>
