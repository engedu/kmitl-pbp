<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<%@ page import="com.buckwa.web.util.*" %>
<form:form modelAttribute="academicYearWrapper" action="edit.htm" method="POST" name="mainForm"> 	 
<form:hidden path="nextAcademicYear"/>
<form:hidden path="previousAcademicYear"/>
<div class="post">
<div class="entry">	

 รอบการประเมิน
	
 	<div style="width: 80%; text-align: center; padding-left: 300px;" > 
 	 <table style="width: 300px;" >
 	 	<tr> 
 	 		<td>ปีการศึกษา</td>
 	 		<td>
 	            		 <form:select path="academicYearSelect" onchange="getEvaluateRoundByYear(this.value);"> 
							<form:options items="${academicYearWrapper.academicYearList}" itemValue="name" itemLabel="name" />
						</form:select> 	 
 							 						
								
 	 		</td>
 	 		

 	 		
 	 	</tr>
 	 </table>
 
 	</div>
		
		<br>  
	
		 <div class="pbptableWrapper">
		 	<table class="pbp-table">
		 		<thead>
		 		<tr><th colspan="4">
            		<div class="pbp-header"> รอบการประเมิน  ประจำปี  ${academicYearWrapper.academicYear.name}  </div>
             	</th></tr>
             	</thead>
			
				<tbody>
				
				 
				
				<c:forEach items="${academicYearWrapper.academicYearEvaluateRoundList}" var="domain" varStatus="status">
                     <tr style="border-top: 1px solid #e1e1e1;">
					<td class="tdFirst">${domain.evaluateTypeDesc}</td>
					
					 <c:if test="${domain.evaluateType=='1'}"> 
					<td class="tdFirst"   align="left">รอบ 1  &nbsp; 
						${domain.round1StartDateShortThaiStr}    &nbsp; -  &nbsp; ${domain.round1EndDateShortThaiStr} 
					</td>					 
					<td class="tdFirst"   align="left">รอบ 2  &nbsp; 
						${domain.round2StartDateShortThaiStr}   &nbsp; -  &nbsp; ${domain.round2EndDateShortThaiStr}   
					</td>					 
					 </c:if>
					 
					 <c:if test="${domain.evaluateType!='1'}"> 
					 <td class="tdFirst" colspan="2" align="left">รอบ 1  &nbsp; 
					 	${domain.round1StartDateShortThaiStr}   &nbsp; -  &nbsp; ${domain.round1EndDateShortThaiStr} 
					 </td>
					 </c:if> 
				     <td>  
				    
				     	 <a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicYear/editDateEvaluateRound.htm?academicYear=<c:out value="${academicYearWrapper.academicYear.name}"/>&evaluateType=<c:out value="${domain.evaluateType}"/>"><span class="lsf-icon colororange" title="gear"></a>
				      
				     </td>					 
					 
					</tr>
				</c:forEach>	 
				 
 		
					 
					
				</tbody>				
 
			</table>
			 
		</div> 
	</div>
</div>
</form:form>
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/role/init.htm";
		form.method='GET';	
		form.submit();	
	} 
	
	
	function getEvaluateRoundByYear (In){		
		var form = document.forms['mainForm']; 
	  //alert(In);
		form.action ="<%=request.getContextPath()%>/admin/pbp/evaluateRound/getEvaluateRoundByYear.htm?academicYearSelect="+In;
		//alert(form.action);
		form.method='GET';	
		form.submit();
	}
</script>
 