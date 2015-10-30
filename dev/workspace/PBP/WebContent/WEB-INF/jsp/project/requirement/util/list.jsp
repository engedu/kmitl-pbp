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
	<div class="subTopicHeader">Util (Date,Number)	
		<sec:authorize ifAnyGranted="ROLE_PROJECT_SA ">
			<a href="<%=request.getContextPath()%>/project/requirement/util/create.htm" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
			</a> 
		</sec:authorize>
		</div>  
	<br> 
	<div class="usecaseHeaderTxt"> 
    <div class="usecase">
      <table  >
       <c:forEach items = "${utilList}" var="domain">
        <tr>
      		<td class="usecaseheader">Code:</td>
      		<td><c:out value="${domain.code}"/>  </td> 
      		<td width="15%">
	       		<sec:authorize ifAnyGranted="ROLE_PROJECT_SA ">
	      		<span class="brEditTxt">
	      		<a href="<%=request.getContextPath()%>/project/requirement/util/edit.htm?utilId=<c:out value="${domain.utilId}"/>" >Edit</a>
	      		</span> /
	  			<span class="brDeleteTxt">
					<a href="<%=request.getContextPath()%>/project/requirement/util/delete.htm?utilId=<c:out value="${domain.utilId}"/>" onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.name}"/> ?')"> Delete</a>
				</span>  
	      		</sec:authorize>   
      		</td>
      	</tr>
      	<tr>
      		<td class="usecaseheader">Detail:</td>
      		<td  colspan="2"> 
      		  <c:set var="msg" value="${domain.detail}" scope="page" />
 		 		  <c:out value='${msg}' escapeXml="false" />  			      		
      		</td>
      	</tr>         
       </c:forEach> 
      </table>   
    </div>    
	</div>
</form:form>
</div>
</div>

 
	