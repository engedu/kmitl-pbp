<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="pBPWorkType" action="editSub.htm" method="POST" name="mainForm"> 	 
<form:hidden path="academicYear"/>
 <form:hidden path="workTypeId"/>
<div class="post">
	<h2 class="title">
	ข้อมูลกลุ่มงานย่อย ภาระงาน    ${pBPWorkType.name}   ประจำปีการศึกษา  ${pBPWorkType.academicYear}  
		<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/pBPWorkType/createSub.htm?workTypeId=<c:out  value="${pBPWorkType.workTypeId}"/>" >
	<input	value="<spring:message code="label.button.new"/>" type="button" class="btn btn-primary" ">
	</a>
	 </h2>
	<div class="entry"> 
	<table style="width: 90%; border: 1px solid white;">
		<thead>
			<tr>
				<td  > กลุ่่มงาน่ย่อย   </td> 
			 	<td rowspan="2">Delete  </td>
			</tr>
	 
		</thead>
		
		<tbody>
				<c:forEach items="${pBPWorkType.pBPWorkTypeSubList}" var="domain" varStatus="status">
			<tr>
				<td style=" border: 1px solid white; text-align: left;">
			
			       <input type="hidden" name="pBPWorkTypeSubList[${status.index}].workTypeSubId" value="${domain.workTypeSubId}" >
					${status.index+1} <input style="width: 350px;"  name="pBPWorkTypeSubList[${status.index}].name" value="${domain.name}"  /> 
			   
				</td>
 
		 	 
				<td>					<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/pBPWorkType/deleteSub.htm?workTypeId=<c:out  value="${pBPWorkType.workTypeId}"/>&workTypeSubId=<c:out  value="${domain.workTypeSubId}"/>"
												onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.name}"/> ?')">
												Delete
												</a> 
				</td>
			</tr> 
			</c:forEach>
		</tbody>

 
	</table>
 </div>
	
	<div class="back_center"> 
	<input class="btn btn-primary"	value="<spring:message code="label.button.save"/>" type="submit" > 
	</div>
	
</div>

 
</form:form> 
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/pBPWorkType/init.htm";
		form.method='GET';	
		form.submit();	
	}
 
</script>
 