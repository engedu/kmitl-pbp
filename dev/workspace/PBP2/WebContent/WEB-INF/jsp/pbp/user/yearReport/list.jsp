<%@page import="com.buckwa.domain.pam.Person"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%> 
 
<form:form modelAttribute="personYearReport" action="search.htm" method="POST" name="mainForm">
 
    <div class="row entry">
<!--  	<div class="one columns"></div> -->
 	<div class="ten columns">
 		 <div class="pbptableWrapper">
            <div class="pbp-header"> 
            	<table style="width: 100%;">
            		<tr>
     
            			<td style="text-align: center;  vertical-align: middle; font-size: 22px;font-weight: bold;">
              		พิมพ์รายงานประจำปีการศึกษา  
           		
 	            			<form:select path="academicYearSelect" cssStyle="width:20%" id="academicYear"> 
								<form:options items="${personYearReport.academicYearList}" itemValue="name" itemLabel="name" />
							</form:select>     
 
 	            			<c:if test="${person.employeeType == 'ข้าราชการ' }">  
	            				 &nbsp;&nbsp;&nbsp;   รอบ  &nbsp; 
	            				 <form:select path="evaluateRound"  cssStyle="width:20% " id="evaluateRound"> 
									<form:options items="${person.evaluateRoundList}" itemValue="name" itemLabel="name" />
								</form:select> 
	            			</c:if> 
 
            			
            			</td>
            			<td abbr="center"> ${academicYearSelect}
<%--             			<a class="btn btn-primary"  rel="notLoading" href="<%=request.getContextPath()%>/downloadDoc.htm?fileCode=59"> พิมพ์</a>  --%>
            			<a class="btn btn-primary"  rel="notLoading" onclick="onPrint()" target="_blank"> Download</a> 
            			</td>
            		</tr>
            		<tr>
            		 <td colspan="2" style="font-size: 25px; text-align: center;">
            		 <br><br>
            		   ระบบจะบันทึก File ลงที่ Folder download ของแต่ละ Browser
            		 </td>
            		
            		</tr>
            	</table>
            </div> 
 
 
</form:form>
<script type="text/javascript">
	 function onPrint(){
		 var year = $("#academicYear").val();
		 var round = $("#evaluateRound").val();
		 window.location = '<%=request.getContextPath()%>/report/printReportYear.htm?year='+year+'&round='+round;
		  
	 }
</script>
