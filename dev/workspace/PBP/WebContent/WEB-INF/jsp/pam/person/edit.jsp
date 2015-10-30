<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form modelAttribute="person" action="edit.htm" method="POST" name="mainForm">
<div class="post">
	<h2 class="title">ประวัติ > แก้ไข</h2>
	<div class="entry">
		<table width="100%">
			<tr>
				<td class="label-form">รหัสบุคลากร:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="employeeId" maxlength="20" />
					<span class="require">*</span>
					<form:errors path="employeeId" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">รหัสประจำตัวประชาชน:&nbsp;</td>
				<td>
					<form:input cssClass="input" id="citizenId" path="citizenId" maxlength="13" onkeypress="return isNumberKey(event)"/>
					<span class="require">*</span>
					<form:errors path="citizenId" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">ชื่อ (ไทย):&nbsp;</td>
				<td>
					<form:input cssClass="input" path="thaiName" maxlength="250" />
					<span class="require">*</span>
					<form:errors path="thaiName" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">นามสกุล (ไทย):&nbsp;</td>
				<td>
					<form:input cssClass="input" path="thaiSurname" maxlength="250" />
					<span class="require">*</span>
					<form:errors path="thaiSurname" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">เพศ:&nbsp;</td>
				<td>
					<form:select path="sex" id="sex">
						<form:options items="${person.lovSexList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="sex" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วัน เดือน ปีเกิด:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="birthdateStr" id="birthdate" readonly="true" />
					<span class="require">*</span>
					<form:errors path="birthdateStr" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">เลขที่อัตรา:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="rateNo" maxlength="20" />
					<span class="require">*</span>
					<form:errors path="rateNo" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">ประเภทข้าราชการ:&nbsp;</td>
				<td>
					<form:select path="employeeType" id="employeeType">
						<form:options items="${person.lovEmployeeTypeList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="employeeType" cssClass="require" /></td>
			</tr>
			<tr>
				<td class="label-form">ตำแหน่ง:&nbsp;</td>
				<td>
					<form:select path="position" id="position">
						<form:options items="${person.lovPositionList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="position" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">ระดับ:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="level" maxlength="250" />
					<span class="require">*</span>
					<form:errors path="level" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">สายงาน:&nbsp;</td>
				<td>
					<form:select path="workLine" id="workLine">
						<form:options items="${person.lovWorkLineList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="workLine" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">อัตราเงินเดือน:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="salary" maxlength="10" onkeypress="return isNumberKey(event)"/>
					<span class="require">*</span>
					<form:errors path="salary" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">โทรศัพท์ที่ทำงาน:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="workTelNo" maxlength="20" />
					<span class="require">*</span>
					<form:errors path="workTelNo" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">สังกัด:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="belongTo" maxlength="250" />
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="belongTo" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">หน่วยงาน:&nbsp;</td>
				<td>
					<form:select path="faculty" id="faculty">
						<form:options items="${person.lovFacultyList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="faculty" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันที่เริ่มทำงานจริง:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="workingDateStr" id="workingDate" readonly="true" />
					<span class="require">*</span>
					<form:errors path="workingDateStr" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันสั่งบรรจุ:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="assignDateStr" id="assignDate" readonly="true" />
					<span class="require">*</span>
					<form:errors path="assignDateStr" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันเกษียณอายุ:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="retireDateStr" id="retireDate" readonly="true" />
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="retireDateStr" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">เครื่องราชการสูงสุด:&nbsp;</td>
				<td>
					<form:select path="maxInsignia" id="maxInsignia">
						<form:options items="${person.lovInsigniaList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="maxInsignia" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">คุณวุฒิการศึกษา ณ วันที่บรรจุ:&nbsp;</td>
				<td>
					<form:select path="maxEducation" id="maxEducation">
						<form:options items="${person.lovEducationList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="maxEducation" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">บัตรผู้เสียภาษี:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="taxNo" maxlength="13" />
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="taxNo" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">สถานะภาพสมรส:&nbsp;</td>
				<td>
					<form:select path="marriedStatus" id="marriedStatus">
						<form:options items="${person.lovMarriedStatusList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="marriedStatus" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">เลขที่บัตรข้าราชการ:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="workNumber" maxlength="50" />
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="workNumber" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">เลขที่ กบข กสจ สปส:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="insureNo" maxlength="50" />
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="insureNo" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">การสมัครกองทุน:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="fund" maxlength="250" />
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="fund" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">ที่อยู่ตามทะเบียนบ้าน:&nbsp;</td>
				<td>
					<form:textarea path="address" id="address"/>
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="address" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">รหัสไปรษณีย์:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="zipCode" maxlength="5" />
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="zipCode" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">เบอร์โทรศัพท์:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="telNo" maxlength="10" onkeypress="return isNumberKey(event)" />
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="telNo" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">สถานะภาพการทำงาน:&nbsp;</td>
				<td>
					<form:select path="workingStatus" id="workingStatus">
						<form:options items="${person.lovWorkingStatusList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="workingStatus" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">อีเมล์:&nbsp;</td>
				<td class="text">${person.email} <form:hidden path="email" /></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td align="left"><input class="btn btn-primary"
					value="<spring:message code="label.button.save"/>" type="submit" id="saveBtn">
				<input class="btn btn-primary"
					value="<spring:message code="label.button.back"/>" type="button"
					id="cancelBtn"></td>
			</tr>
		</table>

	</div>
</div>
</form:form>
<script type="text/javascript">
	
	$(document).ready( function() {

		$("#saveBtn").click(function(){
			openWaiting();
			return true;
		});

		$("#cancelBtn").click(function(){
			window.location = "<%=request.getContextPath()%>/pam/person/init.htm";
		});

		$('#birthdate,#workingDate,#assignDate,#retireDate').datepicker( {
			showOn : 'both',
			buttonText : 'Choose a date',
			buttonImage : '<c:url value="/images/calendar.jpg"/>',
			buttonImageOnly : true,
			showButtonPanel : true
		});

		$('#birthdate,#workingDate,#assignDate,#retireDate').datepicker($.datepicker.regional['th']);

	});
</script>
