<%@page import="com.buckwa.domain.pam.Person"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 
<form:form modelAttribute="person" action="editProfile.htm" method="POST" name="mainForm" enctype="multipart/form-data">	
 
<div class="post"> 
<div class="entry"> 
<!-- <table style="width: 100%;">
 <tr>
 	<td width="45%" valign="top">  -->
 		 <div class="pbptableWrapper">
 
            
                 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header" style="text-align: center; font-size: 25px;">
                              แก้ไขข้อมูลส่วนตัว    ${principal.firstLastName} <small></small>
                        </h1>
                    </div>
                </div>           
            
            
<!-- 			<table class="pbp-table">
				<tbody>
	<tr>
		<td   > -->
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table width="50%"> 
<!-- 				<tr> -->
<!-- 					<td class="tdFirst">ชื่อสกุล (ไทย): </td> -->
<%-- 					<td class="tdFirst">${person.titleName}  ${person.thaiName} ${person.thaiSurname}</td>  --%>
<!-- 				</tr> -->
 
<!-- 				<tr> -->
<!-- 					<td class="tdFirst">สังกัด: </td> -->
<%-- 					<td class="tdFirst"> ${person.facultyDesc}</td> --%>
					 
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td class="tdFirst">ส่วนงาน: </td> -->
<%-- 					<td class="tdFirst">${person.departmentDesc}</td> --%>
					 
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td class="tdFirst">ประเภท: </td> -->
<%-- 					<td class="tdFirst"> ${person.employeeType}  </td> --%>
					 
<!-- 				</tr>  -->
<!-- 				<tr> -->
<!-- 					<td class="tdFirst">เลขที่อัตรา: </td>  -->
<%-- 					 <td class="tdFirst"> ${person.rateNo}  </td> --%>
					 
<!-- 				</tr> 				 -->
<!-- 				  <tr>				 -->
<!-- 					<td class="tdFirst">ตำแหน่งงาน: </td> -->
<!-- 					<td class="tdFirst"> -->
					
<%-- 					 <form:select path="academicRank" id="academicRank" disabled="true"> --%>
<%-- 						<form:options items="${person.lovAcademicRankList}" itemValue="code" itemLabel="name" /> --%>
<%-- 					</form:select>  --%>
<!-- 					</td> -->
		 
<!-- 				</tr>	 -->
<!-- 								  <tr>				 -->
<!-- 					<td class="tdFirst">วุฒิการศึกษา: </td> -->
<!-- 					<td class="tdFirst">  -->
					
<%-- 					 <form:select path="maxEducation" id="maxEducation" disabled="true"> --%>
<%-- 						<form:options items="${person.lovMaxEducationList}" itemValue="code" itemLabel="name" /> --%>
<%-- 					</form:select>					 --%>
					
<!-- 					</td> -->
					 		 
<!-- 				</tr>	 -->
<!-- 				<tr> -->
			
<!-- 					<td class="tdFirst">Email: </td> -->
<%-- 					<td class="tdFirst">${person.email}</td> --%>
					 
<!--                 </tr> -->

			<tr>
				<td class="tdFirst">รูปประวัติส่วนตัว:</td>
				<td class="tdFirst">
					<form:input path="fileData" id="image" type="file" cssClass="input" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="btn btn-primary" value="อัพโหลด" type="button" onclick="validateUpload();" />
					<span class="require">*</span>
					<form:errors path="picture" cssClass="require" />
				</td>
			</tr>	
<!-- 				<tr> -->
			
<!-- 					<td class="tdFirst">รูปส่วนตัว: </td> -->
<%-- 					<td class="tdFirst"> <img src="<%=request.getContextPath()%>/servlet/Image?<c:out value="${person.picture}" />" class="img_border" border="2"></td> --%>
					 
<!--                 </tr>			 -->
			
	 			
		
			</table>
		</div>			 
<!-- 		</td>
 
	</tr>			
					
				</tbody> 
				
				
			</table>  -->
		</div>		

<!-- 	</td>
 
 </tr> -->
  				 <tr>
					<td align="center">
 
				&nbsp;
				 
					</td>
				</tr>	
 
 			<div class="col-md-12" style="text-align: center;">
<!--  				 <tr> -->
<!-- 					<td align="center"> -->
 
					<input class="btn btn-primary"
					value="<spring:message code="label.button.save"/>" type="submit" id="saveBtn">
				<input class="btn btn-primary"
					value="<spring:message code="label.button.back"/>" type="button"
					id="cancelBtn">
				 
<!-- 					</td> -->
<!-- 				</tr>	 -->
			</div>
<!-- </table>   -->

</div>
</div>
 
</form:form>
<script type="text/javascript">

 	function validateUpload (){
		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>	/pam/person/uploadPersonProfilePicture.htm";
		form.method = 'POST';
		form.submit();
	}
	
	function edit(){
		window.location.href='<%=request.getContextPath()%>/pam/person/edit.htm';
	}
	
	$(document).ready( function() {

		$("#saveBtn").click(function(){
			openWaiting();
			return true;
		});

		$("#cancelBtn").click(function(){
			window.location = "<%=request.getContextPath()%>/pam/person/init.htm";
		});

		$('#birthdate,#workingDate,#assignDate,#retireDate').datepicker( {
			showOn : 'both',
			buttonText : 'Choose a date',
			buttonImage : '<c:url value="/images/calendar.jpg"/>',
			buttonImageOnly : true,
			showButtonPanel : true
		});

		$('#birthdate,#workingDate,#assignDate,#retireDate').datepicker($.datepicker.regional['th']);

	});
</script>
