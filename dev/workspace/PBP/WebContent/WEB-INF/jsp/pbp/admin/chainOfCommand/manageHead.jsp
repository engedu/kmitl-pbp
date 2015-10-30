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
<form:form modelAttribute="chainOfCommandWrapper"	action="searchHead.htm" method="POST" name="mainForm">  
<div class="post">
	 
	<div class="entry">
	
		 <div class="pbptableWrapper">
            
           
           	
		<div style="clear: both;">&nbsp;</div>
		<table width="100%" id="tableSearch">
			<thead><tr><th colspan="4">
			<div class="pbp-header"><span class="lsf-icon colororange" title="list"></span> หัวหน้าภาควิชา   ${chainOfCommandWrapper.department.name} ประจำปี  ${chainOfCommandWrapper.academicYear}    
            	  ${chainOfCommandWrapper.head.thaiName}   ${chainOfCommandWrapper.head.thaiSurname}   </div>
           </div>
			
			</th></tr></thead>
			<tr>	
				<td class="label-form">
					ชื่อผู้เข้าใช้ระบบ:
				</td>
				<td>
					<form:input cssClass="input" path="user.username" />  					 
				</td>
				 <td class="label-form">
					ชื่อ - นามสกุล:
				</td>
				<td>
					<form:input cssClass="input" path="user.firstLastName" />  
					<input class="btn btn-primary" value="<spring:message code="label.button.search"/>" type="submit"> 
				</td>
	 
			</tr>
		</table>
		<div class="line">&nbsp;</div>
 
		<div>
				<pg:pager url="searchHeadNextPage.htm"
					items="${pagingBean.totalItems}"
					maxPageItems="${pagingBean.maxPageItems}"
					maxIndexPages="${pagingBean.maxIndexPages}" isOffset="<%= true %>"
					export="offset,currentPageNumber=pageNumber" scope="request">
				<pg:param name="maxPageItems" />
				<pg:param name="maxIndexPages" />
		
		
		    <div class="pbptableWrapper"> 
			<table class="pbp-table">
				<thead>
					<th class="thFirst">ชื่อผู้เข้าใช้ระบบ</th>
					<th class="thFirst">ชื่อ - นามสกุล</th>
					<th class="thFirst">ภาควิชา</th>
					<th class="thFirst">ประเภท</th>
					<th class="thFirst">ปีการศึกษา</th>
					<th class="thFirst">กำหนดหัวหน้าภาควิชา</th>
				</thead>	
 
					<tbody>
						<c:if
							test="${empty pagingBean.currentPageItem && doSearch == 'true' }">
							<tr  >
								<td colspan="3" class="row" align="center">
									<div class="searchNotFound"><spring:message code="message.searchNotFound" /></div>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${pagingBean.currentPageItem}" var="domain" varStatus="status">
							<tr  >
								<td class="tdFirst"><c:out value="${domain.username}" />&nbsp;</td>
								<td class="tdFirst" ><c:out value="${domain.firstLastName}" />&nbsp;</td>
				  				<td class="tdFirst" ><c:out value="${domain.departmentDesc}" />&nbsp;</td>
				  				<td class="tdFirst" ><c:out value="${domain.employeeType}" />&nbsp;</td>
				  				<td class="tdFirst" ><c:out value="${domain.academicYear}" />&nbsp;</td>
								<td class="tdFirst">
								<a onclick="openWaiting()" href="<%=request.getContextPath()%>/admin/pbp/chainOfCommand/assignToHead.htm?userName=<c:out value="${domain.username}"/>">
								กำหนดหัวหน้าภาควิชา   </a></td> 
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				
				<br>
				
				<div class="footerPaging"><pg:index>
					<jsp:include page="/WEB-INF/jsp/common/paging.jsp" flush="true" />
				</pg:index></div>
			</pg:pager>
		</div>
	</div>
</div></div>
</form:form>

<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/user/init.htm";
		form.method='GET';	
		form.submit();	
	}
 
</script>
	