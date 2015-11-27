<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="academicYearEvaluateRound" action="editDateEvaluateRound.htm" method="POST" name="mainForm"> 	 
 
<div class="post">
	 <h2 class="title">แก้ไขรอบการประเมิน    </h2>
	<div class="entry">	 
	
		 <div class="pbptableWrapper">
            <div class="pbp-header"> แก้ไขวันที่รอบการประเมินของ  ${academicYearEvaluateRound.evaluateTypeDesc} ประจำปีการศึกษา  ${academicYearEvaluateRound.academicYear}    
        	 
             </div> 
			
			<table class="pbp-table">
				<tbody>
				 <c:if test="${academicYearEvaluateRound.evaluateType=='1'}"> 
					<tr>
					<td class="tdFirst">รอบ  1 เริ่มต้น :   
						<form:input cssClass="inputDate"  path="round1StartDateStr" id="round1StartDateStr"  />
						<span class="require">*</span>
						<form:errors path="round1StartDateStr" cssClass="require" />					
	 						สิ้นสุด : 
						<form:input cssClass="inputDate" path="round1EndDateStr" id="round1EndDateStr"   />
						<span class="require">*</span>
						<form:errors path="round1EndDateStr" cssClass="require" />					
					</td> 
						 <td class="tdFirst">รอบ  2 เริ่มต้น :   
						<form:input cssClass="inputDate" path="round2StartDateStr" id="round2StartDateStr"  />
						<span class="require">*</span>
						<form:errors path="round2StartDateStr" cssClass="require" />					
	 						สิ้นสุด : 
						<form:input cssClass="inputDate" path="round2EndDateStr" id="round2EndDateStr" />
						<span class="require">*</span>
						<form:errors path="round2EndDateStr" cssClass="require" />					
					</td> 
					</tr>
				</c:if>
	
					 <c:if test="${academicYearEvaluateRound.evaluateType!='1'}"> 
					<tr>
					<td class="tdFirst">รอบ  1 เริ่มต้น :   
						<form:input cssClass="inputDate" path="round1StartDateStr" id="round1StartDateStr"   />
						<span class="require">*</span>
						<form:errors path="round1StartDateStr" cssClass="require" />					
	 						สิ้นสุด : 
						<form:input cssClass="inputDate" path="round1EndDateStr" id="round1EndDateStr"   />
						<span class="require">*</span>
						<form:errors path="round1EndDateStr" cssClass="require" />					
					</td> 
	 
					</tr>
				</c:if>
					
				</tbody> 
			</table> 
		</div>	 
	</div>
	<br>
 
	<div>
	<input class="btn btn-primary"	value="<spring:message code="label.button.save"/>" type="submit" >   &nbsp;  &nbsp; 
	<input class="btn btn-primary" value="ย้อนกลับ" type="button"		onclick="init();" />  
	</div>
</div>
</form:form>
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/academicYear/init.htm";
		form.method='GET';	
		form.submit();	
	} 
	
	$(document).ready( function() {
		$('#round1StartDateStr,#round1EndDateStr,#round2StartDateStr,#round2EndDateStr').datepicker( {
			showOn : 'both',
			buttonText : 'Choose a date',
			buttonImage : '<c:url value="/images/calendar.jpg"/>',
			buttonImageOnly : true,
			showButtonPanel : true
		});

		$('#round1StartDateStr,#round1EndDateStr,#round2StartDateStr,#round2EndDateStr').datepicker($.datepicker.regional['th']);

	});
</script>
 