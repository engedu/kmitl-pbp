<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="academicUnitWrapper" action="edit.htm" method="POST" name="mainForm"> 	 
<form:hidden path="academicYear"/>
 
<div class="post"> 
	<div class="entry"> 
			 <div class="pbptableWrapper">
             
               <div class="pbp-header"> 
               <table style="width:100%">
               	<tr>
               		<td width="80%">	ข้อมูล หน่วยนับ  </td>
               		<td ><a> <input value="<spring:message code="label.button.new"/>" type="button" class="btn btn-primary" onclick="create();"> </a> 	</td>
               	</tr>
               </table>
               	 
             </div> 
	
	
	<table >
		<thead>
			<tr>
				<th> No </th>
				<th>หน่วย </th>
				<th>Detete</th>
			</tr>
		</thead>

  		<tbody>
		<c:forEach items="${academicUnitWrapper.academicUnitList}" var="domain" varStatus="status">
		<tr> 
		<td style=" border: 1px solid white;">
	
			${status.index+1}
	 
		</td>
		<td style=" border: 1px solid white;">
		
 
			 <input   name="academicUnitList[${status.index}].name" value="${domain.name}"  style="width: 400px;"/>
		 
			 
		</td>
		
		<td style=" border: 1px solid white;">	 
		<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicUnit/delete.htm?academicUnitId=<c:out  value="${domain.academicUnitId}"/>"
									onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.name}"/>  ?')">
									Delete
									</a>
			 
			 
		</td>		
		</tr>
	</c:forEach>	
 
 		</tbody>
	</table>
 
	</div>
	</div>
	
	<div class="back_center">
	
	<input class="btn btn-primary"	value="<spring:message code="label.button.save"/>" type="submit" >
	
	</div>
	
</div>

 
</form:form>
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/academicUnit/init.htm";
		form.method='GET';	
		form.submit();	
	}
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/academicUnit/create.htm";
		form.method='GET';	
		form.submit();
	}
</script>
 