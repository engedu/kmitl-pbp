<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<c:if test="${not empty errorCode}"> <div class="errorMessage"> <spring:message code="${errorCode}"/> </div>  </c:if> 
<c:if test="${not empty successCode}"> <div class="successMessage"> <spring:message code="${successCode}"/> </div>  </c:if> 

<div class="content">  
<div class="mainContent"> 
<form:form modelAttribute="user"	action="edit.htm" method="POST" name="mainForm"> 
	 
	<div class="searchForm">	
	  <div class="topicHeader">Edit User Profile  </div> 	 
		<table width="100%">
		<tr>	
			<td class="formLabel">
				Login Name: 
			</td>
			<td class="formValue">
				<form:input  cssClass="tb200"  path="username" /><span class="requireField">*</span> <form:errors path="username" cssClass="requirefied" />
			</td> 
		</tr>				
 	
		
	<tr>
		<td colspan="2"> 
			<hr>
		</td>
	</tr>
			

			
		<tr>	
			<td class="formLabel">
				First Name: 
			</td>
			<td class="formValue">
				<form:input cssClass="tb200"  path="first_name" /> <form:errors path="first_name" cssClass="requirefied" />
			</td> 
		</tr>			


		<tr>	
			<td class="formLabel">
				Last Name:
			</td>
			<td class="formValue">
				<form:input cssClass="tb200"  path="last_name" /> <form:errors path="last_name" cssClass="requirefied" />
			</td> 
		</tr>
		
		<tr>	
			<td class="formLabel">
				 E-mail:
			</td>
			<td class="formValue">
				<form:input cssClass="tb200"  path="email" /> <span class="requireField">*</span> <form:errors path="email" cssClass="requirefied" />
			</td> 
		</tr>
		
		
		
			<tr>	
				<td class="formLabel">
					เลขที่:
				</td>
				<td class="formValue">
					<form:input cssClass="tb200" path="address.no" maxlength="300" />   
				</td> 
			</tr>	
			<tr>	
				<td class="formLabel">
					ซอย:
				</td>
				<td class="formValue">
					<form:input cssClass="tb200" path="address.soi" maxlength="300" />  
				</td> 
			</tr>	
			<tr>	
				<td class="formLabel">
					ถนน:
				</td>
				<td class="formValue">
					<form:input cssClass="tb200" path="address.road" maxlength="300" />  
				</td> 
			</tr>			
			<tr>	
				<td class="formLabel">
					ตำบล/แขวง :
				</td>
				<td class="formValue">
					<form:input cssClass="tb200" path="address.tumbon" maxlength="300" /> 
				</td> 
			</tr>	
			<tr>	
				<td class="formLabel">
					อำเภอ/เขต : 
				</td>
				<td class="formValue">
					<form:input cssClass="tb200" path="address.aumpur" maxlength="300" />  
				</td> 
			</tr>	
			<tr>	
				<td class="formLabel">
					จังหวัด :	
				</td>
				<td class="formValue">
					<form:input cssClass="tb200" path="address.province" maxlength="300" /> 
				</td> 
			</tr>							
 
 			<tr>	
				<td class="formLabel">
				รหัสไปรษณีย์ :  
				</td>
				<td class="formValue">
					<form:input cssClass="tb200" path="address.zipCode" maxlength="300" /> 
				</td> 
			</tr>	
 
			<tr>	
				<td class="formLabel">
					เบอร์โทร:
				</td>
				<td class="formValue">
					<form:input cssClass="tb1" path="address.telNo" maxlength="100" /> 
				</td> 
			</tr>	
			<tr>	
				<td class="formLabel">
					Fax No.:
				</td>
				<td class="formValue">
					<form:input cssClass="tb1" path="address.faxNo" maxlength="100" /> <form:errors path="address.faxNo" cssClass="require" />
				</td> 
			</tr>
		
			<tr>  <td colspan="2">&nbsp; </tr>								
			<tr> 
				<td> </td>
				<td align="left">
				<input class="btn_2" value="<spring:message code="label.button.back"/>"  type="button" onclick="init();">	
				<input class="btn_2" value="<spring:message code="label.button.save"/>"  type="submit" >	    
			    </td>
		     </tr>			
		</table>
	</div>
</form:form>	
</div>
</div>
 <script type="text/javascript">

	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/user/userProfile.htm";
		form.method='GET';	
		form.submit();	
	}
</script>