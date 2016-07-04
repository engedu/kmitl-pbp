<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.buckwa.web.util.*" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<form:form modelAttribute="accessLog"	action="search.htm" method="POST" name="mainForm">  
<div class="post"> 
	<div class="entry">
 		 <div class="pbptableWrapper">
            		 
		<table class="pbp-table"> 
			<thead><tr><th colspan="7">
			<div class="pbp-header"><span class="lsf-icon colororange" title="list"></span>Access Log</div>
			</thead></tr></th>
			<tr>	
				<td class="label-form">
					ชื่อผู้เข้าใช้ระบบ:
				</td>
				<td>
					<form:input cssClass="input" path="username" />  					 
				</td>	 
	            <td>
	            	 <form:radiobutton  path="loginStatus"  id="evalNo0"  value="" />&nbsp; ALL &nbsp;&nbsp;
					<form:radiobutton path="loginStatus" id="evalNo1" value="SUCCESS"   />&nbsp;SUCCESS&nbsp;&nbsp;
					<form:radiobutton path="loginStatus" id="evalNo1" value="FAIL"   />&nbsp;FAIL&nbsp;&nbsp;
	            </td>
				 <td rowspan="2">
					 
					<input class="btn btn-primary" value="<spring:message code="label.button.search"/>" type="submit"> 
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
				<table class="pbp-table"> 
					<thead  >
						<tr>
							<th class="thFirst">ชื่อผู้เข้าใช้ระบบ</th>
							<th class="thLast">Status</th>
				 
							 <th class="thLast">IP</th>
							 <th class="thLast">Login Date Time</th>
					  
						</tr>
					</thead>
					<tbody>
						<c:if
							test="${empty pagingBean.currentPageItem && doSearch == 'true' }">
							<tr  >
								<td class="tdLast" colspan="7" class="row" align="center">
									<div class="searchNotFound"><spring:message code="message.searchNotFound" /></div>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${pagingBean.currentPageItem}" var="domain" varStatus="status">
							<tr  >
								<td class="tdLast"><c:out value="${domain.username}" />&nbsp;</td>
								<td class="tdLast"><c:out value="${domain.loginStatus}" />&nbsp;</td>
								
  
		 						<td class="tdLast"><c:out value="${domain.loginIP}" />&nbsp;</td>
		 						<td class="tdLast"><c:out value="${domain.createDateTimeStr}" />&nbsp;</td>
 
		
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
</div>
</form:form>

<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/user/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
 
</script>
	