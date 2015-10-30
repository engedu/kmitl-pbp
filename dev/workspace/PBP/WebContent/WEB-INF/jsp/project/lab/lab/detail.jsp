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
<form:form   modelAttribute="lab" action="search.htm" method="POST" name="mainForm"> 
	<div class="subTopicHeader">Lab Detail : <c:out value="${lab.name}"/>  </div>   
          <div class="backtToTop"> </div>	    
		     <div class="usecase"> 
		      <table  > 
		      	<tr>
		      		<td class="usecaseheaderNoBorder" colspan="2"><c:out value="${lab.code}"/>:<c:out value="${lab.name}"/>  </td>
		      	  
      				<td width="10%">
      					 <sec:authorize ifAnyGranted="ROLE_PROJECT_SA "> 
		      			<span class="brEditTxt">
      					<a href="<%=request.getContextPath()%>/lab/edit.htm?useCaseId=<c:out value="${lab.labId}"/>" >Edit </a>
      					</span>/<span class="brDeleteTxt">
      					<a href="<%=request.getContextPath()%>/project/requirement/useCase/delete.htm?useCaseId=<c:out value="${lab.labId}"/>&moduleId=<c:out value="${module.moduleId}"/>" onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${lab.name}"/> ?')"> Delete</a>
      					</span>      					
      				</sec:authorize>
      				</td>
		      	</tr>		      	 
		      	<tr>
		      		<td class="usecaseheader">Summary:</td>
		      		<td  colspan="2"> 
		      		  <c:set var="msg" value="${lab.summary}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  			      		
		      		</td>
		      	</tr>      	
		       	<tr>
		      		<td class="usecaseheader">Actor:</td>
		      		<td colspan="2">
		      		 
		      		  <c:set var="msg" value="${lab.actor}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  		      		
		      		
		      		</td>
		      	</tr>       	
		        	<tr>
		      		<td class="usecaseheader">Basic Flow:</td>
		      		 <td  colspan="2" >   
		      		  <c:set var="msg" value="${lab.basicFlow}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  
		      		 </td>
		      	</tr>      
		        	<tr>
		      		<td class="usecaseheader">Alternative Flows:</td>
		      		<td colspan="2">
		      		
		      		   <c:set var="msg" value="${lab.alternateFlow}" scope="page" />
   		 				<c:out value='${msg}' escapeXml="false" />   
		      		</td>
		      	</tr>  
         	<tr>
      		<td class="usecaseheader">Reference:</td>
      		<td>    
					<c:set var="msg" value="${lab.reference}" scope="page" />
					<c:out value='${msg}' escapeXml="false" />  
      			</td>
      		</tr>        
         	<tr>  
          	<tr>
      		<td class="usecaseheader">เอกสารแนบ:</td>
      		<td>  
 			   
			     <c:forEach items = "${lab.filePathList}" var="domain2">   
			        <a href="<%=request.getContextPath()%>/updown/download.htm?filePath=<c:out value="${domain2.fullImagePath}"/>&type=android"><c:out value="${domain2.fileName}"/></a>
 			         <br>
 			       </c:forEach> 
			    
      		 </td>
      		</tr>    
 	      	
         	<tr>   
      		<td class="usecaseheader">Detail Design:</td>
      		<td>  
		      		
		     	    <c:forEach items = "${lab.detailDesignList}" var="domain2"> 		     	    	 
				      <a href="<%=request.getContextPath()%>/project/requirement/detailDesign/detail.htm?detailDesignId=<c:out value="${domain2.detailDesignId}"/>" >     
				      	 <c:out value="${domain2.code}"/>:<c:out value="${domain2.name}"/> 
				      </a> 
		     	    	
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