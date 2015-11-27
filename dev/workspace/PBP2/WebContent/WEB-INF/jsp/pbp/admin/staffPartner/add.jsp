<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>
<script type="text/javascript" src='<c:url value="/js/inputNumber.js"/>'></script>

<div class="pbptableWrapper">
	<div class="pbp-header">เพิ่มสัดส่วน</div>
	<div align="center">
	<table class="pbp-table" style="width: 90%">
		<thead>
			<th class="thFirst" width="5%" colspan="2">เพิ่มสัดส่วน สตาฟ</th>
		</thead>
			<tbody>
				<tr>
					<td>รหัส</td>
					<td>${subject.subjectId }</td>
				</tr>
				<tr>
					<td>ชื่อ</td>
					<td>${subject.subjectName }</td>
				</tr>
				<tr>
					<td>SECTION</td>
					<td>${subject.sectionCd }</td>
				</tr>
				<tr>
					<td>ปีการศึกษา</td>
					<td>${subject.year } / ${subject.term }</td>
				</tr>
				<tr>
					<td>STAFF</td>
					<td>
						<table id="staffpartnerList">
							<c:if test="${not empty listRatio }">
							<c:forEach items="${listRatio }" var="r">
							<tr>
								<td> ${r.staff_name } </td>
								<td>
									<input type="text" value="${r.staff_ratio}" style="width: 50px;margin-left: 10px;" disabled="disabled"/>&permil; 
									<input type="button" value="delete" onclick="deleteStaff(${subject.sectionId},${r.staff_code})"/>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							<c:if test="${empty listRatio}">
								<tr>
									<td colspan="2">NOT FOUND</td>
								</tr>
							</c:if>
							
						</table>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center" bgcolor="#e1e1e1"><p style="font-size: 16px;font-weight: bold;">ค้นหา</p></td>
				</tr>
				<tr>
				<tr>
					<td colspan="2" align="center" >
						<form action="search.htm" method="post">
							ชื่อ <input type="text" value=""  name="firstname"	style="width: 100px;" />
							นามสกุล<input type="text" value="" name="surname"	style="width: 100px;" /> 
						 	<input  type="hidden" name="section_id" value="${subject.sectionId}"/>
						 	<input type="submit" value="search" />
						</form>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" > 	&nbsp; </td>
				</tr>
<!-- 				 for search -->
					<td colspan="2" align="center" >
						<c:if test="${not empty searchList}">
							
								<c:forEach items="${searchList}" var="r" varStatus="l">
									<tr>
										<td colspan="2" align="center">
											ชื่อ <input type="text" value="${r.fullName}"  name="fullName"	id="fullName" style="width: 200px;" readonly="readonly"/>
										 	<input type="text" value="0" id="ratio_${r.staffCode}" style="width: 100px;"  onkeydown="numberUtil.inputNumber(event);" /> &permil; 
										 	<input  type="hidden" name="section_id" value="${subject.sectionId}"/>
										 	<input  type="hidden" name="code_id" value="${r.staffCode}"/>
										 	<input type="button" value="add" onclick="addstaff('${subject.sectionId}','${r.fullName}', '${r.staffCode}')">
										 </td>
									 	
									</tr>
								</c:forEach>
						
						</c:if>
					</td>
<!-- 				 for search -->
								
			</tbody>

		</table>
		
		<br /> <br /> 
		<input class="btn btn-primary"value="<spring:message code="label.button.save"/>" type="button">
		&nbsp; &nbsp;
		<input class="btn btn-primary" value="ย้อนกลับ" type="button" onclick="window.location='init.htm'" /> 
		<br /> <br />


	</div>
</div>
<form action="addRatio.htm" method="post" id="addForm">
	<input  type="hidden" name="section_id" />
	<input  type="hidden" name="firstname" />
	<input  type="hidden" name="surname" />
	<input  type="hidden" name="ratio" />
</form>
<script type="text/javascript">
<!--
	function deleteStaff(section_id,staff_code){
		window.location="<%=request.getContextPath()%>/admin/pbp/staffpartner/deleteStaff.htm?section_id="+section_id+"&staff_code="+staff_code;
	}

	function addstaff(section_id,full_name, staff_code){
		var f = $('#addForm').get(0);
		var n = full_name.split(" ");
		f['section_id'].value = section_id;
		f['firstname'].value = n[0];
		f['surname'].value = n[1];
		var r =  $('#ratio_' + staff_code).val();
		f['ratio'].value = ( r == "" )? 0 : r ;
		f.submit();
	}
//-->
</script>