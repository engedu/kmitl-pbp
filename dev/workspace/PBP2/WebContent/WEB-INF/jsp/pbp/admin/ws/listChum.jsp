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
				<div class="pbp-header"><span class="lsf-icon colororange" title="list"></span>นำเข้าข้อมูล  Webservice จากสำนักทะเบียน  ปีการศึกษา  ${academicYearStr} ชุมพร</div>
				</th></tr>
				
			<tr>
				<th  class="thLast" width="200px;">  เทอม  </th>
				<th   class="thFirst">นำเข้าข้อมูล  ตารางสอน </th>
		 		<th   class="thFirst" >หมายเหตุ </th>
			</tr> 				
				
				
				
				</thead>
				<tbody>
					<tr>
					<td class="tdFirst" style="text-align: center;">1 </td>
					<td class="tdLast"  style="text-align: center;" >	 
					 <a rel="notLoading" href="<%=request.getContextPath()%>/admin/timetablews/syncTimeTableYearSemesterChum.htm?academicYear=<c:out value="${academicYearStr}"/>&semester=1">  
								 <input class="btn btn-primary" value="Sync Webservice" type="button"   /> 
					 </a> 
						 
					</td> 
					<td class="tdFirst" style="text-align: center;" rowspan="3"> ระบบจะทำการ ปรับปรุงข้อมูลปีการศึกษาปัจจุบันในแต่ละเทอมดังนี้<br>
					1. คณะ <br>
					2. ภาควิชา<br>
					3. ข้อมูลอาจารย์<br>
					4. ตารางสอน<br>
					</td>
					
					</tr>
		 				
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
