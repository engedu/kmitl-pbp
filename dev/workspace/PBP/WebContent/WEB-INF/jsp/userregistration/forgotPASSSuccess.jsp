<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
  
<c:if test="${not empty errorCode}"> <div class="errorMessage"> <spring:message code="${errorCode}"/> </div>  </c:if> 
<c:if test="${not empty successCode}"> <div class="topicHeader"> <spring:message code="${successCode}"/> </div>  </c:if> 

<div class="content">  
<div class="mainContent"> 
<form:form modelAttribute="user"	action="forgotPASS.htm" method="POST" name="mainForm"> 	
	<div class="searchForm">
	<div class="subTopicHeader"></div> 	
	<hr> 
		<hr> 
	</div>
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