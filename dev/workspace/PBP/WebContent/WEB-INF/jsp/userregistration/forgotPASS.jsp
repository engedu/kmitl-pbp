<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<c:if test="${not empty errorCode}"> <div class="errorMessage"> <spring:message code="${errorCode}"/> </div>  </c:if> 
<c:if test="${not empty successCode}"> <div class="successMessage"> <spring:message code="${successCode}"/> </div>  </c:if> 

<div class="content">  
<div class="mainContent"> 
<form:form modelAttribute="user"	action="forgotPASS.htm" method="POST" name="mainForm"> 
	 	
	<div class="searchForm">
	<div class="subTopicHeaderNoBorder">Forgot Password</div> 	
	<hr>
		<table width="100%">			
		<tr>	
			<td class="formLabel">
				Registered E-mail Address: 
			</td>
			<td class="formValue">
				<form:input cssClass="tb200"  path="email" /> <span class="requireField">*</span><form:errors path="email" cssClass="requirefied" />
			</td> 
		</tr>			
 
			<tr>  <td colspan="2">&nbsp; </tr>								
			<tr> 
				<td> </td>
				<td align="left">
 
				 <a href="#" onclick="submitForm()">	  
	 				<input class="btn_2" value="Submit"  type="button"  >
	 			</a>
			    </td>
		     </tr>			
		</table>
		
		<hr>
		
	</div>
	
	
		<table height="200px;">
	<tr><td>&nbsp;</td></tr>
	
	</table>
</form:form>	
</div>
</div>
 <script type="text/javascript">
 

	function submitForm (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/user/registration/forgotPASS.htm";
		form.method='POST';	
		form.submit();	
	}
 
</script>