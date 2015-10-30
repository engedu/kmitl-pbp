<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="importData"	method="POST" name="mainForm" enctype="multipart/form-data">
<div class="post">
	<div class="entry">
		 <div class="pbptableWrapper" align="center">
            
					<table  width="100%">
					
					<thead><tr><th colspan="2">
					<div class="pbp-header"><span class="lsf-icon colororange" title="list"></span> ตารางสอน</div> 
					</th></tr></thead>
						
						<tr>	
							<td class="label-form" align="right">ข้อมูลตารางสอน (Teach Table) : </td>
							<td >
								<form:input path="fileDataTeachTable" id="fileDataTeachTable" type="file" cssClass="input"/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="require">*</span><form:errors path="fileDataTeachTable" cssClass="require" />
							</td> 
						</tr>
						<tr>
							<td align="center" colspan="2">
								<input value="<spring:message code="label.button.save"/>" class="btn btn-primary" type="button" id="saveBtn" onclick="validateUpload();">
								<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" id="cancelBtn">
							</td>
						</tr>
					</table>
		</div>
	</div>
</div>
</form:form>

 <script>
	
	function validateUpload (){	
			
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/importdata/timetable/upload.htm";
		form.method='POST';	
		form.submit();
	}
 
	$(document).ready(function(){
		$("#yearId").change(function(){
				
			var form = document.forms['mainForm']; 
			form.action ="<%=request.getContextPath()%>/admin/importdata/timetable/getSemester.htm";
			form.method='POST';	
			form.submit();
		});

		$("#cancelBtn").click(function(){
			document.location.href="<%=request.getContextPath()%>/admin/importdata/timetable/initTimeTableHistory.htm";
		});
	});
	    
</script>
 