<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<c:if test="${not empty errorCode}"> 
	<div class="errorMessage"> 
		<spring:message code="${errorCode}"/> 
	</div>  
</c:if> 
<c:if test="${not empty successCode}"> 
	<div class="successMessage">  Enable User Success</div>  
<div class="createForm">
	<br>
	<br>
	 <a href="<%=request.getContextPath()%>/preLogin.htm" >  <spring:message code="label.login"/> </a>           
</div>

</c:if> 

 
  

 
