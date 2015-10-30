<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<form:form modelAttribute="estimateGroup" action="edit.htm" method="POST" name="mainForm">
<div class="post">
	<h2 class="title">กำหนดสิทธิ์การประเมิน > แก้ไข</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
			<table id="mainScreen">
				<tr>
					<td class="label-form">ชื่อกลุ่ม :</td>
					<td><form:input cssClass="input" path="name" id="name" /><span class="require">*</span>
					<form:errors path="name" cssClass="require" /></td>
				</tr>
			</table>
			<table class="byUserSection" style="display: none">
				<tr>
					<td class="label-form" align="left">หน่วยงาน : <form:select path="faculty" id="faculty">
							<form:option value="0" label="--- หน่วยงาน ---" /> 
							<form:options items="${estimateGroup.facultyList}" itemValue="code" itemLabel="name" />
						</form:select>
					</td>
				</tr>
			</table>
			<table class="byUserSection" style="display: none">
				<tr>
					<td class="label-form" align="center">ผู้ประเมิน</td>
					<td>&nbsp;</td>
					<td class="label-form" align="center">ผู้ถูกประเมิน</td>
				</tr>
				<tr>
					<td valign="top">
						<ul id="byUser" class="attr-ul">
							<li class="attr-li" faculty="-1"><input type="checkbox" id="byUserAllChk">เลือกทั้งหมด</li>
							<c:forEach items="${estimateGroup.personByUserList}" var="domain" varStatus="row"> 
								<li class="attr-li" faculty="${domain.faculty}">
									<form:checkbox path="estimateByUserList[${row.index}].userId" faculty="${domain.faculty}"  id="byUserli-${domain.userId}" value="${domain.userId}"/>
									<form:hidden path="estimateByUserList[${row.index}].estimateGroupId"/>
									<c:out value="${domain.fullName}"></c:out>
								</li>
							</c:forEach>
						</ul>
					</td>
					<td style="border-left: 1px solid #CCCCCC; padding: 5px;"></td> 
					<td valign="top">
						<ul id="user" class="attr-ul">
							<li class="attr-li" faculty="-1"><input type="checkbox" id="userAllChk">เลือกทั้งหมด</li>
							<c:forEach items="${estimateGroup.personUserList}" var="domain" varStatus="row"> 
								<li class="attr-li" faculty="${domain.faculty}">
									<c:if test="${empty domain.estimateGroupName}">
										<form:checkbox path="estimateUserList[${row.index}].userId" faculty="${domain.faculty}" id="userli-${domain.userId}" value="${domain.userId}" cssClass=""/>
									</c:if>
									<c:if test="${!empty domain.estimateGroupName}">
										<form:checkbox path="estimateUserList[${row.index}].userId" faculty="${domain.faculty}" id="userli-${domain.userId}" value="${domain.userId}" disabled="true" cssClass="notchange"/>
									</c:if>
									<form:hidden path="estimateUserList[${row.index}].estimateGroupId"/>
									<c:out value="${domain.fullName}"></c:out>
									<c:if test="${!empty domain.estimateGroupName}">
										(เป็นผู้ถูกประเมินในกลุ่ม  :<c:out value="${domain.estimateGroupName}"></c:out>)
									</c:if>
								</li>
							</c:forEach>
						</ul>
					</td>
				</tr>
			</table>
		</div>
