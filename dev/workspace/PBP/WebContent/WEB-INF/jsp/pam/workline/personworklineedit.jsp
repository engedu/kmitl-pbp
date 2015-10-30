<!--
	@Author : Teerawoot Charoenporn(Tor)
	@Create : Aug 19, 2012 5:54:08 PM
-->
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form modelAttribute="person"	action="editpersonworkline.htm" method="POST" name="mainForm">  
 <div class="post">
	<h2 class="title" id="mainTitle">ข้อมูลสายงานบุคลากร > แก้ไข </h2>
		<div class="entry">
		<table width="100%">
			<tr>
				<td class="label-form">ชื่อ-นามสกุล:</td>
				<td class="text">
					<c:out value="${person.thaiName}"/>&nbsp;<c:out value="${person.thaiSurname}"/>
					<form:hidden path="oldWorklineCode"/>
				</td>
			</tr>
			<tr>
				<td class="label-form">ตำแหน่งสายงาน:</td>
				<td class="text">
					<form:select path="worklineCode">
						<form:option value="" label="-- โปรดเลือก--" />
    					<form:options items="${worklineList}" itemValue="worklineCode" itemLabel="worklineName" />
					</form:select> 
					<span class ="require"  >*</span> <form:errors path="worklineCode" cssClass="require" />
				</td>
			</tr>
	
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td align="left">
					<input class="btn btn-primary" value="<spring:message code="label.button.save"/>" type="submit" onclick="save();">
					<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init();">
				</td>
			</tr>
		</table>
	</div>
</div>
</form:form>	
 
 <script type="text/javascript">
 
 	$(document).ready(function(){
 		
 		var form = document.forms['mainForm']; 
		if(form.oldWorklineCode.value.length > 0){
			$('#mainTitle').text("ข้อมูลสายงานบุคลากร > แก้ไข ");
		}else{
			$('#mainTitle').text("ข้อมูลสายงานบุคลากร > เพิ่ม ");
		}
 	});

	function save (){
		
		var form = document.forms['mainForm']; 
		if(form.oldWorklineCode.value.length > 0){
			form.action ="<%=request.getContextPath()%>/admin/workline/editpersonworkline.htm";
		}else{
			form.action ="<%=request.getContextPath()%>/admin/workline/addpersonworkline.htm";
		}
		
		form.method='POST';	
		form.submit();	
	}
	
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/workline/listpersonworkline.htm";
		form.method='GET';	
		form.submit();	
	}
</script>