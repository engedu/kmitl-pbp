<%@page import="com.buckwa.domain.pam.Person"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

 
<form:form modelAttribute="department" action="search.htm" method="POST" name="mainForm">
<div class="post"> 
<div class="entry">  


<table style="width: 100%;">
 <tr>
 	<td width="50%" valign="top""> 
 	
 	 	
 	 		 <div class="pbptableWrapper">
            <div class="pbp-header">
                  Radar Plot   ${department.name}    ประจำปี  ${department.academicYear}  
             </div> 
            
            	<table class="pbp-table">
				<tbody>
            <td width="100%" style="border-right: 1px solid white;" valign="top">
  		<iframe src=" <c:out value="${department.radarURL}"/>" width="500" height="500" marginwidth="0" marginheight="0" frameborder="no" scrolling="no"
			style="background:#FFF;padding-bottom: 5px;">

 		</iframe>

					</td>	
		</tbody>
		</table>
		</div>
 	
 	
 	

 	</td>
 	<td width="5%"> 
 	&nbsp;
 	</td>
 	<td width="40%" valign="top"> 
	 	
  		 <div class="pbptableWrapper">
            <div class="pbp-header">  คะแนนตามประเภทภาระงาน</div>
          
			<table class="pbp-table"> 
		<thead>
			<tr> 
				<th  class="thLast" width="200px;"   >   ภาระงาน      </th>
				<th  class="thLast" width="200px;"  >   คะแนนรวม     </th>
				<th  class="thLast" width="200px;"  >   คะแนนรวม   เฉลี่ย    </th>

             </tr>
             </thead>
             <tbody>
             <c:forEach items="${department.pBPWorkTypeList}" var="domain" varStatus="status">
             <tr>
				 
			 
			<td class="tdLast"  >	<c:out value="${domain.shortDesc}"/> </td>
			<td class="tdLast"  >	<c:out value="${domain.totalInWorkType}"/> </td>
			
			<td class="tdLast"  >	<c:out value="${domain.totalInPercentCompareBaseWorkTypeAVG}"/> </td>
               
              </tr> 
              
              	</c:forEach>
             </tbody>
        </table>
        </div> 		
 	
 	</td> 	
</tr>
</table>

        
        
        
 		 <div class="pbptableWrapper">
            <div class="pbp-header">
            <table style="width: 100%;">
            	<tr>
            		<td width="90%" align="left">   คะแนน ${department.name}    ประจำปี  ${department.academicYear}   </td>
   
            	</tr>
            </table>
            </div> 
			<table class="pbp-table"> 
		<thead>
			<tr> 
				<th  class="thLast" width="200px;"  rowspan="2">   บุคลากร      </th>
				<th   class="thFirst" colspan="5">ประเภทภาระงาน </th> 
				<th   class="thFirst" width="150px;" rowspan="2">รวม </th> 
			</tr> 
				 <tr> 
				 <c:forEach items="${department.pBPWorkTypeList}" var="domain" varStatus="status">
				<th  class="thLast" width="200px;"  >   <c:out value="${domain.shortDesc}"/>      </th>
			 
				</c:forEach>
			</tr> 
		</thead>		
		<tbody>
		 <c:forEach items="${department.academicPersonList}" var="domain" varStatus="status">
			<tr>
				<td class="tdLast"  > 	 
					<c:out value="${domain.thaiName}"/>  <c:out value="${domain.thaiSurname}"/>   
				</td> 
				
				<c:forEach items="${domain.pBPWorkTypeWrapper.pBPWorkTypeList}" var="domain2" varStatus="status">
				<td class="tdBoth" style="font-size: 12px; width: 100px;"  > 
					<c:out value="${domain2.totalInWorkType}"/>
				</td>
				</c:forEach>
				<td  class="tdBoth" style="font-size: 14px; width: 100px; font-weight: bold;"  > 
					<c:out value="${domain.pBPWorkTypeWrapper.totalPercentMarkCompareBase}"/>
				</td>				
  
				</td> 
			</tr> 
			</c:forEach> 
			  <tr>
			  <td class="tdLast"  > 	 
					รวม 
				</td> 
			  <c:forEach items="${department.pBPWorkTypeList}" var="domain" varStatus="status">  
				<td class="tdBoth" style="font-size: 14px; width: 100px; font-weight: bold;"  > 	<c:out value="${domain.totalInWorkType}"/> </td> 
               </c:forEach>
               
               	 <td class="tdLast"  > 	 
					 &nbsp;
				</td> 
			   </tr> 
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
