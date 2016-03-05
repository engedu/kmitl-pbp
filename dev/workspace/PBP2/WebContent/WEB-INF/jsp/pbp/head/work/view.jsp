 <%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="academicKPIUserMappingWrapper" action="importwork.htm" method="POST" name="mainForm" enctype="multipart/form-data">		 
<form:hidden path="academicYear"/>
 
<div class="post"> 
<div class="entry">	  
	 
		<div class="pbptableWrapper">
            
             
			<table class="pbp-table">
 		 	<thead><tr><th colspan="3">
 		 	<div class="pbp-header"><span class="lsf-icon colororange" title="list" ></span>ภาระงาน </div>
			</th></tr></thead>
			<tr>
				<td class="tdFirst">ชื่อภาระงาน:</td>
				<td class="tdLast">  ${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPI.name}  </td>
				
				<td class="tdLast" colspan="3" width="20%" align="left" style="background-color: rgb(246,246,246);">
				 
	     	 <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status=='CREATE'}">
	 
<a rel="notLoading" class="button approve" href="<%=request.getContextPath()%>/head/pbp/approveWork.htm?kpiUserMappingId=${academicKPIUserMappingWrapper.academicKPIUserMapping.kpiUserMappingId}">
	 <%-- <img src="<c:url value="/images/approve.jpg"/>" width="40" height="40"/> --%>Approve
	 </a>
	 </c:if>	

	     	 <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status=='CREATE_CO_TEACH'}">
	 
<a rel="notLoading" class="button approve" href="<%=request.getContextPath()%>/head/pbp/approveWork.htm?kpiUserMappingId=${academicKPIUserMappingWrapper.academicKPIUserMapping.kpiUserMappingId}">
	 <%-- <img src="<c:url value="/images/approve.jpg"/>" width="40" height="40"/> --%>Approve
	 </a>
	 </c:if>		 
	 
 		
				
				 </td>				
			</tr>
			
			<tr>
				<td class="tdFirst">หมายเหตุ:</td>
				<td class="tdLast">  ${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPI.description}  </td>
				
				<td class="tdLast" colspan="3" width="20%" align="left" style="background-color: rgb(246,246,246);">
				 
 
 		
				
				 </td>				
			</tr>			
			
			<tr>
				<td class="tdFirst">คะแนน:</td>
				<td class="tdLast"> 
				${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPI.mark} คะแนน/ ${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPI.unitDesc}
				 </td>
			</tr> 
		 			<c:forEach items="${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPIAttributeValueList}" var="domain" varStatus="status">
						<tr>
							<td class="tdFirst">
							  <c:out  value="${domain.name}"/>
		                    
							</td>
 							<td class="tdFirst"> 
		                   <c:out  value="${domain.value}"/>
		                   	 
							</td>						
						</tr>
					</c:forEach>	 
		</table>
 
    </div>
    
    <br>
 
    
      
		<div class="pbptableWrapper">
            <table class="pbp-table">
             <thead><tr><th colspan="2">
 		 	<div class="pbp-header"> เอกสารแนบ  (ไม่เกิน 10 MB) </div>
			</th></tr></thead>
             <c:forEach items="${academicKPIUserMappingWrapper.academicKPIUserMapping.academicKPIAttachFileList}" var="domain" varStatus="status">
 	 				 <tr>
					<td class="tdFirst">	${status.index+1} </td>
					<td class="tdFirst">
						 <a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/downloadAttachFile.htm?attachFileId=<c:out  value="${domain.attachFileId}"/>"> 
							 <c:out  value="${domain.fileName}"/> 
						</a>
					 
					</td>
	 
					 
					</tr>
	          </c:forEach>
			</table>
 
 
    </div>   
   
   
     
     
<br> 
 	<div  class="back_center">	

	
	 &nbsp;
	<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init();">
	</div>

	
    		<div class="pbptableWrapper">
            
			<table class="pbp-table">
			<thead><tr><th colspan="1">
 		 	<div class="pbp-header"><span class="lsf-icon colororange" title="list" ></span>ข้อความ </div>
			</th></tr></thead>
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
   		 
  
  
     		  <c:if test="${academicKPIUserMappingWrapper.academicKPIUserMapping.status=='CREATE_CO_TEACH'}">
   		 <sec:authorize ifAnyGranted="ROLE_USER">    
   		 
   		  <tr>
   		 <td class="tdLast">	 		     		 
   		 <div class="messageReply"> 
   		 
   		 	<form:textarea path="replyMessage" cssClass="tinymce" rows="10" cols="80" />
   		 	 <span class ="require"  >*</span> 
   		 	 <form:errors path="replyMessage" cssClass="require" />
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
		form.action ="<%=request.getContextPath()%>/head/pbp/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	function replyMessagex (){	 
		 
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/head/pbp/replyMessage.htm";
		 
		form.method = 'POST';
		form.submit();
	}
 
</script>
 
