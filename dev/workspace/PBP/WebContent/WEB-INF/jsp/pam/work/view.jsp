<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form modelAttribute="workPerson" action="edit.htm" method="POST" name="mainForm">
<div class="post">
	<h2 class="title">ผลงาน</h2>
	<div class="entry">
	<div style="clear: both;">&nbsp;</div>
		<table>
			<tr>
				<td class="label-form" width="25%">ชื่อผลงาน :</td>
				<td align="left"><c:out value="${workPerson.name}"/></td>
			</tr>
			<c:forEach items="${workPerson.workPersonAttrList}" var="domain" varStatus="row"> 
				<tr>
					<td class="label-form" width="25%"><c:out value="${domain.label}"/> :</td>
					<td>
						<c:out value="${workPerson.workPersonAttrList[row.index].value}" />
						&nbsp;<span class="label-form"><c:out value="${domain.unitName}"/></span>
					</td>
				</tr>
				<c:if test="${!empty workPerson.fileLocationList && domain.isFile==1}">
				<tr>
					<td valign="top"><span class="label-form">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ไฟล์แนบ :</span>&nbsp;</td>
					<td>
						<c:forEach items="${workPerson.fileLocationList}" var="file" varStatus="status">
						<c:if test="${file.workPersonAttrId == domain.workPersonAttrId}">
								<a href="<%=request.getContextPath()%>/pam/work/downloadFile.htm?fileCode=<c:out value="${file.fileCode}"/>" >
									<c:out value="${file.fileName}${file.fileExtension}" />
								</a>
								<br>
						</c:if>
						</c:forEach>
					</td>
				</tr>
				</c:if>
			</c:forEach>
		</table>
		<br>
		<div style="clear: both;">&nbsp;</div>
		<table>
			<tr>
				<td align="center">
					<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" id="cancelBtn">
				</td>
			</tr>
		</table>
	</div>
</div>
<form:hidden path="workPersonId"/>
<form:hidden path="workTemplateId"/>
</form:form>

<script type="text/javascript">

	$(document).ready( function() {
	
		$("#cancelBtn").click(function(){
			window.location = "<%=request.getContextPath()%>/pam/work/init.htm?workTemplateId=${workPerson.workTemplateId}";
		});
	
	});

</script>