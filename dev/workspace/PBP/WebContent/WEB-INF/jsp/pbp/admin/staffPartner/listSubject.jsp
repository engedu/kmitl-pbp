<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>

<div class="pbptableWrapper">
	
		<form action="" method="get">
		<div align="center">
		<table >
		   <thead>
		    <tr><th colspan="3"><div class="pbp-header">รายวิชา</div><th></tr>
			</thead>
			<tr>	
				<td>
					รหัสวิชา : <input class="input"  type="text" style="margin-right: 20px;" name="subject_id"/>
				</td>
				<td >
					ปี : <input class="input"  type="text" style="margin-right: 20px;" name="year" />
				</td> 
				<td >
					เทอม : <input class="input"  type="text" style="margin-right: 20px;" name="term"/>
				</td>
				<td>
				<input type="submit" class="btn btn-primary" value="<spring:message code="label.button.search"/>">
				</td> 
			</tr>	
			
		</table>
		</div>
		
		
		</form>

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
			<th class="thFirst">ชื่อ</th>
			<th class="thFirst" width="10%">SECTION</th>
			<th class="thFirst" width="15%">ปีการศักษา /เทอม</th>
			<th class="thFirst" width="10%">แก้ไข  STAFF</th>
	     </tr>
		</thead>
		<tbody>
			<c:forEach items="${subjectList}" var="r" varStatus="l">
				<tr>
					<td>${l.count }</td>
					<td>${r.subjectId }</td>
					<td>${r.subjectName }</td>
					<td align="center"> ${r.sectionCd }</td>
					<td align="center" >${r.year } / ${r.term }</td>
					<td align="center">
						<a href="#" onclick="add(${r.sectionId});return false;">
							<span class="lsf-icon colororange" title="gear">
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>

function add( sectionId){
	window.location = "<%=request.getContextPath()%>/admin/pbp/staffpartner/add.htm?section_id=" + sectionId;
}

</script>