</div>
<div class="post" id="additionalPanel" style="display:none">
	<h1 class="title">เพิ่มผู้ประเมินจากหน่วยงานอื่น</h1>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table>
				<tr>
					<td class="label-form" align="left" colspan="3">
						ค้นหาชื่อ : <input type="text" name="namePerson" class="input" id="namePerson"/>&nbsp;<input  type="button" id="searchBtn" value="ค้นหา"/>
					</td>
				</tr>
				<tr>
					<td valign="top">
							<ul id="byAddtionalUser" class="attr-ul">
								<c:forEach items="${estimateGroup.personByUserList}" var="domain" varStatus="row"> 
									<li class="attr-li" rel="userAdditional" style="display:none" facultyAddtional="${domain.faculty}" fullname="${domain.fullName}">
										<c:out value="${domain.fullName}"></c:out> &nbsp;<input  type="button" rel="addBtn" value="เลือก" userid="${domain.userId}"/>
									</li>
								</c:forEach>
							</ul>
					</td>
				</tr>
			</table>
			<div style="clear: both;">&nbsp;</div>
			<table>
				<tr>
					<td class="label-form" align="left" colspan="3">
						รายชื่อที่เลือก
					</td>
				</tr>
				<tr>
					<td valign="top">
						<ul class="attr-ul">
							<c:forEach items="${estimateGroup.personByUserList}" var="domain" varStatus="row"> 
								<li class="attr-li" style="display:none">
									<form:checkbox path="estimateByUserAdditionalList[${row.index}].userId" id="byAdditionalUserSelectedli-${domain.userId}"  value="${domain.userId}" />
									<form:hidden path="estimateByUserAdditionalList[${row.index}].estimateGroupId"/>
									<c:out value="${domain.fullName}"></c:out>&nbsp;<input  type="button" rel="delBtn" value="ลบ" userid="${domain.userId}"/>
								</li>
							</c:forEach>
						</ul>
					</td>
				</tr>
			</table>
	</div>
</div>
<div class="post">
	<div class="entry">
	<table>
		<tr>
			<td align="center">
				<input value="<spring:message code="label.button.save"/>" class="btn btn-primary" type="submit" onclick="create();">
				<input class="btn btn-primary" value="<spring:message code="label.button.cancel"/>" type="button" onclick="init();">
				<input class="btn btn-primary" id="mainBtn" value="ย้อนกลับ" type="button" style="display:none"/>
				<input class="btn btn-primary" id="byUserBtn" value="กำหนดกลุ่มผู้ประเมิน" type="button"/>
			</td>
		</tr>
	</table>
	</div>
</div>

<form:hidden path="estimateGroupId"/>
</form:form>

