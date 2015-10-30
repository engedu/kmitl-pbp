<!--
	@Author : Teerawoot Charoenporn(Tor)
	@Create : Aug 19, 2012 1:07:17 PM
-->
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<form:form modelAttribute="person" action="searchpersonworkline.htm" method="POST" name="mainForm">  
<div class="post">
	<h2 class="title">ข้อมูลสายบังคับบุคลากร</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table width="100%" id="tableSearch">
			<tr>	
				<td class="label-form">
					ชื่อผู้เข้าใช้ระบบ:
				</td>
				<td>
					<form:input cssClass="input" path="email" /> <form:errors path="email" cssClass="require" /> 
					<input class="btn btn-primary" value="<spring:message code="label.button.search"/>" type="submit"> 
				</td>
			</tr>
		</table>
		<div class="line">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
		<div>
			<pg:pager url="searchpersonworkline.htm" 
					items="${pagingBean.totalItems}" 
					maxPageItems="${pagingBean.maxPageItems}"
					maxIndexPages="${pagingBean.maxIndexPages}" isOffset="<%= true %>"
					export="offset,currentPageNumber=pageNumber" scope="request">
				<pg:param name="maxPageItems" />
				<pg:param name="maxIndexPages" />
		
				<table class="tableSearchResult">
					<thead class="tableHeader">
						<tr>
							<th class="headerTH">ชื่อผู้เข้าใช้ระบบ</th>
							<th class="headerTH">ชื่อ</th>
							<th class="headerTH">นามสกุล</th>
							<th class="headerTH">ตำแหน่งสายงาน</th>
							<th class="headerTH">แก้ไข</th>
							<th class="headerTH">ลบ</th>
							<th class="headerTH">เพิ่ม</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty pagingBean.currentPageItem && doSearch == 'true' }">
							<tr class="row">
								<td colspan="4" class="row" align="center">
									<div class="searchNotFound"><spring:message code="message.searchNotFound" /></div>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${pagingBean.currentPageItem}" var="domain" varStatus="status">
							<tr class="row">
								<td><c:out value="${domain.email}" />&nbsp;</td>
<%-- 								<td align="center"><c:if test="${domain.enabled == 'true'}"> --%>
<!-- 						 			Active -->
<%-- 						 		</c:if> <c:if test="${domain.enabled != 'true'}"> --%>
<!-- 						 		Inactive -->
<%-- 						 		</c:if></td> --%>
		
								<td align="center"><c:out value="${domain.thaiName}" /></td>
								<td align="center"><c:out value="${domain.thaiSurname}" /></td>
								<td align="center"><c:out value="${domain.worklineName}" /></td>
		
								<td align="center">
									<c:if test="${!empty domain.worklineName}">
										<a href="<%=request.getContextPath()%>/admin/workline/editpersonworkline.htm?
											username=<c:out value="${domain.email}"/>&oldWorklineCode=<c:out value="${domain.worklineCode}"/>">
											<img src="<c:url value="/images/edit.png"/>" /> 
										</a>
									</c:if>
								</td>
								
								<td align="center">
									<c:if test="${!empty domain.worklineName}">
										<a href="<%=request.getContextPath()%>/admin/workline/deletepersonworkline.htm?
											personId=<c:out value="${domain.personId}"/>&worklineCode=<c:out value="${domain.worklineCode}"/>"
											onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.worklineName}"/> ?')">
											<img src="<c:url value="/images/delete.png"/>" /> 
										</a>
									</c:if>
								</td>
								
								<td align="center">
										<a href="<%=request.getContextPath()%>/admin/workline/addpersonworkline.htm?username=<c:out value="${domain.email}"/>">
											<input class="btn btn-primary" value="<spring:message code="label.button.add"/>"  type="button" />
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
		form.action ="<%=request.getContextPath()%>/admin/user/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	function add(userName, worklineCode) {
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/workline/addpersonworkline.htm?username="+userName;
		form.method='GET';	
		form.submit();	
	}
</script>
	