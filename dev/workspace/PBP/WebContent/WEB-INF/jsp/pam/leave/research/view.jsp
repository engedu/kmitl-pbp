<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form modelAttribute="leave" action="view.htm" method="POST" name="mainForm">  
 <div class="post">
	<h2 class="title">ยื่นใบลา > ใบลาไป ศึกษา ฝึกอบรม ปฎิบัติการวิจัย ดูงาน ราชการ&nbsp;<spring:message code="${leave.cancelMsg}"/></h2>
	<div class="entry">
		<%@include file="/WEB-INF/jsp/pam/leave/includeProfile.jsp" %>
		<div class="line">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
		<table width="100%">
			<tr>
				<td class="label-form">มีความประสงค์ขอลาไป:</td>
				<td class="text"><form:checkboxes disabled="true"
					items="${leave.researchLeave.researchTypes}" path="researchLeave.researchTypeCode"
					id="researchTypeCode" itemValue="code" itemLabel="name"
					delimiter="&nbsp;&nbsp;" /></td>
			</tr>
		</table>
		<div class="line">&nbsp;</div>
		<table class="researchTbl" style="display: none;">
			<tr>
				<td class="label-form" width="25%">รหัสเอกสาร :</td>
				<td class="text">${leave.researchLeave.docNo}</td>
			</tr>
			<tr class="researchType1">
				<td class="label-form"  width="25%">ศึกษาวิชา :</td>
				<td class="text">${leave.researchLeave.study}</td>
			</tr>
			<tr class="researchType1">
				<td class="label-form"  width="25%">ขั้นปริญญา :</td>
				<td class="text">${leave.researchLeave.degree}
				</td>
			</tr>
			<tr class="researchType1">
				<td class="label-form" width="25%">ณ สถานศึกษา :</td>
				<td class="text">${leave.researchLeave.education}</td>
			</tr>
			<tr class="researchType2">
				<td class="label-form" width="25%">ด้าน/หลักสูตร:</td>
				<td class="text">${leave.researchLeave.course}
				</td>
			</tr>
			<tr class="researchType2">
				<td class="label-form" width="25%">ณ :</td>
				<td class="text">${leave.researchLeave.location}
				</td>
			</tr>
			<tr>
				<td class="label-form" width="25%">ประเทศ :</td>
				<td class="text">${leave.researchLeave.country}
				</td>
			</tr>
			<tr>
				<td class="label-form" width="25%">ด้วยทุน :</td>
				<td class="text">${leave.researchLeave.bycapital}</td>
			</tr>
			<tr>
				<td class="label-form" width="25%">ตั้งแต่วันที่ :</td>
				<td class="text">${leave.researchLeave.fromDateStr}</td>
			</tr>
			<tr>
				<td class="label-form" width="25%">ถึงวันที่ :</td>
				<td class="text">${leave.researchLeave.toDateStr}</td>
			</tr>
			
			<tr>
				<td class="label-form" width="25%">มีกำหนด (ปี/เดือน/วัน) :</td>
				<td class="text">
					${leave.researchLeave.amountYear}/${leave.researchLeave.amountMonth}/${leave.researchLeave.amountDay}
				</td>
			</tr>
		
			
			<tr>
				<td class="label-form" width="25%">ในระหว่างลาจะติดต่อข้าพเจ้าได้ที่ :</td>
				<td class="text">${leave.researchLeave.contactBy}</td>
			</tr>
			<tr>
				<td class="label-form" width="25%">หมายเลขที่โทรศัพท์ :</td>
				<td class="text">${leave.researchLeave.contactNo}</td>
			</tr>
			<tr>
				<td class="label-form" width="25%">สถานะใบลา :</td>
				<td class="text"><spring:message code="${leave.flowStatus}"/></td>
			</tr>
			<tr>
				<td class="label-form">ข้อมูลเพิ่มเติม :</td>
				<td><form:textarea path="leaveComment.comment" id="leaveComment.comment"/></td>
			</tr>
		</table>
		<div class="line">&nbsp;</div>
		<%@include file="/WEB-INF/jsp/pam/leave/includeComment.jsp" %>
		<table>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
				<c:if test="${leave.cancelAction == 'true' }">
					<input class="btn btn-primary" value="<spring:message code="label.leave.button.cancel"/>" type="button" onclick="cancel();"/>	 
				</c:if>
				<c:if test="${leave.researchLeave.flagExpired == 0 }">
					<c:if test="${leave.approveAction == 'true' }">
						<input class="btn btn-primary" value="<spring:message code="label.leave.button.approve"/>" type="button" onclick="approve();"/>	 
				   	 	<input class="btn btn-primary" value="<spring:message code="label.leave.button.reject"/>" type="button" onclick="reject();"/>
					</c:if>
					<c:if test="${leave.cancalLeaveAction == 'true' }">
						<input class="btn btn-primary" value="<spring:message code="label.leave.button.cancelLeave"/>" type="button" onclick="cancelLeave();"/>
					</c:if>
				</c:if>
				<input class="btn btn-primary" value="<spring:message code="label.button.save"/>" type="button" onclick="save();"/>
				<c:if test="${leave.isCancel == 0 }">
					<input class="btn btn-primary" value="<spring:message code="label.leave.button.print"/>" type="button" rel='notLoading' onclick="print();"/>	
				</c:if>
				<c:if test="${leave.isCancel == 1 }">
					<input class="btn btn-primary" value="<spring:message code="label.leave.button.print"/>" type="button" rel='notLoading' onclick="print_cancel();"/>
				</c:if>
				<c:if test="${leave.officerApprove == 'true' }">
					<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init('<%=request.getContextPath()%>/leave/initOfficer.htm');"/>
				</c:if>
				<c:if test="${leave.officerApprove == 'false' }">
					<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init('<%=request.getContextPath()%>/leave/init.htm');"/>
				</c:if>
				</td>
			</tr>
		</table>
	</div>
</div>
<form:hidden path="leaveFlowId"/>
<form:hidden path="officerApprove" />
</form:form>	
 
 <script type="text/javascript">
 
	function init (url){
		var form = document.forms['mainForm']; 
		form.action =url;
		form.method='POST';	
		form.submit();	
	}

	function cancel (){
		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/leave/cancel.htm";
		form.method='POST';	
		form.submit();	
	}

	function approve (){
		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/leave/approve.htm";
		form.method='POST';	
		form.submit();	
	}

	function reject (){
		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/leave/reject.htm";
		form.method='POST';	
		form.submit();	
	}
	
	function print (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/leave/research/print.htm";
		form.method='GET';	
		form.submit();	
	}

	$(document).ready(function(){
		if($("input[name=researchLeave.researchTypeCode]:checked").length>0){
			 if($("input[name=researchLeave.researchTypeCode]:checked").val()=='R001'){
				 $(".researchTbl").show();
				 $(".researchType1").show();
				 $(".researchType2").hide();
			 }else{
				 $(".researchTbl").show();
				 $(".researchType1").hide();
				 $(".researchType2").show();	
			 }
		 }
	});
	function save (){
		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/leave/save.htm";
		form.method='POST';	
		form.submit();	
	}
	function cancelLeave(){
		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/leave/cancelLeave.htm";
		form.method='POST';	
		form.submit();	
	}
	function print_cancel (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/leave/report_cancel.htm";
		form.method='POST';	
		form.submit();
	}
</script>