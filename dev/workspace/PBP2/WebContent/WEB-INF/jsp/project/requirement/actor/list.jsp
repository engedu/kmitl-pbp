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
<form:form   action="search.htm" method="POST" name="mainForm"> 
	<div class="subTopicHeader"> <c:out value='${projectName}'/> Actor	
		<sec:authorize ifAnyGranted="ROLE_PROJECT_SA ">
			<a href="<%=request.getContextPath()%>/project/requirement/actor/create.htm" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
			</a> 
		</sec:authorize>
		</div> 	  
	<div class="usecaseHeaderTxt"> 
    <div class="usecase">
      <table  >
      <!--
        <thead>
       	  <tr>
       	  	<td>Name</td> 
       	  	<td>Task Description</td>	
       	  </tr>
       </thead>
         -->
       <c:forEach items = "${actorList}" var="domain">
        <tr>
      		<td class="actorheader"><c:out value="${domain.name}"/>&nbsp;</td>
      		<td>
      	 		
      		 <c:set var="msg" value="${domain.detail}" scope="page" />
   		 	 <c:out value='${msg}' escapeXml="false" /> 
      		
      		</td> 
      		<td width="18%">
	       		<sec:authorize ifAnyGranted="ROLE_PROJECT_SA ">
	      		<span class="brEditTxt">
	      		<a href="<%=request.getContextPath()%>/project/requirement/actor/edit.htm?actorId=<c:out value="${domain.actorId}"/>" >Edit</a>
	      		</span> /
	  			<span class="brDeleteTxt">
					<a href="<%=request.getContextPath()%>/project/requirement/actor/delete.htm?actorId=<c:out value="${domain.actorId}"/>" onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.code}"/> ?')"> Delete</a>
				</span>  
	      		</sec:authorize>   
      		</td>
      	</tr>
       </c:forEach> 
      </table>   
    </div>    
	</div>
</form:form>
</div>
</div>

 
	