<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.buckwa.web.util.*" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<form:form modelAttribute="user"	action="search.htm" method="POST" name="mainForm">  
<div class="post"> 
	<div class="entry">
 		 <div class="pbptableWrapper">
            		 
		<table class="pbp-table"> 
			<thead><tr><th colspan="7">
			<div class="pbp-header"><span class="lsf-icon colororange" title="list"></span>ข้อมูลตารางสอนบุคลากร    </div>
			</thead></tr></th>
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
				 
				</td>
		 	
				
				 <td rowspan="2">
					 
					<input class="btn btn-primary" value="<spring:message code="label.button.search"/>" type="submit"> 
				</td>
 
			</tr>
			
			
				 <tr>	
				 
					  <td class="label-form">
					   ประจำปี:   
				</td>
				 <td>
				 	 
            		 <form:select path="academicYear" > 
							<form:options items="${user.academicYearList}" itemValue="name" itemLabel="name" />
						</form:select> 
				</td>	
				
				<td  >
				   คณะ:  
				
				</td>
				
				<td>
					<sec:authorize ifAnyGranted="ROLE_ADMIN_FAC">	
            		 <form:select path="facultyCode" disabled="true" > 
							<form:options items="${user.facultyList}" itemValue="code" itemLabel="name"/>
						</form:select> 	
						<form:hidden path="facultyCode"/>
				</sec:authorize>	
				
				<sec:authorize ifNotGranted="ROLE_ADMIN_FAC">	
				<sec:authorize ifAnyGranted="ROLE_ADMIN">	
            		 <form:select path="facultyCode" > 
							<form:options items="${user.facultyList}" itemValue="code" itemLabel="name" />
						</form:select> 	
				</sec:authorize>
				</sec:authorize>				
				
				</td>
				 
				<!-- 
	 
				 <td class="label-form">
					คณะ:
				</td>
				
				
				<td>
					 <form:select path="facultyCode" > 
							<form:options items="${user.facultyList}" itemValue="code" itemLabel="name" />
						</form:select>  
				 
				</td>
				
 -->
				
			 
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
							<th class="thLast">ชื่อ - นามสกุล</th>
							<!-- 
							<th class="thLast">สถานะ</th>
							<th class="thLast">เปลี่ยนสถานะ</th>
							<th class="thLast">เปลี่ยนรหัสผ่าน</th>
							
							 -->
							 <th class="thLast">คณะ</th>
							 <th class="thLast">ภาควิชา</th>
							 
							 <th class="thLast">Reg. Id</th>
							 <th class="thLast">ปีการศึกษา</th>
							<th class="thLast">คารางสอน</th>
							 
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
								<td class="tdLast"><c:out value="${domain.firstLastName}" />&nbsp;</td>
								
								<!-- 
								
								
								<td class="tdLast" align="center"><c:if test="${domain.enabled == 'true'}">
						 			Active
						 		</c:if> <c:if test="${domain.enabled != 'true'}">
						 		Inactive
						 		</c:if></td>
		
		
								<td class="tdLast" align="center"><a
									href="<%=request.getContextPath()%>/admin/user/changeStatus.htm?currentStatus=<c:out value="${domain.enabled}"/>&username=<c:out value="${domain.username}"/>">
								Change Status </a></td>
								<td class="tdLast" align="center"><a onclick="openWaiting()"
									href="<%=request.getContextPath()%>/admin/user/resetPass.htm?username=<c:out value="${domain.username}"/>">
								Reset Password </a></td>
		 -->
		 						<td class="tdLast"><c:out value="${domain.facultyDesc}" />&nbsp;</td>
		 						<td class="tdLast"><c:out value="${domain.departmentDesc}" />&nbsp;</td>
		 					<td class="tdLast"><c:out value="${domain.regId}" />&nbsp;</td>
		 						<td class="tdLast"><c:out value="${domain.academicYear}" />&nbsp;</td>
								<td class="tdLast" align="center">
								
								<a href="<%=request.getContextPath()%>/admin/timetable/viewTimeTable.htm?username=<c:out value="${domain.username}"/>&semester=1">
								ตารางสอน</a></td>
		 
		
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
	
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/user/create.htm";
		form.method='GET';	
		form.submit();
	}
</script>
	