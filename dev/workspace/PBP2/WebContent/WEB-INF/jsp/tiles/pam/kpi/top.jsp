<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
<div class="post">
	<h2 class="title">กลุ่มการประเมิน</h2>
	<div class="entry"> 
 

 <table width="90%">
 	<tr>
 	
 		<td width="20%">&nbsp;</td>
 		
		<c:forEach items="${kpiCategoryList}" var="domain">
 			<td>
 			
 			<a href="<%=request.getContextPath()%>/admin/kpiTemplate/getTemplateByGroupId.htm?groupId=<c:out  value="${domain.kpiCategoryId}"/>">
 			
 			<c:out value="${domain.name}"/></a></td>
		</c:forEach>
 
 		<td width="20%">&nbsp;</td>
 		<td>
          
          
 		
 		 <input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="initAdmin();">
 		 
 		 </td>
 		</td>
 	</tr>
 </table>

 
 </div>
 
 
  <script type="text/javascript">
	function initAdmin (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/role/init.htm";
		form.method='GET';	
		form.submit();	
	}

</script>