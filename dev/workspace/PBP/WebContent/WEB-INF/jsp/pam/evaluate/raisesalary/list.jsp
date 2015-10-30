<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form modelAttribute="raiseSalaryForm" action="view.htm" method="POST" name="mainForm">  
<div class="post">
<h2 class="title">การสร้างเอกสารบัญชีเลื่อนเงินเดือน</h2>
<div class="entry">
<%@include file="/WEB-INF/jsp/pam/leave/includeProfile.jsp" %>
<div class="line">&nbsp;</div>
<div style="clear: both;">&nbsp;</div>

<table class="tableSearchResult">
<tr class="row">
	<td align="left">ปีการศึกษา</td>
	<td align="left">
		<form:select path="yearId" id="yearId" onchange="changeYear(this.value);">
			<form:options items="${raiseSalaryForm.yearList}" itemValue="yearId" itemLabel="name" />
		</form:select>
	</td>
	<td align="left">ภาคเรียน</td>
	<td align="left">
		<form:select path="semesterId" id="semesterId">
			<form:options items="${raiseSalaryForm.semesterList}" itemValue="semesterId" itemLabel="name" />
		</form:select>
	</td>
</tr>
</table>

<div class="line">&nbsp;</div>

<table>
<tr>
	<td>&nbsp;</td>
</tr>
<tr>
	<td align="center">
		<input class="btn btn-primary" value="ออกรายงาน" type="button" rel='notLoading' onclick="print();"/>
	</td>
</tr>
</table>

</div>
</div>
</form:form>	
 
 <script type="text/javascript">
 
 	function changeYear() {
		var form = document.forms['mainForm'];
		form.action ="<%=request.getContextPath()%>/pam/evaluate/raisesalary/initByYear.htm";
		form.method='GET';
		form.submit();
	}
 	
	function print (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/pam/evaluate/raisesalary/print.htm";
		form.method='POST';	
		form.submit();	
	}
</script>