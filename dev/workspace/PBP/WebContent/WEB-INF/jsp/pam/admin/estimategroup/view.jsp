<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<form:form modelAttribute="estimateGroup" action="init.htm" method="POST" name="mainForm">
<div class="post">
	<h2 class="title">กำหนดสิทธิ์การประเมิน > แสดง</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
			<table id="mainScreen">
				<tr>
					<td class="label-form">ชื่อกลุ่ม :</td>
					<td><form:input cssClass="input" path="name" id="name" disabled="true"/>
					</td>
				</tr>
			</table>
			<table class="byUserSection">
				<tr>
					<td class="label-form" align="center">ผู้ประเมิน</td>
					<td>&nbsp;</td>
					<td class="label-form" align="center">ผู้ถูกประเมิน</td>
				</tr>
				<tr>
					<td valign="top">
						<ul id="byUser" class="attr-ul">
							<c:forEach items="${estimateGroup.estimateByUserList}" var="domain" varStatus="row"> 
								<li class="attr-li">
									<c:out value="${domain.person.fullName}"></c:out>
								</li>
							</c:forEach>
							<c:forEach items="${estimateGroup.estimateByUserAdditionalList}" var="domain" varStatus="row"> 
								<li class="attr-li">
									<c:out value="${domain.person.fullName}"></c:out>
								</li>
							</c:forEach>
						</ul>
					</td>
					<td style="border-left: 1px solid #CCCCCC; padding: 5px;"></td> 
					<td valign="top">
						<ul id="user" class="attr-ul">
							<c:forEach items="${estimateGroup.estimateUserList}" var="domain" varStatus="row"> 
								<li class="attr-li">
									<c:out value="${domain.person.fullName}"></c:out>
								</li>
							</c:forEach>
						</ul>
					</td>
				</tr>
			</table>
			<br/>
			<table>
				<tr>
					<td align="center">
						<input value="<spring:message code="label.button.edit"/>" class="btn btn-primary" type="button" onclick="edit();">
						<input class="btn btn-primary" value="<spring:message code="label.button.cancel"/>" type="button" onclick="init();">
					</td>
				</tr>
			</table>
		</div>
</div>
</form:form>

<script type="text/javascript">

	function init (){
		window.location.href="<%=request.getContextPath()%>/admin/estimategroup/init.htm";
	}

	function edit() {
		window.location.href="<%=request.getContextPath()%>/admin/estimategroup/edit.htm?estimateGroupId=${estimateGroup.estimateGroupId}";
	}
	
</script>