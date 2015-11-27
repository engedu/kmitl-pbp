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
	<div class="pbp-header"></div>
	<div align="center">
	<table class="pbp-table" style="width: 90%">
		<thead>
			<th class="thFirst" width="5%" colspan="2">เพิ่มรายวิชาสอนร่วมสำเร็จข้อมูลจะแสดงในหน้าผลงานและตารางสอน</th>
		</thead>
			<tbody>
				<tr>
					<td style="text-align: center;" >
					<a href="<%=request.getContextPath()%>/pam/person/initAcademicWork.htm"><span style="font-size: 17px;">กลับสู่หน้าผลงานประจำปี</span></a>
					</td>
					 
				</tr>
				 
								
			</tbody>

		</table>
		
	 


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