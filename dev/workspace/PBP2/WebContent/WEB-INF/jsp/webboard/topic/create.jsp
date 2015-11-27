<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %> 
<div class="content100">  
<div class="mainContent100"> 
<form:form modelAttribute="topic"	action="create.htm" method="POST" name="mainForm">  
	
	<div class="subTopicHeader">Topic >> Create</div> 
		<table width="100%">
			<tr>	
				<td class="formLabel">
					Topic Name:&nbsp;
				</td>
				<td class="formValue">
				 	<form:input cssClass="tb1" path="topicHeader"  maxlength="50"/> <span class ="require"  >*</span> <form:errors path="topicHeader" cssClass="require" />
				</td> 
			</tr>	
			<tr>	
				<td class="formLabel">
					Description:&nbsp;
				</td>
				<td class="formValue">
	 
						<div>
			<form:textarea path="topicDetail" cssClass="tinymce" rows="15" cols="90"  />
 
		</div>
				</td> 
			</tr>						

		  
		    <tr>  <td colspan="3">&nbsp; </tr>		
		     <tr>
		     	<td colspan="4"><hr></td>
		     </tr>		      
		        <tr>  <td colspan="3">&nbsp; </tr>	
		     <tr>	
			<td class="formLabel">
				Image or Video : &nbsp;
			</td>
			<td class="formValue">
				 
					<form:input path="fileData" id="uploadFile"   type="file" /> 
					<input class="btn_2" value="Upload"  type="button" onclick="validateUpload();">		
				 
			</td> 
		</tr>
		
			<tr>  <td colspan="3">&nbsp; </tr>								
			<tr> 
				<td> </td>
				<td align="left">
						<input class="btn_2" value="<spring:message code="label.button.save"/>"  type="submit" >	
		 <a href="<%=request.getContextPath()%>/webboard/topic/init.htm?catType=GENERAL">
		<input class="btn_2" value="<spring:message code="label.button.back"/>"  type="button"  >	
		</a>
		    
			    </td>
		     </tr>			
		</table>


</form:form>	
</div>
</div>
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/webboard/topic/init.htm?catType=GENERAL";
		form.method='GET';	
		form.submit();	
	}

	function validateUpload(){
		var form = document.forms['mainForm']; 	 	 
		//form.action ="<%=request.getContextPath()%>/updown/uploadAndroid.htm";	 
		alert(" validateUpload:"+form.action);
		//form.method='POST';	
		//form.submit();

	}
</script>