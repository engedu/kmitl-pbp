<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<script type="text/javascript" src='<c:url value="/js/inputNumber.js"/>'></script>
 
<form:form modelAttribute="academicKPIUserMappingWrapper" action="editImportwork.htm" method="POST" name="mainForm" enctype="multipart/form-data">		 
<form:hidden path="academicYear"/>
 
<div class="post"> 
<div class="entry">	  
	 
		<div class="pbptableWrapper">
 			<table class="pbp-table">
		   	   	<thead>
		   	   		<tr>
		   	   		
		   	   		<th  > <div class="pbp-header">  <span class="lsf-icon colororange" title="list"></span> รายละเอียดการคำนวณภาระงานด้าน ${academicKPIUserMappingWrapper.pBPWorkType.name} </div>  &nbsp;
 					
					</th>
 
							 	
							 					
					</tr>
 
		   	   	</thead>			
			</table>
             
			<table class="pbp-table">
 		 
			<tr>
				<td class="tdFirst">ชื่อภาระงาน:</td>
				<td class="tdLast"> <span style="font-size: 17px; font-weight: bold;"> ${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPI.name}  </span></td>
				<td class="tdLast" colspan="3" width="20%" align="left" style="background-color: rgb(246,246,246);">
				
	     	 <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status=='CREATE'}">
	 
				 <a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/deleteImportWork.htm?kpiUserMappingId=<c:out value="${academicKPIUserMappingWrapper.academicKPIUserMapping.kpiUserMappingId}"/>"
				 onclick="return confirmPage('ยืนยันการลบข้อมูล?')"> 
				  <span style="color: red; font-size: 25px;">ลบรายการ</span> 
				 </a>
				 
		 		 
				 
			 </c:if>		
	
	     	 <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status=='APPROVED'}">
	              <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPI.fromRegis=='Y'}">
	               <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status != 'APPROVED' }">     
	              	 <a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/editKPIMapping.htm?kpiUserMappingId=<c:out value="${academicKPIUserMappingWrapper.academicKPIUserMapping.kpiUserMappingId}"/>"> 
		   				    <input class="btn btn-primary" value="แก้ไข  KPI ที่ใช้คำนวณ" type="button" > 
