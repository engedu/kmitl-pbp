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
<form:form  modelAttribute="testcase" 	action="search.htm" method="POST" name="mainForm"> 
	<div class="subTopicHeader"><c:out value="${testcase.name}"/>  </div> 	
	<div class="searchFormNoBorder">	
	<div class="conclude"> 
       
    </div> 
		<div class="usecaseHeaderTxt">
		 <div class="usecase">
     
     <table width="100%">
       <thead>
       	  <tr>
       	  	<td>Name</td>
 			<td>Step</td>	
       	  	<td>Expected</td>	
       	  	<td>Result</td>	
       	  	<td>F/P</td>	
       	  </tr>
       </thead>
       
       <tbody>
       
       <c:forEach items = "${testcase.testcaseDetailList}" var="domain"> 
     	<tr>
     	 <td class="usecaseheader" >
		       <a href="#<c:out value='${domain.name}'/>">      
		      	 <span class="detailDesignLinkTxt"><c:out value="${domain.name}"/> </span>
		      </a>		   	 
     	 </td>
  		<td></td>
  		<td></td>
  		<td></td>
  		<td></td>  		  		 
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

 
	