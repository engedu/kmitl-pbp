list<%@ page pageEncoding="UTF-8"%>
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
<form:form   modelAttribute="module" action="search.htm" method="POST" name="mainForm"> 
	<div class="subTopicHeader">  Detail Design :<c:out value="${module.name}"/> 	
		<sec:authorize ifAnyGranted="ROLE_PROJECT_SA">
			<a href="<%=request.getContextPath()%>/project/requirement/detailDesign/create.htm?moduleId=<c:out value="${module.moduleId}"/>" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
			</a>  
		</sec:authorize>		 
		</div> 	 	 
	<div class="usecaseHeaderTxt">
     <c:forEach items = "${module.detailDesignList}" var="domain"> 
     <table width="90%">
     	<tr>
     	 <td width="100%">
		       <div class="uc_headerTxt"> 
		      <a href="<%=request.getContextPath()%>/project/requirement/detailDesign/detail.htm?detailDesignId=<c:out value="${domain.detailDesignId}"/>" >     
		      	 <c:out value="${domain.code}"/>:<c:out value="${domain.name}"/> 
		      </a> 
		      </div>    	 
     	 </td>
     	</tr>
     </table>
     </c:forEach>
 	</div>      
       <c:forEach items = "${module.detailDesignList}" var="domain"> 
		    <br>
          <div class="backtToTop"><a href="#top">Back To Top</a></div>	    
		     <div class="usecase">
		      <a NAME="<c:out value='${domain.code}'/>"> </a>
		      <table  >
		      	<tr>
		      		<td class="usecaseheaderNoBorder" colspan="2"><c:out value="${domain.code}"/>:<c:out value="${domain.name}"/> </td>		      	  
      				<td width="10%">
      					 <sec:authorize ifAnyGranted="ROLE_PROJECT_SA "> 
		      			<span class="brEditTxt">
      					<a href="<%=request.getContextPath()%>/project/requirement/detailDesign/edit.htm?detailDesignId=<c:out value="${domain.detailDesignId}"/>" >Edit </a>
      					</span>/<span class="brDeleteTxt">
      					<a href="<%=request.getContextPath()%>/project/requirement/detailDesign/delete.htm?detailDesignId=<c:out value="${domain.detailDesignId}"/>&moduleId=<c:out value="${module.moduleId}"/>" onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.name}"/> ?')"> Delete</a>
      					</span>      					
      				</sec:authorize>
      				</td>
		      	</tr>
		      	<tr>
		      		<td class="usecaseheader">Summary:</td>
		      		<td colspan="2">		      		
		      		  <c:set var="msg" value="${domain.summary}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  			      		
		      		</td>
		      	</tr>      	

		      	<tr>
		      		<td class="usecaseheader">Step:</td>
		      		<td colspan="2">
		      		
		      		 <c:set var="msg" value="${domain.step}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  			      		
		      		</td>
		      	</tr>  
 		      	<tr>
		      		<td class="usecaseheader">Screen:</td>
		      		<td colspan="2"><a href="#">SC1</a> &nbsp; <a href="#">SC2</a></td>
		      	</tr>  
 		      	<tr>
		      		<td class="usecaseheader">Sequence Diagram:</td>
		      		<td colspan="2"><a href="#">SD1</a> </td>
		      	</tr>  		      	
 		      	<tr>
		      		<td class="usecaseheader">Class Daiagram:</td>
		      		<td colspan="2"><a href="#">CD</a></td>
		      	</tr>  		      	
		      	<tr>
		      		<td class="usecaseheader">File:</td>
		      		<td colspan="2"><a href="#">Customer.xsd</a> &nbsp; </td>
		      	</tr>  		      	
		      	
		      	
			      	<tr>
		      		<td class="usecaseheader">Database:</td>
		      		<td colspan="2">
		      		
			      	 <c:set var="msg" value="${domain.dataPart}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  	
		      		
		      		</td>
		      	</tr>        	
			    <tr>
		      		<td class="usecaseheader">Reference:</td>
		      		<td colspan="2"> 
		      		</td>
		      	</tr> 	
			    <tr>
		      		<td class="usecaseheader">Use Case:</td>
		      		<td colspan="2"> 
		      		 
		      		</td>
		      	</tr> 			      	
			    <tr>
		      		<td class="usecaseheader">Test Case:
		      			<a href="<%=request.getContextPath()%>/project/testing/createByDetailDesign.htm?moduleId=<c:out value="${module.moduleId}"/>&detailDesignId=<c:out value="${domain.detailDesignId}"/>" >
						<img src="<c:url value="/images/plus.jpg"/>"/> 
						</a>  		      		
		      		</td>		 
		      		<td colspan="2"> 
		   
			<c:forEach items = "${domain.testCaseList}" var="domain2">      	    	 
     	    	 <a href="<%=request.getContextPath()%>/project/testing/detail.htm?testCaseId=<c:out value="${domain2.testcaseId}"/>">
     	    		<span class="detailDesignLinkTxt"> <c:out value="${domain2.name}"/></span> 
     	    	 </a>
     	    	 <br>
     	    </c:forEach>   
     	    
     	    
		      		</td>
		      	</tr> 			      		      	     		      	 	   
		      </table>   
		    </div>         
    </c:forEach>  
</form:form>
</div>
</div>

 
	