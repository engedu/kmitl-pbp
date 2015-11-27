<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="academicYearWrapper" action="ajustYearIncrease.htm" method="POST" name="mainForm"> 	 
<form:hidden path="nextAcademicYear"/>
<form:hidden path="previousAcademicYear"/>
<div class="post">
	<h2 class="title">ปรับปีการศึกษา    </h2>
	<div class="entry">	
	<div class="back_center"> 
	<br>
	<br> 
	<span style="font-size: 30px; color: rgb(74,132,47);"> ปีการศึกษาปัจจุบัน   ${academicYearWrapper.academicYear.name}  &nbsp;   </span> 
 
	</div>
	</div>
	<div>
	<br>
	<br>
	<br>
	<input class="btn btn-primary" value="ย้อนกลับ" type="button"		onclick="init();" />  
	</div>
</div>
</form:form>
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/academicYear/init.htm";
		form.method='GET';	
		form.submit();	
	} 
</script>
 