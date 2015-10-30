<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.buckwa.domain.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.buckwa.domain.pam.Person"%>
<% Person person = (Person) request.getAttribute("person"); %>
<table>
	<tr>
		<td width="10%" style="border-right: 1px solid white;">
			<img src="<%=request.getContextPath()%>/servlet/Image?<c:out value="${person.imagePath}" />" class="img_border" border="2">
		</td>
		<td valign="top">
			<table width="100%">
<!-- 				<tr> -->
<!-- 					<td colspan="4" align="right"><input value="ดูรายละเอียด" class="btn btn-primary" type="button" onclick="detail();"></td> -->
<!-- 				</tr> -->
				<tr>
					<td class="label-form">รหัสบุคลากร:</td>
					<td class="text">${person.employeeId}</td>
					<td class="label-form">รหัสประจำตัวประชาชน:</td>
					<td class="text">${person.citizenId}</td>
				</tr>
				<tr>
					<td class="label-form">ชื่อสกุล (ไทย):</td>
					<td class="text">${person.thaiName} ${person.thaiSurname}</td>
					<td class="label-form">เพศ:</td>
					<td class="text"><%= person.getLovDesc(person.getLovSexList(), person.getSex()) %></td>
				</tr>
				<tr>
					<td class="label-form">วัน เดือน ปีเกิด:</td>
					<td class="text">${person.birthdateStr}</td>
					<td class="label-form">ตำแหน่ง:</td>
<%-- 					<td class="text">${person.position}</td> --%>
					<td class="text"><%= person.getLovDesc(person.getLovPositionList(), person.getPosition()) %></td>
				</tr>
				<tr>
					<td class="label-form">สายงาน:</td>
<%-- 					<td class="text">${person.workLine}</td> --%>
					<td class="text"><%= person.getLovDesc(person.getLovWorkLineList(), person.getWorkLine()) %></td>
					<td class="label-form">อัตราเงินเดือน:</td>
					<td class="text">${person.salaryFormatThai}</td>
				</tr>
				<tr>
					<td class="label-form">หน่วยงาน:</td>
<%-- 					<td class="text">${person.faculty}</td> --%>
					<td class="text"><%= person.getLovDesc(person.getLovFacultyList(), person.getFaculty()) %></td>
					<td class="label-form">โทรศัพท์ที่ทำงาน:</td>
					<td class="text">${person.workTelNo}</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<script type="text/javascript">
	function detail(){
		window.location.href='<%=request.getContextPath()%>/pam/person/view.htm';
	}
</script>
