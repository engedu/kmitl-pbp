<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
	
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
<div class="content100">  
<div class="mainContent100"> 
<form:form modelAttribute="menu"	action="edit.htm" method="POST" name="mainForm">  
 
	 
	<div class="subTopicHeader">Menu Edit</div> 		
	 
	
		<table width="100%">
			<tr>	
				<td class="formLabel">
					Menu Code:
				</td>
				<td class="formValue">
					<form:input cssClass="tb1" path="code" /><span class ="require"  >*</span>  <form:errors path="code" cssClass="require" />
				</td> 
			</tr>	
			<tr>	
				<td class="formLabel">
					Menu Name:
				</td>
				<td class="formValue">
					<form:input cssClass="tb1" path="name" /> <span class ="require"  >*</span> <form:errors path="name" cssClass="require" />
				</td> 
			</tr>			
			<tr>	
				<td class="formLabel">
					Menu URL:
				</td>
				<td class="formValue">
					<form:input cssClass="tb1" path="url" /><span class ="require"  >*</span>  <form:errors path="url" cssClass="require" />
				</td> 
			</tr>	
			<tr>	
				<td class="formLabel">
					Description :
				</td>
				<td class="formValue">
					<form:input cssClass="tb1" path="desc" />  
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
			</tr>						
			<tr>  <td colspan="2">&nbsp; </tr>								
			<tr> 
				<td> </td>
				<td align="left">
				<input class="btn_2" value="<spring:message code="label.button.save"/>"  type="submit" >
				<input class="btn_2" value="<spring:message code="label.button.back"/>"  type="button" onclick="init();">	
					    
			    </td>
		     </tr>			
		</table>
	</div>
</form:form>	
</div>
 
 <script type="text/javascript">

	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/menu/init.htm";
		form.method='GET';	
		form.submit();	
	}
</script>