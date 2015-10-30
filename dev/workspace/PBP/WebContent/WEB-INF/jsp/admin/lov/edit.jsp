<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
 
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>

 <div class="content">  
<form:form modelAttribute="group"	action="edit.htm" method="POST" name="mainForm"> 
	<div class="searchForm">	
		<table  >
		<tr>	
			<td class="formLabel">
				Group Name: &nbsp;
			</td>
			<td>
				&nbsp;<form:input cssClass="tb1" path="groupName" /> <form:errors path="groupName" cssClass="require" />
			</td> 
		</tr>	

		<tr>	
			<td class="formLabel">
				Group Desc: &nbsp;
			</td>
			<td>
				&nbsp;<form:input cssClass="tb1" path="groupDesc" /> <form:errors path="groupDesc" cssClass="require" />
			</td> 
		</tr>	

		<tr>	
			<td class="formLabel">
				Authorize : &nbsp;
			</td>
			<td>
				&nbsp;<form:checkboxes items="${group.roleList}" path="authorizes"  itemValue="roleId" itemLabel="roleName"   /> 
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
		form.action ="<%=request.getContextPath()%>/admin/group/search.htm";
		form.method='GET';	
		form.submit();	
	}
</script>