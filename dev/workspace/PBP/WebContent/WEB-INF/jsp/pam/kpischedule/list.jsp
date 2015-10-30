<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>

<form:form modelAttribute="kpiSchedule" action="search.htm" method="POST" name="mainForm">
<div class="post">
<h2 class="title">กำหนดช่วงเวลาประเมิน</h2>
<div class="entry">
<div style="clear: both;">&nbsp;</div>

<table width="100%" id="tableSearch">
<tr>
	<td class="label-form"></td>
	<td>
<%-- 		<form:input cssClass="input" path="yearName" /> --%>
<%-- 		<form:errors path="yearName" cssClass="require" /> --%>
<%-- 		<input value="<spring:message code="label.button.search"/>" type="submit" class="btn btn-primary"> --%>
	</td>
	<td align="right">
		<input value="<spring:message code="label.button.new"/>" type="button" class="btn btn-primary" onclick="create();">
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
		<th class="headerTH">ปีการศึกษา (พ.ศ.)</th>
       	<th class="headerTH"><spring:message code="label.edit"/></th>
       	<th class="headerTH"><spring:message code="label.delete"/></th>
	</tr>
	</thead>
	<tbody>
	<c:if
		test="${empty pagingBean.currentPageItem && doSearch == 'true' }">
		<tr class="row">
			<td colspan="5" class="row" align="center">
				<div class="searchNotFound"><spring:message code="message.searchNotFound" /></div>
			</td>
		</tr>
	</c:if>
	<c:forEach items="${pagingBean.currentPageItem}" var="domain">
	<tr class="row">
		<td align="left"> <c:out value="${domain.yearName}"/>&nbsp;</td>
		<td align="center">
			<a href="<%=request.getContextPath()%>/admin/kpiSchedule/edit.htm?yearName=<c:out value="${domain.yearName}"/>" >
				<img src="<c:url value="/images/edit.png"/>" />
			</a>
		</td>
		<td align="center">
			<a rel="notLoading"  href="<%=request.getContextPath()%>/admin/kpiSchedule/delete.htm?kpiScheduleId=<c:out value="${domain.kpiScheduleId}"/>" onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.yearName}"/> ?')">
				<img src="<c:url value="/images/delete.png"/>" />
			</a>
		</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	<div class="footerPaging">
	<pg:index>
		<jsp:include page="/WEB-INF/jsp/common/paging.jsp" flush="true" />
	</pg:index>
	</div>
	</pg:pager>
</div>
</div>
</div>
</form:form>

<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm'];
		form.action ="<%=request.getContextPath()%>/admin/kpiSchedule/init.htm";
		form.method='GET';
		form.submit();
	}

	function create (){
		var form = document.forms['mainForm'];
		form.action ="<%=request.getContextPath()%>/admin/kpiSchedule/create.htm";
		form.method='GET';
		form.submit();
	}
</script>
