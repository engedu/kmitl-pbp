<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.buckwa.domain.*"%>
<%@ page import="java.util.*"%>

<form:form modelAttribute="chainOfCommandWrapper" action="search.htm" method="POST" name="mainForm"> 	
 
	<form:hidden path="academicYear" />
	<div class="post">
		<h2 class="titlex"></h2>
		<div class="entry">
		
		 <div class="pbptableWrapper">
            <div class="pbp-header"> 
               <table style="width: 100%;">
               	<tr>
               		<td width="70%;">
               			สายบังคับบัญชา คณะ  ${chainOfCommandWrapper.faculty.name}  
               		</td>
               		<td>
               			คณบดี
               		</td>
               		<td>
	               		<c:forEach items="${chainOfCommandWrapper.faculty.deanList}" var="domain"  varStatus="status"> 
	               			<c:out value="${domain.thaiName}"/>  <c:out value="${domain.thaiSurname}"/>  
	               		</c:forEach> 
               		</td>               		
               	</tr>
               </table> 
            </div> 
		</div> 
		
		<br>
		
		<c:forEach items="${chainOfCommandWrapper.faculty.departmentList}" var="domain"  varStatus="status"> 
			<div class="pbptableWrapper">
            <div class="pbp-header"> 
	 
	               <table style="width: 100%;">
	               	<tr>
	               		<td width="70%;">
	               			${status.index+1} .<c:out value="${domain.name}"/>
	               		</td>
	               		<td>
	               			หัวหน้าภาควิชา
	               		</td>
	               		<td>
		               		<c:forEach items="${domain.headList}" var="domain2"  varStatus="status2"> 
		               			<c:out value="${domain2.thaiName}"/>  <c:out value="${domain2.thaiSurname}"/>  
		               		</c:forEach> 
	               		</td>               		
	               	</tr>
	               </table> 					
			</div> 		
				 
				<table class="pbp-table">
				<tbody>  <c:forEach items="${domain.academicPersonList}" var="domain2"   varStatus="status2"> 
					<tr>
						<td class="tdFirst" colspan="2">
				 			${status2.index+1} . <c:out value="${domain2.thaiName}"/> <c:out value="${domain2.thaiSurname}"/> 
									      
						</td>
												 <td class="tdFirst" >
				 		  <c:out value="${domain2.email}"/>  
									      
						</td>
							 <td class="tdFirst" >
				 		  <c:out value="${domain2.employeeType}"/>  
									      
						</td>
		 
					</tr>				
					</c:forEach>			
 									
				</tbody>
			</table>	
			</div>
		 
			<br>
		</c:forEach>	
		
		
		
		
		</div>
	</div>


</form:form>

<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/faculty/init.htm";
		form.method='GET';	
		form.submit();	
	}
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/faculty/create.htm";
		form.method = 'GET';
		form.submit();
	}
</script>
