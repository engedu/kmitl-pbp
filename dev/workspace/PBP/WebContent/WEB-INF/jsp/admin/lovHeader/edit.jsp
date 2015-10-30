<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
 
<form:form modelAttribute="lovHeader"	action="edit.htm" method="POST" name="mainForm">  
 
	<div class="post">
	<h2 class="title">ประเภทค่าคงที่ > แก้ไข </h2>
		<div class="entry">
		<table width="100%">	 
			<tr>	
				<td class="formLabel">
					  Code:
				</td>
				<td class="formValue">
					<form:input cssClass="tb1" path="code" /><span class ="require"  >*</span>  <form:errors path="code" cssClass="require" />
				</td> 
 	
				<td class="formLabel">
					  Name:
				</td>
				<td class="formValue">
					<form:input cssClass="tb1" path="name" /> <span class ="require"  >*</span> <form:errors path="name" cssClass="require" />
				</td> 
				<td align="left">
				<input class="btn btn-primary" value="<spring:message code="label.button.save"/>"  type="submit" >
				<input class="btn btn-primary" value="<spring:message code="label.button.back"/>"  type="button" onclick="init();">	
					    
			    </td>
			</tr>			
 			
			 <tr>	
				<td class="formLabel">
					Status:
				</td>
				<td class="formValue">
				 <form:radiobutton  path="status"  id="status0"  value="0" />Enable
				<form:radiobutton path="status" id="status1" value="1"   />Disable
				</td> 
                <td colspan="3"> &nbsp;</td>

		     </tr>			
		</table>
		
		<hr>
	 
 


 
 
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

	function addNewLOV (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/lovHeader/addNewLOV.htm";
		form.method='POST';	
		form.submit();	
	}
</script>