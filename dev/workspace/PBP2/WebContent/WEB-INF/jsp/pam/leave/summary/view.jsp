<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page import="com.buckwa.util.BuckWaDateUtils"%>
<form:form action="init.htm" method="POST" name="mainForm">
<div class="post">
	<h2 class="title">สิทธิ์การลาประจำปี</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
			<table>
				<tr>
					<td width="25%" class="label-form">ประจำปี : ${year}</td>
				</tr>
			</table>
			<div class="line">&nbsp;</div>
			<div style="clear: both;">&nbsp;</div>
			<div>
				<table class="tableSearchResult">
					<thead class="tableHeader">
						<tr>
							<th class="headerTH">ประเภทการลา</th>
							<th class="headerTH">สิทธิ์ในการลา</th>
							<th class="headerTH">ใช้ไปแล้ว</th>
							<th class="headerTH">คงเหลือ</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${summaryLeaves}" var="domain" varStatus="row">
							<tr>
								<td width="55%" class="text"><c:out value="${domain.leaveName}"/></td>
								<td width="15%" align="right" class="text"><c:out value="${domain.total}"/></td>
								<td width="15%" align="right" class="text"><c:out value="${domain.amount}"/></td>
								<td width="15%" align="right" class="text"><c:out value="${domain.balance}"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
</div>
</form:form>