<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="timeTableReport"	action="editTimeTable.htm" method="POST" name="mainForm"  enctype="multipart/form-data">  
 <div class="post">
 
		<div class="entry" style="text-align: left;">
				 <div class="pbp-header" style=" color: black; "> แก้ไขข้อมูลตารางสอน ${user.first_name}  ${user.last_name} ประจำปีการศึกษา ${academicYearStr}</div>
				 <div class="pbp-header" style=" color: black;">เทอม <c:out value="${timeTableReport.semester}" />/<c:out value="${timeTableReport.academicYear}" /></div>
		<hr>
 		 <div class="pbptableWrapper">
           <div class="pbp-header" style="text-align: left; color: black;"> 

 
			<table class="pbp-table" style="width: 60%;">
 		 			 
 		 
		   	   	<thead>
		   	   		<tr>
		   	   		
		   	   		<th  colspan="2">   แก้ไขตารางสอน   &nbsp;
 					
					</th>
 					</tr>
 
		   	   	</thead>			
			 
			  <tbody> 
			  
			  
			<tr>
				<td class="tdFirst">รหัสวิชา	:</td>
				<td class="tdLast"><form:input cssClass="input" path="subjectCode"/> <span class="require">*</span> 
				<form:errors path="subjectCode" cssClass="require" /></td>
			</tr>
			
			<tr>
				<td class="tdFirst">ชื่อวิชา Thai:</td>
				<td class="tdLast"><form:input cssClass="input" path="thaiName"/> <span class="require">*</span> 
				<form:errors path="subjectName" cssClass="require" /></td>
			</tr>
			
			<tr>
				<td class="tdFirst">ชื่อวิชา Eng:</td>
				<td class="tdLast"><form:input cssClass="input" path="engName"/> <span class="require">*</span> 
				<form:errors path="subjectName" cssClass="require" /></td>
			</tr>			
						<tr>
				<td class="tdFirst">ป/ท:</td>
				<td class="tdLast">
				  <form:select path="lecOrPrac" > 
					<form:options items="${timeTableReport.lecOrPracList}" itemValue="code" itemLabel="name" />
					 </form:select> 
				  <span class="require">*</span> 
				
				<form:errors path="lecOrPrac" cssClass="require" /></td>
			</tr>
						<tr>								
				<td class="tdFirst">ชั่วโมงสอน:</td>
				<td class="tdLast"><form:input cssClass="input" path="teachHrEdit"/> <span class="require">*</span> 
				<form:errors path="teachHrEdit" cssClass="require" /></td>
			</tr>
						<tr>
				<td class="tdFirst">หน่วยกิต:</td>
				<td class="tdLast"><form:input cssClass="input" path="credit"/> <span class="require">*</span> 
				<form:errors path="credit" cssClass="require" /></td>
			</tr>
						<tr>
				<td class="tdFirst">ระดับ:</td>
				<td class="tdLast">
				 				  <form:select path="degree" > 
					<form:options items="${timeTableReport.degreeLevelList}" itemValue="code" itemLabel="name" />
					 </form:select>
				<span class="require">*</span> 
				<form:errors path="degreeStr" cssClass="require" /></td>
			</tr>
						<tr>
				<td class="tdFirst">จำนวนนักศึกษา:</td>
				<td class="tdLast"><form:input cssClass="input" path="totalStudent"/> <span class="require">*</span> 
				<form:errors path="totalStudent" cssClass="require" /></td>
			</tr>
						<tr>
				<td class="tdFirst">Section:</td>
				<td class="tdLast"><form:input cssClass="input" path="secNo"/> <span class="require">*</span> 
				<form:errors path="secNo" cssClass="require" /></td>
			</tr>
						<tr>
				<td class="tdFirst">วัน:</td>
				<td class="tdLast">
				
				  <form:select path="teachDay" > 
					<form:options items="${timeTableReport.thaiShortDateList}" itemValue="code" itemLabel="name" />
					 </form:select>
				
				<span class="require">*</span> 
				<form:errors path="teachDayStr" cssClass="require" /></td>
			</tr>			
						<tr>
				<td class="tdFirst">เวลา:</td>
				<td class="tdLast"> From <form:input cssClass="input" path="teachTime1"/> <br>
				To <form:input cssClass="input" path="teachTime2"/>
				 ex. 16:00:00 - 19:00:00
				<span class="require">*</span> 
				 </td>
			</tr>	
			
			
						<tr>
				<td class="tdFirst">มีผู้ช่วยสอน(TA):</td>
				<td class="tdLast">
				
				
				 <form:radiobutton  path="isTA"  id="status0"  value="0" />มี
				<form:radiobutton path="isTA" id="status1" value="1"   />ไม่มี
				
				</td>
			</tr>			
			

						<tr>
				<td class="tdFirst">Project Base Learning:</td>
				<td class="tdLast">
				 <form:radiobutton  path="isProjectBase"  id="status0"  value="0" />ไช่
				<form:radiobutton path="isProjectBase" id="status1" value="1"   />ไม่ไช่
				
				</td>
			</tr>			
						
           </tbody>
           </table> 
            </div>			 
			<div style="width: 90%; text-align: center;">
			<a href="<%=request.getContextPath()%>/admin/timetable/viewTimeTable.htm?username=<c:out value="${user.username}"/>&semester=1" class="btn btn-primary" >ยกเลิก</a>
			
			&nbsp;	&nbsp;
			<input 	value="<spring:message code="label.button.save"/>" class="btn btn-primary" type="submit" >
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