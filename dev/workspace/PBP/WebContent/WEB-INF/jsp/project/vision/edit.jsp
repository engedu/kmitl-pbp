 <%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %> 
<A NAME="top"></A>
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>   
<div class="content90">  
<div class="mainContent90"> 
<form:form modelAttribute="project"	action="edit.htm" method="POST" name="mainForm" enctype="multipart/form-data" >  
	<div class="subTopicHeader"><c:out value="${project.vision.projectName}"/> : Vision Edit</div>	 
	<br> 
	<div class="usecaseHeaderTxt"> 
    <div class="usecase">
      <table  >       
      	<tr>
      		<td class="usecaseheader">Summary:</td>
      		<td>
	 		&nbsp;<form:textarea cssClass="tinymce" path="vision.summary"  cols="120" rows="15"/>  
      		</td>
      	</tr>      	
        	<tr>
      		<td class="usecaseheader">Image:</td>
      		<td> 
      		  <form:input path="vision.fileData" id="image" type="file" /> 
			    <input class="btn_2" value="Upload Image"  type="button" onclick="validateUploadImage();"/> 	
			    
			    <br>
			    <br>
			    
			    <table width="25%"> 
			     <c:forEach items = "${project.vision.imagePathList}" var="domain">   
			      <tr>
			        <td >
			        <img src="<%=request.getContextPath()%>/servlet/Image?<c:out value="${domain.fullImagePath}"/>" width="70px" height="80px"/>
			        &nbsp;
							<a href="<%=request.getContextPath()%>/project/vision/removeImage.htm?imagePathId=<c:out value="${domain.imagePathId}"/>" onclick="return confirmPage('ยืนยันการลบข้อมูล this image');" >  
			        	 Delete</a>
		 			 </td> 
			      	<td>
			      	   
			      	</td> 
			      </tr>
			        </c:forEach> 
			    </table> 
			     
      		</td>
      	</tr>        	 
       	<tr>
      		<td class="usecaseheader">Detail:</td>
      		<td>
	 		&nbsp;<form:textarea cssClass="tinymce" path="vision.detail"  cols="120" rows="30" />  
      		</td>
      	</tr> 
      	
        	<tr>
      		<td class="usecaseheader">Reference:</td>
      		<td>
	 		&nbsp;<form:textarea cssClass="tinymce" path="vision.reference"  cols="120" rows="30" />  
	 		<br>
	 		   <form:input path="vision.referenceFileData" id="image" type="file" /> 
			    <input class="btn_2" value="Upload File"  type="button" onclick="validateUploadReferenceFile();"/> 	
	 		  <table width="25%"> 
			     <c:forEach items = "${project.vision.filePathList}" var="domain">   
			      <tr>
			        <td > 
			        <c:out value="${domain.fileName}"/>&nbsp;
					 <a href="<%=request.getContextPath()%>/project/vision/removeFile.htm?filePathId=<c:out value="${domain.imagePathId}"/>" onclick="return confirmPage('ยืนยันการลบข้อมูล this File');" >  
			        	 Delete</a>
		 			 </td> 
			      	<td>
			      	</td> 
			      </tr>
			        </c:forEach> 
			    </table> 
      		</td>
      	</tr>      	   
      </table>    
      <br>
		<input class="btn_2" value="<spring:message code="label.button.save"/>"  type="submit" >	 
		<a href="<%=request.getContextPath()%>/project/vision/init.htm?projectId=<c:out value="${vision.projectId}"/>">
		<input class="btn_2" value="<spring:message code="label.button.back"/>"  type="button"  >	
		</a>
    </div>   
 
	</div>
</form:form>
</div>
</div>
 
	 <script type="text/javascript">
	function validateUploadImage(){
		var form = document.forms['mainForm']; 	 	 
		form.action ="<%=request.getContextPath()%>/project/vision/uploadImage.htm";
		form.method='POST';	
		form.submit();
	}
	function validateUploadReferenceFile(){
		var form = document.forms['mainForm']; 	 	 
		form.action ="<%=request.getContextPath()%>/project/vision/uploadFile.htm";
		form.method='POST';	
		form.submit();
	}	
	
 
</script>