<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="pBPWorkTypeWrapper" action="edit.htm" method="POST" name="mainForm"> 	 
<form:hidden path="academicYear"/>
 
<div class="post"> 
	<div class="entry"> 
			 <div class="pbptableWrapper">
             
               <div class="pbp-header"> 
               <table>
               	<tr>
               		<td width="80%">	ข้อมูลประเภทภาระงาน ประจำปีการศึกษา  ${pBPWorkTypeWrapper.academicYear}  </td>
               		<td > <!-- <a> <input	value="<spring:message code="label.button.new"/>" type="button" class="btn btn-primary" onclick="create();"> </a>  -->	</td>
               	</tr>
               </table>
               	 
             </div> 	
	
	
	
	<table>
		<thead>
		    <tr><th colspan="5"></th></tr>
			<tr>
				<th rowspan="2"> ประเภทภาระงาน   </td>
				<th colspan="2">ภาระงานคาดหวัง ต่อปี </td>
				<!--<td rowspan="2">Sub  </td>  -->
				<th rowspan="2">ฐานการคำนวณ  </td>
			 	<th rowspan="2">Delete  </td>
			</tr>
			<tr>
				<th> ขั้นต่ำ   </td>
				<th>ขั้นสูง </td>
				 
			</tr> 
		</thead>
		
		<tbody>
				<c:forEach items="${pBPWorkTypeWrapper.pBPWorkTypeList}" var="domain" varStatus="status">
			<tr>
				<td style="  text-align: left;">
			
			       <input type="hidden" name="pBPWorkTypeList[${status.index}].workTypeId" value="${domain.workTypeId}" >
					${status.index+1} <input style="width: 350px; "  name="pBPWorkTypeList[${status.index}].name" value="${domain.name}"  />  
					<!--  
			        <br>
			        <c:forEach items="${domain.pBPWorkTypeSubList}" var="domain2" varStatus="status2">
			            &nbsp; &nbsp; &nbsp; ${domain2.name} <br>
			        </c:forEach>
			        
			        -->
				</td>
				<td style=" "> 
		 
				 <input style="width: 50px;"  name="pBPWorkTypeList[${status.index}].minPercent" value="${domain.minPercent}"  /> % 
				 <input style="width: 50px;"  name="pBPWorkTypeList[${status.index}].minHour" value="${domain.minHour}"  />  ชั่วโมง
					 
				</td>
				<td style=" "> 
				 <input style="width: 50px;"  name="pBPWorkTypeList[${status.index}].maxPercent" value="${domain.maxPercent}"  /> % 
				 <input style="width: 50px;"  name="pBPWorkTypeList[${status.index}].maxHour" value="${domain.maxHour}"  />  ชั่วโมง 
				</td>	
				
				<!-- 
		 		<td>
					<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/pBPWorkType/manageSub.htm?workTypeId=<c:out  value="${domain.workTypeId}"/>"  >
												ManageSub
												</a> 
		 		
		 		</td>
		 		 -->
		 		 
				<td style=" "> 
				 <input style="width: 50px;"  name="pBPWorkTypeList[${status.index}].limitBase" value="${domain.limitBase}"  />  
				   
				</td>		 		 
		 		
				<td>					<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/pBPWorkType/delete.htm?pBPWorkTypeId=<c:out  value="${domain.workTypeId}"/>"
												onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.name}"/> ?')">
												Delete
												</a> 
				</td>
			</tr> 
			</c:forEach>
		</tbody>

 
	</table>
 </div>
	
	<div class="back_center"> 
	<input class="btn btn-primary"	value="<spring:message code="label.button.save"/>" type="submit" > 
	</div>
	</div>
</div>

 
</form:form> 
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/pBPWorkType/init.htm";
		form.method='GET';	
		form.submit();	
	}
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/pBPWorkType/create.htm";
		form.method='GET';	
		form.submit();
	}
</script>
 