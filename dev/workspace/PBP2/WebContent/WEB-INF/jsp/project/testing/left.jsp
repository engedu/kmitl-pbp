<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.AuthenticationException"%>
<%@ page import="com.buckwa.domain.project.*" %>
<%@ page import="java.util.*" %> 
<%
  List<Module> moduleList = (List)session.getAttribute("moduleList"); 
%> 
<div class="wrapperleft">
<div class="leftHeaderTxt"> 
 <br>
&nbsp;&nbsp;&nbsp; &nbsp;<c:out value="${projectName}"/>  : Testing 
 </div> 
 
  <div class="customerServiceHeader">  
 	<div class="customerServiceElement">  
<img src="<c:url value="/images/icon_sub.gif"/>"/>&nbsp;
	 <a href="<%=request.getContextPath()%>/project/testing/initAll.htm">All &nbsp;<span class="childCount"><c:out value="${totalCount}"/> </span></a>   </div>  
</div>
  
<div class="customerServiceHeader"> 
     <c:forEach items = "${moduleList}" var="domain" > 
 	<div class="customerServiceElement">  
 	<img src="<c:url value="/images/icon_sub.gif"/>"/>&nbsp;
 	<a href="<%=request.getContextPath()%>/project/testing/init.htm?moduleId=<c:out value="${domain.moduleId}"/>">
 	 <c:out value="${domain.name}"/>   <span class="childCount"><c:out value="${domain.childCount}"/> </span>
 	 
 	</a> </div>     
     </c:forEach> 
 <br>
 <br> 
</div>
</div>
