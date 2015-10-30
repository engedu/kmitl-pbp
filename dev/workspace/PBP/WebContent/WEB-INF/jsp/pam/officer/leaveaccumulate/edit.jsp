<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form modelAttribute="user"	action="edit.htm" method="POST" name="mainForm"  enctype="multipart/form-data">  
 <div class="post">
	<h2 class="title">ข้อมูลการลาสะสมตั้งต้น > แก้ไข </h2>
		<div class="entry">
		<table width="100%"> 
			<tr>
				<td class="label-form">ชื่อเข้าใช้ระบบ:</td>
				<td class="text"><c:out value="${user.username}"/></td>
			</tr>
			 <tr>
				<td class="label-form">ชื่อ-สกุล:</td>
				<td class="text"><c:out value="${user.person.thaiName}"/> &nbsp; <c:out value="${user.person.thaiSurname}"/></td>
			</tr>
			
			<tr>
				<td class="label-form">วันลาสะสม:&nbsp;</td>
				<td>					 
		 			<form:input cssClass="input" path="leaveAccumulate" />
				</td>
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
</form:form>	
 
 <script type="text/javascript">

	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/officer/leaveaccumulate/init.htm";
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