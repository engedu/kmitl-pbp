<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.buckwa.domain.*"%>
<%@ page import="java.util.*"%>

<form:form   	method="POST" name="mainForm" enctype="multipart/form-data">		
<div class="post">
 
	<div class="entry">
	
		 <div class="pbptableWrapper">
             
			
			<table class="pbp-table">
				<thead><tr><th colspan="3">
				<div class="pbp-header"><span class="lsf-icon colororange" title="list"></span>คำนวณคะแนน  ปีการศึกษา  ${academicYearStr} </div>
				</th></tr>
				
			<tr>
				 
				<th   class="thFirst">คำนวณคะแนน </th>
		 		<th   class="thFirst" >หมายเหตุ </th>
			</tr> 				
				
				
				
				</thead>
				<tbody>
					<tr>
					 
					<td class="tdLast"  style="text-align: center;" >	 
					 <a rel="notLoading" href="<%=request.getContextPath()%>/admin/timetablews/recalculate.htm?academicYear=<c:out value="${academicYearStr}"/>&semester=1">  
								 <input class="btn btn-primary" value="Re-Calculate All" type="button"   /> 
					 </a> 
						 
					</td> 
					<td class="tdFirst" style="text-align: center;" rowspan="3"> ระบบจะทำการคำนวณคะแนนระดับ<br>
					1. คณะ <br>
					2. ภาควิชา<br>
					3. สถาบัน<br>
					 
					</td>
					
					</tr>
		 				
				</tbody> 
			</table> 
		</div>		
 
	</div>
	
	
			 <div class="pbptableWrapper">
            
             
			<table class="pbp-table">
				<thead>
				    <tr><th colspan="4"> 
		               <div class="pbp-header">  
			 <a rel="notLoading" href="<%=request.getContextPath()%>/admin/timetablews/recalculateAllDepartment.htm">  
								 <input class="btn btn-primary" value="คำนวนทุกคณะ" type="button"   /> 
					 </a> 
  </div> 
				    </th>
				    </tr>
				    <tr>
					<th class="thFirst">คณะ</th> 
					<th class="thLast">ภาควิชา</th>
					 <th class="thLast">Recalculate</th>
	                </tr>  
				</thead>
				<tbody>
				<c:forEach items="${facultyWrapper.facultyList}" var="domain"  varStatus="status"> 
					<tr>
						<td class="tdFirst" width="10%;">
							 <c:out value="${domain.name}"/>   
						</td>
 						<td class="tdFirst" width="20%;" colspan="2" > 
						
						 <table>
						 <c:forEach items="${domain.departmentList}" var="domain2"   varStatus="status2">  
						    <tr> 
						    	<td>
					  <c:out value="${domain2.name}"/>   
						    	
						    	</td>
						    	<td>
   
					  <a rel="notLoading" href="<%=request.getContextPath()%>/admin/timetablews/recalculateByDepartment.htm?headUserName=<c:out value="${domain2.head.email}"/>"> RecalCulate</a><br>
						    	
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
<script>
	
	function validateUpload (){		
		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/timetablews/syncTimeTable.htm";
		form.method = 'GET';
		form.submit();
	}
	
 
	
	function showHistory(){		
		document.location.href= "<%=request.getContextPath()%>/admin/importdata/profile/initProfileHistory.htm";
	}
	
	function importFile(){
		document.location.href="<%=request.getContextPath()%>/admin/importdata/profile/initProfile.htm";
	}
</script>
