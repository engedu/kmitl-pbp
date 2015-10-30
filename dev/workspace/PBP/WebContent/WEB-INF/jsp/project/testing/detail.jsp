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
<form:form   modelAttribute="testCase" action="search.htm" method="POST" name="mainForm"> 
	<div class="subTopicHeader"> Test Case : <c:out value="${testcase.name}"/>  </div>   
          <div class="backtToTop"> </div>	    
		     <div class="testcase"> 
		      <table  > 
		      	<tr>
		      		<td class="testcaseheaderNoBorder" colspan="2"><c:out value="${testCase.code}"/>:<c:out value="${testCase.name}"/>  </td>
		      	  
      				<td width="10%">
      					 <sec:authorize ifAnyGranted="ROLE_PROJECT_SA "> 
		      			<span class="brEditTxt">
      					<a href="<%=request.getContextPath()%>/project/requirement/useCase/edit.htm?useCaseId=<c:out value="${testCase.testcaseId}"/>" >Edit </a>
      					</span>/<span class="brDeleteTxt">
      					<a href="<%=request.getContextPath()%>/project/requirement/useCase/delete.htm?useCaseId=<c:out value="${testCase.testcaseId}"/>&moduleId=<c:out value="${module.moduleId}"/>" onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${testcase.name}"/> ?')"> Delete</a>
      					</span>      					
      				</sec:authorize>
      				</td>
		      	</tr>		      	
 
		      	<tr>
		      		<td class="testcaseheader">Summary:</td>
		      		<td  colspan="2"> 
		      		  <c:set var="msg" value="${testCase.summary}" scope="page" />
   		 			   <c:out value='${msg}' escapeXml="false" />  			      		
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

 
	