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
<form:form  modelAttribute="project" 	action="search.htm" method="POST" name="mainForm"> 
	<div class="subTopicHeader"><c:out value="${project.projectName}"/> :Development </div> 	
	<div class="searchFormNoBorder">	
	
	
	<div class="conclude"> 
 	 
 <table  >
  	<tr>
 	<td><div class="businessRuleHeaderTxt"> <img src="<c:url value="/images/icon_sub.gif"/>"/>&nbsp;
 		<a href="<%=request.getContextPath()%>/project/development/initSoftwareAndTool.htm">Source Code</a>
 	</div>
 	
 	<div class="usecaseHeaderTxt">
	  
	  <a href="<%=request.getContextPath()%>/updown/download.htm?filePath=sourcecode/res/Restaurant.war"/>      1. Restaurant.war</a>  
     <br>
     
     <a href="#">2. Restuarant.sql</a> 
      
      </div>
 	
 	  
 	</td>
 	</tr>
      
 	<tr>
 	<td>
 	     <br>
 	<div class="businessRuleHeaderTxt"> <img src="<c:url value="/images/icon_sub.gif"/>"/>&nbsp;
 		<a href="<%=request.getContextPath()%>/project/development/initSoftwareAndTool.htm">Software and Tool</a>
 	</div></td>
 	</tr>
 	
  	<tr>
 	<td>
 	     <br><div class="businessRuleHeaderTxt"> <img src="<c:url value="/images/icon_sub.gif"/>"/>&nbsp;
 		<a href="<%=request.getContextPath()%>/project/development/initDeployment.htm">Deployment</a>
 	</div></td>
 	</tr>	  
 </table>
 
  </div> 
  
  
		<div class="usecaseHeaderTxt">
		 <div class="usecase">
     
     <table width="100%">
       <thead>
       	  <tr>
       	  	<td>Detail Design</td>
       	  	<td>Status</td>
       	  	<td>SA</td>
       	  	<td>DEV</td>
       	  	<td>Tester</td>
       	  	<td>Detail</td>	
       	  </tr>
       </thead>
       
       <tbody>
       
       <c:forEach items = "${project.detailDesignList}" var="domain"> 
     	<tr>
     	 <td class="usecaseheader" >
		       <a href="#<c:out value='${domain.code}'/>">      
		      	 <span class="detailDesignLinkTxt"><c:out value="${domain.code}"/> </span>
		      </a>
		   	 
     	 </td>
     	   <td class="usecaseheader">
   	              		  พร้อมเทส
     	 </td>
     	   <td class="usecaseheader">
   	               Somsak Tuksiri
     	 </td>
     	   <td class="usecaseheader">
   	               MJ
     	 </td>
     	 <td class="usecaseheader">
   	               NM
     	 </td>
     	  <td class="usecaseheader">
   	              <a href="#"> <span class="detailDesignLinkTxt">Detail</span></a>
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
 
	