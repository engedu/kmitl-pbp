<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<form:form
	modelAttribute="leaveYearQuota" action="init.htm" method="POST"
	name="mainForm">
<div class="post">
	<h2 class="title">สิทธิ์การลาประจำปี > แสดง</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
			<table>
				<tr>
					<td width="25%" class="label-form">ประจำปี :</td>
					<td align="left">${leaveYearQuota.year}</td>
				</tr>
				
			</table>
			<div class="line">&nbsp;</div>
			<div style="clear: both;">&nbsp;</div>
			<div>
				<table class="tableSearchResult">
					<thead class="tableHeader">
						<tr>
							<th class="headerTH">ประเภทการลา</th>
							<th class="headerTH">สิทธิ์(จำนวนวัน)</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${leaveYearQuota.leaveQuoList}" var="domain" varStatus="row">
							<tr>
								<td width="85%" class="text"><c:out value="${domain.leaveTypeName}"/></td>
								<td align="right" class="text"><c:out value="${domain.quota}"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
</div>
<form:hidden path="leaveYearQuotaId"/>
</form:form>
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/leaveQuota/init.htm";
		form.method='GET';	
		form.submit();	
	}
</script>