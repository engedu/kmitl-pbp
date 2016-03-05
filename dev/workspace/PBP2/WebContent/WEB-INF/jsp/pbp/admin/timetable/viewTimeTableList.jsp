<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="user"	action="edit.htm" method="POST" name="mainForm"  enctype="multipart/form-data">  
 <div class="post">
 
		<div class="entry">
		 <div class="pbp-header" style=" color: black;"> ข้อมูลตารางสอน ${user.first_name}  ${user.last_name} ประจำปีการศึกษา ${academicYearStr}</div>
		  <div class="pbp-header" style=" color: black;">RegId: ${user.regId}  </div>
		 
		<hr>
 		 <div class="pbptableWrapper">
           <div class="pbp-header" style="text-align: left; color: black;"> เทอม 1/${academicYearStr}
           
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a rel="notLoading" href="<%=request.getContextPath()%>/admin/timetable/createTimeTable.htm?username=<c:out  value="${user.username}"/>&semester=1" class="btn btn-primary" >NEW</a>
           
            </div>			

				<table class="pbp-table"> 
					<thead  >
						<tr>
							<th class="thLast">รหัสวิชา</th>
							<th class="thLast">ชื่อวิชา</th>
							<th class="thLast">ป/ท</th>
							<th class="thLast">ชั่วโมงสอน</th>
							<th class="thLast">หน่วยกิต</th>
							<th class="thLast">ระดับ</th>
							<th class="thLast">จำนวนนักศึกษา</th>
							<th class="thLast">Section</th>
							<th class="thLast">วัน</th>
							<th class="thLast">เวลา           </th> 
							<th class="thLast">แก้ไข </th>
						</tr>
					</thead>
     
						<c:forEach items="${user.timeTableList}" var="domain" varStatus="status">
							<tr  >
								<td class="tdLast"><c:out value="${domain.subjectCode}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.subjectName}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.lecOrPrac}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.teachHr}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.credit}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.degreeStr}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.totalStudent}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.secNo}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.teachDayStr}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.teachTimeFromTo}" />&nbsp;</td>
								<td class="tdLast" align="center"> 
		                   		<a rel="notLoading" href="<%=request.getContextPath()%>/admin/timetable/editTimeTable.htm?timeTableId=<c:out  value="${domain.timetableId}"/>"  >
	                   		 Edit</a>
								</td>								
						</tr>		
		</c:forEach>
 
		</table> 
	</div>
	
	<br><br>
	
 		 <div class="pbptableWrapper">
            <div class="pbp-header" style="text-align: left;"><span style="color: black;">เทอม 2/${academicYearStr}</span> 
             &nbsp; &nbsp; &nbsp; &nbsp;
   <a rel="notLoading" href="<%=request.getContextPath()%>/admin/timetable/createTimeTable.htm?username=<c:out  value="${user.username}"/>&semester=2" class="btn btn-primary" >NEW</a>
         
            </div>			

				<table class="pbp-table"> 
					<thead  >
						<tr>
							<th class="thLast">รหัสวิชา</th>
							<th class="thLast">ชื่อวิชา</th>
							<th class="thLast">ป/ท</th>
							<th class="thLast">ชั่วโมงสอน</th>
							<th class="thLast">หน่วยกิต</th>
							<th class="thLast">ระดับ</th>
							<th class="thLast">จำนวนนักศึกษา</th>
							<th class="thLast">Section</th>
							<th class="thLast">วัน</th>
							<th class="thLast">เวลา           </th> 
							<th class="thLast">แก้ไข </th>
						</tr>
					</thead>
     
						<c:forEach items="${user.timeTableList2}" var="domain" varStatus="status">
							<tr  >
								<td class="tdLast"><c:out value="${domain.subjectCode}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.subjectName}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.lecOrPrac}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.teachHr}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.credit}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.degreeStr}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.totalStudent}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.secNo}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.teachDayStr}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.teachTimeFromTo}" />&nbsp;</td>
								<td class="tdLast" align="center"> 
		                   		<a rel="notLoading" href="<%=request.getContextPath()%>/admin/timetable/editTimeTable.htm?timeTableId=<c:out  value="${domain.timetableId}"/>"  >
	                   		 Edit</a>
								</td>								
						</tr>		
		</c:forEach>
 
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				 
				<td style="text-align: center;" colspan="11"> 
				<input class="btn btn-primary"
					value="<spring:message code="label.button.back"/>" type="button"
					onclick="init();"></td>
			</tr>
		</table>
		
		
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