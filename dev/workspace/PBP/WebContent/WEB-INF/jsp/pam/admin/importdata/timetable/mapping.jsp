<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="importData"  action="userMapping.htm" method="POST" name="mainForm">
<div class="post">
	<h2 class="title">ตารางสอน</h2>
	<div class="entry">
		<div>
			<table width="100%">
				<tr>
					<td class="label-form">ปีการศึกษา: <c:out value="${year}"/><form:hidden path="yearId"/></td>
				</tr>	
				<tr>
					<td class="label-form">เทอมการศึกษา: <c:out value="${semester}"/> <form:hidden path="semesterId"/></td>
				</tr>	
			</table>
			<div class="line">&nbsp;</div>
			<table width="100%">
				<tr>
					<td class="label-form">อาจารย์ (งานทะเบียน):</td>
					<td>
						<select id="userId1" style="width:150px;">
							<option value="0">--- กรุณาเลือก---</option>
							<c:forEach items="${personList}" var="domain" varStatus="row">
								<option value="${domain.userId}"><c:out value="${domain.fullName}"/></option>
							</c:forEach>
						</select>
					</td>
					<td class="label-form">อาจารย์ (ตารางสอน):</td>
					<td>
						<select id="userId2" style="width:150px;">
							<option value="0">--- กรุณาเลือก---</option>
							<c:forEach items="${teacherList}" var="domain" varStatus="row">
								<option value="${domain.userId}"><c:out value="${domain.fullName}"/></option>
							</c:forEach>
						</select>
					</td>
					<td>
						<a href="#" onclick="createAttr();return false;" rel="notLoading"><img src="<c:url value="/images/plus.jpg"/>" alt="<spring:message code="label.button.new"/>"/></a>
					</td>
				</tr>
			</table>
			<div id="attrScreen">
				<ul id="attr" class="attr-ul">
					<c:forEach items="${importData.personMappingList}" var="domain" varStatus="row"> 
						<li class="attr-li" id="attrli-${row.index}">ชื่อ อาจารย์ &nbsp;
							<c:out value="${domain.fullName1}"/>
							ผูกกับ  &nbsp;
							<c:out value="${domain.fullName2}"/>
							<form:hidden path="personMappingList[${row.index}].userId1" id="userId1${row.index}"/>
							<form:hidden path="personMappingList[${row.index}].userId2" id="userId2${row.index}"/>
							<a href="#" onclick="removeAttr(${row.index});return false;" rel="notLoading">
							<img src="<c:url value="/images/delete.png"/>" alt='ลบ'/></a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<br/>
			<table>
				<tr>
					<td align="center">
						<input value="<spring:message code="label.button.new"/>" class="btn btn-primary" type="button" onclick="create();" rel="notLoading">
						<input id="cancelBtn" class="btn btn-primary" value="<spring:message code="label.button.cancel"/>" type="button">
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>
<form:hidden path="classRoomProcessId"/>
</form:form>

 <script>
	
	$(document).ready(function(){
		$("#yearId").change(function(){
				
			var form = document.forms['mainForm']; 
			form.action ="<%=request.getContextPath()%>/admin/importdata/timetable/getSemester.htm";
			form.method='POST';	
			form.submit();
		});

		$("#cancelBtn").click(function(){
			document.location.href="<%=request.getContextPath()%>/admin/importdata/timetable/initTimeTableHistory.htm";
		});
	});

	var index='<c:out value="${fn:length(importData.personMappingList)}" />';
	var delBtn='<c:url value="/images/delete.png"/>';

	function createAttr(){
		
		var userName1 = $("#userId1 option:selected").text();
		var userName2 = $("#userId2 option:selected").text();
		var userId1 = $("#userId1 option:selected").val();
		var userId2 = $("#userId2 option:selected").val();
		if(userId1!=0 && userId2!=0){
			$("#attr").append("<li class='attr-li' id='attrli-"+index+"'>ชื่อ อาจารย์ &nbsp;"+userName1+"&nbsp;ผูกกับ  &nbsp;"+userName2+"<input type='hidden' name='personMappingList["+index+"].fullName1' id='fullName1"+index+"' value='"+userName1+"'/><input type='hidden' name='personMappingList["+index+"].fullName2' id='fullName2"+index+"' value='"+userName2+"'/><input type='hidden' name='personMappingList["+index+"].userId1' id='userId1"+index+"' value='"+userId1+"'/><input type='hidden' name='personMappingList["+index+"].userId2' id='userId2"+index+"' value='"+userId2+"'/>&nbsp;&nbsp;<a href='#' onclick='removeAttr("+index+");return false;' rel='notLoading'><img src="+delBtn+" alt='ลบ'/></a></li>");
			$("#userId1").find('option:selected').remove();
			$("#userId2").find('option:selected').remove();		
			index++;
		}else{
			alert("กรุณาเลือกอาจารย์");
		}
	}
	function removeAttr(indexli){
		$('#userId1').append('<option value="'+$("#userId1"+indexli).val()+'" selected="selected">'+$("#fullName1"+indexli).val()+'</option>');
		$('#userId2').append('<option value="'+$("#userId2"+indexli).val()+'" selected="selected">'+$("#fullName2"+indexli).val()+'</option>');
		$("#attrli-"+indexli).remove();
	}


	function create() {
		if($("#attr > li").length==0){
			alert("กรุณาเลือกอาจารย์");
		}else{
			openWaiting();
			var form = document.forms['mainForm']; 
			form.action ="<%=request.getContextPath()%>/admin/importdata/timetable/userMapping.htm";
			form.method='POST';	
			form.submit();
		}
		
	}
</script>
 