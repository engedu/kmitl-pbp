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
<div class="post" >
<div class="entry">	

<section class="twelve columns">
 
   facultyCode: ${facultyCode} :  ${facultyDesc}
   <section class="five columns">
	<div class="row">
	
		 	<table class="pbp-table">
		 		<thead>
		 		<tr><th colspan="4">
            		<div class="pbp-header"> รอบการประเมิน  ประจำปีการศึกษา  ${academicYearWrapper.academicYear.name}  </div>
             	</th></tr>
             	</thead>
			
				<tbody>
				
				 
				
				<c:forEach items="${academicYearWrapper.academicYearEvaluateRoundList}" var="domain" varStatus="status">
                     <tr style="border-top: 1px solid #e1e1e1;">
					<td class="tdFirst" style="text-align: left;">${domain.evaluateTypeDesc}</td>
					
					 <c:if test="${domain.evaluateType=='1'}"> 
					<td class="tdFirst"   style="text-align: left;">รอบ 1  &nbsp; 
						${domain.round1StartDateShortThaiStr}    &nbsp; -  &nbsp; ${domain.round1EndDateShortThaiStr} 
					</td>					 
					<td class="tdFirst"   style="text-align: left;">รอบ 2  &nbsp; 
						${domain.round2StartDateShortThaiStr}   &nbsp; -  &nbsp; ${domain.round2EndDateShortThaiStr}   
					</td>					 
					 </c:if>
					 
					 <c:if test="${domain.evaluateType!='1'}"> 
					 <td class="tdFirst" colspan="2"  style="text-align: left;">รอบ 1  &nbsp; 
					 	${domain.round1StartDateShortThaiStr}   &nbsp; -  &nbsp; ${domain.round1EndDateShortThaiStr} 
					 </td>
					 </c:if> 
		 
					 
					</tr>
				</c:forEach>	 
				 
 		
					 
					
				</tbody>				
 
			</table>
	
	</div>
  </section>
  
     <section class="four columns">
	 
 	
	  <a href="<%=request.getContextPath()%>/downloadDoc.htm?fileCode=declare${facultyCode}" class="list-group-item"> <img src="<c:url value="/images/icon/pdf_logo.png"/>" /> &nbsp; <b> ประกาศหลักเกณฑ์วิธีการคิดภาระงานทางวิชาการคณาจารย์ <br>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;พ.ศ. 2558 คณะ${facultyDesc}</b></a>
 
	</section>
  
</section>
 
	<div class="">
 
		<table class="pbp-table" >
		<thead>
<!-- 			<tr><th colspan="3"></th></tr> -->
			<tr>
				<th rowspan="2" class="thLast" width="250px;">   ประเภทภาระงาน ปีการศึกษา ${anonymousWrapper.academicYear}     </th>
				<th colspan="2" class="thFirst">ภาระงานคาดหวัง ต่อปี </th>
			</tr>
			<tr>
				<th class="thFirst"> ขั้นต่ำ  (คะแนน) </th>
				<th class="tdFirst">ขั้นสูง (คะแนน) </th>
				 
			</tr> 
		</thead>
		
		<tbody>
				<c:forEach items="${anonymousWrapper.pBPWorkTypeWrapper.pBPWorkTypeList}" var="domain" varStatus="status">
			<tr>
				<td class="tdLast">
			
			       <input type="hidden" name="pBPWorkTypeList[${status.index}].workTypeId" value="${domain.workTypeId}" >
					 
	    
     
         <div   >  <a rel="notLoading" href="<%=request.getContextPath()%>/anonymous/listKPIByWorktype.htm?workTypeCode=<c:out value="${domain.code}"/>&academicYear=<c:out value="${anonymousWrapper.academicYear}"/>">
		 <c:out value="${domain.name}"/> 
         </a></div>   
   
				</td>
				<td class="tdLast">
				
				

		   
		   <c:if test="${domain.minHourCal}">
				
		  <c:out value="${domain.minPercent}"/>
		   <c:out value="${domain.minHour}"/>
		   </c:if>
		   
		   <c:if test="${not domain.minHourCal}">
		   -
		   </c:if> 
					  
				</td>
				
				<td class="tdFirst"> 
				
				

				
				
		   <c:if test="${domain.maxHourCal}">
				<c:out value="${domain.maxPercent}"/>
				<c:out value="${domain.maxHour}"/>
		   </c:if>
		   
		   <c:if test="${not domain.maxHourCal}">
		   -
		   </c:if> 				
				
  
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
	
		
<!-- 		<table class="pbp-table"  "> -->
<!-- 		<thead> -->
 
<!-- 			<tr> -->
<!-- 				<th class="thFirst"><div class="pbp-header"> -->
<%-- 				<a rel="notLoading" class="colorwhite" href="<%=request.getContextPath()%>/anonymous/listByWorktypeFaculty.htm?academicYear=<c:out value="${anonymousWrapper.academicYear}"/>"> --%>
<!-- 				 View All  </a>  </div></th>  -->
				 
<!-- 			</tr>  -->
<!-- 		</thead>	 -->
<!-- 	</table> -->
	
	<br>
<!-- 	</td> -->
<!-- </tr> -->
<!-- </table>  -->
</div>
</section>
	</div>	
</div>

</form:form>
 