<script type="text/javascript">

	function init (){
		window.location.href="<%=request.getContextPath()%>/admin/estimategroup/init.htm";
	}

	function create() {
		return true;
	}
	$(document).ready( function() {


		

		if($("#faculty").val()!="0"){
			$("li[faculty!="+$("#faculty").val()+"]").hide();
			$("li[faculty="+$("#faculty").val()+"]").show();
			$("li[faculty=-1]").show();
		}
		

		$("#byUserBtn").click(function(){
			closeWaiting();
			$(".byUserSection").show();
			$("#mainScreen").hide();
			$(this).hide();
			$("#mainBtn").show();
			if($("#faculty").val()!="0"){
				$("#additionalPanel").show();
				$("li[faculty!="+$("#faculty").val()+"]").hide();
				$("li[faculty="+$("#faculty").val()+"]").show();
				$("li[faculty=-1]").show();
				$("input[id*=byAdditionalUserSelectedli-]:checked").parent().show();
			}
		});

		$("#mainBtn").click(function(){
			closeWaiting();
			$(".byUserSection").hide();
			$("#mainScreen").show();
			$(this).hide();
			$("#byUserBtn").show();
			$("#additionalPanel").hide();
		});

		$("#byUserAllChk").click(function(){
			if($(this).is(':checked')){
				$("#userAllChk").attr("disabled","disabled").removeAttr("checked");
				if($("#faculty").val()!="0")
					$("input[id*=byUserli-][faculty="+$("#faculty").val()+"]").attr("checked","checked");
				else
					$("input[id*=byUserli-]").attr("checked","checked");
				$("input[id*=userli-][class!=notchange]").removeAttr("checked").attr("disabled","disabled");
			}else{
				$("#userAllChk").removeAttr("disabled");
				$("input[id*=byUserli-]").removeAttr("checked");
				$("input[id*=userli-][class!=notchange]").removeAttr("checked").removeAttr("disabled");
			}
		});

		$("input[id*=byUserli-]").click(function(){
			if($("input[id*=byUserli-]:checked").length==$("input[id*=byUserli-]").length){
				$("#byUserAllChk").attr("checked","checked");
			}else{
				$("#userAllChk").removeAttr("disabled");
				$("#byUserAllChk").removeAttr("checked");
			}
			if($(this).is(':checked')){
				$("input[id=userli-"+$(this).val()+"][class!=notchange]").removeAttr("checked").attr("disabled","disabled");
			}else{
				$("input[id=userli-"+$(this).val()+"][class!=notchange]").removeAttr("checked").removeAttr("disabled");
			}
		});

		$("#userAllChk").click(function(){
			if($(this).is(':checked')){
				if($("#faculty").val()!="0")
					$("input[id*=userli-][class!=notchange][faculty="+$("#faculty").val()+"]").attr("checked","checked");
				else
					$("input[id*=userli-][class!=notchange]").attr("checked","checked");
				
				$("input[id*=userli-][class!=notchange]:disabled").removeAttr("checked");
			}else
				$("input[id*=userli-][class!=notchange]").removeAttr("checked");
		});

		$("input[id*=userli-][class!=notchange]").click(function(){
			if($("input[id*=userli-][class!=notchange]:checked").length==$("input[id*=userli-][class!=notchange]").length){
				$("#userAllChk").attr("checked","checked");
			}else{
				$("#userAllChk").removeAttr("checked");
			}
		});

		$("input[id*=byUserli-]").each(function(){
			if($(this).is(':checked'))
				$("input[id=userli-"+$(this).val()+"][class!=notchange]").attr("disabled","disabled");
		});

		$("#faculty").change(function(){
			$("#userAllChk").removeAttr("checked");
			$("#byUserAllChk").removeAttr("checked");
			$("input[id*=byAdditionalUserSelectedli-]").removeAttr("checked").parent().hide();
			$("input[id*=userli-][class!=notchange]").removeAttr("checked");
			$("input[id*=byUserli-]").removeAttr("checked");
			$("input[id*=userli-][class!=notchange]").removeAttr("checked").removeAttr("disabled");
			if($(this).val()!="0"){
				$("#additionalPanel").show();
				$("li[faculty!="+$(this).val()+"]").hide();
				$("li[faculty="+$(this).val()+"]").show();
				$("li[faculty=-1]").show();
			}else{
				$("#additionalPanel").hide();
				$("li[faculty]").show();
				$("input[id*=byAdditionalUserSelectedli-]:checked").removeAttr("checked");
			}
		});

		$("#searchBtn").click(function(){
			var name = $("#namePerson").val().toLowerCase();
			name = $.trim(name);
			$("li[rel=userAdditional]").hide();
			$("li[rel=userAdditional]").each(function(){
				if($(this).attr("fullname").toLowerCase().indexOf(name)>-1){
					var faculty = $(this).attr("facultyAddtional");
					if(faculty!=$("#faculty").val())
						$(this).show();
					
				}
			});
		});

		$("input[rel=addBtn]").click(function(){
			var userid= $(this).attr("userid");
			$("#byAdditionalUserSelectedli-"+userid).parent().show();
			$("#byAdditionalUserSelectedli-"+userid).attr("checked","checked");
		});

		$("input[id*=byAdditionalUserSelectedli-]").click(function(){
			$(this).attr("checked","checked");
		});

		$("input[rel=delBtn]").click(function(){
			var userid= $(this).attr("userid");
			$("#byAdditionalUserSelectedli-"+userid).parent().hide();
			$("#byAdditionalUserSelectedli-"+userid).removeAttr("checked");
		});
	});
</script>