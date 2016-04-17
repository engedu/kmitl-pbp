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

<form:form modelAttribute="facultyWrapper" action="search.htm" method="POST" name="mainForm"> 	
 
	<form:hidden path="academicYear" />
	<div class="post">
			 	<div style="width: 80%; text-align: center; padding-left: 300px;" > 
 	 <table style="width: 300px;">
 	 	<tr> 
 	 		<td>ปีการศึกษา</td>
 	 		<td>
 	            		 <form:select path="academicYearSelect" onchange="getFacultyByYear(this.value);"> 
							<form:options items="${facultyWrapper.academicYearList}" itemValue="name" itemLabel="name" />
						</form:select> 	  
 	 		</td> 
 	 	</tr>
 	 </table>
 
 	</div>
		<div class="entry">
		

		
		 <div class="pbptableWrapper">
            
             
			<table class="pbp-table">
				<thead>
				    <tr><th colspan="4">
				      <div class="pbp-header"> สายบังคับบัญชา ประจำปี  ${facultyWrapper.academicYear} 
		              </div>
		            
		               <div class="pbp-header">อธิการบดี &nbsp;<c:out value="${facultyWrapper.president.thaiName}"/>  <c:out value="${facultyWrapper.president.thaiSurname}"/>    
		            
		            <span class="lsf-icon colororange" title="man"></span> &nbsp;   
		
					<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/chainOfCommand/managePresident.htm"><span class="lsf-icon colororange" title="gear"></span></a>
					  </div> 
				    </th></tr>
				    <tr>
					<th class="thFirst">คณะ</th>
					<th class="thFirst">คณบดี</th>
					<th class="thLast">ภาควิชา</th>
					 <th class="thLast">หัวหน้าภาค</th>
	                </tr>  
				</thead>
				<tbody>
				<c:forEach items="${facultyWrapper.facultyList}" var="domain"  varStatus="status"> 
					<tr>
						<td class="tdFirst" width="10%;">
							<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/chainOfCommand/listByFaculty.htm?facultyId=<c:out value="${domain.facultyId}"/>"> <c:out value="${domain.name}"/>   </a>
						</td>
						<td class="tdFirst" width="10%;"><span class="lsf-icon colororange" title="man"></span> <c:out value="${domain.dean.email}"/> &nbsp;<c:out value="${domain.dean.thaiName}"/>  <c:out value="${domain.dean.thaiSurname}"/>   
								<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/chainOfCommand/manageDean.htm?facultyId=<c:out value="${domain.facultyId}"/>"><span class="lsf-icon colororange" title="gear"></span></a></td>
						<td class="tdFirst" width="20%;" colspan="2" > 
						
						 <table>
						 <c:forEach items="${domain.departmentList}" var="domain2"   varStatus="status2">  
						    <tr> 
						    	<td>
					 <a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/chainOfCommand/listByDepartment.htm?departmentId=<c:out value="${domain2.departmentId}"/>"> <c:out value="${domain2.name}"/>   </a>
						    	
						    	</td>
						    	<td>
					 <span class="lsf-icon colororange" title="man"></span> <c:out value="${domain2.head.email}"/> &nbsp;<c:out value="${domain2.head.thaiName}"/>  <c:out value="${domain2.head.thaiSurname}"/>  
					  <a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/chainOfCommand/manageHead.htm?departmentId=<c:out value="${domain2.departmentId}"/>"><span class="lsf-icon colororange" title="gear"></span> </a><br>
						    	
						    	</td>
						    </tr>
						 </c:forEach>						 
						 </table>
 

			</td>
					</tr>				
				</c:forEach>				
 									
				</tbody>
			</table>
			 
		</div> 
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
	
	function getFacultyByYear (In){		
		var form = document.forms['mainForm']; 
	  //alert(In);
		form.action ="<%=request.getContextPath()%>/admin/pbp/chainOfCommand/getFacultyByYear.htm?academicYearSelect="+In;
		//alert(form.action);
		form.method='GET';	
		form.submit();
	}
</script>
