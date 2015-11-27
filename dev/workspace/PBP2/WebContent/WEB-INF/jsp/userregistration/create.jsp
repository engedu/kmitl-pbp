<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>

<div class="content">  
<div class="mainContent"> 
<form:form modelAttribute="user"	action="register.htm" method="POST" name="mainForm"> 
	<div class="topicHeader">User Registration</div> 	
	<div class="searchForm">
	<div class="subTopicHeaderNoBorder">User Profile</div> 	
 
		<table width="100%">		
		
		<tr>	
			<td class="formLabel">
				E-mail:
			</td>
			<td class="formValue">
				<form:input  cssClass="tb200"  path="username" /><span class="requireField">*</span> <form:errors path="username" cssClass="requirefied" />
				<span class="hintTxt">ใช้ในการ login เข้าระบบ</span> 
			</td> 
		</tr>
		
					
		<tr>	
			<td class="formLabel">
				First Name: 
			</td>
			<td class="formValue">
				<form:input cssClass="tb200"  path="first_name" /> <span class="requireField">*</span><form:errors path="first_name" cssClass="requirefied" />
			</td> 
		</tr>			


		<tr>	
			<td class="formLabel">
				Last Name:
			</td>
			<td class="formValue">
				<form:input cssClass="tb200"  path="last_name" /> <span class="requireField">*</span><form:errors path="last_name" cssClass="requirefied" />
			</td> 
		</tr>
 			
				
			

		<tr> 
			<td class="formLabel">Password:</td>
 			<td class="formValue">
				<form:password path="password"   cssClass="tb200"/>	<span class="requireField">*</span> <form:errors path="password" cssClass="requirefied" />		
				
			</td>
			 
		</tr>
	
		<tr> 
			<td class="formLabel"> Re-enter password:</td> 
 			<td class="formValue">
				<form:password path="passwordConfirmation"   cssClass="tb200"/>	<span class="requireField">*</span> <form:errors path="passwordConfirmation" cssClass="requirefied" />		
				
			</td>			
			
		</tr>		
		
	<tr>
		<td colspan="2"> 
			<hr>
		</td>
	</tr>
			


		
<!-- 
		
		
			<tr>	
				<td class="formLabel">
					เลขที่:
				</td>
				<td class="formValue">
					<form:input cssClass="tb200" path="address.no" maxlength="300" />   <span class ="require"  >*</span><form:errors path="address.no" cssClass="require" />
				</td> 
			</tr>	
			<tr>	
				<td class="formLabel">
					ซอย:
				</td>
				<td class="formValue">
					<form:input cssClass="tb200" path="address.soi" maxlength="300" /> <span class ="require"  >*</span><form:errors path="address.soi" cssClass="require" />
				</td> 
			</tr>	
			<tr>	
				<td class="formLabel">
					ถนน:
				</td>
				<td class="formValue">
					<form:input cssClass="tb200" path="address.road" maxlength="300" /> <span class ="require"  >*</span><form:errors path="address.road" cssClass="require" />
				</td> 
			</tr>			
			<tr>	
				<td class="formLabel">
					ตำบล/แขวง :
				</td>
				<td class="formValue">
					<form:input cssClass="tb200" path="address.tumbon" maxlength="300" /><span class ="require"  >*</span><form:errors path="address.tumbon" cssClass="require" />
				</td> 
			</tr>	
			<tr>	
				<td class="formLabel">
					อำเภอ/เขต : 
				</td>
				<td class="formValue">
					<form:input cssClass="tb200" path="address.aumpur" maxlength="300" /> <span class ="require"  >*</span><form:errors path="address.aumpur" cssClass="require" />
				</td> 
			</tr>	
			<tr>	
				<td class="formLabel">
					จังหวัด :	
				</td>
				<td class="formValue">
					<form:input cssClass="tb200" path="address.province" maxlength="300" /><span class ="require"  >*</span> <form:errors path="address.province" cssClass="require" />
				</td> 
			</tr>							
 
 			<tr>	
				<td class="formLabel">
				รหัสไปรษณีย์ :  
				</td>
				<td class="formValue">
					<form:input cssClass="tb200" path="address.zipCode" maxlength="300" /><span class ="require"  >*</span> <form:errors path="address.zipCode" cssClass="require" />
				</td> 
			</tr>	
 
			<tr>	
				<td class="formLabel">
					เบอร์โทร:
				</td>
				<td class="formValue">
					<form:input cssClass="tb1" path="address.telNo" maxlength="100" /><span class ="require"  >*</span> <form:errors path="address.telNo" cssClass="require" />
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
		
 -->		
		
			<tr>  <td colspan="2">&nbsp; </tr>								
			<tr> 
				<td> </td>
				<td align="left">
				<!-- 
				<input class="btn_2" value="<spring:message code="label.button.back"/>"  type="button" onclick="init();">	
				<input class="btn_2" value="<spring:message code="label.button.save"/>"  type="submit" >	&nbsp;&nbsp;&nbsp;
				 -->
				 <a href="#" onclick="submitForm()">	  
	 				<input class="btn_2" value="Submit"  type="button"  >
	 			</a>
			    </td>
		     </tr>			
		</table>
		
		<hr>
		
	</div>
</form:form>	
</div>
</div>
 <script type="text/javascript">

	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/user/search.htm";
		form.method='GET';	
		form.submit();	
	}

	function submitForm (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/userregistration/register.htm";
		form.method='POST';	
		form.submit();	
	}
 
</script>