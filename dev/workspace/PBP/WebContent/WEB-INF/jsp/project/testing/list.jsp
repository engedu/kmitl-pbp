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
<div class="content">  
<div class="mainContent"> 
<form:form   	action="search.htm" method="POST" name="mainForm"> 
	<div class="subTopicHeader"><c:out value="${projectName}"/> :Testing </div> 	
	<div class="searchFormNoBorder">
	<div class="usecaseHeaderTxt">
	<div class="usecase">     
     <table width="100%">
       <thead>
       	  <tr>
       	  	<td>Detail Design</td>
 
       	  	<td>Test Case</td>	
       	  </tr>
       </thead>
       <tbody>       
       <c:forEach items = "${testWrapperList}" var="domain"> 
     	<tr>
     	 <td class="usecaseheader" >
		       <a href="#<c:out value='${domain.detailDesign.name}'/>">      
		      	 <span class="detailDesignLinkTxt"><c:out value="${domain.detailDesign.name}"/> </span>
		      </a>		   	 
     	 </td>  
     	  <td class="usecaseheader">
     	    <c:forEach items = "${domain.testCaseList}" var="domain2"> 
     	    	 
     	    	 <a href="<%=request.getContextPath()%>/project/testing/detail.htm?testCaseId=<c:out value="${domain2.testcaseId}"/>">
     	    		<span class="detailDesignLinkTxt"> <c:out value="${domain2.name}"/></span> 
     	    	 </a>
     	    	 <br>
     	    </c:forEach>   	             
     	 </td>
     	</tr>    
     	</c:forEach>   
       </tbody>
     </table>   
     </div>
 	</div>  	
</div>
</form:form>
</div>
</div>