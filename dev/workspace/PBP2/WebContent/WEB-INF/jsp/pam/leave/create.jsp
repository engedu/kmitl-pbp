<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.buckwa.domain.*"%>
<%@ page import="java.util.*"%>

<%@page import="com.buckwa.util.BuckWaConstants"%>
<form:form modelAttribute="leave" action="init.htm" method="POST" name="mainForm">
<div class="post">
	<h2 class="title">ยื่นใบลา</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table width="100%" id="tableSearch">
			<tr>
				<td class="label-form">ประเภทการลา:</td>
				<td>
					<form:select path="leaveTypeCode" id="leaveTypeCode">
							<form:option value="" label="--- กรุณาเลือกประเภทการลา ---" /> 
							<form:options items="${leave.leaveTypes}" itemValue="code" itemLabel="name" />
					</form:select>
					<form:errors path="leaveTypeCode" cssClass="require" /> <input value="<spring:message code="label.button.new"/>" type="button" class="btn btn-primary" onclick="create();" rel='notLoading'>
				</td>
			</tr>
		</table>
		<div class="line">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
	</div>
</div>
</form:form>

<script type="text/javascript">
	
	function create(){
		if($("#leaveTypeCode").val()==""){
			alert('กรุณาเลือกประเภทการลา');
		}else if($("#leaveTypeCode").val()=="<%=BuckWaConstants.LEAVE_RESEARCH%>"){
			
			var form = document.forms['mainForm']; 
			form.action ="<%=request.getContextPath()%>/leave/research/init.htm";
			form.method='GET';	
			form.submit();
		}else if($("#leaveTypeCode").val()=="<%=BuckWaConstants.LEAVE_VACATION%>"){
			
			var form = document.forms['mainForm']; 
			form.action ="<%=request.getContextPath()%>/leave/vacation/init.htm";
			form.method='GET';	
			form.submit();
		}else if($("#leaveTypeCode").val()=="<%=BuckWaConstants.LEAVE_SICK%>"){
			
			var form = document.forms['mainForm']; 
			form.action ="<%=request.getContextPath()%>/leave/sick/init.htm";
			form.method='GET';	
			form.submit();
		}
		else if($("#leaveTypeCode").val()=="<%=BuckWaConstants.LEAVE_PERSONAL%>"){
			
			var form = document.forms['mainForm']; 
			form.action ="<%=request.getContextPath()%>/leave/personal/init.htm";
			form.method='GET';	
			form.submit();
		}
		else if($("#leaveTypeCode").val()=="<%=BuckWaConstants.LEAVE_MATERNITY%>"){
			
			var form = document.forms['mainForm']; 
			form.action ="<%=request.getContextPath()%>/leave/maternity/init.htm";
			form.method='GET';	
			form.submit();
		}else if($("#leaveTypeCode").val()=="<%=BuckWaConstants.LEAVE_MONKHOOD%>"){
			
			var form = document.forms['mainForm']; 
			form.action ="<%=request.getContextPath()%>/leave/monkhood/init.htm";
			form.method='GET';	
			form.submit();
		}else if($("#leaveTypeCode").val()=="<%=BuckWaConstants.LEAVE_CANCEL%>"){
			
			var form = document.forms['mainForm']; 
			form.action ="<%=request.getContextPath()%>/leave/cancel/init.htm";
			form.method='GET';	
			form.submit();
		}
		
	}
</script>
