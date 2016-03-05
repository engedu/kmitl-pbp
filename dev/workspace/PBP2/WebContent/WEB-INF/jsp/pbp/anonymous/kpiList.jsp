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

 
		  <div class="pbptableWrapper" style="width: 95%;">
            
            <br>
			
			<table class="pbp-table">
		   	   	<thead>
		   	   	    <tr><th colspan="2"><div class="pbp-header"><span class="lsf-icon colororange" title="list" ></span> เกณฑ์ภาระงานด้าน  ${academicKPIWrapper.pBPWorkType.name} ประจำปีการศึกษา  ${academicKPIWrapper.academicYear}</div> 
					
					</th></tr>
		   	   		<tr>
		   	   			<th class="thFirst" style="width: 70%;">ภาระงาน</th>
		   	   			<th class="thFirst">คะแนน</th>
	 
		   	   		</tr>
		   	   	</thead>
		   	   	
		   	   	<tbody> 
		   		<c:forEach items="${academicKPIWrapper.academicKPIList}" var="domain" varStatus="status">  
		   			<tr>
		   				<td class="tdFirst">   ${domain.name}</td>
		   				<td class="tdFirst">${domain.mark} คะแนน/ ${domain.unitDesc}</td>
 		   				
		   			</tr>
		   			 	   			           
		       </c:forEach>   
		       
		       	 </tbody>		   	   	
			</table> 
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
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/academicKPI/create.htm";
		form.method='GET';	
		form.submit();
	}
</script>
 