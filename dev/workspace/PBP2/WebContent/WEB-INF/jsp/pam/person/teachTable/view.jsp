<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form modelAttribute="subject" action="view.htm" method="POST" name="mainForm">
<div class="post">
	<h2 class="title">รายวิชา</h2>
	<div class="entry">
	<div style="clear: both;">&nbsp;</div>
		<table>
			<tr>
				<td class="label-form" width="25%">รหัสรายวิชา :</td>
				<td align="left"><c:out value="${subject.code}"/></td>
			</tr>
			<tr>
				<td class="label-form" width="25%">หลักสูตร :</td>
				<td align="left"><spring:message code="${subject.degree}"/></td>
			</tr>
			<tr>
				<td class="label-form" width="25%">ชื่อวิชาภาษาไทย :</td>
				<td align="left"><c:out value="${subject.nameTh}"/></td>
			</tr>
			<tr>
				<td class="label-form" width="25%">ชื่อวิชาภาษาอังกฤษ :</td>
				<td align="left"><c:out value="${subject.nameEn}"/></td>
			</tr>
			<tr>
				<td class="label-form" width="25%">ชื่อวิชาภาษาอังกฤษ :</td>
				<td align="left"><c:out value="${subject.nameTh}"/></td>
			</tr>
			<tr>
				<td class="label-form" width="25%">หน่วยกิต :</td>
				<td align="left"><c:out value="${subject.credit}"/></td>
			</tr>
			<tr>
				<td class="label-form" width="25%">จำนวนชั่วโมงทฤษฎี :</td>
				<td align="left"><c:out value="${subject.lecHr}"/></td>
			</tr>
			<tr>
				<td class="label-form" width="25%">จำนวนชั่วโมงปฏิบัติ :</td>
				<td align="left"><c:out value="${subject.prcHr}"/></td>
			</tr>
			<tr>
				<td class="label-form" width="25%">จำนวนชั่วโมงศึกษาด้วยตนเอง :</td>
				<td align="left"><c:out value="${subject.selfHr}"/></td>
			</tr>
			<tr>
				<td class="label-form" width="25%">รายละเอียดวิชา :</td>
				<td align="left"><c:out value="${subject.details}"/></td>
			</tr>
		</table>
		<br>
		<div style="clear: both;">&nbsp;</div>
		<table>
			<tr>
				<td align="center">
					<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" id="cancelBtn" rel="notLoading">
				</td>
			</tr>
		</table>
	</div>
</div>
</form:form>

<script type="text/javascript">

	$(document).ready( function() {
	
		$("#cancelBtn").click(function(){
			window.location.href="<%=request.getContextPath()%>/pam/person/teachtable/initSubject.htm";
		});
	
	});

</script>