<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="user"	action="create.htm" method="POST" name="mainForm"  enctype="multipart/form-data">  
 <div class="post">
	<h2 class="title"> </h2>
		<div class="entry">
		
 		 <div class="pbptableWrapper">
            <div class="pbp-header">ข้อมูลบุคลากร > สร้าง
            </div>			
		<table class="pbp-table"> 
			<tr>
				<td class="label-form">ชื่อเข้าใช้ระบบ:</td>
				<td><form:input cssClass="input" path="username" /><span class ="require"  >*</span> <form:errors path="username" cssClass="require" /></td>
			</tr>
			<tr>
				<td class="label-form">รหัสผ่าน:</td>
				<spring:bind path="password">
					<td>			
						<input type="password" name="password" size="20" maxlength="40"	value="${status.value}" class="input"/><span class ="require">*</span>		
						<c:if test="${status.error}">
							<span class="require"><c:out value="${status.errorMessage}" /></span>
						</c:if>
					</td>
				</spring:bind>
			</tr>
			<tr> 
				<td class="label-form">ยืนยันรหัสผ่าน:</td>
				<spring:bind path="passwordConfirmation">
				<td>			
					<input type="password" name="passwordConfirmation" size="20" maxlength="40"	value="${status.value}" class="input"/><span class ="require"  >*</span>	
					<c:if test="${status.error}">
						<span class="require"><c:out value="${status.errorMessage}" /></span>
					</c:if>
				</td>
				</spring:bind>
			</tr>
			<tr>
				<td class="label-form">สถานะ:</td>
				<td class="text"><form:radiobutton path="enabled" value="true"/>Active 
				<form:radiobutton path="enabled" value="false"/>Inactive </td>
			</tr>
			<tr>	
				<td class="label-form" style="vertical-align: middle;">
					กลุ่มผู้ใช้งาน : &nbsp;
				</td>
				<td >
					 <form:checkboxes items="${user.groupList}" path="groups"  itemValue="groupId" itemLabel="groupName"  /> 
				</td> 
			</tr>
			<tr>
				<td colspan="2"><div class="line">&nbsp;</div></td>
			</tr>
			
			<!--  
			
			<tr>
				<td colspan="2"><div class="line">&nbsp;</div></td>
			</tr>
			<tr>	
				<td class="label-form">
					ชื่อ: &nbsp;
				</td>
				<td class="text"> 
					<c:out value="${user.first_name}"/>
				</td> 
			</tr>			
	
	
			<tr>	
				<td class="label-form">
					นามสกุล:&nbsp;
				</td>
				<td class="text"> 
					<c:out value="${user.last_name}"/>
				</td> 
			</tr>
			
			<tr>	
				<td class="label-form">
					 อีเมล์:&nbsp;
				</td>
				<td class="text"> <c:out value="${user.email}"/>
					 
				</td> 
			</tr>
			<tr>	
				<td class="label-form">
					 ที่อยู่ 1:&nbsp;
				</td>
				<td class="text"> <c:out value="${user.address1}"/>
					 
				</td> 
	
			</tr>	
			<tr>
				<td class="label-form">
					ที่อยู่ 2:&nbsp;
				</td>
				 <td class="text">
					 <c:out value="${user.address2}"/>
				</td> 
			</tr>	
			<tr>	
				<td class="label-form">
					 เบอร์โทรศัพท์:&nbsp;
				</td>
				<td class="text"> <c:out value="${user.tel_no}"/>
					 
				</td> 
			</tr>	
			
			<tr>
			<td class="label-form">ลายเซ็น:&nbsp;</td>
			<td class="text"> 
				<c:if test="${ user.fullSignatureImagePath !=null}">
					<img src="<%=request.getContextPath()%>/servlet/Image?<c:out value="${user.fullSignatureImagePath}"  />" width="100px;" height="60px;">
				</c:if>		
			</td>
			</tr> 	
	
	
	
			
			<tr>
				<td class="label-form">รหัสบุคลากร:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.employeeId" maxlength="20" />
					<span class="require">*</span>
					<form:errors path="person.employeeId" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">รหัสประจำตัวประชาชน:&nbsp;</td>
				<td>
					<form:input cssClass="input" id="citizenId" path="person.citizenId" maxlength="13" onkeypress="return isNumberKey(event)"/>
					<span class="require">*</span>
					<form:errors path="person.citizenId" cssClass="require" />
				</td>
			</tr>
			
			-->
			<tr>
				<td class="label-form">ชื่อ (ไทย):&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.thaiName" maxlength="250" />
					<span class="require">*</span>
					<form:errors path="person.thaiName" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">นามสกุล (ไทย):&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.thaiSurname" maxlength="250" />
					<span class="require">*</span>
					<form:errors path="person.thaiSurname" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">เพศ:&nbsp;</td>
				<td>
					<form:select path="person.sex" id="sex">
						<form:options items="${user.person.lovSexList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="person.sex" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วัน เดือน ปีเกิด:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.birthdateStr" id="birthdate" readonly="true" />
					<span class="require">*</span>
					<form:errors path="person.birthdateStr" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">เลขที่อัตรา:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.rateNo" maxlength="20" />
					<span class="require">*</span>
					<form:errors path="person.rateNo" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">ประเภทข้าราชการ:&nbsp;</td>
				<td>
					<form:select path="person.employeeType" id="employeeType">
						<form:options items="${user.person.lovEmployeeTypeList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="person.employeeType" cssClass="require" /></td>
			</tr>
			<tr>
				<td class="label-form">ตำแหน่ง:&nbsp;</td>
				<td>
					<form:select path="person.position" id="position">
						<form:options items="${user.person.lovPositionList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="person.position" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">ระดับ:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.level" maxlength="250" />
					<span class="require">*</span>
					<form:errors path="person.level" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">สายงาน:&nbsp;</td>
				<td>
					<form:select path="person.workLine" id="workLine">
						<form:options items="${user.person.lovWorkLineList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="person.workLine" cssClass="require" />
				</td>
			</tr>
			 <!-- 
			<tr>
				<td class="label-form">อัตราเงินเดือน:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.salary" maxlength="10" onkeypress="return isNumberKey(event)"/>
					<span class="require">*</span>
					<form:errors path="person.salary" cssClass="require" />
				</td>
			</tr>
			 -->
			<tr>
				<td class="label-form">โทรศัพท์ที่ทำงาน:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.workTelNo" maxlength="20" />
					<span class="require">*</span>
					<form:errors path="person.workTelNo" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">สังกัด:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.belongTo" maxlength="250" />
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="belongTo" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">หน่วยงาน:&nbsp;</td>
				<td>
					<form:select path="person.faculty" id="faculty">
						<form:options items="${user.person.lovFacultyList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="person.faculty" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันที่เริ่มทำงานจริง:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.workingDateStr" id="workingDate" readonly="true" />
					<span class="require">*</span>
					<form:errors path="person.workingDateStr" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันสั่งบรรจุ:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.assignDateStr" id="assignDate" readonly="true" />
					<span class="require">*</span>
					<form:errors path="person.assignDateStr" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">วันเกษียณอายุ:&nbsp;</td>
				<td>
					 <form:input cssClass="input" path="person.retireDateStr" id="retireDateStr" readonly="true" />
 <!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="retireDateStr" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">เครื่องราชการสูงสุด:&nbsp;</td>
				<td>
					<form:select path="person.maxInsignia" id="maxInsignia">
						<form:options items="${user.person.lovInsigniaList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="person.maxInsignia" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">คุณวุฒิการศึกษา ณ วันที่บรรจุ:&nbsp;</td>
				<td>
					<form:select path="person.maxEducation" id="maxEducation">
						<form:options items="${user.person.lovEducationList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="person.maxEducation" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">บัตรผู้เสียภาษี:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.taxNo" maxlength="13" />
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="taxNo" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">สถานะภาพสมรส:&nbsp;</td>
				<td>
					<form:select path="person.marriedStatus" id="marriedStatus">
						<form:options items="${user.person.lovMarriedStatusList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="person.marriedStatus" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">เลขที่บัตรข้าราชการ:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.workNumber" maxlength="50" />
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="workNumber" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">เลขที่ กบข กสจ สปส:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.insureNo" maxlength="50" />
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="insureNo" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">การสมัครกองทุน:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.fund" maxlength="250" />
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="fund" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">ที่อยู่ตามทะเบียนบ้าน:&nbsp;</td>
				<td>
					<form:textarea path="person.address" id="address"/>
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="address" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">รหัสไปรษณีย์:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.zipCode" maxlength="5" />
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="zipCode" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">เบอร์โทรศัพท์:&nbsp;</td>
				<td>
					<form:input cssClass="input" path="person.telNo" maxlength="10" onkeypress="return isNumberKey(event)" />
