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

 
		  <div class="pbptableWrapper">
            <div class="pbp-header" style="text-align: center; color: black;"> เกณฑ์ภาระงานประจำปีการศึกษา  ${academicKPIWrapper.academicYear}  
            </div> 
            
 <c:forEach items="${academicKPIWrapper.pBPWorkTypeList}" var="domain" varStatus="status">
 
 		  <div class="pbptableWrapper">
            <div class="pbp-header">  <span style="color: black;"> ${status.index+1} ${domain.name} </span> 
  
            </div> 
			
			<table class="pbp-table">
		   	   	<thead>
		   	   		<tr>
		   	   			<th class="thFirst" >ภาระงาน</th>
		   	   			<th class="thFirst">คะแนน</th>
	 
		   	   		</tr>
		   	   	</thead>
		   	   	
		   	   	<tbody> 
		   		<c:forEach items="${domain.academicKPIList}" var="domain2" varStatus="status2">  
		   			<tr>
		   				<td class="tdFirst">    ${domain2.name}</td>
		   				<td class="tdFirst">${domain2.mark} คะแนน/ ${domain2.unitDesc}</td> 
		   			</tr> 	           
		       </c:forEach>   
		       
		       	 </tbody>		   	   	
			</table> 
		 </div> 
		 <br><br>
  </c:forEach>        
 
		 </div> 
		 
	 
 	<div  class="back_center">	 
	<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init();">
	</div>
	
</div>

 </div>
 
</form:form>
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/anonymous.htm";
		form.method='GET';	
		form.submit();	
	}
 
</script>
 