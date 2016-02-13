<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.AuthenticationException"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="com.buckwa.util.*" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %> 
 

<form:form modelAttribute="anonymousWrapper" action="search.htm" method="POST" name="mainForm"> 			 	
<div class="post">
<div class="entry">	

<table style="width: 100%">
<tr>
	<td width="44%" valign="top" style="margin-right: 2px;"> 
			 <div class="pbptableWrapper">
            <div class="pbp-header"> รอบการประเมิน  ประจำปี  ${anonymousWrapper.academicYearWrapper.academicYear.name}  </div>
             
			<table class="pbp-table">
		<thead>
			<tr>
			<th class="thFirst" rowspan="2"> ประเภทพนักงาน </th>
			<th class="thFirst" colspan="2"> รอบการประเมิน </th>
			</tr>
		 
			<tr>
				
				<th class="thFirst">  1  </th>
				<th class="thFirst"> 2  </th> 
			</tr>
		</thead>			
			
				<tbody>
				
				<c:forEach items="${anonymousWrapper.academicYearWrapper.academicYearEvaluateRoundList}" var="domain" varStatus="status">
                     <tr style="border-top: 1px solid #e1e1e1;">
					<td class="tdFirst">${domain.evaluateTypeDesc}</td>
					
					 <c:if test="${domain.evaluateType=='1'}"> 
					<td class="tdFirst"   align="left"> 
						${domain.round1StartDateShortThaiStr}    &nbsp; -  &nbsp; ${domain.round1EndDateShortThaiStr} 
					</td>					 
					<td class="tdFirst"   align="left">  
						${domain.round2StartDateShortThaiStr}   &nbsp; -  &nbsp; ${domain.round2EndDateShortThaiStr}   
					</td>					 
					 </c:if>
					 
					 <c:if test="${domain.evaluateType!='1'}"> 
					 <td class="tdFirst" colspan="2" align="left"> 
					 	${domain.round1StartDateShortThaiStr}   &nbsp; -  &nbsp; ${domain.round1EndDateShortThaiStr} 
					 </td>
					 </c:if> 
 				 
					 
					</tr>
				</c:forEach>	 
				</tbody> 
			</table> 
		</div> 
		
		
				 <div class="pbptableWrapper">
            <div class="pbp-header">ระดับคะแนน ประจำปี  ${anonymousWrapper.academicYearWrapper.academicYear.name}  </div>
           
          <table class="pbp-table">
          <tbody>
           <tr>
                 <td class="tdFirst" rowspan="2"  valign="top">
                  
		<table class="pbp-table" style="width: 90%;">
		<thead>
			
			<tr>
				<th class="thFirst"> ภาระงานที่ปฎิบัติสำเร็จ(%)   </th>
				<th class="thFirst">ระดับคะแนน (%) </th> 
			</tr>
		</thead>

  		<tbody>
  		
  		  <c:forEach items="${anonymousWrapper.markRankWrapper.markRankRoundList}" var="domain" varStatus="status">
  		  
  		  		<tr>
  		  		<td colspan="2">
 	        <div class="pbp-header"> 
        
            		 	<c:if test="${domain.employeeType=='0'}">ข้าราชการรอบที่   <c:out value="${domain.round}"/>  </c:if> 
            		     <c:if test="${domain.employeeType=='1'}">พนักงาน    </c:if> 
  
            </div>  		  		
  		  		
  		  		
  		  		</td>
  		  		
  		  		</tr>
				<c:forEach items="${domain.markRankList}" var="domain2" varStatus="status2">
					<tr> 
					<td class="tdFirst" align="center">
						<c:out value="${domain2.markFrom}"/> - <c:out value="${domain2.markTo}"/>  
					</td>
					<td class="tdFirst" align="center">  
			 				<c:out value="${domain2.salaryLevel}"/> 
					</td>  
					 	
					</tr>
				</c:forEach>
			</c:forEach> 
		
	</tbody>
	</table>
	</td>
	</tr>
	</tbody>
	</table>
	</div>  
 
	
	</td>
	<td width="5%">&nbsp;</td>
	<td width="50%" valign="top" style="margin-left: 2px;">
		<table class="pbp-table"  ">
		<thead>
			<tr>
				<th rowspan="2" class="thLast" width="250px;">   ประเภทภาระงาน ปีการศึกษา ${anonymousWrapper.academicYear}     </th>
				<th colspan="2" class="thFirst">ภาระงานคาดหวัง ต่อปี </th>
 
			</tr>
			<tr>
				<th class="thFirst"> ขั้นต่ำ   </th>
				<th class="tdFirst">ขั้นสูง </th>
				 
			</tr> 
		</thead>
		
		<tbody>
				<c:forEach items="${anonymousWrapper.pBPWorkTypeWrapper.pBPWorkTypeList}" var="domain" varStatus="status">
			<tr>
				<td class="tdLast">
			
			       <input type="hidden" name="pBPWorkTypeList[${status.index}].workTypeId" value="${domain.workTypeId}" >
					 
	    
     
         <div class="subHeaderLink" >  <a rel="notLoading" href="<%=request.getContextPath()%>/anonymous/listKPIByWorktype.htm?workTypeCode=<c:out value="${domain.code}"/>&academicYear=<c:out value="${anonymousWrapper.academicYear}"/>">
			${status.index+1} <c:out value="${domain.name}"/> 
         </a></div>   
   
				</td>
				<td class="tdLast">
				
		  <c:out value="${domain.minPercent}"/>%
		   <c:out value="${domain.minHour}"/>ชั่วโมง
 
					 
				</td>
				<td class="tdFirst"> 
				<c:out value="${domain.maxPercent}"/>% 
				<c:out value="${domain.maxHour}"/>ชั่วโมง
  
				</td>	 
			</tr> 
			</c:forEach>
			 
			 <tr>
	  	<td colspan="3" align="center"> 
	  	      &nbsp;
	  	</td>
	  	
	  </tr>
		</tbody>

 
	</table>	
		<table class="pbp-table"  ">
		<thead>
 
			<tr>
				<th class="thFirst">   
				<a rel="notLoading" href="<%=request.getContextPath()%>/anonymous/listByWorktype.htm?academicYear=<c:out value="${anonymousWrapper.academicYear}"/>">
				 View All  </a>  </th> 
				 
			</tr> 
		</thead>	
	</table>
	
	
	</td>
</tr>

</table> 
 	
		
	</div>	
		
		


</div>

</form:form>
 