<!-- 		   				    onclick="#" -->
		   			 </a>	
						   </c:if>         
	              </c:if>

			 </c:if>		 
	 		
				
				 </td>
			</tr>
			<tr>
				<td class="tdFirst">คะแนน KPI:</td>
				<td class="tdLast" style="text-align: left;"> 
				${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPI.mark} คะแนน/ ${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPI.unitDesc}
				 </td>
			</tr> 
			
			  <form:errors		path="errorDesc" cssClass="require" />
		 			<c:forEach items="${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPIAttributeValueList}" var="domain" varStatus="status">
				
				 <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status != 'APPROVED' }">     
						<tr>
							<td class="tdFirst">
							  <c:out  value="${domain.name}"/>  
		                    
							</td>
 							<td class="tdFirst" style="text-align: left;"  > 
 							 
		                    <input   name="academicKPIAttributeValueList[${status.index}].value" value="${domain.value}"  id="academicKPIAttributeValueList${status.index}" style="width: 90%;" />
		                     <input type="hidden"  name="academicKPIAttributeValueList[${status.index}].name" value="${domain.name}"  />
		                     <span class="require">*</span>  
		                     
		                      <c:if test="${domain.isValidateNumber=='Y'}">กรอกค่าตัวเลข</c:if>
		                   	 <c:if test="${domain.isValidateNumber=='Y'}"> 
		                   	 	<script> 
		                   	 	$(document).ready (function(){
									var inputNumber = $('#academicKPIAttributeValueList${status.index}');
									inputNumber.keydown(numberUtil.inputNumber);
		                   	 	});
		                   	 </script>
		                   	 </c:if>
							</td>
						</tr>
		</c:if>
		
		
		 <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status == 'APPROVED' }"> 
		 						<tr>
							<td class="tdFirst">
							  <c:out  value="${domain.name}"/>
		                    
							</td>
 							<td class="tdFirst" style="text-align: left;"  > 
 							 
		                    <input   name="academicKPIAttributeValueList[${status.index}].value" value="${domain.value}" style="width: 90%;"  readonly="readonly"/>
		                     <input type="hidden"  name="academicKPIAttributeValueList[${status.index}].name" value="${domain.name}"  />
		                     <span class="require">*</span>  
							</td>
						</tr>
		 </c:if>
					</c:forEach>
				<tr>
				
				
				<td class="tdFirst">การคำนวณ:</td>
				<td class="tdLast" style="text-align: left;">
				<b><c:out  value="${academicKPIUserMappingWrapper.academicKPIUserMapping.calResultStr}"/></b>
				
				</td>
				</tr>	
	 
		</table>
 
    </div>

    
 
		<div class="pbptableWrapper">
           <div  >  เอกสารแนบ  (ไม่เกิน 10 MB) </div>
            
            
            	<table style="width: 600px;" >
             <c:forEach items="${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPIAttachFileList}" var="domain" varStatus="status">
 	 				 <tr>
					<td class="tdFirst">	${status.index+1} </td>
					<td class="tdFirst">
						 <a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/downloadAttachFile.htm?attachFileId=<c:out  value="${domain.attachFileId}"/>"> 
							 <c:out  value="${domain.fileName}"/> 
						</a>
					 
					</td>
					<td class="tdLast">	
					<c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status != 'APPROVED' }">  
						 <a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/deleteAttachFile.htm?kpiUserMappingId=<c:out value="${academicKPIUserMappingWrapper.academicKPIUserMapping.kpiUserMappingId}"/>&attachFileId=<c:out  value="${domain.attachFileId}"/>"> 
						   Delete
						 </a>					
					 </c:if> 
					</td> 
					 
					</tr>
	          </c:forEach>
			</table>
            
         <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status != 'APPROVED' }">     
			<table style="width: 600px;" >
 	 					<tr>
					<td class="tdFirst">แนบเอกสารประกอบการพิจารณา :  </td>
					<td class="tdLast">						
						<form:input path="fileData" id="image" type="file" cssClass="input"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  
						<input class="btn btn-primary" value="&#3629;&#3633;&#3614;&#3650;&#3627;&#3621;&#3604;" type="button"
							onclick="validateUpload();" /> 
						 
					</td>
					 
					</tr>
	 
			</table>
       </c:if>
    </div>   
    
    
    
    		<div class="pbptableWrapper">
            <div class="pbp-header">ข้อความ </div>
            
  
			
			 <table style="width:700px;" >
          <c:forEach items="${academicKPIUserMappingWrapper.academicKPIUserMapping.messageList}" var="domain" varStatus="status"> 
           <tr>  
          <td class="tdLast" style="border-bottom: 1px solid gray;">	   
	        <div class="messageDetail">                	   
	         <c:set var="msg" value="${domain.messageDetail}" scope="page" />
	   		 <c:out value='${msg}' escapeXml="false" />  
	   		 <div class="messageDetailUser"> <c:out value="${domain.createBy}"/> &nbsp; <span class="messageDetailDate"><c:out value="${domain.createDateTimeStr}"/></span></div>
 
	        </div>  
	        </td>  
	        </tr>
   		 </c:forEach>
   		 
   		  <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status=='CREATE'}">
   		 <sec:authorize ifAnyGranted="ROLE_USER">    
   		 
   		  <tr>
   		 <td class="tdLast">	
   		 		     		 
   		 <div class="messageReply"> 
   		 <div style="width: 90%;text-align: left;"> <h3 >ส่งข้อความถึงหัวหน้าภาค/ประธานสาขาวิชา</h3> </div>
   		
   		 	<form:textarea path="replyMessage" cssClass="tinymce" rows="5" cols="60" />
   		 
   		 </div> 
   		 </td>
   		 </tr>
   		 </sec:authorize>
   		 
   		 <br><br>
              <tr>
   		 <td class="tdLast">	 
   		 <input class="btn btn-primary" value="Reply Message"  onclick="replyMessagex();"  /> 
   		 </td>
   		 </tr>
   		 </c:if>
   		 
   		 </table>
    </div>  
    
    
    
    <br> 
 	<div  class="back_center">	 
		 	 &nbsp;
	<input class="btn btn-primary" value="ย้อนกลับ" type="button" onclick="initAfterApprove();">
	
	 &nbsp;
	 <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status=='CREATE'}">
	 <input class="btn btn-primary"	value="<spring:message code="label.button.save"/>" type="button" onclick="submitForm();">
 	 
	 </c:if>
	 
	 	 <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status=='CREATE_CO_TEACH'}">
	 
	  <input class="btn btn-primary"	value="<spring:message code="label.button.save"/>" type="button" onclick="submitForm();" >
 
	 </c:if>
	</div>    
    
    
</div> 
 </div>

</form:form>
 
 <script type="text/javascript">
	function submitForm (){
		var form = document.forms['mainForm']; 
		if(isSelect()){
			form.method='POST';	
			form.submit();				
		}

	}
	
	
	function initAfterApprove (){
		var form = document.forms['mainForm']; 
 
			form.action ="<%=request.getContextPath()%>/pam/person/initAcademicWork.htm"; 
			form.method='GET';	
			form.submit();				
	 

	}
	function init (){
		var form = document.forms['mainForm']; 
		if(isSelect()){
			form.action ="<%=request.getContextPath()%>/pam/person/initAcademicWork.htm"; 
			form.method='GET';	
			form.submit();				
		}

	}
	function validateUpload (){		
		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/pam/person/uploadAttatchFileEdit.htm";
		form.method = 'POST';
		form.submit();
	}
 
	function replyMessagex (){	 
		 
		var form = document.forms['mainForm']; 
		if(isSelect()){
			form.action ="<%=request.getContextPath()%>/pam/person/replyMessage.htm";
			 
			form.method = 'POST';
			form.submit();
		}
	}
	function isSelect(){
		
		if(document.getElementById('image').value== ""){			
			return true;
		}else{
			alert(" กรุณา Upload File ที่เลื่อกไว้");
			return false;
		}
	}
</script>
 