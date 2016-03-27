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

<h1 id="exampleTitle"> 
            <span ><img src="<c:url value="/images/chart_example.jpg"/>"    /></span>
            <strong> คำนวณคะแนนภาควิชา    ${departmentName}   ปีการศึกษา  ${academicYearStr}</strong>  
        
            </h1> 	
 
             
	<div style="margin-left: 10%;">		
			<table class="pbp-table" style="width: 60%;"> 
		 
				<tbody>
					<tr>
				 
					<td class="tdLast"  style="text-align: center;" >	 
					 <a rel="notLoading" href="<%=request.getContextPath()%>/head/pbp/markDepartmentRecal.htm">  
								 <input class="btn btn-primary" value="คำนวณคะแนนให้เป็นปัจจุบัน" type="button"   /> 
					 </a> 
						 
					</td> 
					<td class="tdFirst" style="text-align: left;"  > <strong>ระบบจะทำการ ปรับปรุงข้อมูลคะแนนบุคลากรทั้งหมดของภาควิชา </strong><br>
				 
					</td>
					
					</tr>
		 				
				</tbody> 
			</table> 
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
