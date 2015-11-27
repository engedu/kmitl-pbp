<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form modelAttribute="leave" action="view.htm" method="POST" name="mainForm">  

<div class="post">
	<h2 class="title">ยื่นใบลา > ใบลากิจ&nbsp;<spring:message code="${leave.cancelMsg}"/></h2>
	<div class="entry">
		<%@include file="/WEB-INF/jsp/pam/leave/includeProfile.jsp" %>
		<div class="line">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
		<table class="researchTbl">
			<tr>
				<td class="label-form" width="25%">รหัสเอกสาร :</td>
				<td class="text">${leave.personalLeave.docNo}</td>
			</tr>
			
			<tr>
				<td class="label-form" width="25%">ตั้งแต่วันที่ :</td>
				<td class="text">${leave.personalLeave.fromDateStr}</td>
			</tr>
			<tr>
				<td class="label-form" width="25%">ถึงวันที่ :</td>
				<td class="text">${leave.personalLeave.toDateStr}</td>
			</tr>
			
			<tr>
				<td class="label-form" width="25%">มีกำหนด (วัน) :</td>
				<td class="text">
					${leave.personalLeave.amountDay}
				</td>
			</tr>
			<tr>
				<td class="label-form" width="25%">มีวันลากิจคงเหลือ(วัน) :</td>
				<td class="text">
					${leave.leaveBalance}
				</td>
			</tr>
			<tr>
				<td class="label-form" width="25%">เนื่องจาก :</td>
				<td class="text">${leave.personalLeave.reason}</td>
			</tr>
			<tr>
				<td class="label-form" width="25%">ในระหว่างลาจะติดต่อข้าพเจ้าได้ที่ :</td>
				<td class="text">${leave.personalLeave.contactBy}</td>
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
				<c:if test="${leave.personalLeave.flagExpired == 0 }">
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

	function print (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/leave/personal/print.htm";
		form.method='GET';	
		form.submit();	
	}
	function print_cancel (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/leave/report_cancel.htm";
		form.method='POST';	
		form.submit();
	}
</script>