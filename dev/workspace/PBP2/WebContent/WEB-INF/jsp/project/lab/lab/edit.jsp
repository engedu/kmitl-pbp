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


<div class="content100">  
<div class="mainContent100"> 
<form:form modelAttribute="lab"	action="edit.htm" method="POST" name="mainForm" enctype="multipart/form-data" >  

	<div class="subTopicHeader">Lab Edit</div>	 
	<br> 
	<div class="usecaseHeaderTxt">
 
    <div class="usecase">

      <table  >
      
            <tr>
      		<td class="usecaseheader">Code:</td>
      		<td> 
	 	 	<c:out value="${lab.code}"/> 
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
	 		&nbsp;<form:textarea cssClass="tinymce" path="summary"  cols="85" rows="4"/>  
      		</td>
      	</tr>      	
       	<tr>
      		<td class="usecaseheader">Actor:</td>
      		<td>
	 		&nbsp;<form:textarea cssClass="tinymce" path="actor"  cols="85" rows="4" />  
      		</td>
      	</tr>       	
        	<tr>
      		<td class="usecaseheader">Basic Flow:</td>
      		 <td  >
      		 
      		  <form:textarea path="basicFlow" cssClass="tinymce" rows="10" cols="85" />
  	 &nbsp; <span class ="require"  >*</span> <form:errors path="basicFlow" cssClass="require" />
      		
      		 </td>
      	</tr>      
        	<tr>
      		<td class="usecaseheader">Alternative Flows:</td>
      		<td  > 
      		
      		 <form:textarea path="alternateFlow" cssClass="tinymce" rows="10" cols="85" />
 
       		
      		</td>
      	</tr> 
      	
      	
         	<tr>
      		<td class="usecaseheader">เอกสารแนบ:</td>
      		<td> 
      		  <form:input path="fileData" id="image" type="file" /> 
			    <input class="btn_2" value="Upload File"  type="button" onclick="validateUploadFile();"/> 	
			    
			    <br>
			    <br> 
			    
			    <table width="25%"> 
			     <c:forEach items = "${useCase.filePathList}" var="domain">   
			      <tr>
			        <td >
			        <a href="<%=request.getContextPath()%>/updown/download.htm?filePath=<c:out value="${domain.fullImagePath}"/>&type=android"><c:out value="${domain.fileName}"/></a>
			        
			        &nbsp;
						<a href="<%=request.getContextPath()%>/lab/removeFile.htm?fileId=<c:out value="${domain.imagePathId}"/>&labId=<c:out value="${lab.labId}"/>" onclick="return confirmPage('ยืนยันการลบข้อมูล this File');" >  
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
		<a href="<%=request.getContextPath()%>/lab/init.htm?labCategoryId=<c:out value="${lab.labCategoryId}"/>">
		<input class="btn_2" value="<spring:message code="label.button.back"/>"  type="button"  >	
		</a>
    </div>   
 
	</div>
</form:form>
</div>
</div>
 <script type="text/javascript">
	function init (moduleIdIn){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/project/requirement/useCase/init.htm?moduleId="+moduleIdIn;
		alert(form.action);
		form.method='POST';	
		form.submit();	
	}

	function validateUploadFile(){
		var form = document.forms['mainForm']; 	 	 
		form.action ="<%=request.getContextPath()%>/project/requirement/useCase/uploadFile.htm";
		form.method='POST';	
		form.submit();
	}
</script>
 
	