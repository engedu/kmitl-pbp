<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="kpiCategory"	action="search.htm" method="POST" name="mainForm"> 	 
<div class="post">
	<h2 class="title">กลุ่มตัวชี้วัด</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table width="100%" id="tableSearch">
			<tr>
				<td class="label-form">ชื่อกลุ่มตัวชี้วัด:</td>
				<td><form:input cssClass="input" path="name" />
					<form:errors path="name" cssClass="require" /> <input
					value="<spring:message code="label.button.search"/>" type="submit" class="btn btn-primary">
				</td>
				<td  align="right"><input
					value="<spring:message code="label.button.new"/>" type="button" class="btn btn-primary" onclick="create();"></td>
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
							<th class="headerTH">ประเภทบุคลากร</th>
							<th class="headerTH">ชื่อกลุ่มตัวชี้วัด</th>
							 
							<th class="headerTH"><spring:message code="label.edit" /></th>
							<th class="headerTH"><spring:message code="label.delete" /></th>
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
								<td align="left"> <spring:message code="${domain.employeeType}"/>&nbsp;</td>
			 					<td align="left"> <c:out value="${domain.name}"/>&nbsp;</td>
	 
								<td align="center"><a href="<%=request.getContextPath()%>/admin/kpiCategory/edit.htm?kpiCategoryId=<c:out value="${domain.kpiCategoryId}"/>" >
									<img src="<c:url value="/images/edit.png"/>" /> </a></td>
								<td align="center"><a rel="notLoading" href="<%=request.getContextPath()%>/admin/kpiCategory/delete.htm?kpiCategoryId=<c:out  value="${domain.kpiCategoryId}"/>"  
									onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.name}"/> ?')">
								<img src="<c:url value="/images/delete.png"/>" /> </a></td>
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
		form.action ="<%=request.getContextPath()%>/admin/kpiCategory/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/kpiCategory/create.htm";
		form.method='GET';	
		form.submit();
	}
	 
	    
</script>
 