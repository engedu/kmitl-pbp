<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="importData" action="search.htm" method="POST" name="mainForm">
<div class="post">
	<h2 class="title">ตารางสอน</h2>
	<div class="entry">
		<div>
			<table width="100%">	
				<tr>	
					<td align="right"><input type="button" class="btn btn-primary" value="นำเข้าข้อมูล" onclick="initTimeTable();"/></td>
				</tr>	
			</table>
		</div>
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
							<th class="headerTH">ปีการศึกษา</th>
							<th class="headerTH">เทอมการศึกษา</th>
							<th class="headerTH">สร้างเมื่อ</th>
							<th class="headerTH">สร้างโดย</th>
							<th class="headerTH">ดำเนินการ</th>
						</tr>
					</thead>
					<tbody>
						<c:if
							test="${empty pagingBean.currentPageItem && doSearch == 'true' }">
							<tr class="row">
								<td colspan="4" class="row" align="center">
									<div class="searchNotFound"><spring:message code="message.searchNotFound" /></div>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${pagingBean.currentPageItem}" var="domain" varStatus="status">
							<tr class="row">
									<td align="center"><c:out value="${domain.year}" /></td>
									<td align="center"><c:out value="${domain.semester}" /></td>
									<td align="center"><c:out value="${domain.createDateStr}"/></td>
									<td align="left"><c:out value="${domain.createBy}"/></td>
									<c:if test="${domain.flag==0}">
										<td align="center"><a href="<%=request.getContextPath()%>/admin/importdata/timetable/process.htm?classRoomProcessId=<c:out  value="${domain.classRoomProcessId}"/>" >ประมวลผล</a></td>
									</c:if>
									<c:if test="${domain.flag==1}">
										<td align="center"><a href="<%=request.getContextPath()%>/admin/importdata/timetable/userMapping.htm?classRoomProcessId=<c:out  value="${domain.classRoomProcessId}"/>">ผูกความสัมพันธ์</a></td>
									</c:if>
									<c:if test="${domain.flag==2}">
										<td align="center">-</td>
									</c:if>
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
 
 <script>
	
 	function initTimeTable(){		
		document.location.href= "<%=request.getContextPath()%>/admin/importdata/timetable/initTimeTable.htm";
	}
	
	function showHistory(){
		document.location.href="<%=request.getContextPath()%>/admin/importdata/timetable/initTimeTableHistory.htm";
	}

	
</script>
 