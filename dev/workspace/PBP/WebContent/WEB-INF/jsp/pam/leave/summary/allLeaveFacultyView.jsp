<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page import="com.buckwa.util.BuckWaDateUtils"%>
<form:form action="init.htm" method="POST" name="mainForm">
<div class="post">
	<h2 class="title">สรุปวันลาประจำปี</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
			<table>
				<tr>
					
					<td>
						<div style="margin-right: 20px;" class="label-form" >ประจำปี : 2555</div>
					</td>
					
					<td>
						<div style="margin-right: 40px;" class="label-form" >ภาควิชา: 
							<select id="facultyCode" name="facultyCode" style="width: 200px;">
								<c:forEach items="${lovHeader.detailList}" var="domain" varStatus="row">
									<option value="${domain.code}"  label="${domain.name}">${domain.name}</option>
								</c:forEach>
							</select>
						</div>
					</td>
					<td  align="right">
						<div style="margin-right: 40px;" class="label-form" >
							<input class="btn btn-primary" value="ออกรายงาน Excel" type="button" onclick="report();"/>
						</div>
					</td>
					
				</tr>
			</table>
			<div class="line">&nbsp;</div>
			<div style="clear: both;">&nbsp;</div>
			<div>
				<table class="tableSearchResult">
					<thead class="tableHeader">
						<tr>
							<th class="headerTH" width="15px">ลำดับ</th>
							<th class="headerTH" width="90px">ชื่อ-สกุล</th>
							<th class="headerTH" width="15px">ภาควิชา</th>
							<th class="headerTH" width="15px">ศึกษา/อบรม</th>
							<th class="headerTH" width="15px">พักผ่อน</th>
							<th class="headerTH" width="15px">ป่วย</th>
							<th class="headerTH" width="15px">กิจ</th>
							<th class="headerTH" width="15px">คลอด</th>
							<th class="headerTH" width="15px">อุปสมบท</th>
						</tr>
					</thead>
					<tbody>
<%-- 					${allLeaveMaps} --%>
						<c:forEach items="${allLeaveMaps}" var="domain" varStatus="row">
							<tr>
								<td align="center">${row.count}</td>
								<td class="text">${domain.thai_name} ${domain.thai_name}</td>
								<td class="text">${domain.facultyName}</td>
								<td align="center" class="text"><c:out value="${domain.summaryLeaveList[0].total}/${domain.summaryLeaveList[0].amount}"/></td>
								<td align="center" class="text"><c:out value="${domain.summaryLeaveList[1].total}/${domain.summaryLeaveList[1].amount}"/></td>
								<td align="center" class="text"><c:out value="${domain.summaryLeaveList[2].total}/${domain.summaryLeaveList[2].amount}"/></td>
								<td align="center" class="text"><c:out value="${domain.summaryLeaveList[3].total}/${domain.summaryLeaveList[3].amount}"/></td>
								<td align="center" class="text"><c:out value="${domain.summaryLeaveList[4].total}/${domain.summaryLeaveList[4].amount}"/></td>
								<td align="center" class="text"><c:out value="${domain.summaryLeaveList[5].total}/${domain.summaryLeaveList[5].amount}"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
</div>
</form:form>

<script>

	jQuery(document).ready(function(){
		$("#facultyCode").change(function() {
			var facultyCode =  $("#facultyCode").val();
			document.location.href="<%=request.getContextPath()%>/leave/summary/facultyLeaveView.htm?facultyCode="+facultyCode;
		});
		
	});
	
	var facultyCode= <%=request.getParameter("facultyCode") %>;
	if(facultyCode != null){
		$("#facultyCode").val(facultyCode);
	}

	function report(){
		var faculty =  $("#facultyCode").val();
		var facultyName =   document.getElementById('facultyCode').children[document.getElementById('facultyCode').selectedIndex].label;

		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/leave/summary/report_type.htm?facultyCode="+faculty+"&facultyName="+facultyName;
		form.method='POST';	
		form.submit();	
	}
	
	function setFaculty(name){
		//logger.info(name);
	}
	
</script>
