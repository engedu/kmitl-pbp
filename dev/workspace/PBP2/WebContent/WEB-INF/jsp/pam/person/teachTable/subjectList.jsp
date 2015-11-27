<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.buckwa.domain.*"%>
<%@ page import="java.util.*"%>
<form:form modelAttribute="subject" action="searchSubject.htm" method="POST" name="mainForm">
<div class="post">
	<h2 class="title">รายวิชาการสอนประจำปี</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table width="100%" id="tableSearch">
			<tr>
				<td class="label-form">ปีการศึกษา:</td>
				<td>
					<form:select path="yearId" id="yearId">
							<form:option value="" label="--- กรุณาเลือกปีการศึกษา---" /> 
							<form:options items="${yearList}" itemValue="yearId" itemLabel="name" />
					</form:select>
				</td>
				<td class="label-form">เทอม:</td>
				<td>
					<form:select path="semesterId" id="semesterId">
							<form:option value="" label="--- กรุณาเลือกเทอมการศึกษา ---" /> 
							<form:options items="${semesterList}" itemValue="semesterId" itemLabel="name" />
					</form:select>
				</td>
				<td>
					<input value="<spring:message code="label.button.search"/>" type="submit" class="btn btn-primary" onclick="openWaiting();">
				</td>
				
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
		
				<table class="tableSearchResult">
					<thead class="tableHeader">
						<tr>
							<th class="headerTH">ปีการศีกษา</th>
							<th class="headerTH">เทอม</th>
							<th class="headerTH">หลักสูตร</th>
							<th class="headerTH">รหัสวิชา</th>
							<th class="headerTH">รายวิชา</th>
							<th class="headerTH">ดูข้อมูล</th>
						</tr>
					</thead>
					<tbody>
						<c:if
							test="${empty pagingBean.currentPageItem}">
							<tr class="row">
								<td colspan="7" class="row" align="center">
									<div class="searchNotFound"><spring:message code="message.searchNotFound" /></div>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${pagingBean.currentPageItem}" var="domain">
							<tr class="row">
								<td align="center" width="10%"><c:out value="${domain.year}" /></td>
								<td align="center" width="5%"><c:out value="${domain.semester}" /></td>
								<td align="left"><spring:message code="${domain.degree}" /></td>
								<td align="center"><c:out value="${domain.code}"/></td>
								<td align="left"><c:out value="${domain.nameTh}"/></td>
								<td align="center" width="5%"><a href="<%=request.getContextPath()%>/pam/person/teachtable/subjectView.htm?subjectId=<c:out value="${domain.subjectId}"/>&degree=<c:out value="${domain.degreeType}"/>"><img src="<c:url value="/images/view.jpg"/>" /></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<div class="footerPaging"><pg:index>
					<jsp:include page="/WEB-INF/jsp/common/paging.jsp" flush="true" />
				</pg:index></div>
			</pg:pager>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	$("#yearId").change(function(){
		openWaiting();	
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/pam/person/teachtable/getSemester.htm";
		form.method='POST';	
		form.submit();
	});
});
</script>
</form:form>
