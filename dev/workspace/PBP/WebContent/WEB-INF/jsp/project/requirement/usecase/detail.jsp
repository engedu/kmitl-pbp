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
<form:form   modelAttribute="usecase" action="search.htm" method="POST" name="mainForm"> 
<br>
	<div class="frameworkHeader"> <strong>Use Case Detail : <c:out value="${usecase.name}"/></strong> 	 
	&nbsp; <span class="messageDetailDate"><c:out value="${usecase.updateDateTimeStr}"/></span>
	</div>   
 <br>    
		     <div class="usecase"> 
		      <table  > 
		      	<tr>
		      		<td class="usecaseheaderNoBorder" colspan="2" ><c:out value="${usecase.code}"/>:<c:out value="${usecase.name}"/>  </td>
		      	  
      				<td width="20%">
      					 <sec:authorize ifAnyGranted="ROLE_PROJECT_SA "> 
		      			<span class="brEditTxt">
      					<a href="<%=request.getContextPath()%>/project/requirement/useCase/edit.htm?useCaseId=<c:out value="${usecase.usecaseId}"/>" >Edit </a>
      					</span>/<span class="brDeleteTxt">
      					<a href="<%=request.getContextPath()%>/project/requirement/useCase/delete.htm?useCaseId=<c:out value="${usecase.usecaseId}"/>&moduleId=<c:out value="${module.moduleId}"/>" onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${usecase.name}"/> ?')"> Delete</a>
      					</span>      					
      				</sec:authorize>
      				</td>
		      	</tr>		      	 
		      	<tr>
		      		<td class="usecaseheader">Summary:</td>
		      		<td  colspan="2"> 
		      		  <c:set var="msg" value="${usecase.summary}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  			      		
		      		</td>
		      	</tr>      	
		       	<tr>
		      		<td class="usecaseheader">Actor:</td>
		      		<td colspan="2">
		      		 
		      		  <c:set var="msg" value="${usecase.actor}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  		      		
		      		
		      		</td>
		      	</tr>       	
		        	<tr>
		      		<td class="usecaseheader">Basic Flow:</td>
		      		 <td  colspan="2" >   
		      		  <c:set var="msg" value="${usecase.basicFlow}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  
		      		 </td>
		      	</tr>      
		        	<tr>
		      		<td class="usecaseheader">Alternative Flows:</td>
		      		<td colspan="2">
		      		
		      		   <c:set var="msg" value="${usecase.alternateFlow}" scope="page" />
   		 				<c:out value='${msg}' escapeXml="false" />   
		      		</td>
		      	</tr>  
         	<tr>
      		<td class="usecaseheader">Reference:</td>
      		<td colspan="2">  
					<c:set var="msg" value="${usecase.reference}" scope="page" />
					<c:out value='${msg}' escapeXml="false" />  
      			</td>
      		</tr>        
         	 
          	<tr>
      		<td class="usecaseheader">เอกสารแนบ:</td>
      		<td colspan="2">
 			   
			     <c:forEach items = "${usecase.filePathList}" var="domain2">   
			        <a href="<%=request.getContextPath()%>/updown/download.htm?filePath=<c:out value="${domain2.fullImagePath}"/>&type=android"><c:out value="${domain2.fileName}"/></a>
 			         <br>
 			       </c:forEach> 
			    
      		 </td>
      		</tr>    
 	      	
         	<tr>   
      		<td class="usecaseheader">Detail Design:
				<sec:authorize ifAnyGranted="ROLE_PROJECT_SA">
					<a href="<%=request.getContextPath()%>/project/requirement/detailDesign/createByUseCase.htm?moduleId=<c:out value="${module.moduleId}"/>&usecaseId=<c:out value="${usecase.usecaseId}"/>" >
						<img src="<c:url value="/images/plus.jpg"/>"/> 
					</a>  
				</sec:authorize>
      		</td>
      		<td colspan="2">
		      		
		     	    <c:forEach items = "${usecase.detailDesignList}" var="domain2"> 		     	    	 
				      <a href="<%=request.getContextPath()%>/project/requirement/detailDesign/detail.htm?detailDesignId=<c:out value="${domain2.detailDesignId}"/>" >     
				      	 <c:out value="${domain2.code}"/>:<c:out value="${domain2.name}"/> 
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