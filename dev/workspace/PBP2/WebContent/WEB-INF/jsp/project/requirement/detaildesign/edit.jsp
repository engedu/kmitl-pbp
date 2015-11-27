edit<%@ page pageEncoding="UTF-8"%>
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


<div class="content100">  
<div class="mainContent100"> 
<form:form modelAttribute="detailDesign"	action="edit.htm" method="POST" name="mainForm" enctype="multipart/form-data" > 
	<div class="subTopicHeader">Detail Design Edit</div>	 
	<br> 
	<div class="usecaseHeaderTxt"> 
    <div class="usecase">
      <table  >      
            	<tr>
      		<td class="usecaseheader">Code:</td>
      		<td>
      		
	 	 	<c:out value="${detailDesign.code}"/>
      		
      		</td>
      	</tr>
      	<tr>
      		<td class="usecaseheader">Name:</td>
      		<td>
      		
	 &nbsp;<form:input cssClass="tb300" path="name" /><span class ="require"  >*</span> <form:errors path="name" cssClass="require" />
      		
      		</td>
      	</tr>
      	<tr>
      		<td class="usecaseheader">Summary:</td>
      		<td>
	 		&nbsp;<form:textarea cssClass="tinymce" path="summary"  cols="120" rows="4"/>  
      		</td>
      	</tr>      	
 

       	<tr>
      		<td class="usecaseheader">Step:</td>
      		<td>
	 		&nbsp;<form:textarea cssClass="tinymce" path="step"  cols="120" rows="15"/>  
      		</td>
      	</tr> 
      	
  
       	<tr>
      		<td class="usecaseheader">Screen:</td>
      		<td> 
      		  <form:input path="screenFileData" id="screenFile" type="file" /> 
			    <input class="btn_2" value="Upload Image"  type="button" onclick="validateUploadScreen();"/> 				    
			    <br>
			    <br>
			    
			    <table width="25%"> 
			     <c:forEach items = "${detailDesign.screenImagePathList}" var="domain">   
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
      		<td class="usecaseheader">File:</td>
      		<td> 
      		  <form:input path="fileData" id="fileData" type="file" /> 
			    <input class="btn_2" value="Upload File"  type="button" onclick="validateUploadFile();"/> 	
			    
			    <br>
			    <br>
			    
			    <table width="25%"> 
			     <c:forEach items = "${detailDesign.filePathList}" var="domain">   
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
      		<td class="usecaseheader">Database:</td>
      		<td>
	 		&nbsp;<form:textarea cssClass="tinymce" path="dataPart"  cols="120" rows="8"/>  
      		</td>
      	</tr>     	     	
      	     	
      </table>   
  
 

      <br>
		<input class="btn_2" value="<spring:message code="label.button.save"/>"  type="submit" >	 
 
    </div>   
 
	</div>
</form:form>
</div>
</div>
 <script type="text/javascript">
	function init (moduleIdIn){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/project/requirement/detailDesign/init.htm?moduleId="+moduleIdIn;
		alert(form.action);
		form.method='POST';	
		form.submit();	
	}

	function validateUploadScreen(){
		var form = document.forms['mainForm']; 	 	 
		form.action ="<%=request.getContextPath()%>/project/requirement/detailDesign/uploadScreen.htm"; 
		form.method='POST';		 
		form.submit();
	}

	function validateUploadFile(){
		var form = document.forms['mainForm']; 	 	 
		form.action ="<%=request.getContextPath()%>/project/requirement/detailDesign/uploadFile.htm";
		form.method='POST';	
		alert(form.action);
		form.submit();
	} 
</script>
 