<!-- 					<span class="require">*</span> -->
<%-- 					<form:errors path="telNo" cssClass="require" /> --%>
				</td>
			</tr>
			<tr>
				<td class="label-form">สถานะภาพการทำงาน:&nbsp;</td>
				<td>
					<form:select path="person.workingStatus" id="workingStatus">
						<form:options items="${user.person.lovWorkingStatusList}" itemValue="code" itemLabel="name" />
					</form:select>
					<span class="require">*</span>
					<form:errors path="person.workingStatus" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">รูปประวัติส่วนตัว:</td>
				<td>
					<form:input path="person.fileData" id="image" type="file" cssClass="input" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="btn btn-primary" value="อัพโหลด" type="button" onclick="validateUpload();" />
					<span class="require">*</span>
					<form:errors path="person.picture" cssClass="require" />
				</td>
			</tr>
			<tr>
				<td class="label-form">ชื่อรูป:</td>
				<td class="text">${user.person.picture} <form:hidden path="person.picture" /></td>
			</tr>
			<tr>
				<td colspan="2"><div class="line">&nbsp;</div></td>
			</tr>
			
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td align="left"><input class="btn btn-primary"
					value="<spring:message code="label.button.save"/>" type="submit" >
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
		form.action ="<%=request.getContextPath()%>/admin/user/init.htm";
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