<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="timeTableReport"	action="edit.htm" method="POST" name="mainForm"  enctype="multipart/form-data">  
 <div class="post">
	<h2 class="title"> </h2>
		<div class="entry">
		
 		 <div class="pbptableWrapper">
           <div class="pbp-header" style="text-align: left; color: black;"> แก้ไขตารางสอน

 
			<table class="pbp-table">
 		 			 
 		 
		   	   	<thead>
		   	   		<tr>
		   	   		
		   	   		<th  colspan="2">   แก้ไขตารางสอน   &nbsp;
 					
					</th>
 					</tr>
 
		   	   	</thead>			
			 
			  <tbody> 
			  
			  
			<tr>
				<td class="tdFirst">รดัส:</td>
				<td class="tdLast"><form:input cssClass="input" path="subjectCode"/> <span class="require">*</span> 
				<form:errors path="subjectCode" cssClass="require" /></td>
			</tr>
			
			<tr>
				<td class="tdFirst">รดัส:</td>
				<td class="tdLast"><form:input cssClass="input" path="subjectName"/> <span class="require">*</span> 
				<form:errors path="subjectName" cssClass="require" /></td>
			</tr>
						<tr>
				<td class="tdFirst">รดัส:</td>
				<td class="tdLast"><form:input cssClass="input" path="lecOrPrac"/> <span class="require">*</span> 
				<form:errors path="lecOrPrac" cssClass="require" /></td>
			</tr>
						<tr>
				<td class="tdFirst">รดัส:</td>
				<td class="tdLast"><form:input cssClass="input" path="teachHr"/> <span class="require">*</span> 
				<form:errors path="teachHr" cssClass="require" /></td>
			</tr>
						<tr>
				<td class="tdFirst">รดัส:</td>
				<td class="tdLast"><form:input cssClass="input" path="credit"/> <span class="require">*</span> 
				<form:errors path="credit" cssClass="require" /></td>
			</tr>
						<tr>
				<td class="tdFirst">รดัส:</td>
				<td class="tdLast"><form:input cssClass="input" path="degreeStr"/> <span class="require">*</span> 
				<form:errors path="degreeStr" cssClass="require" /></td>
			</tr>
						<tr>
				<td class="tdFirst">รดัส:</td>
				<td class="tdLast"><form:input cssClass="input" path="totalStudent"/> <span class="require">*</span> 
				<form:errors path="totalStudent" cssClass="require" /></td>
			</tr>
						<tr>
				<td class="tdFirst">รดัส:</td>
				<td class="tdLast"><form:input cssClass="input" path="secNo"/> <span class="require">*</span> 
				<form:errors path="secNo" cssClass="require" /></td>
			</tr>
						<tr>
				<td class="tdFirst">รดัส:</td>
				<td class="tdLast"><form:input cssClass="input" path="teachDayStr"/> <span class="require">*</span> 
				<form:errors path="teachDayStr" cssClass="require" /></td>
			</tr>			
						<tr>
				<td class="tdFirst">รดัส:</td>
				<td class="tdLast"><form:input cssClass="input" path="teachTimeFromTo"/> <span class="require">*</span> 
				<form:errors path="teachTimeFromTo" cssClass="require" /></td>
			</tr>				
           </tbody>
           </table>
 
            </div>			

 
			<div style="width: 90%; text-align: center;">
			<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init();"> 
			</div>	
		
		
	</div>	
	
	
	
</div>
</div>
</form:form>	
 
 <script type="text/javascript">

	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/timetable/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
 	function validateUpload (){
		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>	/admin/user/uploadFile.htm";
		form.method = 'POST';
		form.submit();
	}
	
	
	$(document).ready( function() {
 
	 
		$('#birthdate,#workingDate,#assignDate,#retireDate').calendarsPicker({calendar: $.calendars.instance('thai','th')});
 

	});
</script>