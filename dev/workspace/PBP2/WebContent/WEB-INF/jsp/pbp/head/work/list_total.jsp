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

<h1 id="exampleTitle"> 
            <span ><img src="<c:url value="/images/chart_example.jpg"/>"    /></span>
            <strong> ผลงานบุคลากร  ${academicKPIUserMappingWrapper.department.name}    ประจำปี  ${academicKPIUserMappingWrapper.academicYear} </strong>  
        
            </h1> 

<div class="post"> 
<div class="entry">  
 		 <div class="pbptableWrapper">
 
			<table class="pbp-table"> 
		<thead>   
			<tr>
				<th  class="thLast" width="200px;">   บุคลากร      </th>
				<th   class="thFirst"> <span class="require">รออนุมัติ  (${academicKPIUserMappingWrapper.totalNotApprove}) </span></th> 
				<th   class="thFirst" width="150px;">อนุมัติแล้ว (${academicKPIUserMappingWrapper.totalApproved}) </th>
				 <th   class="thFirst" width="150px;">รวม (${academicKPIUserMappingWrapper.total}) </th>
			</tr> 
		</thead>	
			
		<tbody>
				<c:forEach items="${academicKPIUserMappingWrapper.department.academicPersonList}" var="domain" varStatus="status">
					<tr>
						<td class="tdBoth"  >
							 <c:choose>
							<c:when test="${domain.total==0}">
								 <c:out value="${domain.thaiName}"/>  <c:out value="${domain.thaiSurname}"/> 
							</c:when>
							<c:otherwise>	
						 
							
							<a rel="notLoading"  href="<%=request.getContextPath()%>/head/pbp/initByUserName.htm?userName=<c:out value="${domain.email}"/>"><span class="requireGreen_underline"><c:out value="${domain.thaiName}"/>  <c:out value="${domain.thaiSurname}"/>  </span></a>
							
							</c:otherwise>
						</c:choose>						
						
					
						 </td>
						<td class="tdBoth" align="center"  >  
						
						
							 <c:choose>
							<c:when test="${domain.totalNotApprove==0}">
								 <c:out value="${domain.totalNotApprove}"/> 
							</c:when>
							<c:otherwise>	
							
							
							<a rel="notLoading"  href="<%=request.getContextPath()%>/head/pbp/initByUserName.htm?userName=<c:out value="${domain.email}"/>"><span class="require"><c:out value="${domain.totalNotApprove}"/> </span></a>
							
							</c:otherwise>
						</c:choose>
						 </td> 
					 	<td class="tdBoth" align="center"  > 
					 	
							 <c:choose>
							<c:when test="${domain.totalApproved==0}">
								 <c:out value="${domain.totalApproved}"/> 
							</c:when>
							<c:otherwise>	
							
							 
							<a rel="notLoading"  href="<%=request.getContextPath()%>/head/pbp/initByUserName.htm?userName=<c:out value="${domain.email}"/>"><span class="requireGreen_underline"><c:out value="${domain.totalApproved}"/> </span></a>
							
							</c:otherwise>
						</c:choose>					 	
					 	
					 	 
					 	
					 	
					 	
					 	
					 	 </td>	 
					 	<td class="tdBoth" align="center"  > <c:out value="${domain.total}"/>  </td>
					</tr>	 
			   </c:forEach> 
		</tbody> 
		
			</table>
		</div>  

		
</div>
</div>
 
</form:form>
<script type="text/javascript">


	function edit(){
		window.location.href='<%=request.getContextPath()%>/pam/person/edit.htm';
	}
	
	function detail(){
		window.location.href='<%=request.getContextPath()%>/pam/person/view.htm';
	}
	
 
 
</script>
