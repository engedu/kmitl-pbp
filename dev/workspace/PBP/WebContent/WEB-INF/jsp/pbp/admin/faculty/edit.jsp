<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="faculty" action="editFaculty.htm" method="POST" name="mainForm"> 	 
<form:hidden path="academicYear"/>
 
<div class="post">
	 
	<div class="entry">
	
		 <div class="pbptableWrapper">
            <div class="pbp-header"> แก้คณะที่ประจำปีการศึกษา  ${faculty.academicYear} 
        	 
             </div> 
			
			<table class="pbp-table">
				<tbody>
					<tr>
					<td class="tdFirst">คณะ :   
							<form:input cssClass="input" path="name"  /> <span class="require">*</span> <form:errors	path="name" cssClass="require" />					
					</td>
					<td class="tdFirst"> 
						<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/faculty/deleteFacultyById.htm?facultyId=<c:out  value="${faculty.facultyId}"/>">
							<img   src="<c:url value="/images/red_x.png"/>" />
						</a>  ลบ
					</td> 
					</tr>
				</tbody> 
			</table> 
		</div>	 	
 
 
 

	</div>
</div>

<div class="back_center">
<input
					value="<spring:message code="label.button.save"/>" class="btn btn-primary" type="submit" >
				<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init();">
</div>

 
</form:form>
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/faculty/init.htm";
		form.method='GET';	
		form.submit();	
	}
 
</script>
 