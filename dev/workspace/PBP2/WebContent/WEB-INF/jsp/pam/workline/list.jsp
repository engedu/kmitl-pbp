<!--
	@Author : Teerawoot Charoenporn(Tor)
	@Create : Aug 13, 2012 5:27:57 PM
-->
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.buckwa.domain.*"%>
<%@ page import="java.util.*"%>
<form:form modelAttribute="workline" action="search.htm" method="POST" name="mainForm">
<div class="post">
	<h2 class="title"><spring:message code="label.workline"/></h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table width="100%" id="tableSearch">
			<tr>
				<td class="label-form">
					รหัส หรือ ชื่อ:
				</td>
				<td>
					<form:input cssClass="input" path="worklineName" /> <form:errors path="worklineName" cssClass="require" /> 
					<input class="btn btn-primary" value="<spring:message code="label.button.search"/>" type="submit"> 
				</td>
				<td align="right"><input class="btn btn-primary" value="<spring:message code="label.button.new"/>" type="button" onclick="create();"></td>
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
							<th class="headerTH">รหัส</th>
							<th class="headerTH">ชื่อ</th>
							<th class="headerTH"><spring:message code="label.edit" /></th>
							<th class="headerTH"><spring:message code="label.delete" /></th>
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
								<td align="left"><c:out	value="${domain.worklineCode}" />&nbsp;</td>
								<td align="left"><c:out value="${domain.worklineName}" />&nbsp;</td>
								<td align="center">
									<a href="<%=request.getContextPath()%>/admin/workline/edit.htm?id=<c:out value="${domain.id}"/>">
									<img src="<c:url value="/images/edit.png"/>" /> </a>
								</td>
								<td align="center"><a
									href="<%=request.getContextPath()%>/admin/workline/delete.htm?id=<c:out  value="${domain.id}"/>"
										onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.worklineName}"/> ?')">
									<img src="<c:url value="/images/delete.png"/>" /> </a>
								</td>
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
</form:form>

<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/workline/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/workline/create.htm";
		form.method='GET';	
		form.submit();
	}
	    
</script>