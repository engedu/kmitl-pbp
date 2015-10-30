<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.buckwa.domain.*"%>
<%@ page import="java.util.*"%>

<table>
	<tr><td class="label-form">ข้อมูลเพิ่มเติม</td></tr>
</table>
<table class="tableSearchResult">
	<thead class="tableHeader">
		<tr>
			<th class="headerTH">ข้อมูลเพิ่มเติม</th>
			<th class="headerTH">โดย</th>
			<th class="headerTH">เมื่อ</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty leave.leaveComments}">
			<tr class="row">
				<td colspan="7" class="row" align="center">
					<div class="searchNotFound"><spring:message code="message.searchNotFound" /></div>
				</td>
			</tr>
		</c:if>
		<c:forEach items="${leave.leaveComments}" var="domain">
			<tr class="row">
				<td align="left" width="50%"><c:out value="${domain.comment}" /></td>
				<td align="left" width="25%"><c:out value="${domain.createBy}" /></td>
				<td align="center"><c:out value="${domain.createDateStr}" /></td>
				
			</tr>
		</c:forEach>
	</tbody>
</table>

