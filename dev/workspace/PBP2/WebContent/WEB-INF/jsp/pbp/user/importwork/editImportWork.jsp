<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
 
<form:form modelAttribute="academicKPIUserMappingWrapper" action="editImportwork.htm" method="POST" name="mainForm" enctype="multipart/form-data">		 
<form:hidden path="academicYear"/>
 
<div class="post"> 
<div class="entry">	  
	 
		<div class="pbptableWrapper">
            <div class="pbp-header">ภาระงาน </div>
             
			<table class="pbp-table">
 		 
			<tr>
				<td class="tdFirst">ชื่อภาระงาน:</td>
				<td class="tdLast">  ${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPI.name} :  ${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPI.fromRegis}  </td>
				<td class="tdLast" colspan="3" width="20%" align="left" style="background-color: rgb(246,246,246);">
				
	     	 <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status=='CREATE'}">
	 
				 <a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/deleteImportWork.htm?kpiUserMappingId=<c:out value="${academicKPIUserMappingWrapper.academicKPIUserMapping.kpiUserMappingId}"/>"> 
				 <img src="<c:url value="/images/del1.jpg"/>" width="40" height="40"/>
				 </a>
			 </c:if>		
	
	     	 <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status=='APPROVED'}">
	              <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPI.fromRegis=='Y'}">
						<input class="btn btn-primary" value="แก้ไข  KPI ที่ใช้คำนวณ" type="button" onclick="#">              
	              </c:if>

			 </c:if>		 
	 		
				
				 </td>
			</tr>
			<tr>
				<td class="tdFirst">คะแนน:</td>
				<td class="tdLast"> 
				${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPI.mark} คะแนน/ ${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPI.unitDesc}
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
					
	 
		</table>
 
    </div>
    <br> 
 	<div  class="back_center">	
		

	
	 <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status=='CREATE'}">
	 <input class="btn btn-primary"	value="<spring:message code="label.button.save"/>" type="submit" >
 
	 </c:if>
	 
	 	 &nbsp;
	<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init();">
	
	 &nbsp;
	  &nbsp;
	   &nbsp;
	    &nbsp;
	     &nbsp;
	     

	</div>
    <br> 
 
		<div class="pbptableWrapper">
             <div  >  เอกสารแนบ  (ไม่เกิน 10 MB) </div>
            
            
             <table class="pbp-table">
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
			<table class="pbp-table">
 	 					<tr>
					<td class="tdFirst">แนบเอกสารประกอบการพิจรณา :  </td>
					<td class="tdLast">						
						<form:input path="fileData" id="image" type="file" cssClass="input"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status=='CREATE'}">
						<input class="btn btn-primary" value="&#3629;&#3633;&#3614;&#3650;&#3627;&#3621;&#3604;" type="button"
							onclick="validateUpload();" /> 
							</c:if>
					</td>
					 
					</tr>
	 
			</table>
       </c:if>
    </div>   
    
    
    
    		<div class="pbptableWrapper">
            <div class="pbp-header">ข้อความ </div>
            
  
			
			<table class="pbp-table">
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
   		 
   		 	<form:textarea path="replyMessage" cssClass="tinymce" rows="10" cols="80" />
   		  
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
 