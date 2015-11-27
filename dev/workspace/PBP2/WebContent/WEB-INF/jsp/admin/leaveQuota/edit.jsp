<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<form:form
	modelAttribute="leaveYearQuota" action="edit.htm" method="POST"
	name="mainForm">
<div class="post">
	<h2 class="title">สิทธิ์การลาประจำปี  </h2>
	<div class="entry">
			<div>
				<table class="tableSearchResult">
					<thead class="tableHeader">
						<tr>
							<th class="headerTH">ประเภทการลา</th>
							<th class="headerTH">สิทธิ์(จำนวนวัน)</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${leaveYearQuota.leaveTypeList}" var="domain" varStatus="row">
							<tr>
								<td width="80%" class="text"><c:out value="${domain.name}"/></td>
								<td align="right">
									<form:hidden path="leaveTypeList[${row.index}].code"/>
									<form:input cssClass="input-short" path="leaveQuoList[${row.index}].quota" onkeypress="return isNumberKey(event)"/>
									<span class="require">*</span><form:errors path="leaveQuoList[${row.index}].quota" cssClass="require" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<table>
				<tr>
					<td align="center">
						<input value="<spring:message code="label.button.save"/>" class="btn btn-primary" type="submit" onclick="edit();">
						 
					</td>
				</tr>
			</table>
		</div>
</div>
<form:hidden path="leaveYearQuotaId"/>
<form:hidden path="year"/>
<form:hidden path="action"/>
</form:form>
 
 <script type="text/javascript">
 	
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/leaveQuota/init.htm";
		form.method='GET';	
		form.submit();	
	}

	function edit() {
		return true;
	}
</script>