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
<div class="subTopicHeaderNoBorder"> 
 <c:out value="${projectName}"/>   
 </div> 
  
 
<div class="customerServiceHeader"> 
<div class="customerServiceElement"> 
<img src="<c:url value="/images/icon_sub.gif"/>"/>&nbsp;
	 <a href="<%=request.getContextPath()%>/project/requirement/detailDesign/initAll.htm?moduleId=">All &nbsp;<span class="childCount"><c:out value="${totalCount}"/> </span></a>  
</div> 
 
     <c:forEach items = "${moduleList}" var="domain" > 
 	<div class="customerServiceElement">  
 	<img src="<c:url value="/images/icon_sub.gif"/>"/>&nbsp;
 	<a href="<%=request.getContextPath()%>/project/requirement/detailDesign/init.htm?moduleId=<c:out value="${domain.moduleId}"/>">
 	 <c:out value="${domain.name}"/> <span class="childCount"><c:out value="${domain.childCount}"/> </span>
 	</a> </div>
     
     </c:forEach>

 <br>
 <br>

<table height="100px;">

 	 <tr>
 	<td><div class="businessRuleHeaderTxt"> <img src="<c:url value="/images/icon_sub.gif"/>"/>&nbsp;
 		<a href="<%=request.getContextPath()%>/project/requirement/util/init.htm?type=D">Date Util</a>
 	</div></td>
 	</tr> 	
 	
  	 <tr>
 	<td><div class="businessRuleHeaderTxt"> <img src="<c:url value="/images/icon_sub.gif"/>"/>&nbsp;
 		<a href="<%=request.getContextPath()%>/project/requirement/util/init.htm?type=N">Number Util</a>
 	</div></td>
 	</tr> 
 	<tr>
 	<td><div class="businessRuleHeaderTxt"> <img src="<c:url value="/images/icon_sub.gif"/>"/>&nbsp;
 		<a href="<%=request.getContextPath()%>/project/requirement/message/init.htm?type=S">Success Message</a>
 	</div></td>
 	</tr>
 	 <tr>
 	<td><div class="businessRuleHeaderTxt"> <img src="<c:url value="/images/icon_sub.gif"/>"/>&nbsp;
 		<a href="<%=request.getContextPath()%>/project/requirement/message/init.htm?type=E">Error Message</a>
 	</div></td>
 	</tr> 
 </table> 
</div> 
</div>