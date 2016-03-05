<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="academicKPIWrapper" action="search.htm" method="POST" name="mainForm"> 	 
 
 
<div class="post">
 
<div class="entry">		
 
 
			 
		<table class="pbp-table"> 
			<thead><tr><th colspan="7">
			<div class="pbp-header"><span class="lsf-icon colororange" title="list"></span>ข้อมูลประเภทภาระงาน คณะ ${academicKPIWrapper.facultyName} ประจำปีการศึกษา ${academicKPIWrapper.academicYear}   </div>
			</thead></tr></th>
 		
			
			<tr>	
					  <td class="label-form">
					   ประจำปี:   
				</td>
				 <td>
				 	 
            		 <form:select path="academicYear" > 
							<form:options items="${academicKPIWrapper.academicYearList}" itemValue="name" itemLabel="name" />
						</form:select>
				</td> 
				<td class="label-form">
					คณะ:
				</td>
				<td>
				<sec:authorize ifAnyGranted="ROLE_ADMIN_FAC">	
            		 <form:select path="facultyCodeSelect" disabled="true" > 
							<form:options items="${academicKPIWrapper.facultyList}" itemValue="code" itemLabel="name"/>
						</form:select> 	
						<form:hidden path="facultyCodeSelect"/>
				</sec:authorize>	
				
				<sec:authorize ifNotGranted="ROLE_ADMIN_FAC">	
				<sec:authorize ifAnyGranted="ROLE_ADMIN">	
            		 <form:select path="facultyCodeSelect" > 
							<form:options items="${academicKPIWrapper.facultyList}" itemValue="code" itemLabel="name" />
						</form:select> 	
				</sec:authorize>
				</sec:authorize>							 
				</td>
				 <td rowspan="2">
					 
					<input class="btn btn-primary" value="<spring:message code="label.button.search"/>" type="submit"> 
				</td>
 
			</tr> 
			
			<tr>	
					  <td class="label-form">
					  ภาระงานด้าน:   
				</td>
				 <td>
				 	 
					<form:select path="workTypeCode"  >  									  
									<form:options items="${academicKPIWrapper.pBPWorkTypeList}" itemValue="code" itemLabel="name" />
							</form:select> 	
				</td> 
				<td class="label-form">
					 
				</td>
				<td>
            		 			 
				</td>
			 
 
			</tr> 		

		</table>
		<div class="line">&nbsp;</div>	
 

 
 
            
            
			
			<table class="pbp-table">
		   	   	<thead>
		   	   		<tr>
		   	   		<th colspan="5">
		   	   		
		   	   		ภาระงานด้าน ${academicKPIWrapper.workTypeName}  
		   	   		</th>
		   	   		 <th  >
               		<a rel="notLoading" class="btn btn-primary" href="<%=request.getContextPath()%>/admin/pbp/academicKPI/create.htm?workTypeCode=<c:out  value="${academicKPIWrapper.workTypeCode}"/>&academicYear=<c:out  value="${academicKPIWrapper.academicYear}"/>&facultyCode=<c:out  value="${academicKPIWrapper.facultyCodeSelect}"/>"  >
	         Add  
	         <%-- <img class="imagePlus" src="<c:url value="/images/plus1.png"/>" /> --%>  
	          </a>		   	   		
		   	   		
		   	   		</th>
		   	   		</tr>
		   	   		<tr>
		   	   			<th class="thFirst" width="50%;">ภาระงาน</th>
		   	   			<th class="thFirst"  >คะแนน</th>
		   	   			<th class="thFirst"  >Remark</th>
		   	   			<th class="thFirst">Edit</th>
		   	   			<th class="thLast">Delete</th>
		   	   			<th class="thLast">ลำดับการจัดเรียง</th>
		   	   		</tr>
		   	   	</thead>
		   	   	
		   	   	<tbody> 
		   		<c:forEach items="${academicKPIWrapper.academicKPIList}" var="domain" varStatus="status">  
		   			<tr class="row1">
		   				 <td class="tdFirst">    ${domain.name}</td>
		   				<td class="tdFirst">${domain.mark} คะแนน/ ${domain.unitDesc}</td>
		   				 <td class="tdFirst">    ${domain.description}</td>
		   				<td class="tdFirst"> 
	                   		<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicKPI/edit.htm?academicKPIId=<c:out  value="${domain.academicKPIId}"/>"  >
	                   		 Edit</a>
		   				</td>
		   				<td class="tdLast"> 
	                   		<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicKPI/delete.htm?academicKPIId=<c:out  value="${domain.academicKPIId}"/>&workTypeCode=<c:out  value="${domain.workTypeCode}"/>&academicYear=<c:out  value="${domain.academicYear}"/>&facultyCode=<c:out  value="${academicKPIWrapper.facultyCodeSelect}"/>" 
	                   		onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.name}"/> ?')" >
	                   		 Delete</a>
		   				</td>		
		   				<td class="tdFirst">   ${domain.orderNo}</td>				
		   			</tr>
		   			 	   			           
		       </c:forEach>   
		       
		       	 </tbody>		   	   	
			</table> 
		 </div>
 
</div>

 </div>
 
</form:form>
<script type="text/javascript">
    $(document).ready(function() {
       
     $(".row1:odd").css("background-color","rgb(235,235,235)");
    });
 
</script>
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/academicKPI/init.htm";
		form.method='GET';	
		form.submit();	
	}
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/academicKPI/create.htm";
		form.method='GET';	
		form.submit();
	}
	
	function changeWorkType (In){		
		var form = document.forms['mainForm']; 
	//	 alert(In);
		form.action ="<%=request.getContextPath()%>/admin/pbp/academicKPI/listByWorktype.htm?workTypeCode="+In+"&academicYear=<c:out value="${academicKPIWrapper.academicYear}"/>";
		//alert(form.action);
		form.method='GET';	
		form.submit();
	}
</script>
 