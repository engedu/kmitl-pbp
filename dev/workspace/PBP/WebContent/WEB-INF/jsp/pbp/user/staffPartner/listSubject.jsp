<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>

<div class="timeTableWrapper">
	
		<form:form modelAttribute="timeTableWrapper"	action="searchSubject.htm" method="POST" name="mainForm">  
		<div align="center" style="color: red;">
		หมายเหตุ :เลือกรายวิชาสอนร่่่วม ที่ยังไม่มีในตารางสอน
		</div>
		<br>
		<div align="center">
		<table >
		   <thead>
		    <tr><th colspan="3"><div class="pbp-header">กำหนดวิชาสอนร่วม </div><th></tr>
			</thead>
			<tr>	
				<td>
					รหัสวิชา : <form:input cssClass="tb1"  path="subjectId"  /> <span class ="require"  >*</span> <form:errors path="subjectId" cssClass="require" />
				</td>
				<td >
					ปี : <form:input cssClass="tb1"  path="academicYear" readonly="true" /> 
				</td> 
				<td >
					เทอม : 
<form:select path="semester">
                    <form:option value="1" label="เทอม  1" />
                      <form:option value="2" label="เทอม  2" />
                       <form:option value="3" label="เทอม  3" />
                    </form:select>
				</td>
				<td>
				<input type="submit" class="btn btn-primary" value="<spring:message code="label.button.search"/>">
				</td> 
			</tr>	
			
		</table>
		</div>
		
		</form:form>

</div>	
<div class="pbptableWrapper">

	

	<table class="pbp-table">
		<thead>
		 <tr>
		    <th colspan="6"><div class="pbp-header">รายวิชา</div></th>
		 </tr>
		 <tr>
			<th class="thFirst" width="5%">No.</th>
			<th class="thFirst" width="15%">รหัสวิชา</th>
			<th class="thFirst">ชื่อวิชา</th>
			<th class="thFirst" width="10%">SECTION</th>
			<th class="thFirst" width="15%">ปีการศักษา /เทอม</th>
			<th class="thFirst" width="10%">กำหนดสอนร่วม</th>
	     </tr>
		</thead>
		<tbody>
		  <c:if test="${empty subjectList }">  	 
    	<tr class="searchNotFound">
    		<td colspan="6" style="text-align: center;" ><spring:message code="message.searchNotFound"/></td>
    	</tr>
    </c:if >
      
			<c:forEach items="${subjectList}" var="r" varStatus="l">
				<tr>
					<td>${l.count }</td>
					<td>${r.subjectCode }</td>
					<td>${r.thaiName }</td>
					<td align="center"> ${r.secNo }</td>
					<td align="center" >${r.academicYear } / ${r.semester }</td>
					<td align="center">
						<a href="#" onclick="add(${r.timetableId});return false;">
							กำหนดสอนร่่วม
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>

function add( sectionId){
	window.location = "<%=request.getContextPath()%>/personTimeTable/addShareSubject.htm?timetableId=" + sectionId;
}

</script>