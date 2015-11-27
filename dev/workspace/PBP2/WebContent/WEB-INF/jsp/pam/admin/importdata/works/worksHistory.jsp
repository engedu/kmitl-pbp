<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="importData"	action="search.htm" method="POST" name="mainForm">

<div class="post">
	<h2 class="title">ผลงาน</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table width="100%" id="tableSearch">
			<tr>	
				<td class="label-form">
					Import Works: 
					&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/admin/importdata/works/initWorks.htm">
						<input type="button" class="btn btn-primary" value="Import"/>
					</a>
					<a href="<%=request.getContextPath()%>/admin/importdata/works/initWorksHistory.htm">
						<input type="button" class="btn btn-primary" value="History"/>
					</a>
				</td>
				
			</tr>
		</table>
		<div class="line">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
		<div>
			<table width="100%">	
				<tr>	
					<td class="label-form">&#3594;&#3639;&#3656;&#3629;&#3652;&#3615;&#3621;&#3660; : </td>
					<td >
						<input class="input"  id="fileName" name="fileName" /> 
						<errors path="fileName" cssClass="require" />
						<input class="btn btn-primary" value="<spring:message code="label.button.search"/>"  type="submit" >
					</td> 
				</tr>	
			</table>
		</div>
		<div class="line">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
		<div>
		<%-- 				<pg:pager url="search.htm" items="${pagingBean.totalItems}" --%>
<%--   					maxPageItems="${pagingBean.maxPageItems}"   --%>
<%--   					maxIndexPages="${pagingBean.maxIndexPages}" isOffset="<%= true %>"  --%>
<%--   					export="offset,currentPageNumber=pageNumber" scope="request">   --%>
<%--   					<pg:param name="maxPageItems" />   --%>
<%--   					<pg:param name="maxIndexPages" />   --%>
						
					<table class="searchResultTable">
						<thead class="tableHeader">
							<tr class="searchResultHeader">
								<th class="headerTH">&#3607;&#3637;&#3656;</th>
								<th class="headerTH">&#3594;&#3639;&#3656;&#3629;&#3652;&#3615;&#3621;&#3660;</th>
								<th class="headerTH">&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;</th>
								<th class="headerTH">&#3604;&#3634;&#3623;&#3609;&#3660;&#3650;&#3627;&#3621;&#3604;</th>
								<th class="headerTH">&#3621;&#3610;</th>
							</tr>
							
						</thead>
						<tbody >
							<c:if
								test="${empty pagingBean.currentPageItem == 'true' }" > 
								<tr>
									<td colspan="4" align="center">
										<div class="searchNotFound">
											<spring:message code="message.searchNotFound" />
									</td>
								</tr>
							</c:if>
							<c:forEach var="domain" items="${pagingBean.currentPageItem}" varStatus="status" >
								<tr class="rgRow">
									<td align="center">${status.count}</td>
									<td align="left"><c:out value="${domain.fileName}${domain.fileExtension}" /></td>
									<td align="center"><c:out value="${domain.fileDesc}" /></td>
									<td align="center"><a href="<%=request.getContextPath()%>/admin/importdata/profile/download.htm?fileCode=<c:out value="${domain.fileCode}"/>" >
									<img src="<c:url value="/images/excel.png"/>" style="height: 15px; width: 15px; "/></a></td>
									<td align="center"><a rel="notLoading" href="<%=request.getContextPath()%>/admin/importdata/profile/delete.htm?fileCode=<c:out value="${domain.fileCode}"/>"
										onclick="return confirmPage('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3607;&#3637;&#3656;&#3592;&#3632;&#3621;&#3610;&#3652;&#3615;&#3621;&#3660; : <c:out value="${domain.fileName}${domain.fileExtension}"/> ?')" >
										<img src="<c:url value="/images/deletered.png"/>" style="height:15px; width: 15px; "/></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
<!-- 					<div class="footerPaging"> -->
<%-- 						<pg:index> --%>
<%-- 							<jsp:include page="/WEB-INF/jsp/common/paging.jsp" flush="true" /> --%>
<%-- 						</pg:index> --%>
<!-- 					</div> -->
<%-- 				</pg:pager> --%>
		</div>
	</div>
</div>
</form:form>

 <script>
	
 
	    
</script>
 