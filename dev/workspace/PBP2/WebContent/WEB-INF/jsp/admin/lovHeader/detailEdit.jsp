<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
 
<form:form modelAttribute="lovHeader"	action="editDetail.htm" method="POST" name="mainForm">  
 <input type="hidden" value="${lovHeader.lovHeaderId} " id="lovId"/>
	<div class="post">
	<h2 class="title">ประเภทค่าคงที่ > Manage </h2>
		<div class="entry">
		<table width="100%">	
		 
		
			<tr>	
				<td class="formLabel">
					  Code:
				</td>
				<td class="formValue">
					${lovHeader.code} 
				</td> 
 	
				<td class="formLabel">
					  Name:
				</td>
				<td class="formValue">
					${lovHeader.name} 
				</td> 
				<td align="left">
		  
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
		
		 
		<div class="line">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>		

   	<h2 class="title">ประเภทค่าคงที่ </h2> 
 
	<table width="80%">
			<tr>	
				<td class="formLabel">
					  Code:&nbsp;
				</td>
				<td class="formValue">
					&nbsp;<form:input cssClass="tb1" path="detailCode"  maxlength="50"/> <span class ="require"  >*</span> <form:errors path="detailCode" cssClass="require" />
				</td> 
	 	
				<td class="formLabel">
					  Name:&nbsp;
				</td>
				<td class="formValue">
					&nbsp;<form:input cssClass="tb1" path="detailName"  maxlength="50"/> <span class ="require"  >*</span> <form:errors path="detailName" cssClass="require" />
				</td> 
  
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
		var id = document.getElementById("lovId").value;
		form.action ="<%=request.getContextPath()%>/admin/lovHeader/editDetail.htm?lovDetailId="+id;
		
		form.method='POST';	
		form.submit();	
	}

	function addNewLOV (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/lovHeader/addNewLOV.htm";
		form.method='POST';	
		form.submit();	
	}
</script>