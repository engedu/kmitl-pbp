<%@page import="com.buckwa.util.BuckWaConstants"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.buckwa.domain.*"%>
<%@ page import="java.util.*"%>
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp"%>

<link href="/PAM/css/evaluate.css" rel="stylesheet" type="text/css" />

<form:form modelAttribute="evaluate" action="search.htm" method="POST"	name="mainForm">
	<div class="post">
		<h2 class="title" >รายการประเมินทั้งหมดที่มีเข้ามาในระบบ</h2>
		
		<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		
			<table border="0">
				<tr >
					<td class="label-form" align="right" width="25px" >ปีการศึกษา : </td>
					<td align="left" width="80px" >${evaluateYear}</td>
					<td class="label-form" align="right" width="25px">ประเมินครั้งที่ :</td>
					<td align="left" width="80px" >${evaluateTerm}</td>
					<td align="left" width="100px" >&nbsp;</td>
				</tr>
				
					<% if(request.getAttribute("groupId").equals(BuckWaConstants.EVALUATE_TEACHER_ID)){ %>
					<tr>
						<td class="label-form" align="right">วันที่เริ่มการประเมินครั้งที่ 1 :</td>
						<td align="left" >${startEvaluateDate1}</td>
						<td class="label-form" align="right" >วันที่สิ้นสุดการประเมินครั้งที่ 1 :</td>
						<td align="left">${endEvaluateDate1}</td>
						<td align="left" >&nbsp;</td>
					</tr>
					<tr>
						<td class="label-form" align="right">วันที่เริ่มการประเมินครั้งที่ 2 :</td>
						<td align="left" >${startEvaluateDate2}</td>
						<td class="label-form" align="right" >วันที่สิ้นสุดการประเมินครั้งที่ 2 :</td>
						<td align="left">${endEvaluateDate2}</td>
						<td align="left" >&nbsp;</td>
					</tr>
				<% }else if(request.getAttribute("groupId").equals(BuckWaConstants.EVALUATE_STAFF_ID)){ %>
					<tr>
						<td class="label-form" align="right">วันที่เริ่มการประเมิน :</td>
						<td align="left" >${startEvaluateDate}</td>
						<td class="label-form" align="right" >วันที่สิ้นสุดการประเมิน :</td>
						<td align="left">${endEvaluateDate}</td>
						<td align="left" >&nbsp;</td>
					</tr>
				<%} %>
			</table>
			
			<div style="clear: both;">&nbsp;</div>
			
			<table border="0">
				<tr>
					<td align="center"> 
						<div style="margin-right: 80px;" class="label-form" >กลุ่มผู้ประเมิน: 
							<select id="groupId" name="groupId" style="width: 120px;">
									<option value="<%=BuckWaConstants.EVALUATE_TEACHER_ID%>">ข้าราชการ</option>
									<option value="<%=BuckWaConstants.EVALUATE_STAFF_ID%>">พนักงาน</option>
							</select>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="line">&nbsp;</div>
			<div style="clear: both;">&nbsp;</div>
			
<%-- 			<% if(request.getAttribute("evaluateAllowed").equals("N")){ %> --%>
<!-- 				<div class="searchNotFound">ยังไม่ถึงกำหนดการทำรายการ "การประเมิน"</div> -->
<!-- 				<div style="clear: both;">&nbsp;</div> -->
<%-- 			<% } %> --%>
					
<!-- 			<div> -->
<%-- 				<pg:pager url="search.htm" --%>
<%-- 					items="${pagingBean.totalItems}" --%>
<%-- 					maxPageItems="${pagingBean.maxPageItems}" --%>
<%-- 					maxIndexPages="${pagingBean.maxIndexPages}" isOffset="<%= true %>" --%>
<%-- 					export="offset,currentPageNumber=pageNumber" scope="request"> --%>
<%-- 				<pg:param name="maxPageItems" /> --%>
<%-- 				<pg:param name="maxIndexPages" /> --%>
		
				<table class="tableSearchResult">
					<thead class="tableHeader">
						<tr>
							<th class="headerTH" width="40px">ลำดับที่</th>
							<th class="headerTH" width="300px">รายการประเมิน</th>
							<th class="headerTH" >ผู้อยู่ภายใต้การประเมิน</th>
<!-- 							<th class="headerTH" width="65px">กลุ่มตัวชี้วัด</th> -->
							<th class="headerTH" width="70px">คะแนนรวมตามผลงาน</br></th>
							<th class="headerTH" width="80px">คะแนนรวมตามประเภทงาน</th>
							<th class="headerTH" width="70px">คะแนนรวมตามภาระงาน</th>
						</tr>
					</thead>
					<tbody>
						<c:if
							test="${empty evaluate.personEvaluateMappingList}">
							<tr class="row">
								<td colspan="5" class="row" align="center">
									<div class="searchNotFound"><spring:message code="message.searchNotFound" /></div>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${evaluate.personEvaluateMappingList}" var="domain"  varStatus="no">
							<tr class="row">
								<td align="center"><c:out value="${no.count}" /></td>
<%-- 								<% if(request.getAttribute("evaluateAllowed").equals("N")){ %> --%>
<!-- 									<td align="left">แบบการประเมินผลการปฏิบัติราชการ</td> -->
<%-- 								<% }else{ %> --%>
									<td align="left"><a onmouseover="this.style.cursor='pointer'"  onclick="checkForEvaluate('${domain.person.personId}','${domain.evaluateStatus}');">แบบการประเมินผลการปฏิบัติราชการ</a></td>
<%-- 								<% } %> --%>
<%-- 								<td align="left"><c:out value="${domain.person.thaiName}"/>&nbsp;<c:out value="${domain.person.thaiSurname}"/></td> --%>
<%-- 								${domain.person} --%>
								<td align="left"><c:out value="${domain.person.fullName}"/></td>
								<td align="center"><c:out value="${domain.totalScore}" /></td>
								<td align="center"><c:out value="${domain.totalSecoundScore}" /></td>
								<td align="center"><c:out value="${domain.totalFirstScore}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
<%-- 				<%} %> --%>
				
<%-- 				<div class="footerPaging"><pg:index> --%>
<%-- 					<jsp:include page="/WEB-INF/jsp/common/paging.jsp" flush="true" /> --%>
<%-- 				</pg:index></div> --%>
<%-- 			</pg:pager> --%>
		</div>

	</div>
		
</form:form>

<script>

	function checkForEvaluate(personId,evaluateStatus){
		var groupId =  $("#groupId").val();
		var evaluateTerm =  '${evaluateTerm}';
		document.location.href="<%=request.getContextPath()%>/pam/evaluate/initEvaluateForm.htm?personId="+personId+"&groupId="+groupId+"&evaluateTerm="+evaluateTerm+"&evaluateStatus="+evaluateStatus;
	}
	
	jQuery(document).ready(function(){
		$('.accordion .head').click(function() {
			$(this).next().toggle('slow');
			return false;
		}).next().hide();
		
		$("#groupId").change(function() {
			var groupId =  $("#groupId").val();
			openWaiting();
			document.location.href="<%=request.getContextPath()%>/pam/evaluate/init.htm?groupId="+groupId;
		});
		
	});
	
	var groupId= <%=request.getParameter("groupId") %>;
	if(groupId != null){
		$("#groupId").val(groupId);
	}

	
</script>
