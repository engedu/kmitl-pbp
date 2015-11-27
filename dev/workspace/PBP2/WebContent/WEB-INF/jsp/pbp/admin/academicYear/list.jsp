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

<!--  
	<h2 class="title">ปีการศึกษา     
	
	 
	 &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  
	 &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;  
	  <a href="<%=request.getContextPath()%>/admin/pbp/academicYear/getCurrentAcademicYear.htm"><input class="btn btn-primary" value="ปีการศึกษาปัจจุบัน" type="button"  >  </a> 
	 &nbsp;  &nbsp; 
   <a href="<%=request.getContextPath()%>/admin/pbp/academicYear/ajustYear.htm"><input class="btn btn-primary" value="ปรับปีการศึกษา" type="button"  >  </a> 
   &nbsp;  &nbsp;  
	  <a href="<%=request.getContextPath()%>/admin/pbp/academicYear/getCurrentAcademicYear.htm"><input class="btn btn-primary" value="สุินสุดการประเมิน" type="button"  >  </a> 	 
	
	</h2>
	
	<div class="back_center">
	<a href="<%=request.getContextPath()%>/admin/pbp/academicYear/listByAcademicYear.htm?academicYear=<c:out value="${academicYearWrapper.previousAcademicYear}"/>&next=Y">	<img src="<c:url value="/images/arrow_left.png"/>" />  <c:out value="${academicYearWrapper.previousAcademicYear}"/></a>
	&nbsp;   &nbsp;&nbsp;   &nbsp;
	<span style="font-size: 30px; color: rgb(74,132,47);">  ${academicYearWrapper.academicYear.name}  </span>
	
	&nbsp;   &nbsp;&nbsp;   &nbsp;
	<a href="<%=request.getContextPath()%>/admin/pbp/academicYear/listByAcademicYear.htm?academicYear=<c:out value="${academicYearWrapper.nextAcademicYear}"/>&next=N">	<c:out value="${academicYearWrapper.nextAcademicYear}"/> <img src="<c:url value="/images/arrow_right.png"/>" /> </a>
	</div>
	
	<div>
 
	
	<span style="font-size: 30px; color: rgb(74,132,47);"> ${academicYearWrapper.academicYear.startDateThaiShort} ${academicYearWrapper.academicYear.name}  &nbsp; -  &nbsp; ${academicYearWrapper.academicYear.endDateThaiShort} ${academicYearWrapper.nextAcademicYear} </span>
	</div>
	-->
	
		 <div class="pbptableWrapper">
		 
			<table class="pbp-table">
				<tbody>
					<tr>
					<td class="tdFirst">ปีการศึกษา ปัจุจุบัน    ${academicYearWrapper.academicYear.name}</td>
					<td class="tdFirst"> ${academicYearWrapper.academicYear.startDateThaiShort}  &nbsp; -  &nbsp; ${academicYearWrapper.academicYear.endDateThaiShort   } 
					   
					<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicYear/editDateAcademicYear.htm?academicYear=<c:out value="${academicYearWrapper.academicYear.name}"/>"> <span class="lsf-icon colororange" title="gear"></a>
					  
					</td>
					 <td>
					              <a href="<%=request.getContextPath()%>/admin/pbp/academicYear/ajustYear.htm"><input class="btn btn-primary" value="ปรับปีการศึกษา" type="button"  >  </a> 
               &nbsp;  &nbsp; 
               
					 </td>
					</tr>
				</tbody> 
			</table> 		 
		 
            <div class="pbp-header"> 
            
               <table style="width: 100%;">
               		<tr>
               			<td width="70%;"> ปีการศึกษา  &nbsp; 
               			
            		 <form:select path="academicYear" > 
							<form:options items="${academicYearList}" itemValue="name" itemLabel="name" />
						</form:select> 
               			</td>
               			<td>
 
               <!-- 
	  			<a href="<%=request.getContextPath()%>/admin/pbp/academicYear/getCurrentAcademicYear.htm"><input class="btn btn-primary" value="สิ้นสุดการประเมิน" type="button"  >  </a>              			
               			 --> 
               			</td>
               		</tr>
               		
               </table>
            
            		  
	 
             </div> 
			

		</div>	
		
		<br><br>
		
		 <div class="pbptableWrapper">
		 	<table class="pbp-table">
		 		<thead>
		 		<tr>
		 		<th >
            		ปีการศึกาษา</div>
             	</th>
  		 		<th >
            		เริ่มต้น - สิ้นสุด
             	</th>
  		 		<th >
            		เทอม : เริ่มต้น-สิ้นสุด
             	</th>         
   		 		<th >
            		แก้ไข
             	</th>    		 		              	    	           	
             	</tr>
             	</thead>
			
				<tbody>
				
				<c:forEach items="${academicYearList}" var="domain" varStatus="status">
                     <tr style="border-top: 1px solid #e1e1e1;">
					<td class="tdFirst">${domain.name}</td>
					
					  
					<td class="tdFirst"   align="left"> 
						${domain.startDateThaiShort}    &nbsp; -  &nbsp; ${domain.endDateThaiShort} 
					</td>					 
				 				 
					 
				 
					 <td class="tdFirst"   align="left"> 
					 
					 <c:forEach items="${domain.semesterList}" var="domain2" varStatus="status2">
					  
					  ${domain2.name}  :  ${domain2.startDateStr} -  ${domain2.endDateStr} <br>
					 
					 
					 </c:forEach>
					 
					 
					 </td>
					  <td>  
				    
				       <a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicYear/editDateAcademicYear.htm?academicYear=<c:out value="${domain.name}"/>"><span class="lsf-icon colororange" title="gear"></a>
				      
				     </td>	
						</tr>					  
				</c:forEach>	 

				</tbody>				
 
			</table>
			 
		</div> 		
		
		<br><br>
	
		 <div class="pbptableWrapper">
		 	<table class="pbp-table">
		 		<thead>
		 		<tr><th colspan="4">
            		<div class="pbp-header"> รอบการประเมิน  ประจำปี  ${academicYearWrapper.academicYear.name}  </div>
             	</th></tr>
             	</thead>
			
				<tbody>
				
				<!--   
				
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
				 -->	
	
	
					<c:forEach items="${academicYearWrapper.academicYearEvaluateRoundList}" var="domain" varStatus="status">
                     <tr style="border-top: 1px solid #e1e1e1;"> 
					 <c:if test="${domain.evaluateType!='1'}"> 
					 
					 <td class="tdFirst" colspan="3" align="left">  &nbsp; 
					 	${domain.round1StartDateShortThaiStr}   &nbsp; -  &nbsp; ${domain.round1EndDateShortThaiStr} 
					 </td>
					 
				     <td>  
				    
				     	 <a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicYear/editDateEvaluateRound.htm?academicYear=<c:out value="${academicYearWrapper.academicYear.name}"/>&evaluateType=<c:out value="${domain.evaluateType}"/>"><span class="lsf-icon colororange" title="gear"></a>
				      
				     </td>						 
					 </c:if> 
				 
					 
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
</script>
 