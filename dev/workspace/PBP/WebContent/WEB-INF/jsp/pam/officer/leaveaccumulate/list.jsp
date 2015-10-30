<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<form:form modelAttribute="user"	action="search.htm" method="POST" name="mainForm">  
<div class="post">
	<h2 class="title">ข้อมูลการลาสะสมตั้งต้น </h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table width="100%" id="tableSearch">
			<tr>	
				<td class="label-form">
					ชื่อผู้เข้าใช้ระบบ:
				</td>
				<td>
					<form:input cssClass="input" path="username" />  					 
				</td>
				 <td class="label-form">
					ชื่อ - นามสกุล:
				</td>
				<td>
					<form:input cssClass="input" path="firstLastName" />  
					<input class="btn btn-primary" value="<spring:message code="label.button.search"/>" type="submit"> 
				</td>
				<td align="right">
					 
				</td>
			</tr>
		</table>
		<div class="line">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
		<div>
				<pg:pager url="searchNextPage.htm"
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
							<th class="headerTH">ชื่อ - นามสกุล</th>
							<th class="headerTH">วันลาสะสม</th>			 
							<th class="headerTH">แก้ไข</th>
							 
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
						<c:forEach items="${pagingBean.currentPageItem}" var="domain" varStatus="status">
							<tr class="row">
								<td><c:out value="${domain.username}" />&nbsp;</td>
								<td><c:out value="${domain.firstLastName}" />&nbsp;</td>
			 
								<td><c:out value="${domain.leaveAccumulate}" />&nbsp;</td>
 								 
		
								<td align="center"><a
									href="<%=request.getContextPath()%>/officer/leaveaccumulate/edit.htm?username=<c:out value="${domain.username}"/>">
								<img src="<c:url value="/images/edit.png"/>" /> </a></td>
		
			 
		
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
		form.action ="<%=request.getContextPath()%>/admin/user/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/user/create.htm";
		form.method='GET';	
		form.submit();
	}
</script>
	