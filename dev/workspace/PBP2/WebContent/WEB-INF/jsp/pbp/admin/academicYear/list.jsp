<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<%@ page import="com.buckwa.web.util.*" %>
<form:form modelAttribute="academicYearWrapper" action="edit.htm" method="POST" name="mainForm"> 	 
<form:hidden path="nextAcademicYear"/>
<form:hidden path="previousAcademicYear"/>
<div class="post">
<div class="entry">	

<!--  
	<h2 class="title">ปีการศึกษา     
	
	 
	 &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  
	 &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  
	  <a href="<%=request.getContextPath()%>/admin/pbp/academicYear/getCurrentAcademicYear.htm"><input class="btn btn-primary" value="ปีการศึกษาปัจจุบัน" type="button"  >  </a> 
	 &nbsp;  &nbsp; 
   <a href="<%=request.getContextPath()%>/admin/pbp/academicYear/ajustYear.htm"><input class="btn btn-primary" value="ปรับปีการศึกษา" type="button"  >  </a> 
   &nbsp;  &nbsp;  
	  <a href="<%=request.getContextPath()%>/admin/pbp/academicYear/getCurrentAcademicYear.htm"><input class="btn btn-primary" value="สุินสุดการประเมิน" type="button"  >  </a> 	 
	
	</h2>
	
	<div class="back_center">
	<a href="<%=request.getContextPath()%>/admin/pbp/academicYear/listByAcademicYear.htm?academicYear=<c:out value="${academicYearWrapper.previousAcademicYear}"/>&next=Y">	<img src="<c:url value="/images/arrow_left.png"/>" />  <c:out value="${academicYearWrapper.previousAcademicYear}"/></a>
	&nbsp;   &nbsp;&nbsp;   &nbsp;
	<span style="font-size: 30px; color: rgb(74,132,47);">  ${academicYearWrapper.academicYear.name}  </span>
	
	&nbsp;   &nbsp;&nbsp;   &nbsp;
	<a href="<%=request.getContextPath()%>/admin/pbp/academicYear/listByAcademicYear.htm?academicYear=<c:out value="${academicYearWrapper.nextAcademicYear}"/>&next=N">	<c:out value="${academicYearWrapper.nextAcademicYear}"/> <img src="<c:url value="/images/arrow_right.png"/>" /> </a>
	</div>
	
	<div>
 
	
	<span style="font-size: 30px; color: rgb(74,132,47);"> ${academicYearWrapper.academicYear.startDateThaiShort} ${academicYearWrapper.academicYear.name}  &nbsp; -  &nbsp; ${academicYearWrapper.academicYear.endDateThaiShort} ${academicYearWrapper.nextAcademicYear} </span>
	</div>
	-->
 
		 <div class="pbptableWrapper">
		  <div style="width: 100%; text-align: right ;"><a href="<%=request.getContextPath()%>/admin/pbp/academicYear/ajustYear.htm"><input class="btn btn-primary" value="ปรับปีการศึกษา" type="button"  >  </a></div> 
		 	<br>
		 	<table class="pbp-table">
		 		<thead>
		 		<tr>
		 		<th >
            		ปีการศึกาษา</div>
             	</th>
  		 		<th >
            		เริ่มต้น - สิ้นสุด
             	</th>
  		 		<th >
            		เทอม : เริ่มต้น-สิ้นสุด
             	</th>         
   		 		<th >
            		แก้ไข
             	</th>    		 		              	    	           	
             	</tr>
             	</thead>
			
				<tbody>
				
				<c:forEach items="${academicYearList}" var="domain" varStatus="status">
                     <tr style="border-top: 1px solid #e1e1e1;">
					<td class="tdFirst">${domain.name}</td>
					
					  
					<td class="tdFirst"   align="left"> 
						${domain.startDateThaiShort}    &nbsp; -  &nbsp; ${domain.endDateThaiShort} 
					</td>					 
				 				 
					 
				 
					 <td class="tdFirst"   align="left"> 
					 
					 <c:forEach items="${domain.semesterList}" var="domain2" varStatus="status2">
					  
					  ${domain2.name}  :  ${domain2.startDateStr} -  ${domain2.endDateStr} <br>
					 
					 
					 </c:forEach>
					 
					 
					 </td>
					  <td>  
				    
				       <a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicYear/editDateAcademicYear.htm?academicYear=<c:out value="${domain.name}"/>"><span class="lsf-icon colororange" title="gear"></a>
				      
				     </td>	
						</tr>					  
				</c:forEach>	 

				</tbody>				
 
			</table>
			 
		</div> 		
		
		<br><br>
	
 
	</div>
</div>
</form:form>
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/role/init.htm";
		form.method='GET';	
		form.submit();	
	} 
</script>
 