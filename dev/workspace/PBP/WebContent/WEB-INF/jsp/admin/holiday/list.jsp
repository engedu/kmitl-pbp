<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %> 

<form:form modelAttribute="holidayCriteria"	action="search.htm" method="POST" name="mainForm">  
<div class="post">
	<h2 class="title">วันหยุดประจำปี</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table width="100%" id="tableSearch">
			<tr>	
				<td class="label-form">ปี:</td>
				<td>
					<form:select path="yearId" id="yearId" onchange="setTimeout(carlendarUtil.setCarlendarInput, 0)">
						<form:option value="" label="--- กรุณาเลือกปี ---" /> 
						<form:options items="${yearList}" itemValue="yearId" itemLabel="name" />
					</form:select>
				</td>
			</tr>
			<!-- begin: Fliey -->
			<tr class='yearSelect'>
				<td></td>
				<td class="label-form">
					<form:hidden path="isDurationDate" id="isDurationDate" />
					<input type="checkbox" name="isDurationDateTemp" id="isDurationDateTemp"
						value="false" onclick="setTimeout(isDurationDateEvent, 0)" /> แบบเป็นระยะเวลา
				</td>
			</tr>
			<!-- end: Fliey -->
			
			<!--begin: singleDate -->
			<tr id='singleDate' >
				<td class="label-form">วันที่:</td>
				<td>
					<form:input cssClass="input" path="holidayDate" id="holidayDate" readonly="true" />
<!-- 					<span class ="require"  >*</span> -->
<%-- 					<form:errors path="holidayDate" cssClass="require" /> --%>
				</td>
			</tr>
			<!--end: singleDate -->
			
			<!--begin: durationDate -->
			<tr id='durationDate-begin' >	
				<td class="label-form">ตั้งแต่วันที่:</td>
				<td>
					<form:input cssClass="input" path="minDate" id="startDate" onchange="carlendarUtil.startDateWasChange()"/> 
<%-- 					<span class ="require"  >*</span><form:errors path="minDate" cssClass="require" /> --%>
				</td>
			</tr>
			<tr id='durationDate-end' >
				<td class="label-form">ถึงวันที่:</td>
				<td>
					<form:input cssClass="input" path="maxDate" id="endDate" onchange="carlendarUtil.endDateWasChange()"/>
<%-- 					<span class ="require"  >*</span><form:errors path="maxDate" cssClass="require" /> --%>
				</td>
			</tr>
			<!--end: durationDate -->
			<tr class='yearSelect'>	
				<td class="label-form">ชื่อวันหยุด:</td>
				<td>
					<form:input cssClass="input" path="holidayName" /> <form:errors path="holidayName" cssClass="require" />
				</td>
			</tr>
			<tr >	
				<td></td>
				<td class='yearSelect'>
					<input class="btn btn-primary" value="<spring:message code="label.button.search"/>" type="submit"> 
				</td>
				<td></td>
				<td></td>
				<td align="right">
					<input value="<spring:message code="label.button.new"/>" type="button" class="btn btn-primary" onclick="create();"/>
				</td>
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
							<th class="headerTH">วันที่</th>
							<th class="headerTH">ชื่อวันหยุด</th>
							<th class="headerTH">รายละเอียด</th>
							<th class="headerTH">เปิดใช้งาน</th>
							<th class="headerTH"><spring:message code="label.edit" /></th>
							<th class="headerTH"><spring:message code="label.delete" /></th>
						</tr>
					</thead>
					<tbody>
						<c:if
							test="${empty pagingBean.currentPageItem && doSearch == 'true' }">
							<tr class="row">
								<td colspan="6" class="row" align="center">
									<div class="searchNotFound"><spring:message code="message.searchNotFound" /></div>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${pagingBean.currentPageItem}" var="domain">
							<tr class="row">
								<td align="left"><c:out value="${domain.holidayDateStr}" />&nbsp;</td>
								<td align="left"><c:out value="${domain.holidayName}" />&nbsp;</td>
								<td align="left"><c:out value="${domain.holidayDesc}" />&nbsp;</td>
								<td align="center">
									<c:if test="${domain.enable == 'true'}" >
										<img style="width: 16px; height: 16px;" src="<c:url value="/images/success.png"/>" />
									</c:if>
									<c:if test="${domain.enable != 'true'}" >
										<img style="width: 16px; height: 16px;" src="<c:url value="/images/deletered.png"/>" />
									</c:if>
								</td>
		
								<td align="center"><a
									href="<%=request.getContextPath()%>/admin/holiday/edit.htm?holidayId=<c:out value="${domain.holidayId}"/>">
								<img src="<c:url value="/images/edit.png"/>" /> </a></td>
								<td align="center"><a rel="notLoading" 
									href="<%=request.getContextPath()%>/admin/holiday/delete.htm?holidayId=<c:out value="${domain.holidayId}"/>"
									onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.holidayName}"/> ?')">
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
		form.action ="<%=request.getContextPath()%>/admin/holiday/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/holiday/create.htm";
		form.method='GET';	
		form.submit();
	}
	
	var isDurationDateEvent = function(){
 		Utility.setChkboxDataBoolean('isDurationDate');
		carlendarUtil.toggleIsSingleDate();
	};
	
	$(document).ready( function() {
		if($('#isDurationDate').val()=='true'){
			carlendarUtil.isSingleDate = false;
			$('#isDurationDateTemp').attr('checked', 'checked');
			
			if($('#startDate').val().length>0){
				//logger.info("start: "+$('#startDate').val());
				
				setTimeout(carlendarUtil.startDateWasChange, 0);
			}else if($('#endDate').val().length>0){
				//logger.info("end: "+$('#endDate').val());
				setTimeout(carlendarUtil.endDateWasChange, 0);
			}
		}else{
			carlendarUtil.isSingleDate = true;
		}
		
		carlendarUtil.setCarlendarInput();
	});
</script>
	