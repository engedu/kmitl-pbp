<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="academicKPIWrapper" action="edit.htm" method="POST" name="mainForm"> 	 
<form:hidden path="academicYear"/>
 
<div class="post">
 
<div class="entry">		


	<c:choose>
		  <c:when test="${empty academicKPIWrapper.pBPWorkType.pBPWorkTypeSubList}"> 	
		  <div class="pbptableWrapper">
            <div class="pbp-header">  ${academicKPIWrapper.pBPWorkType.name} ประจำปีการศึกษา  ${academicKPIWrapper.academicYear} 
            
             <a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicKPI/create.htm?workTypeCode=<c:out  value="${academicKPIWrapper.pBPWorkType.code}"/>&academicYear=<c:out  value="${academicKPIWrapper.academicYear}"/>"  >
	          	<img class="imagePlus" src="<c:url value="/images/plus1.png"/>" />
	          </a>
            </div> 
			
			<table class="pbp-table">
		   	   	<thead>
		   	   		<tr>
		   	   			<th class="thFirst">ภาระงาน</th>
		   	   			<th class="thFirst">คะแนน</th>
		   	   			<th class="thFirst">Edit</th>
		   	   			<th class="thLast">Delete</th>
		   	   		</tr>
		   	   	</thead>
		   	   	
		   	   	<tbody> 
		   		<c:forEach items="${academicKPIWrapper.academicKPIList}" var="domain" varStatus="status">  
		   			<tr>
		   				<td class="tdFirst"> ${status.index+1}   ${domain.name}</td>
		   				<td class="tdFirst">${domain.mark} คะแนน/ ${domain.unitDesc}</td>
		   				<td class="tdFirst"> 
	                   		<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicKPI/edit.htm?academicKPIId=<c:out  value="${domain.academicKPIId}"/>"  >
	                   		 Edit</a>
		   				</td>
		   				<td class="tdLast"> 
	                   		<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicKPI/delete.htm?academicKPIId=<c:out  value="${domain.academicKPIId}"/>&workTypeCode=<c:out  value="${domain.workTypeCode}"/>&academicYear=<c:out  value="${domain.academicYear}"/>" 
	                   		onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.name}"/> ?')" >
	                   		 Delete</a>
		   				</td>		   				
		   			</tr>
		   			 	   			           
		       </c:forEach>   
		       
		       	 </tbody>		   	   	
			</table> 
		 </div>

  </c:when>
  
 		  <c:otherwise> 
  
		     <c:forEach items="${academicKPIWrapper.pBPWorkType.pBPWorkTypeSubList}" var="domain" varStatus="status">  
		     <div class="pbptableWrapper">
            <div class="pbp-header">  ${domain.name}
 
	          <a rel="notLoading" href="#"> <img class="imagePlus" src="<c:url value="/images/plus1.png"/>" /></a>
            </div> 
			
			<table class="pbp-table">
		   	   	<thead>
		   	   		<tr>
		   	   			<th class="thFirst">ภาระงาน</th>
		   	   			<th class="thFirst">คะแนน</th>
		   	   			<th class="thFirst">Edit</th>
		   	   			<th class="thLast">Delete</th>
		   	   		</tr>
		   	   	</thead>
		   	   	
		   	   	<tbody> 
		   		 <c:forEach items="${domain.academicKPIList}" var="domain2" varStatus="status2"> 
		   			<tr>
		   				<td class="tdFirst"> ${status2.index+1}   ${domain.name}</td>
		   				<td class="tdFirst">${domain2.mark} คะแนน/ ${domain2.unitDesc}</td>
		   				<td class="tdFirst"> 
	                   		<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicKPI/edit.htm?academicKPIId=<c:out  value="${domain2.academicKPIId}"/>"  >
	                   		 Edit</a>
		   				</td>
		   				<td class="tdLast"> 
	                   		<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicKPI/delete.htm?academicKPIId=<c:out  value="${domain2.academicKPIId}"/>&workTypeCode=<c:out  value="${domain2.workTypeCode}"/>&academicYear=<c:out  value="${domain2.academicYear}"/>" 
	                   		onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain2.name}"/> ?')" >
	                   		 Delete</a>
		   				</td>		   				
		   			</tr>
		   			 	   			           
		       </c:forEach>   
		       
		       	 </tbody>		   	   	
			</table>  
			</div>
		        </c:forEach>
		        
		        
		  </c:otherwise>  
  
  </c:choose>
 
 
	
	
	
	<div class="back_center">	
	
	</div>
	
</div>

 </div>
 
</form:form>
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/academicKPI/init.htm";
		form.method='GET';	
		form.submit();	
	}
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/academicKPI/create.htm";
		form.method='GET';	
		form.submit();
	}
</script>
 