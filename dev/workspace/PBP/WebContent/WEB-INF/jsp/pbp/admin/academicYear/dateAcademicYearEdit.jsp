<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="academicYear" action="editDateAcademicYear.htm" method="POST" name="mainForm"> 	 
 
<div class="post">
	<h2 class="title">แก้ไขปีการศึกษา     </h2>
	<div class="entry">	 
	
		 <div class="pbptableWrapper">
             
			
			<table class="pbp-table">
		 		<thead>
			 		<tr>
			 			<th> ปีการศึกษา </th>
			 			<th> เริ่มต้น </th>
			 			<th> สิ้นสุด </th>
	             	</tr>
             	
             	</thead>			
				<tbody>
					<tr>
					<td> ${academicYear.name} </td>
					<td class="tdFirst">   
						<form:input cssClass="input" path="startDateStr" id="startDate"   />
						<span class="require">*</span>
						<form:errors path="startDateStr" cssClass="require" />					
					</td>
					<td class="tdFirst"> 
						<form:input cssClass="input" path="endDateStr" id="endDate"   />
						<span class="require">*</span>
						<form:errors path="endDateStr" cssClass="require" />					
					</td>  
					</tr>
				</tbody> 
			</table> 
			
			<br>
			<table class="pbp-table">
		 		<thead>
			 		<tr>
			 			<th> เทอม </th>
			 			<th> เริ่มต้น </th>
			 			<th> สิ้นสุด </th>
	             	</tr>
             	
             	</thead>			
				<tbody>
				
				 <c:forEach items="${academicYear.semesterList}" var="domain2" varStatus="status2">
					<tr>
					<td> ${domain2.name} </td>
					<td class="tdFirst">   
						<form:input cssClass="input" path="startDateStr" id="startDate"   />
						<span class="require">*</span>
						<form:errors path="startDateStr" cssClass="require" />					
					</td>
					<td class="tdFirst"> 
						<form:input cssClass="input" path="endDateStr" id="endDate"   />
						<span class="require">*</span>
						<form:errors path="endDateStr" cssClass="require" />					
					</td> 
					
					
					</tr>
					
				</c:forEach>
				</tbody> 
			</table> 			
			
		</div>	 
	</div>
	<br>
 
	<div>
	<input class="btn btn-primary"	value="<spring:message code="label.button.save"/>" type="submit" >   &nbsp;  &nbsp; 
	<input class="btn btn-primary" value="ย้อนกลับ" type="button"		onclick="init();" />  
	</div>
</div>
</form:form>
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/academicYear/init.htm";
		form.method='GET';	
		form.submit();	
	} 
	
	$(document).ready( function() {
		$('#startDate,#endDate').datepicker( {
			showOn : 'both',
			buttonText : 'Choose a date',
			buttonImage : '<c:url value="/images/calendar.jpg"/>',
			buttonImageOnly : true,
			showButtonPanel : true
		});

		$('#startDate,#endDate').datepicker($.datepicker.regional['th']);

	});
</script>
 