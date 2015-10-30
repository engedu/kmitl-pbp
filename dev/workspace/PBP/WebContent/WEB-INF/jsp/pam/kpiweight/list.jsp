<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.buckwa.domain.*"%>
<%@ page import="java.util.*"%>

 <form:form modelAttribute="kpiYearMapping" action="search.htm" method="POST" name="mainForm">
		
	<div class="post">
	<h2 class="title">กำหนดน้ำหนักตัวชี้วัดรายปี</h2>
	<div id="kpi-tree">
			<div class="searchFormNoBorder">
				<table width="100%">
					<tr> 
						<td class="label-form" align="right" >ปีการศึกษา :</td>
						<td align="left" width="20%">
							<form:select path="yearId" id="year-dropdown"   >
  									<form:option value="0" label="--- ทั้งหมด---" />   
									<form:options items="${yearList}" itemValue="yearId" itemLabel="name" />
							</form:select> 							
						</td>
				 		 <td class="label-form" align="right" >กลุ่ม KPI:</td>		
						<td width="20%">						
						 <form:select path="categoryId" id="year-dropdown"   >
  									<form:option value="0" label="--- ทั้งหมด---" />   
									<form:options items="${kpiCategoryList}" itemValue="kpiCategoryId" itemLabel="name" />
							</form:select> 
							</td>	 					
					<td>
					<input value="<spring:message code="label.button.search"/>" type="submit" class="btn btn-primary">						
			 				
					</td>			 
					</tr>
				</table>
			</div>

			<div class="line">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
		<div>
				<pg:pager url="search.htm" items="${pagingBean.totalItems}" maxPageItems="${pagingBean.maxPageItems}" maxIndexPages="${pagingBean.maxIndexPages}" isOffset="<%= true %>"
					export="offset,currentPageNumber=pageNumber" scope="request">
				<pg:param name="maxPageItems" />
				<pg:param name="maxIndexPages" />
		
				<table class="tableSearchResult">
					<thead class="tableHeader">
						<tr>
							<th class="headerTH">ปีการศึกษา</th>
							<th class="headerTH">กลุ่มประเมิน</th>
							<!--  
 							<th class="headerTH">แก้ไข </th>
 							-->
 							<th class="headerTH">แก้ไข</th>
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
						<c:forEach items="${pagingBean.currentPageItem}" var="domain">
							<tr class="row">
								<td align="left"><c:out value="${domain.yearName}"/>&nbsp;</td>
								<td align="left"><c:out value="${domain.categoryName}"/>&nbsp;</td>
								<!-- 
 								<td align="left"> 
 								 								<a href="<%=request.getContextPath()%>/admin/kpiweight/kpiweightLevel1.htm?yearId=<c:out value="${domain.yearId}"/>&groupId=<c:out value="${domain.categoryId}"/>">
								View </a>
 								</td>
 								-->
 								<td align="left">
 								
 								<a href="<%=request.getContextPath()%>/admin/kpiweight/kpiweightLevel2.htm?yearId=<c:out value="${domain.yearId}"/>&groupId=<c:out value="${domain.categoryId}"/>">
								แก้ไข </a>
 								
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
</body>


<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/kpi/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
 
 
</script>
