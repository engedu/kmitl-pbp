all<%@ page pageEncoding="UTF-8"%>
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
<form:form    action="search.htm" method="POST" name="mainForm"> 
  	<div class="subTopicHeader"> All Detail Design </div> 	 
  
	<div class="usecaseHeaderTxt">
  	<table width="100%">
		<tr>
			<td width="90%">
     <table width="100%">
      <c:forEach items = "${detailDesignList}" var="domain"> 
     	<tr>
     	 <td width="90%">
		       <div class="uc_headerTxt">  
		      <a href="<%=request.getContextPath()%>/project/requirement/detailDesign/detail.htm?detailDesignId=<c:out value="${domain.detailDesignId}"/>" >     
		      	 <c:out value="${domain.code}"/>:<c:out value="${domain.name}"/> 
		      </a> 
		      </div>     	 
     	 </td>
     	  
 
     	</tr>
      </c:forEach> 
      </table>
      </td>
      </tr>
      </table>
     
 	</div>      
 
</form:form>
</div>
</div>

 
	