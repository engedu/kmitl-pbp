<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="facultyWrapper" action="search.htm" method="POST" name="mainForm"> 	 
<form:hidden path="academicYear"/> 
<div class="post"> 

 	<div style="width: 80%; text-align: center; padding-left: 300px;" > 
 	 <table style="width: 300px;" >
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

   <br>
	<div class="entry"> 	
		 <div class="pbptableWrapper">
			<table class="pbp-table">
				<thead>
				    <tr><th colspan = "2"><div class="pbp-header"> ข้อมูลหน่วยงาน ประจำปีการศึกษา  ${facultyWrapper.academicYear} </div></th></tr>
				    <tr>
					<th class="thFirst">คณะ     		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
							<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/faculty/create.htm?academicYearSelect=<c:out  value="${facultyWrapper.academicYearSelect}"/>">
								Add <span class="lsf-icon colororange" title="plus"></span>
							</a>
					</th> 
					<th class="thLast">ภาควิชา</th> 
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${facultyWrapper.facultyList}" var="domain"  varStatus="status"> 
					<tr  >
						<td   width="20%;"><c:out value="${domain.code}"/> : <c:out value="${domain.name}"/> 
										<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/faculty/editFaculty.htm?facultyId=<c:out  value="${domain.facultyId}"/>">
											<span class="lsf-icon colororange" title="gear"></span>

										</a>  						
						</td>
 
						<td   width="20%;">
							<table style="width: 98%;border: none;">
								<tr style="border: none;">
									<td width="80%;"style="border: none;">
									  <c:forEach items="${domain.departmentList}" var="domain2"   varStatus="status2"> 
											 <c:out value="${domain2.code}"/>: <c:out value="${domain2.name}"/>
										<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/faculty/editDepartment.htm?departmentId=<c:out  value="${domain2.departmentId}"/>">
											<span class="lsf-icon colororange" title="gear"></span>

										</a>  
										  <br>
										
										
										</c:forEach>									
									</td>
									<td valign="top"style="border: none;">
										<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/faculty/createDepartment.htm?facultyId=<c:out  value="${domain.facultyId}"/>">
											Add <span class="lsf-icon colororange" title="plus"></span>
										</a>									
									</td>
								</tr>
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
		form.method='GET';	
		form.submit();
	}
	
		function getFacultyByYear (In){		
			var form = document.forms['mainForm']; 
		  //alert(In);
			form.action ="<%=request.getContextPath()%>/admin/pbp/faculty/getFacultyByYear.htm?academicYearSelect="+In;
			//alert(form.action);
			form.method='GET';	
			form.submit();
		}
</script>
 