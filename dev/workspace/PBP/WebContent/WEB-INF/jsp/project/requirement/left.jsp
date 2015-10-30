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
  String  projectName = (String)session.getAttribute("projectName"); 
%>
<div class="wrapperleft">
<div class="leftHeaderTxt"> 
<div class="highlight">
<p>
  <c:out value="${projectName}"/> Module
		<sec:authorize ifAnyGranted="ROLE_PROJECT_SA "> 
			 <a class="btn_2_small" href="<%=request.getContextPath()%>/project/module/create.htm" >
			  + New
			 </a>
		</sec:authorize>
</p>
</div>
 </div>
 

 
 
 <div class="download-block"> 
 
  <div class="customerServiceHeader">  
 	<div class="customerServiceElement">   
	 <a href="<%=request.getContextPath()%>/project/requirement/useCase/initAll.htm?moduleId=">All &nbsp;<span class="childCount"> ( <c:out value="${totalCount}"/> )</span></a>   </div>  
</div>
 
 
  <c:forEach items = "${moduleList}" var="domain" > 
 
	 <div class="download-infos">
				
	 <a href="<%=request.getContextPath()%>/project/requirement/useCase/init.htm?moduleId=<c:out value="${domain.moduleId}"/>">
 	 <span class="childCount"><c:out value="${domain.name}"/> &nbsp;  ( <c:out value="${domain.childCount}"/> ) </span>
 	</a>
				 
				</div>
				<div class="clear"></div>
		<br>		
	</c:forEach>			
 </div> 
 
 
 
 
 
</div>
 
 
<div class="highlight">        
	<div class="businessRuleHeaderTxt">&nbsp; &nbsp;<img src="<c:url value="/images/icon_sub.gif"/>"/> 
 		<a href="<%=request.getContextPath()%>/project/requirement/actor/init.htm">Actor</a>
 	</div> 	
 	<div class="businessRuleHeaderTxt">&nbsp;&nbsp; <img src="<c:url value="/images/icon_sub.gif"/>"/> 
 		<a href="<%=request.getContextPath()%>/project/requirement/businessRule/init.htm">Business Rule</a>
 	</div> 	
 	 <div class="businessRuleHeaderTxt">&nbsp;&nbsp; <img src="<c:url value="/images/icon_sub.gif"/>"/> 
 		<a href="<%=request.getContextPath()%>/project/requirement/businessRule/init.htm">Screen</a>
 	</div> 	
  	 <div class="businessRuleHeaderTxt">&nbsp;&nbsp; <img src="<c:url value="/images/icon_sub.gif"/>"/> 
 		<a href="<%=request.getContextPath()%>/project/requirement/businessRule/init.htm">ER-Diagram</a>
 	</div>
 	
 	<br> 		
 	 
  </div>
  
  </div>
  
 
 
 