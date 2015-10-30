<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form:form modelAttribute="workPerson" action="edit.htm" method="POST" name="mainForm" enctype="multipart/form-data">
<div class="post">
	<h2 class="title">ผลงาน > แก้ไข</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
			<table>
				<tr>
					<td class="label-form">ชื่อผลงาน :</td>
					<td>
						<form:input cssClass="input" path="name"/><span class="require">*</span>
						<form:errors path="name" cssClass="require" />
					</td>
				</tr>
				<c:forEach items="${workPerson.workPersonAttrList}" var="domain" varStatus="row"> 
					<tr>
						<td class="label-form"><c:out value="${domain.label}"/> :</td>
						<td>
							<form:hidden path="workPersonAttrList[${row.index}].label"/>
							<c:if test="${domain.isFile==0}">
								<form:input cssClass="input" path="workPersonAttrList[${row.index}].value" id="workPersonAttrList[${row.index}].value" />
							</c:if>
							<c:if test="${domain.isFile==1}">
								<form:input cssClass="input" path="workPersonAttrList[${row.index}].value" id="workPersonAttrList[${row.index}].value" onkeypress="return isNumberKey(event)" />
							</c:if>
							
							&nbsp; <span class="label-form"><c:out value="${domain.unitName}"/></span>
							<form:hidden path="workPersonAttrList[${row.index}].unitId"/>
							<form:hidden path="workPersonAttrList[${row.index}].isFile"/>
							<form:hidden path="workPersonAttrList[${row.index}].flagCalculate"/>
						</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${not empty workPerson.workPersonAttrMappingList}">
			<div class="line">&nbsp;</div>
			<div style="clear: both;">&nbsp;</div>
			<div>
				<table width="100%">
					<tr>
						<td class="label-form">แนบไฟล์:</td>
						<td>
							<form:input path="fileData" id="image" type="file" cssClass="input" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="btn btn-primary" value="อัพโหลด" type="button" onclick="validateUpload();" />
						</td>
					</tr>
					<tr>
						<td class="label-form">ผูกกับคุณลักษณะ:</td>
						<td class="text">
							<form:select path="workPersonAttrMappingId" id="workPersonAttrMappingId">
								<form:options items="${workPerson.workPersonAttrMappingList}" itemValue="workPersonAttrId" itemLabel="label" />
							</form:select>
							<span class="require">*</span><form:errors path="workPersonAttrMappingId" cssClass="require" />
						</td>
					</tr>
				</table>
			</div>
			<table class="tableSearchResult">
			<thead class="tableHeader">
			<tr>
				<th class="headerTH" width="30px">ที่</th>
				<th class="headerTH" width="150px">ชื่อไฟล์</th>
				<th class="headerTH" width="80px">ผูกกับคุณลักษณะ</th>
				<th class="headerTH" width="70px">ดาวน์โหลด</th>
				<th class="headerTH" width="30px">ลบ</th>
			</tr>
			</thead>
			<c:forEach items="${workPerson.fileLocationList}" var="file" varStatus="status">
			<tr class="row">
				<td align="center">${status.count}</td>
				<td align="left" ><c:out value="${file.fileName}${file.fileExtension}" /></td>
				<td align="left" ><c:out value="${file.label}" /></td>
				<td align="center">
					<a href="<%=request.getContextPath()%>/pam/work/downloadFile.htm?fileCode=<c:out value="${file.fileCode}"/>" >
						<img src="<c:url value="/images/open.png"/>" style="height: 15px; width: 30px; "/>
					</a>
				</td>
				<td align="center" >
					<a href="#" onclick="validateDelete('<c:out value="${file.fileName}${file.fileExtension}"/>', '<c:out value="${file.fileCode}"/>')" >
						<img src="<c:url value="/images/delete.png"/>"/>
					</a>
				</td>
			</tr>
			</c:forEach>
			</table>
			</c:if>
			<br>
			<br>
			<table>
				<tr>
					<td align="center">
						<input value="<spring:message code="label.button.save"/>" class="btn btn-primary" type="submit" id="saveBtn">
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
function validateUpload (){		
	
	var form = document.forms['mainForm']; 
	form.action ="<%=request.getContextPath()%>/pam/work/uploadFile.htm";
	form.method = 'POST';
	form.submit();
}

function validateDelete (fileName, fileCode){
	var flag = confirm('ยืนยันที่จะลบไฟล์  ' + fileName + ' ?');
	if (flag) {
		
		window.location ="<%=request.getContextPath()%>	/pam/work/deleteFile.htm?fileCode=" + fileCode;
	}
}

	$(document).ready( function() {
		$("#saveBtn").click(function(){
			
			return true;
		});
	
		$("#cancelBtn").click(function(){
			var form = document.forms['mainForm']; 
			form.action ="<%=request.getContextPath()%>/pam/work/init.htm";
			form.method = 'POST';
			form.submit();
		});
	
	});

</script>