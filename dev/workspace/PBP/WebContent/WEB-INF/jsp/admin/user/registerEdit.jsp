<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>

<div class="content">  
<div class="mainContent"> 
<form:form modelAttribute="user"	action="edit.htm" method="POST" name="mainForm" enctype="multipart/form-data" > 
	<div class="topicHeader">User Registration Edit</div> 	
	<div class="searchForm">
	<div class="subTopicHeader">User </div> 	
	
	
	<table width="100%">
		<tr>	
			<td class="formLabel">
				Login Name: 
			</td>
			<td>			 
			<c:out value="${user.username}"/>
				 
			</td> 
		</tr>				
			
 		
 		
	<tr>
		<td colspan="2"> 
			<hr>
		</td>
	</tr>
			

			
		<tr>	
			<td class="formLabel">
				First Name: 
			</td>
			<td>
				<form:input cssClass="tb1"  path="first_name" /> <form:errors path="first_name" cssClass="require" />
			</td> 
		</tr>			


		<tr>	
			<td class="formLabel">
				Last Name:
			</td>
			<td>
				<form:input cssClass="tb1"  path="last_name" /> <form:errors path="last_name" cssClass="require" />
			</td> 
		</tr>
		
		<tr>	
			<td class="formLabel">
				 E-mail:
			</td>
			<td>
				<form:input cssClass="tb1"  path="email" /> <form:errors path="email" cssClass="require" />
			</td> 
		</tr>
		<tr>	
			<td class="formLabel">
				 Address Line1:
			</td>
			<td>
				<form:input cssClass="tb1"  path="address1" /> <form:errors path="address1" cssClass="require" />
			</td> 

		</tr>	
		<tr>
					<td class="formLabel">
				 Address Line2:
			</td>
								<td>
				<form:input cssClass="tb1"  path="address2" /> <form:errors path="address2" cssClass="require" />
			</td> 
		</tr>	
		<tr>	
			<td class="formLabel">
				 Telephone No::
			</td>
			<td>
				<form:input cssClass="tb1"  path="tel_no" /> <form:errors path="tel_no" cssClass="require" />
			</td> 
		</tr>	
		<tr>	
			<td class="formLabel">ลายเซ็น:</td>			 
				<td>
					<form:input path="fileData" id="image" type="file" /> 
					<input class="btn_2" value="Upload"  type="button" onclick="validateUpload();">	
				 </td>
			 
			</tr>			
		<tr>	
		<td> &nbsp;</td>	 
		<td colspan="1">
			<c:if test="${ user.fullSignatureImagePath !=null}">
				<img src="<%=request.getContextPath()%>/servlet/Image?<c:out value="${user.fullSignatureImagePath}"  />" width="100px;" height="60px;">
			</c:if>		
		</td>
		</tr>		
			<tr>  <td colspan="2">&nbsp; </tr>								
			<tr> 
				<td> </td>
				<td align="left">
				<input class="btn_2" value="<spring:message code="label.button.save"/>"  type="submit" >	    
				<input class="btn_2" value="<spring:message code="label.button.back"/>"  type="button" onclick="init();">	
				
			    </td>
		     </tr>			
		</table>
	</div>
</form:form>	
</div>
</div>
 <script type="text/javascript">

	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/user/init.htm";
		form.method='GET';	
		form.submit();	
	}

	function validateUpload(){
		var form = document.forms['mainForm']; 	 	 
		form.action ="<%=request.getContextPath()%>/user/registration/uploadSingature.htm";
		form.method='POST';	
		form.submit();

	}
</script>