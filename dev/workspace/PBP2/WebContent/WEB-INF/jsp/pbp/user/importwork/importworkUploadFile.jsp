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
<form:form modelAttribute="academicKPI" action="importwork.htm" method="POST" name="mainForm" enctype="multipart/form-data">		 
<form:hidden path="academicYear"/>
 
<div class="post"> 
<div class="entry">	  
		<div class="pbptableWrapper">            
			<table class="pbp-table" style="width: 700px; margin-left: 15%;"> 
			<thead><tr><th colspan="2">
			<div class="pbp-header"><span class="lsf-icon colororange" title="list" ></span>นำเข้าภาระงานด้าน ${academicKPIWrapper.pBPWorkType.name}  </div> 
			</th></tr></thead>
			<tr>
				<td class="tdFirst">ชื่อภาระงาน:</td>
				<td class="tdLast">  ${academicKPI.name}  </td>
			</tr>
			 <tr>
				<td class="tdFirst">หมายเหตุ:</td>
				<td class="tdLast">  ${academicKPI.description}  </td>
			</tr>
			<tr>
				<td class="tdFirst">คะแนน:</td>
				<td class="tdLast"> 
				${academicKPI.mark} ชั่วโมงภาระงาน/ ${academicKPI.unitDesc}
				 </td>
			</tr>
			<!-- 
			<tr>
				<td class="tdFirst">หน่วย:</td>
				<td class="tdLast">
					<form:select path="unitCode"  >
		     			<option value="0" label=" - Select - " ></option>
		     			<form:options items="${academicKPI.academicUnitList}" itemLabel="name" itemValue="code"/>
		     			  <span class="require">*</span> <form:errors
					path="unitCode" cssClass="require" />
					</form:select>
					
				</td>
			</tr>	 
			 -->
			  <form:errors		path="errorDesc" cssClass="require" />
			 
		 			<c:forEach items="${academicKPI.academicKPIAttributeList}" var="domain" varStatus="status">
						<tr>
							<td class="tdFirst">
							  <c:out  value="${domain.name}"/>
		                    
							</td>
 							<td class="tdFirst"> 
		                    <input type="text"  name="academicKPIAttributeList[${status.index}].value" value="${domain.value}"  id="academicKPIAttributeList${status.index}" />
		                    <input type="hidden"  name="academicKPIAttributeList[${status.index}].name"  value="${domain.name}"  />
		                   	<span class="require">*</span> <form:errors		path="unitCode" cssClass="require" />
		                   	 <c:if test="${domain.isValidateNumber=='Y'}">กรอกค่าตัวเลขเท่านั้น </c:if>
		                   	 <c:if test="${domain.isValidateNumber=='Y'}"> 
		                   	 	<script> 
		                   	 	$(document).ready (function(){
									var inputNumber = $('#academicKPIAttributeList${status.index}');
									inputNumber.keydown(numberUtil.inputNumber);
		                   	 	});
		                   	 </script>
		                   	 </c:if>
							</td>						
						</tr>
					</c:forEach>	 
		</table>
    </div>
    <br>
    
        
     <c:if test="${academicKPI.academicKPIUserMappingId!=null}"> 
		<div class="pbptableWrapper">
            <div  ><span style="color: red;"> * เอกสารแนบ  (ไม่เกิน 10 MB)</span></div>
            
             	<table style="width: 600px; margin-left: 15%;"> 
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
            
             
			<table style="width: 600px; margin-left: 15%;"> 
 	 					<tr>
					<td class="tdFirst">แนบเอกสารประกอบการพิจรณา :  </td>
					<td class="tdLast">						
						<form:input path="fileData" id="image" type="file" cssClass="input"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="btn btn-primary" value="&#3629;&#3633;&#3614;&#3650;&#3627;&#3621;&#3604;" type="button"
							onclick="validateUpload();" /> 
					</td>					 
					</tr> 
			</table> 
    </div>   
    </c:if>
     
<br> 

 	<div  class="back_center">	
 		 &nbsp;
	 <a class="btn btn-primary" href="<%=request.getContextPath()%>/pam/person/listByWorktype.htm?workTypeCode=<c:out value="${academicKPIWrapper.pBPWorkType.code}"/>&academicYear=<c:out value="${academicKPIWrapper.academicYear}"/>&index=<c:out value=""/>"> Back</a>
 		 &nbsp;
  <c:if test="${academicKPI.academicKPIUserMappingId==null}"> 
	<input class="btn btn-primary"	value="Next" type="submit" >	
</c:if>
	</div>

	
</div> 
 </div>

</form:form>
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/pam/person/listByWorktype.htm?workTypeCode=<c:out value="${academicKPIWrapper.pBPWorkType.code}"/>&academicYear=<c:out value="${academicKPIWrapper.academicYear}"/>&index=<c:out value=""/>";
	 	form.method='GET';	
	 	alert(form.action);
		form.submit();	
	}
	function validateUpload (){		
		alert(document.getElementById('image').value);
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/pam/person/uploadAttatchFile.htm";
		form.method = 'POST';
		form.submit();
	}
	function editRatio(dat){
		 $('#ratio').val = dat;
	}
	
</script>
 