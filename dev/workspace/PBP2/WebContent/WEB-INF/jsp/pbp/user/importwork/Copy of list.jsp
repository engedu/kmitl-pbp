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
       
            </div> 
			
			<table class="pbp-table">
		   	   	<thead>
		   	   		<tr>
		   	   			<th class="thFirst">ภาระงาน</th>
		   	   			<th class="thFirst">คะแนน</th>
 
		   	   		</tr>
		   	   	</thead>
		   	   	
		   	   	<tbody> 
		   		<c:forEach items="${academicKPIWrapper.academicKPIList}" var="domain" varStatus="status">  
		   			<tr>
		   				<td class="tdFirst">
		   			 
		   				<a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/importwork.htm?academicKPICode=<c:out  value="${domain.code}"/>&academicYear=<c:out  value="${academicKPIWrapper.academicYear}"/>"> 
		   				 ${status.index+1}   ${domain.name}
		   				</a>		   				 
		   				 </td>
		   				<td class="tdFirst">${domain.mark} ชั่วโมงภาระงาน/ ${domain.unitDesc}</td>
 	   				
		   			</tr>
		   			 	   			           
		       </c:forEach>   
		       
		       	 </tbody>		   	   	
			</table> 
		 </div>

  </c:when>
  
 		  <c:otherwise> 
  
		     <c:forEach items="${academicKPIWrapper.pBPWorkType.pBPWorkTypeSubList}" var="domain" varStatus="status">  
		     <div class="pbptableWrapper">
            <div class="pbp-header">  ${domain.name} </div> 
			
			<table class="pbp-table">
		   	   	<thead>
		   	   		<tr>
		   	   			<th class="thFirst">ภาระงาน</th>
		   	   			<th class="thFirst">คะแนน</th>
 
		   	   	</thead>
		   	   	
		   	   	<tbody> 
		   		 <c:forEach items="${domain.academicKPIList}" var="domain2" varStatus="status2"> 
		   			<tr>
		   				<td class="tdFirst">
		   				
		   				<a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/importwork.htm"> 
		   				 ${status2.index+1}   ${domain.name}
		   				</a>
		   				
		   				 
		   				 </td>
		   				<td class="tdFirst">${domain2.mark} ชั่วโมงภาระงาน/ ${domain2.unitDesc}</td>
 	   				
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
 