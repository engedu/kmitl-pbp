<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
<div class="content100">  
<div class="mainContent100"> 
<form:form modelAttribute="province"	action="create.htm" method="POST" name="mainForm">  
 	
	 	<div class="searchFormNoBorder">
	 <div class="topicHeader">Province/Create</div> 
		<table width="100%">
			<tr>	
				<td class="formLabel">
					Code:&nbsp;
				</td>
				<td class="formValue">
				 	<form:input cssClass="tb1" path="code"  maxlength="50"/> <span class ="require"  >*</span> <form:errors path="code" cssClass="require" />
				</td> 
			</tr>	
			<tr>	
				<td class="formLabel">
					Name:&nbsp;
				</td>
				<td class="formValue">
					 <form:input cssClass="tb1" path="name" maxlength="100" /><span class ="require"  >*</span> <form:errors path="name" cssClass="require" />
				</td> 
			</tr>						
 
			<tr>  <td colspan="3">&nbsp; </tr>								
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
		form.action ="<%=request.getContextPath()%>/admin/address/province/init.htm";
		form.method='GET';	
		form.submit();	
	}
</script>