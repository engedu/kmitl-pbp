<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="pBPWorkTypeWrapper" action="search.htm" method="POST" name="mainForm">  	 
 
 
<div class="post"> 
	<div class="entry"> 
			 <div class="pbptableWrapper">
			 
			 
			 
		<table class="pbp-table"> 
			<thead><tr><th colspan="7">
			<div class="pbp-header"><span class="lsf-icon colororange" title="list"></span>ข้อมูลประเภทภาระงาน คณะ ${pBPWorkTypeWrapper.facultyName} ประจำปีการศึกษา ${pBPWorkTypeWrapper.academicYear}   </div>
			</thead></tr></th>
 		
			
			<tr>	
					  <td class="label-form">
					   ประจำปี:   
				</td>
				 <td>
				 	 
            		 <form:select path="academicYear" > 
							<form:options items="${pBPWorkTypeWrapper.academicYearList}" itemValue="name" itemLabel="name" />
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
					 
					<sec:authorize ifAnyGranted="ROLE_ADMIN_FAC">	 
					</sec:authorize> 
				<sec:authorize ifNotGranted="ROLE_ADMIN_FAC">	
				<sec:authorize ifAnyGranted="ROLE_ADMIN">	
					<input class="btn btn-primary" value="<spring:message code="label.button.search"/>" type="submit"> 
				</sec:authorize>
				</sec:authorize>					 
					 
					 
				</td>
 
			</tr> 

		</table>
		<div class="line">&nbsp;</div>		 

	
	
	<table>
		<thead>
		    <tr><th colspan="5"></th></tr>
			<tr>
				<th rowspan="2"> ประเภทภาระงาน   </td>
				<th colspan="2">ภาระงานคาดหวัง ต่อปี </td>
				<!--<td rowspan="2">Sub  </td> 
				<th rowspan="2">ฐานการคำนวณ  </td> -->
			 <!--	<th rowspan="2">Delete  </td> -->
			</tr>
			<tr>
				<th> ขั้นต่ำ (คะแนน)&nbsp;/&nbsp;ใช้ในการคำนวณ</td>
				<th>ขั้นสูง (คะแนน)&nbsp;/&nbsp;ใข้ในการคำนวณ</td>
				 
			</tr> 
		</thead>
		
		<tbody>
				<c:forEach items="${pBPWorkTypeWrapper.pBPWorkTypeList}" var="domain" varStatus="status">
			<tr>
				<td style="  text-align: left;">
			
			       <input type="hidden" name="pBPWorkTypeList[${status.index}].workTypeId" value="${domain.workTypeId}" >
					${status.index+1} <input style="width: 350px; "  name="pBPWorkTypeList[${status.index}].name" value="${domain.name}"  />  
					<!--  
			        <br>
			        <c:forEach items="${domain.pBPWorkTypeSubList}" var="domain2" varStatus="status2">
			            &nbsp; &nbsp; &nbsp; ${domain2.name} <br>
			        </c:forEach>
			        
			        -->
				</td>
				<td style="text-align: center; "> 
		 
				 <input style="width: 50px;"  name="pBPWorkTypeList[${status.index}].minHour" value="${domain.minHour}"  />&nbsp;&nbsp;/&nbsp;&nbsp;
				  <form:checkbox path="pBPWorkTypeList[${status.index}].minHourCal"/>
	 
  		 
				</td>
				<td style="text-align: center;"> 
				  
				 <input style="width: 50px;"  name="pBPWorkTypeList[${status.index}].maxHour" value="${domain.maxHour}"  />&nbsp;&nbsp;/&nbsp;&nbsp;
				  <form:checkbox path="pBPWorkTypeList[${status.index}].maxHourCal"/>
 
				</td>	
				
				<!-- 
		 		<td>
					<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/pBPWorkType/manageSub.htm?workTypeId=<c:out  value="${domain.workTypeId}"/>"  >
												ManageSub
												</a> 
												
												
		 		
		 		</td>
		 		 -->
		 		 <!-- 
				<td style=" "> 
				 <input style="width: 50px;"  name="pBPWorkTypeList[${status.index}].limitBase" value="${domain.limitBase}"  />  
				   
				</td>		 		 
		 		
				<td>					<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/pBPWorkType/delete.htm?pBPWorkTypeId=<c:out  value="${domain.workTypeId}"/>"
												onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.name}"/> ?')">
												Delete
												</a> 
				</td>
				 -->
			</tr> 
			</c:forEach>
		</tbody>

 
	</table>
 </div>
	
	<div class="back_center"> 
	 
	<input value="<spring:message code="label.button.save"/>" type="button" class="btn btn-primary" onclick="edit();"/>
	</div>
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
	
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/pBPWorkType/create.htm";
		form.method='GET';	
		form.submit();
	}
	function edit (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/pBPWorkType/edit.htm";
		form.method='POST';	
		form.submit();
	}
</script>
 