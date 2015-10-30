<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.buckwa.domain.pam.Person"%>

<form:form modelAttribute="person" action="#" method="POST" name="mainForm">
<div class="post">
 
<div class="entry">

<% Person person = (Person) request.getAttribute("person"); %>

 		 <div class="pbptableWrapper">
            <div class="pbp-header"> ประวัติ > ดูรายละเอียด </div> 
			
			<table class="pbp-table">
				<tbody>
 
<tr>
	<td width="50%">
		<div align="center">
			<img src="<%=request.getContextPath()%>/servlet/Image?<c:out value="${person.imagePath}" />" class="img_border" border="2">
		</div>
	</td>
	<td width="50%">
		<table width="100%">
		<tr>
			<td width="50%" class="label-form">รหัสบุคลากร:</td>
			<td width="50%" class="text">${person.employeeId}</td>
		</tr>
		<tr>
			<td class="label-form">รหัสประจำตัวประชาชน:</td>
			<td class="text">${person.citizenId}</td>
		</tr>
		<tr>
			<td class="label-form">ชื่อสกุล (ไทย):</td>
			<td class="text">${person.thaiName} ${person.thaiSurname}</td>
		</tr>
		<tr>
			<td class="label-form">ตำแหน่ง:</td>
			<td class="text"><%= person.getLovDesc(person.getLovPositionList(), person.getPosition()) %></td>
		</tr>
		<tr>
			<td class="label-form">สายงาน:</td>
			<td class="text"><%= person.getLovDesc(person.getLovWorkLineList(), person.getWorkLine()) %></td>
		</tr>
		<tr>
			<td class="label-form">สังกัด:</td>
			<td class="text">${person.belongTo}</td>
		</tr>
		<tr>
			<td class="label-form">หน่วยงาน:</td>
			<td class="text"><%= person.getLovDesc(person.getLovFacultyList(), person.getFaculty()) %></td>
		</tr>
		<tr>
			<td class="label-form">โทรศัพท์ที่ทำงาน:</td>
			<td class="text">${person.workTelNo}</td>
		</tr>
		</table>
	</td>
</tr>
<tr>
	<td colspan="2">
		<table width="100%">
		<tr>
			<td width="25%" class="label-form">เพศ:</td>
			<td width="25%" class="text"><%= person.getLovDesc(person.getLovSexList(), person.getSex()) %></td>
			<td width="25%" class="label-form">วัน เดือน ปีเกิด:</td>
			<td width="25%" class="text">${person.birthdateStr}</td>
		</tr>
		<tr>
			<td class="label-form">เลขที่อัตรา:</td>
			<td class="text">${person.rateNo}</td>
			<td class="label-form">ประเภทข้าราชการ:</td>
			<td class="text"><%= person.getLovDesc(person.getLovEmployeeTypeList(), person.getEmployeeType()) %></td>
		</tr>
		<tr>
			<td class="label-form">ระดับ:</td>
			<td class="text">${person.level}</td>
			<td class="label-form">อัตราเงินเดือน:</td>
			<td class="text"> </td>
		</tr>
		<tr>
			<td class="label-form">วันที่เริ่มทำงานจริง:</td>
			<td class="text">${person.workingDateStr}</td>
			<td class="label-form">วันสั่งบรรจุ:</td>
			<td class="text">${person.assignDateStr}</td>
		</tr>
		<tr>
			<td class="label-form">วันเกษียณอายุ:</td>
			<td class="text">${person.retireDateStr}</td>
			<td class="label-form">เครื่องราชการสูงสุด:</td>
			<td class="text"><%= person.getLovDesc(person.getLovInsigniaList(), person.getMaxInsignia()) %></td>
		</tr>
		<tr>
			<td class="label-form">คุณวุฒิการศึกษา ณ วันที่บรรจุ:</td>
			<td class="text"><%= person.getLovDesc(person.getLovEducationList(), person.getMaxEducation()) %></td>
			<td class="label-form">บัตรผู้เสียภาษี:</td>
			<td class="text">${person.taxNo}</td>
		</tr>
		<tr>
			<td class="label-form">สถานะภาพสมรส:</td>
			<td class="text"><%= person.getLovDesc(person.getLovMarriedStatusList(), person.getMarriedStatus()) %></td>
			<td class="label-form">เลขที่บัตรข้าราชการ:</td>
			<td class="text">${person.workNumber}</td>
		</tr>
		<tr>
			<td class="label-form">เลขที่ กบข กสจ สปส:</td>
			<td class="text">${person.insureNo}</td>
			<td class="label-form">การสมัครกองทุน:</td>
			<td class="text">${person.fund}</td>
		</tr>
		<tr>
			<td class="label-form">ที่อยู่ตามทะเบียนบ้าน:</td>
			<td class="text">${person.address}</td>
			<td class="label-form">รหัสไปรษณีย์:</td>
			<td class="text">${person.zipCode}</td>
		</tr>
		<tr>
			<td class="label-form">เบอร์โทรศัพท์:</td>
			<td class="text">${person.telNo}</td>
			<td class="label-form">สถานะภาพการทำงาน:</td>
			<td class="text"><%= person.getLovDesc(person.getLovWorkingStatusList(), person.getWorkingStatus()) %></td>
		</tr>
		<tr>
			<td class="label-form">อีเมล์:</td>
			<td class="text">${person.email}</td>
			<td class="label-form">&nbsp;</td>
			<td class="text">&nbsp;</td>
		</tr>
		</tbody>
		</table>
	</td>
</tr>
</table>
</div>
<br>
<br>
<div align="center">
	<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" id="cancelBtn">
</div>

</div>
</div>
</form:form>
<script type="text/javascript">
	
	$(document).ready( function() {

		$("#cancelBtn").click(function(){
			window.location = "<%=request.getContextPath()%>/pam/person/init.htm";
		});

	});
</script>
