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
	<div class="pbp-header">TIME : ${processTime} ms</div>
</div>
<div class="pbptableWrapper">
	<div class="pbp-header">SUCCESS</div>
	<table class="pbp-table">
		<thead>
			<th class="thFirst" >NO.</th>
			<th class="thFirst" >USERNAME</th>
			<th class="thFirst">FIRST NAME</th>
			<th class="thFirst">LAST NAME</th>
			<th class="thFirst">STATUS</th>
		</thead>
		<tbody>
		 <c:forEach items="${okList}" var="r" varStatus="l">
			<tr>
				 <td>${l.count}</td>
				 <td>${r.username}</td>
				 <td>${r.first_name}</td>
				 <td>${r.last_name}</td>
				 <td><b>${r.statusRecord}</b></td>
			</tr>
		 </c:forEach>
		</tbody>
	</table>
</div>
<div class="pbptableWrapper">
	<div class="pbp-header">FAIL</div>
	<table class="pbp-table">
		<thead>
			<th class="thFirst" >NO.</th>
			<th class="thFirst" >USERNAME</th>
			<th class="thFirst">FIRST NAME</th>
			<th class="thFirst">LAST NAME</th>
			<th class="thFirst">STATUS</th>
		</thead>
		<tbody>
		 <c:forEach items="${failList}" var="r" varStatus="l">
			<tr>
				 <td>${l.count}</td>
				 <td>${r.username}</td>
				 <td>${r.first_name}</td>
				 <td>${r.last_name}</td>
				 <td> <b>${r.statusRecord}</b></td>
			</tr>
		 </c:forEach>
		</tbody>
	</table>
</div>
<br/>
<input class="btn btn-primary" value="ย้อนกลับ" type="button" onclick="backTomenu();" /> 
<script type="text/javascript">
<!--
function backTomenu(){
	window.location = "<%=request.getContextPath()%>/welcome.htm";	
}
//-->
</script>
