<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.buckwa.domain.*"%>
<%@ page import="java.util.*"%>
<form:form modelAttribute="leave" action="search.htm" method="POST" name="mainForm">
<div class="post">
	<h2 class="title">สถานะการลา</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table width="100%" id="tableSearch">
			<tr>
				<td class="label-form">ประเภทการลา:</td>
				<td>
					<form:select path="leaveTypeCode" id="leaveTypeCode">
							<form:option value="" label="--- กรุณาเลือกประเภทการลา ---" /> 
							<form:options items="${leave.leaveTypes}" itemValue="code" itemLabel="name" />
					</form:select>
				</td>
				<td class="label-form">รหัสเอกสาร:</td>
				<td><form:input cssClass="input" path="docNo"/></td>
			</tr>
			<tr>
				<td class="label-form">ชื่อ:</td>
				<td><form:input cssClass="input" path="firstName"/></td>
				<td class="label-form">นามสกุล:</td>
				<td><form:input cssClass="input" path="lastName"/></td>
			</tr>
			<tr>
				<td colspan="4" align="center"><input value="<spring:message code="label.button.search"/>" type="submit" class="btn btn-primary"></td>
			</tr>
		</table>
		<div class="line">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
		<div>
				<pg:pager url="search.htm"
					items="${pagingBean.totalItems}"
					maxPageItems="${pagingBean.maxPageItems}"
					maxIndexPages="${pagingBean.maxIndexPages}" isOffset="<%= true %>"
					export="offset,currentPageNumber=pageNumber" scope="request">
				<pg:param name="maxPageItems" />
				<pg:param name="maxIndexPages" />
				<pg:param name="officerApprove" value="${leave.officerApprove}"/>
				<pg:param name="leaveTypeCode" value="${leave.leaveTypeCode}"/>
				<pg:param name="firstName" value="${leave.firstName}"/>
				<pg:param name="lastName" value="${leave.lastName}"/>
		
				<table class="tableSearchResult">
					<thead class="tableHeader">
						<tr>
							<th class="headerTH">รหัสเอกสาร</th>
							<th class="headerTH">ประเภทการลา</th>
							<th class="headerTH">ชื่อผู้ยื่นลา</th>
							<th class="headerTH">จากวันที่</th>
							<th class="headerTH">ถึงวันที่</th>
							<th class="headerTH">สถานะ</th>
							<th class="headerTH">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<c:if
							test="${empty pagingBean.currentPageItem && doSearch == 'true' }">
							<tr class="row">
								<td colspan="7" class="row" align="center">
									<div class="searchNotFound"><spring:message code="message.searchNotFound" /></div>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${pagingBean.currentPageItem}" var="domain">
							<tr class="row">
								<td align="left"><c:out value="${domain.docNo}" /></td>
								<td align="left"><spring:message code="${domain.leaveTypeCode}"/>&nbsp;<spring:message code="${domain.cancelMsg}"/></td>
								<td align="left"><c:out value="${domain.ownerFullName}"/></td>
								<td align="center"><c:out value="${domain.fromDateStr}"/></td>
								<td align="center"><c:out value="${domain.toDateStr}"/></td>
								<td align="left"><spring:message code="${domain.flowStatus}"/></td>
								<c:if test="${leave.officerApprove == 'true'}">
									<td align="center" width="5%"><a href="<%=request.getContextPath()%>/leave/viewByOfficer.htm?leaveFlowId=<c:out value="${domain.leaveFlowId}"/>">
								</c:if>
								<c:if test="${leave.officerApprove == 'false'}">
									<td align="center" width="5%"><a href="<%=request.getContextPath()%>/leave/view.htm?leaveFlowId=<c:out value="${domain.leaveFlowId}"/>">
								</c:if>
								<img src="<c:url value="/images/view.jpg"/>" /></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="footerPaging"><pg:index>
					<jsp:include page="/WEB-INF/jsp/common/paging.jsp" flush="true" />
				</pg:index></div>
			</pg:pager>
		</div>
	</div>
</div>
<form:hidden path="officerApprove"/>
</form:form>

<script type="text/javascript">
	function init (){
		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/leave/init.htm";
		form.method='POST';	
		form.submit();	
	}

	function view(){
		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/leave/view.htm";
		form.method='POST';	
		form.submit();
	}

	
</script>
