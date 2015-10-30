<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.buckwa.domain.*"%>
<%@ page import="java.util.*"%>	

<link href="/PAM/css/evaluate.css" rel="stylesheet" type="text/css" />

<form:form modelAttribute="evaluate" action="search.htm" method="POST"	name="mainForm">

	<div class="post">
	
		<h2 class="title" >ประวัติการประเมินย้อนหลัง</h2>
		
		<div class="entry">
		<div style="clear: both;">&nbsp;</div>
			<table border="0">
				<tr align="left">
					<td class="label-form" align="right">ปีการศึกษา:</td>
					<td align="left" width="10%">
						<form:select	path="personEvaluateMappingList[0].year.yearId"
							id="year-dropdown" onchange="loadSemester(this.value)">
							<form:options items="${yearList}" itemValue="yearId" itemLabel="name" />
						</form:select>
					</td>
					<td class="label-form" align="right">ภาคการศึกษาที่ :</td>
					<td align="left">
						<form:select	path="personEvaluateMappingList[0].semester.semesterId"		id="semester-dropdown">
							<form:options items="${semesterList}" itemValue="semesterId"
								itemLabel="name" />
						</form:select> 
						<form:errors
							path="personEvaluateMappingList[0].semester.semesterId"
							cssClass="require" />
					</td>
					<td align="center">
						<div class="label-form">
							กลุ่มผู้ประเมิน: <select id="groupId" name="groupId"
								style="width: 120px;">
								<option value="11">ข้าราชการ</option>
								<option value="22">พนักงาน</option>
							</select>
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
							<th class="headerTH" width="40px">ลำดับที่</th>
							<th class="headerTH" width="300px">รายการประเมิน</th>
<!-- 							<th class="headerTH" >ผู้อยู่ภายใต้การประเมิน</th> -->
							<th class="headerTH" width="70px">คะแนนรวม</br>ที่ได้</th>
							<th class="headerTH" width="80px">คะแนนรวมตามประเภทงาน</th>
							<th class="headerTH" width="70px">คะแนนรวมตามภาระงาน</th>
						</tr>
					</thead>
					<tbody>
						<c:if
							test="${empty evaluate.personEvaluateMappingList[0].person}">
							<tr class="row">
								<td colspan="6" class="row" align="center">
									<div class="searchNotFound"><spring:message code="message.searchNotFound" /></div>
								</td>
							</tr>
						</c:if>
							<c:forEach items="${evaluate.personEvaluateMappingList}" var="domain"  varStatus="no">
								<c:if test="${!empty domain.person}">
									<tr class="row">
										<td align="center"><c:out value="${no.count}" /></td>
										<td align="left"><a onmouseover="this.style.cursor='pointer'"  onclick="checkForEvaluate('${domain.person.personId}');">แบบการประเมินผลการปฏิบัติราชการ</a></td>
<%-- 										<td align="left"><c:out value="${domain.person.fullName}"/></td> --%>
										<td align="center"><c:out value="${domain.totalScore}" /></td>
										<td align="center"><c:out value="${domain.totalSecoundScore}" /></td>
										<td align="center"><c:out value="${domain.totalFirstScore}" /></td>
									</tr>
								</c:if>
							</c:forEach>
					</tbody>
				</table>
				
<!-- 					<div class="footerPaging"> -->
<%-- 						<pg:index> --%>
<%-- 							<jsp:include page="/WEB-INF/jsp/common/paging.jsp" flush="true" /> --%>
<%-- 						</pg:index>   --%>
<!-- 					</div> -->
<%-- 				</pg:pager> --%>
			</div>
		</div>
			
		

	</div>


</form:form>


<script type="text/javascript">
	
	var yearId = "<%=request.getParameter("yearId")%>";
	var groupId = "<%=request.getParameter("groupId")%>";
	var semesterId = "<%=request.getParameter("semesterId")%>";
	
	jQuery(document).ready(function(){
		
		$("#year-dropdown").val(yearId);
		$("#groupId").val(groupId);
		$("#semester-dropdown").val(semesterId);
		
		$("#groupId").change(function() {
			var group =  $("#groupId").val();
			var year =  $("#year-dropdown").val();
			var semester =  $("#semester-dropdown").val();
			openWaiting();
			document.location.href="<%=request.getContextPath()%>/pam/evaluate/historyEvaluate.htm?yearId="+year+"&semesterId="+semester+"&groupId="+group;
		});
		
		$("#semester-dropdown").change(function() {
			var group =  $("#groupId").val();
			var year =  $("#year-dropdown").val();
			var semester =  $("#semester-dropdown").val();
			openWaiting();
			document.location.href="<%=request.getContextPath()%>/pam/evaluate/historyEvaluate.htm?yearId="+year+"&semesterId="+semester+"&groupId="+group;
		});
	});

	function loadSemester(yearId) {
		var group =  $("#groupId").val();
		var semester =  $("#semester-dropdown").val();
		openWaiting();
		document.location.href="<%=request.getContextPath()%>/pam/evaluate/historyEvaluate.htm?yearId="+yearId+"&groupId="+group;
	}
	
	function afterLoadSemester(value) {
		
		$("#year-dropdown").val('2012');
	}
	
	function checkForEvaluate(personId){
		var groupId =  $("#groupId").val();
// 		var evaluateTerm =  '${evaluateTerm}';
		var evaluateTerm =  '1';
		document.location.href="<%=request.getContextPath()%>/pam/evaluate/initEvaluateForm.htm?personId="+personId+"&groupId="+groupId+"&evaluateTerm="+evaluateTerm;
	}
	
// 		var xmlhttp;

// 		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
// 			xmlhttp = new XMLHttpRequest();
// 		} else {// code for IE6, IE5
// 			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
// 		}
// 		xmlhttp.onreadystatechange = function() {
// 			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
// 				eval("semesterObj="+xmlhttp.responseText);
// 				var select = document.getElementById("semester-dropdown");
// 				select.options.length = 0;
// 				if(semesterObj==null || semesterObj == "") alert("null");
// 				for (index in sortObject(semesterObj)) {
// 					select.options[select.options.length] = new Option(index,semesterObj[index]);
// 				}
// 			}
// 		};
// 		xmlhttp.open("GET", url + yearId, true);
// 		xmlhttp.send();
// 	}
	
// 	function sortObject(o) {
// 	    var sorted = {},
// 	    key, a = [];

// 	    for (key in o) {
// 	        if (o.hasOwnProperty(key)) {
// 	                a.push(key);
// 	        }
// 	    }

// 	    if(a.length == 0){
	    	
// 	    	 a[0]="ไม่พบข้อมูล";
// 	    }
	    
// 	    a.sort();

// 	    for (key = 0; key < a.length; key++) {
// 	        sorted[a[key]] = o[a[key]];
// 	    }
	    
// 	    return sorted;
// 	}
	
	
	
</script>
