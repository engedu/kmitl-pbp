<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="academicKPIUserMappingWrapper" action="editKPIMapping.htm" method="POST" name="mainForm" enctype="multipart/form-data">		 
<form:hidden path="academicYear"/>
  
<div class="post"> 
<div class="entry">	  
	 
		<div class="pbptableWrapper">
 			<table class="pbp-table">
		   	   	<thead>
		   	   		<tr>
		   	   		
		   	   		<th  > <div class="pbp-header">  <span class="lsf-icon colororange" title="list"></span> แก้ไข KPI การคำนวน </div>  &nbsp;
 					
					</th>
 
							 					
					</tr>
 
		   	   	</thead>			
			</table>
             
			<table class="pbp-table">
 		 
			<tr>
				<td class="tdFirst">ชื่อภาระงาน:</td>
				<td class="tdLast">  ${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPI.name}  </td>
				<td class="tdLast" colspan="3" width="20%" align="left" style="background-color: rgb(246,246,246);">
				
	     	 <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status=='CREATE'}">
	 
				 <a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/deleteImportWork.htm?kpiUserMappingId=<c:out value="${academicKPIUserMappingWrapper.academicKPIUserMapping.kpiUserMappingId}"/>"> 
				 <img src="<c:url value="/images/del1.jpg"/>" width="40" height="40"/>
				 </a>
			 </c:if>		
	 	 
	 		
				
				 </td>
			</tr>
			<tr>
				<td class="tdFirst">คะแนน:</td>
				<td class="tdLast"> 
				${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPI.mark} ชั่วโมงภาระงาน/ ${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPI.unitDesc}
				 </td>
			</tr> 
			
			  <form:errors		path="errorDesc" cssClass="require" />
		 			<c:forEach items="${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPIAttributeValueList}" var="domain" varStatus="status">
						<tr>
							<td class="tdFirst">
							  <c:out  value="${domain.name}"/>
		                    
							</td>
 							<td class="tdFirst" style="text-align: left;"  > 
 							 
		                    <input   name="academicKPIAttributeValueList[${status.index}].value" value="${domain.value}" style="width: 90%;" />
		                     <input type="hidden"  name="academicKPIAttributeValueList[${status.index}].name" value="${domain.name}"  />
		                     <span class="require">*</span>  
							</td>
						</tr>
		
					</c:forEach>
				<tr>
				<td class="tdFirst">การคำนวน:</td>
				<td class="tdLast"> 
				<c:out  value="${academicKPIUserMappingWrapper.academicKPIUserMapping.calResultStr}"/>
				
				</td>
				</tr>	
	 
		</table>
 
    </div>
    <br> 
 	<div  class="back_center">	
 	
 	
 	
  <br>
		  <div class="pbptableWrapper">
            
			
			<table class="pbp-table">
		   	   	<thead>
		   	   		<tr><th colspan="4">
		   	   		<div class="pbp-header"><span class="lsf-icon colororange" title="list"></span>  ${academicKPIWrapper.pBPWorkType.name} </div> 
					
					</th></tr>
		   	   		<tr>
		   	   			<th class="thFirst">เลือก KPI </th>
		   	   			<th class="thFirst">ภาระงาน</th>
		   	   			<th class="thFirst">คะแนน</th>
 						<th class="thFirst">หมายเหตุ</th>
		   	   		</tr>
		   	   	</thead>
		   	   	
		   	   
		   	   	
		   	   	<tbody> 
		   		<c:forEach items="${academicKPIWrapper.academicKPIList}" var="domain" varStatus="status">  
		   			<tr class="row1">
		   				<td class="tdFirst">
		   					<form:radiobutton path="academicSelectId" value="${domain.academicKPIId}"/>
		   				</td>
		   			
		   				<td class="tdFirst">
		   			  <c:if test="${domain.fromRegis != 'Y' }"> 
		   				<a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/importwork.htm?academicKPICode=<c:out  value="${domain.code}"/>&academicYear=<c:out  value="${academicKPIWrapper.academicYear}"/>&index=<c:out  value=""/>"> 
		   				     ${domain.name}
		   				</a>		
		   				</c:if>
		   				 <c:if test="${domain.fromRegis == 'Y' }">    
		   				  ${domain.name}
		   				 </c:if>				 
		   				 </td>
		   				<td class="tdFirst">${domain.mark} ชั่วโมงภาระงาน/ ${domain.unitDesc}</td>
 	   					<td class="tdFirst">
 	   					 ${domain.description}
 	   					<!--  
								    <c:if test="${domain.fromRegis == 'Y' }">  	 
						        ระบบดึงข้อมูลตารางสอนอัตโนมัติจาก สำนักทะเบียน
								    </c:if > 	   					
-->
						 </td>
		   			</tr>
		   			 	   			           
		       </c:forEach>   
		       
		       	 </tbody>		   	   	
			</table> 
		 </div>	
 	
 	
		

	
	  
	 <input class="btn btn-primary"	value="<spring:message code="label.button.save"/>" type="submit" >
 
	 
	 
	 	 &nbsp;
	<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init();">
	
	 &nbsp;
	  &nbsp;
	   &nbsp;
	    &nbsp;
	     &nbsp;
	     

	</div>
    <br> 
 
	 
 
</div> 
 </div>

</form:form>
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/pam/person/initAcademicWork.htm"; 
	 
		form.method='GET';	
		form.submit();	
	}
	function validateUpload (){		
		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/pam/person/uploadAttatchFileEdit.htm";
		form.method = 'POST';
		form.submit();
	}
 
	function replyMessagex (){	 
		 
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/pam/person/replyMessage.htm";
		 
		form.method = 'POST';
		form.submit();
	}
 
</script>
 