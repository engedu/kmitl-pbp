<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
<div class="post">
	<h2 class="title">ตารางสอนประจำปี</h2>
	<div style="clear: both;">&nbsp;</div>
	<div id="calendar" style="color:#000000"></div>
</div>
<div id="subjectView" >
	<div id="subjectView-ct">
		<div id="subjectView-header">
			<h2>ข้อมูลรายวิชา</h2>
		</div>
		<div class="txt-fld"><label for="">รหัสวิชา :</label><input id="subjectCode" name="" type="text" value="" disabled="disabled"/></div>
		<div class="txt-fld"><label for="">วิชา : </label><input id="subjectName" name="" type="text" value="" disabled="disabled"/></div>
		<div class="txt-fld"><label for="">หลักสูตร : </label><input id="degreeName" name="" type="text" value="" disabled="disabled"/></div>
		<div class="txt-fld"><label for="">เวลาสอน : </label><input id="subjectTime" name="" type="text" value="" disabled="disabled"/></div>
		<div class="txt-fld"><label for="">ห้อง : </label><input id="subjectRoom" name="" type="text" value="" disabled="disabled"/></div>
		<div class="txt-fld"><label for="">อาคาร : </label><input id="subjectBuilding" name="" type="text" value="" disabled="disabled"/></div>
		<div class="btn-fld"></div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,basicDay'
		},
		editable: false,
		events: [${teachTable}],
		eventClick: function(event) {
			// opens events in a popup window
			$("#subjectCode").val('');
			$("#subjectName").val('');
			$("#subjectTime").val('');
			$("#subjectRoom").val('');
			$("#subjectBuilding").val('');
			$.ajax({
				url: '<%=request.getContextPath()%>/pam/person/teachtable/json-subjectdetails.htm',
				dataType : 'json',
				data: {id: event.id,degree:event.degree,yearId:event.yearId,semesterId:event.semesterId},
				success: function(obj){
					$("#subjectCode").val(obj.code);
					$("#subjectName").val(obj.name);
					$("#subjectTime").val(obj.time);
					$("#subjectRoom").val(obj.room);
					$("#degreeName").val(obj.degreeName);
					$("#subjectBuilding").val(obj.building);
				}
			}).done(function() { 
				return false;
			});;
			
		}
	});

	$("#cancelBtn").click(function(){
		window.location.href ="<%=request.getContextPath()%>/pam/person/init.htm";
	});

	$('a[rel*=leanModal]').leanModal({ top : 50, closeButton: ".modal_close" });
});
</script>

 