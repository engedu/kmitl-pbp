<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="academicKPIWrapper" action="edit.htm" method="POST" name="mainForm"> 	 
<form:hidden path="academicYear"/>
 
<div class="post">
 
<div class="entry">		
 
			
			<table class="pbp-table">
		   	   	<thead>
		   	   		<tr>
		   	   		
		   	   		<th  > <div class="pbp-header">  <span class="lsf-icon colororange" title="list"></span> เลือกประเภทภาระงาน :</div>  &nbsp;
 					
					</th>
					<th>
					<form:select path="workTypeCode" id="year-dropdown" onchange="changeWorkType(this.value);"  >  									  
									<form:options items="${academicKPIWrapper.pBPWorkTypeList}" itemValue="code" itemLabel="name" />
							</form:select> 						
					</th>

							 					
					</tr>
 
		   	   	</thead>			
			</table>
 
 
            
            
			
			<table class="pbp-table">
		   	   	<thead>
		   	   		<tr>
		   	   		<th colspan="5">
		   	   		
		   	   		${academicKPIWrapper.pBPWorkType.name} ประจำปีการศึกษา  ${academicKPIWrapper.academicYear}  
		   	   		</th>
		   	   		 <th  >
               		<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicKPI/create.htm?workTypeCode=<c:out  value="${academicKPIWrapper.pBPWorkType.code}"/>&academicYear=<c:out  value="${academicKPIWrapper.academicYear}"/>"  >
	         Add <span class="lsf-icon colororange" title="plus">
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
		   				<td class="tdFirst">${domain.mark} ชั่วโมงภาระงาน/ ${domain.unitDesc}</td>
		   				 <td class="tdFirst">    ${domain.description}</td>
		   				<td class="tdFirst"> 
	                   		<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicKPI/edit.htm?academicKPIId=<c:out  value="${domain.academicKPIId}"/>"  >
	                   		 Edit</a>
		   				</td>
		   				<td class="tdLast"> 
	                   		<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicKPI/delete.htm?academicKPIId=<c:out  value="${domain.academicKPIId}"/>&workTypeCode=<c:out  value="${domain.workTypeCode}"/>&academicYear=<c:out  value="${domain.academicYear}"/>" 
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
 