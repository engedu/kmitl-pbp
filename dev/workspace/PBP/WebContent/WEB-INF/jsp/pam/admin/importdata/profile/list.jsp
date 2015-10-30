<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.buckwa.domain.*"%>
<%@ page import="java.util.*"%>

<form:form modelAttribute="importData" 	method="POST" name="mainForm" enctype="multipart/form-data">		
<div class="post">
 
	<div class="entry">
	
		 <div class="pbptableWrapper">
            <div class="pbp-header"> 	นำเข้าข้อมูลบุคลากร ประจำปีการศึกษา : ${academicYearStr}   &nbsp;   &nbsp;&nbsp;   &nbsp;&nbsp;   &nbsp;&nbsp;   &nbsp;&nbsp;   &nbsp;&nbsp;   &nbsp;&nbsp;   &nbsp;&nbsp;   &nbsp;
  				<a rel="notLoading" href="#" onclick="showHistory();"> <input type="button" class="btn btn-primary" value="ประวัติการนำเข้า"  /></a>             </div> 
			
			<table class="pbp-table">
				<tbody>
					<tr>
					<td class="tdFirst">นำเข้าข้อมูล บุคลากร : </td>
					<td class="tdLast">						
						<form:input path="fileData" id="image" type="file" cssClass="input"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="btn btn-primary" value="&#3629;&#3633;&#3614;&#3650;&#3627;&#3621;&#3604;" type="button"
							onclick="validateUpload();" /> 
					</td>
					 
					</tr>
				</tbody> 
			</table> 
		</div>		
 
	</div>
</div>
</form:form>
<script>
	
	function validateUpload (){		
		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>	/admin/importdata/profile/upload.htm";
		form.method = 'POST';
		form.submit();
	}
	
	function showHistory(){		
		document.location.href= "<%=request.getContextPath()%>/admin/importdata/profile/initProfileHistory.htm";
	}
	
	function importFile(){
		document.location.href="<%=request.getContextPath()%>/admin/importdata/profile/initProfile.htm";
	}
</script>
