<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="importData" method="POST" name="mainForm" enctype="multipart/form-data" >
<div class="post">
	<h2 class="title">ผลงาน</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table width="100%" id="tableSearch">
			<tr>	
				<td class="label-form">
					Import Works: 
					&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/admin/importdata/works/initWorks.htm">
						<input type="button" class="btn btn-primary" value="Import"/>
					</a>
					<a href="<%=request.getContextPath()%>/admin/importdata/works/initWorksHistory.htm">
						<input type="button" class="btn btn-primary" value="History"/>
					</a>
				</td>
				
			</tr>
		</table>
		<div class="line">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
		<div>
			<table width="100%">	
				<tr>	
					<td class="label-form">&#3609;&#3635;&#3648;&#3586;&#3657;&#3634;&#3652;&#3615;&#3621;&#3660; : </td>
					<td >
						<form:input path="fileData" id="image" type="file" cssClass="input"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="btn btn-primary" value="&#3629;&#3633;&#3614;&#3650;&#3627;&#3621;&#3604;" type="button"
							onclick="validateUpload();" /> 
					</td> 
				</tr>	
			</table>
		</div>
	</div>
</div>
</form:form>

 
 <script>
	
	function validateUpload (){		
			
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/importdata/works/upload.htm";
		form.method='POST';	
		form.submit();
	}
 
	    
</script>
 