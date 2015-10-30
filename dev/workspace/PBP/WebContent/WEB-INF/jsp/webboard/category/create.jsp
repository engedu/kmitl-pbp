<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
 
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
 
<div class="content">  
<div class="mainContent"> 
<form:form modelAttribute="category"	action="create.htm" method="POST" name="mainForm"> 
	<div class="subTopicHeader">Webboard Category >> สร้าง</div> 	
	<div class="searchFormNoBorder">		
 
	
<table width="100%"> 
			<tr>	
				<td class="formLabel">
					Category Name:&nbsp;
				</td>
				<td class="formValue">
					&nbsp;<form:input cssClass="tb1" path="name"  maxlength="50"/> <span class ="require"  >*</span> <form:errors path="name" cssClass="require" />
				</td> 
			</tr>			
 			
			<tr>	
				<td class="formLabel">
					Description:&nbsp;
				</td>
				<td class="formValue">
					&nbsp;<form:input cssClass="tb1" path="desc"  maxlength="50"/> 
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
</div>
 <script type="text/javascript">

	function init (){
		 
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/webboard/category/init.htm";
		form.method='GET';	
		form.submit();	
	}
</script>
