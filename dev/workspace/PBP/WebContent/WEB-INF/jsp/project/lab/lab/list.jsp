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
	<div class="subTopicHeader"> Lab Description <c:out value="${labCategory.name}"/> 
	
		<sec:authorize ifAnyGranted="ROLE_PROJECT_SA">
			<a href="<%=request.getContextPath()%>/lab/create.htm?labCategoryId=<c:out value="${labCategory.labCategoryId}"/>" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
			</a>  
		</sec:authorize>
		 
		</div> 	 
	 
	<div class="usecaseHeaderTxt">
     <c:forEach items = "${labCategory.labList}" var="domain"> 
     <table width="90%">
     	<tr>
     	 <td width="100%">
		       <div class="uc_headerTxt"> &nbsp;<img src="<c:url value="/images/icon_sub.gif"/>"/> 
		      <a href="<%=request.getContextPath()%>/lab/detail.htm?labId=<c:out value="${domain.labId}"/>" >     
		      	 <c:out value="${domain.code}"/>:<c:out value="${domain.name}"/> 
		      </a> 
		      </div>    	 
     	 </td>
     	</tr>
     </table>

     </c:forEach>
 	</div>
 	
 	<!-- 
      
       <c:forEach items = "${module.useCaseList}" var="domain"> 
		    <br>
          <div class="backtToTop"><a href="#top">Back To Top</a></div>	    
		     <div class="usecase">
		      <a NAME="<c:out value='${domain.code}'/>"> </a>
		      <table  > 
		      	<tr>
		      		<td class="usecaseheaderNoBorder" colspan="2"><c:out value="${domain.code}"/>:<c:out value="${domain.name}"/>  </td>
		      	  
      				<td width="10%">
      					 <sec:authorize ifAnyGranted="ROLE_PROJECT_SA "> 
		      			<span class="brEditTxt">
      					<a href="<%=request.getContextPath()%>/project/requirement/useCase/edit.htm?useCaseId=<c:out value="${domain.usecaseId}"/>" >Edit </a>
      					</span>/<span class="brDeleteTxt">
      					<a href="<%=request.getContextPath()%>/project/requirement/useCase/delete.htm?useCaseId=<c:out value="${domain.usecaseId}"/>&moduleId=<c:out value="${module.moduleId}"/>" onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.name}"/> ?')"> Delete</a>
      					</span>      					
      				</sec:authorize>
      				</td>
		      	</tr>		      	
 
		      	<tr>
		      		<td class="usecaseheader">Summary:</td>
		      		<td  colspan="2"> 
		      		  <c:set var="msg" value="${domain.summary}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  			      		
		      		</td>
		      	</tr>      	
		       	<tr>
		      		<td class="usecaseheader">Actor:</td>
		      		<td colspan="2">
		      		 
		      		  <c:set var="msg" value="${domain.actor}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  		      		
		      		
		      		</td>
		      	</tr>       	
		        	<tr>
		      		<td class="usecaseheader">Basic Flow:</td>
		      		 <td  colspan="2" >   
		      		  <c:set var="msg" value="${domain.basicFlow}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  
		      		 </td>
		      	</tr>      
		        	<tr>
		      		<td class="usecaseheader">Alternative Flows:</td>
		      		<td colspan="2">
		      		
		      		   <c:set var="msg" value="${domain.alternateFlow}" scope="page" />
   		 				<c:out value='${msg}' escapeXml="false" />  
		      	 
		      		
		      		</td>
		      	</tr> 
		      	
         	<tr>
      		<td class="usecaseheader">Reference:</td>
      		<td>  

      			</td>
      		</tr>        	
      	     			      	
         	<tr>
      		<td class="usecaseheader">Detail Design: 	
      			<a href="<%=request.getContextPath()%>/project/requirement/detailDesign/createByUseCase.htm?moduleId=<c:out value="${module.moduleId}"/>&usecaseId=<c:out value="${domain.usecaseId}"/>" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
				</a>  
			</td>
	      		<td>  	      		
		     	    <c:forEach items = "${domain.detailDesignList}" var="domain2"> 		     	    	 
				      <a href="<%=request.getContextPath()%>/project/requirement/detailDesign/detail.htm?detailDesignId=<c:out value="${domain2.detailDesignId}"/>" >     
				      	 <c:out value="${domain2.code}"/>:<c:out value="${domain2.name}"/> 
				      </a> 
		     	    	 <br>
		     	    </c:forEach>  	      		
	      		
	 				 
	      		</td>
      		</tr>   		      	
		      	     		      	 	   
		      </table>   
		    </div>         
    </c:forEach>  
    
     -->
</form:form>
</div>
</div>

 
	