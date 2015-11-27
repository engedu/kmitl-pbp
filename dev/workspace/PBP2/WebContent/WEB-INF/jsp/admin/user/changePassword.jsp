<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
<div class="content">  
<div class="mainContent"> 
<form:form modelAttribute="user"	action="changePassword.htm" method="POST" name="mainForm"> 
	 
	<div class="searchForm">	
	 <div class="topicHeader">Change Password  </div> 	 
    <table width="100%">		 
		<tr>	 			
			<td class="formLabel"> Login Name: </td><td class="formValue">  ${user.username}</td>			
		</tr>			
		<tr> 
			<td class="formLabel">Current Password:</td>
			<spring:bind path="currentPassword">
			<td class="formValue">			
				<input type="password" name="currentPassword" size="20" maxlength="40"	value="${status.value}" class="tb1" />	
				<span class="requireField">*</span>		
				<c:if test="${status.error}">
					<span class="require"><c:out value="${status.errorMessage}" /></span>
				</c:if>
			</td>
			</spring:bind>
		</tr>

		<tr> 
			<td class="formLabel">New Password:</td>
			<spring:bind path="newPassword">
			<td class="formValue">			
				<input type="password" name="newPassword" size="20" maxlength="40"	value="${status.value}"  class="tb1"/>		
				<span class="requireField">*</span>	
				<c:if test="${status.error}">
					<span class="require"><c:out value="${status.errorMessage}" /></span>
				</c:if>
			</td>
			</spring:bind>
		</tr>	
		<tr> 
			<td class="formLabel"> Re-enter New Password:</td>
			<spring:bind path="passwordConfirmation">
			<td class="formValue">			
				<input type="password" name="passwordConfirmation" size="20" maxlength="40"	value="${status.value}"  class="tb1"/>		
				<span class="requireField">*</span>	
				<c:if test="${status.error}">
					<span class="require"><c:out value="${status.errorMessage}" /></span>
				</c:if>
			</td>
			</spring:bind>
		</tr>
  
			<tr>  <td colspan="2">&nbsp; </tr>								
			<tr> 
				<td> </td>
				<td align="left">
				<input class="btn_2" value="<spring:message code="label.button.save"/>"  type="submit" >	   
				<input class="btn_2" value="ข้อมูลผู้ใช้"  type="button" onclick="init();">	
				 
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