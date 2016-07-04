<%@page import="com.buckwa.domain.pam.Person"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
 
<form:form modelAttribute="academicKPIUserMappingWrapper" action="search.htm" method="POST" name="mainForm">
	
<div class="post"> 
<div class="entry">  
 		 <div class="pbptableWrapper">
            <div class="pbp-header">
            <table style="width: 100%;">
            	<tr>
            		<td width="90%" align="left">   ผลงานบุคลากร  ${academicKPIUserMappingWrapper.department.name}    ประจำปี  ${academicKPIUserMappingWrapper.academicYear}   </td>
   
            	</tr>
            </table>
            </div> 
			<table class="pbp-table"> 
		<thead>
			<tr>
				<th  class="thLast" width="200px;">   บุคลากร      </th>
				<th   class="thFirst">ผลงาน </th> 
				<th   class="thFirst" width="150px;">สถานะ </th>
			 
			</tr> 
		</thead>		
		<tbody>
				<c:forEach items="${academicKPIUserMappingWrapper.department.academicPersonList}" var="domain" varStatus="status">
			<tr>
				<td class="tdLast"  >			
			        
					<c:out value="${domain.thaiName}"/>  <c:out value="${domain.thaiSurname}"/>  
	 
				</td>
				<td class="thLast" style="border-bottom: 1px solid #e1e1e1; "  colspan="2">  
				<table class="pbp-table" ">
					 <c:forEach items="${domain.academicKPIUserMappingList}" var="domain2" varStatus="status2">
					<tr>
					<td class="tdBoth" style="font-size: 12px;"  > 
					     <c:forEach items="${domain2.academicKPIAttributeValueList}" var="domain3" varStatus="status3">
					         
								 <a rel="notLoading" href="#">
								 <a rel="notLoading" href="<%=request.getContextPath()%>/head/pbp/viewWork.htm?kpiUserMappingId=<c:out value="${domain2.kpiUserMappingId}"/>">  
								  <c:out value="${domain3.value}"/> 
								  </a> 
							 
							 
						</c:forEach>  
					</td>
 
					<td class="tdBoth" style="font-size: 12px; width: 150px;" >
					<c:if test="${domain2.status=='CREATE'}">
					 
					  <a rel="notLoading" href="<%=request.getContextPath()%>/head/pbp/viewWork.htm?kpiUserMappingId=<c:out value="${domain2.kpiUserMappingId}"/>">  
					<span class="require" style="font-size: 12px;" > รออนุมัติ </span>
					 </a>
					
					</c:if>
					
					 <c:if test="${domain2.status=='CREATE_CO_TEACH'}">
					 
					  <a rel="notLoading" href="<%=request.getContextPath()%>/head/pbp/viewWork.htm?kpiUserMappingId=<c:out value="${domain2.kpiUserMappingId}"/>">  
					<span class="require" style="font-size: 12px;" > รออนุมัติสอนร่วม </span>
					 </a>
					
					</c:if>
					 <c:if test="${domain2.status=='APPROVED'}">
					  อนุมัติ 
					</c:if> 
					</td>
	 
					</tr>
					</c:forEach>
				 </table>
				</td>
 	 
 
			</tr> 
			</c:forEach>
			
 
			
	 
		</tbody> 
			</table>
		</div>  
 
		
</div>
</div>
 	<br><br><br>
</form:form>
<script type="text/javascript">
	
	function edit(){
		window.location.href='<%=request.getContextPath()%>/pam/person/edit.htm';
	}
	
	function detail(){
		window.location.href='<%=request.getContextPath()%>/pam/person/view.htm';
	}
	
 
 
</script>
