<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="facultyWrapper" action="search.htm" method="POST" name="mainForm"> 	 
<form:hidden path="academicYear"/> 
<div class="post"> 

 	<div style="width: 80%; text-align: center; padding-left: 300px;" > 
 	<br>
 	 <table style="width: 400px;" >
 	 	<tr> 
 	 		<td>ปีการศึกษา</td>
 	 		<td>
 	            		 <form:select path="academicYearSelect" onchange="getFacultyByYear(this.value);"> 
							<form:options items="${facultyWrapper.academicYearList}" itemValue="name" itemLabel="name" />
						</form:select> 	 
 							 						
								
 	 		</td>
 	 		
 	 		<td width="200px;">
 	 		 <a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/report/exportExcel.htm?academicYear=<c:out value="${academicYearStr}"/>">  
					 <input class="btn btn-primary" value="Export to Excel" type="button"   /> 
			 </a> 
 	 		</td>
 	 		

 	 		
 	 	</tr>
 	 </table>
 
 	</div>

   <br>
 
</div>

 
</form:form>
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/faculty/init.htm";
		form.method='GET';	
		form.submit();	
	}
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/faculty/create.htm";
		form.method='GET';	
		form.submit();
	}
	
		function getFacultyByYear (In){		
			var form = document.forms['mainForm']; 
		  //alert(In);
			form.action ="<%=request.getContextPath()%>/admin/pbp/report/getFacultyByYear.htm?academicYearSelect="+In;
			//alert(form.action);
			form.method='GET';	
			form.submit();
		}
</script>
 