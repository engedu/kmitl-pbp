detail<%@ page pageEncoding="UTF-8"%>
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
<form:form   modelAttribute="detailDesign" action="search.htm" method="POST" name="mainForm"> 
 	<div class="subTopicHeader"> Detail Design : <c:out value="${detailDesign.name}"/>  </div>    
          <div class="backtToTop"> </div>	    
		     <div class="usecase">
		      <a NAME="<c:out value='${detailDesign.code}'/>"> </a>
		      <table  >
		      	<tr>
		      		<td class="usecaseheaderNoBorder" colspan="2"><c:out value="${detailDesign.code}"/>:<c:out value="${detailDesign.name}"/> </td>
		      	  
      				<td width="10%">
      					 <sec:authorize ifAnyGranted="ROLE_PROJECT_SA "> 
		      			<span class="brEditTxt">
      					<a href="<%=request.getContextPath()%>/project/requirement/detailDesign/edit.htm?detailDesignId=<c:out value="${detailDesign.detailDesignId}"/>" >Edit </a>
      					</span>/<span class="brDeleteTxt">
      					<a href="<%=request.getContextPath()%>/project/requirement/detailDesign/delete.htm?detailDesignId=<c:out value="${detailDesign.detailDesignId}"/>&moduleId=<c:out value="${module.moduleId}"/>" onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${detailDesign.name}"/> ?')"> Delete</a>
      					</span>      					
      				</sec:authorize>
      				</td>
		      	</tr> 
		      	<tr>
		      		<td class="usecaseheader">Summary:</td>
		      		<td colspan="2">  
		      		  <c:set var="msg" value="${detailDesign.summary}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  	 
		      		</td>
		      	</tr>      	

		      	<tr>
		      		<td class="usecaseheader">Step:</td>
		      		<td colspan="2">
		      		
		      		 <c:set var="msg" value="${detailDesign.step}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  			      		
		      		</td>
		      	</tr>  
		      	
 		      	<tr>
		      		<td class="usecaseheader">Screen:</td>
		      		<td colspan="2"><a href="#">SC1</a> &nbsp; <a href="#">SC2</a></td>
		      	</tr>  
		      	<tr>
		      		<td class="usecaseheader">File:</td>
		      		<td colspan="2"><a href="#">Customer.xsd</a> &nbsp; </td>
		      	</tr>  		      	
		      	
			      	<tr>
		      		<td class="usecaseheader">Database:</td>
		      		<td colspan="2">
		      		
			      	 <c:set var="msg" value="${detailDesign.dataPart}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  	
		      		
		      		</td>
		      	</tr>     
			    <tr>
		      		<td class="usecaseheader">Reference:</td>
		      		<td colspan="2"> 
		      		
		      			 <c:set var="msg" value="${detailDesign.reference}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  	
		      		</td>
		      	</tr> 	 
			    <tr>
		      		<td class="usecaseheader">Use Case:</td>
		      		<td colspan="2">  
	 		      <a href="<%=request.getContextPath()%>/project/requirement/useCase/detail.htm?useCaseId=<c:out value="${detailDesign.usecase.usecaseId}"/>" >     
			      	 <c:out value="${detailDesign.usecase.code}"/>:<c:out value="${detailDesign.usecase.name}"/> 
			      </a>   	  
		      		</td>
		      	</tr>  
			    <tr>
		      		<td class="usecaseheader">Test Case:</td>
		      		<td colspan="2"> 		 
			       	    <c:forEach items = "${detailDesign.testCaseList}" var="domain2"> 			     	    	 
			     	    	 <a href="<%=request.getContextPath()%>/project/testing/detail.htm?testCaseId=<c:out value="${domain2.testcaseId}"/>">
			     	    		<span class="detailDesignLinkTxt"> <c:out value="${domain2.name}"/></span> 
			     	    	 </a>
			     	    	 <br>
			     	    </c:forEach>   	   
		      		</td>
		      	</tr> 		      	     		      	 	   
		      </table>   
		    </div>      
</form:form>
</div>
</div> 
<br> 
 <div class="leftHeaderTxt"> <div class="greenTitle">&nbsp;</div>Talk.. </div>  
<jsp:include page="/WEB-INF/jsp/webboard/topic/viewTopicInclude.jsp"></jsp:include>
