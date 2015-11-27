<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %> 
<A NAME="top"></A>
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
<div class="content100">  
<div class="mainContent100"> 
<form:form     action="search.htm" method="POST" name="mainForm"> 
  
  <br>
	<div class="frameworkHeader">   <c:out value="${projectName}"/> Use Case List 
				<sec:authorize ifAnyGranted="ROLE_PROJECT_SA ">
			<a href="<%=request.getContextPath()%>/project/module/create.htm" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
			</a> 
		</sec:authorize>
	</div>  

	 <br>
	
	 
 
 
  
      <c:forEach items = "${useCaseList}" var="domain"> 
   
		<div class="uc_list"> 
		      <a href="<%=request.getContextPath()%>/project/requirement/useCase/detail.htm?useCaseId=<c:out value="${domain.usecaseId}"/>" >     
		      	<img src="<c:url value="/images/icon/UnitIcon.jpg"/>"/> <c:out value="${domain.code}"/>:<c:out value="${domain.name}"/> 
		      </a> 
		      </div>     	 
    
      </c:forEach>
 
 	</div>  	
 	
 
</form:form>
</div>
</div>

 
	