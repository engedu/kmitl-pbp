<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>

<div class="content">  
<div class="mainContent"> 
<form:form modelAttribute="team"	action="edit.htm" method="POST" name="mainForm">  
	<div class="subTopicHeader">Project User Mapping  :<c:out value="${team.projectName}"/></div>	 
	<br> 	 
	<div class="usecaseHeaderTxt"> 
    <div class="usecase">
	 
	<table width="100%">
		<tr>	
			<td class="formLabel">
				User Name: &nbsp;
			</td>
			<td class="formValue">			 
			 <c:out value="${team.username}"/>
				 
			</td> 
		</tr>				
 					
		<tr>	
			<td class="formLabel">
				User Group :
			<td class="formValue">
				 <form:checkboxes items="${team.groupList}" path="groups"  itemValue="groupId" itemLabel="groupName"   delimiter="<br/>"  /> 
				  
				 
			</td> 
		</tr>			
 							
			<tr> 
				<td> </td>
				<td align="left">
				<input class="btn_2" value="<spring:message code="label.button.save"/>"  type="submit" >	  
				
					<a href="<%=request.getContextPath()%>/project/pm/team/init.htm?projectName=<c:out value="${team.projectName}"/>&projectId=<c:out value="${team.projectId}"/>">
					<input class="btn_2" value="<spring:message code="label.button.back"/>"  type="button"  >	
					</a>	  
				 
				
			    </td>
		     </tr>			
		</table>
		</div>
	 </div>	
	 
</form:form>	
</div>
</div>
 <script type="text/javascript">

	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/project/pm/team/init.htm";
		form.method='GET';	
		form.submit();	
	}
</script>