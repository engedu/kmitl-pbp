<%@page import="com.buckwa.domain.pam.Person"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 
<% Person person = (Person) request.getAttribute("person"); %>
<form:form modelAttribute="person" action="search.htm" method="POST" name="mainForm">
   <div class="row">
 	<div class="one columns"></div>
 	<div class="five columns">
 		 <div class="pbptableWrapper">
            <div class="pbp-header"> 
            	<table style="width: 100%;">
            		<tr>
            		
            			<td width="70%;" style="text-align: center;"> 
            			ข้อมูลส่วนตัว   &nbsp; 
            		<form:select path="academicYear" cssStyle="width:60px;" > 
							<form:options items="${person.academicYearList}" itemValue="name" itemLabel="name" />
						</form:select> 
						

            			</td>
            			<td style="text-align: center;">
            			
            			<sec:authentication var="principal" property="principal" />
            			
            			<c:if test="${principal.personProfile.employeeType == 'ข้าราชการ' }">  
            				 &nbsp;&nbsp;&nbsp;   รอบ  &nbsp; 
            				 <form:select path="evaluateRound" > 
							<form:options items="${person.evaluateRoundList}" itemValue="name" itemLabel="name" />
						</form:select> 
            			</c:if>
            			
            			 <c:if test="${principal.personProfile.employeeType != 'ข้าราชการ' }">  
            			 
            			</c:if>
            			
            			 	<a rel="notLoading" onclick="initAcademic();" > 
							 <input value="ผลประเมิน" class="btn btn-primary" type="button" onclick="#">
							</a>
            			
            			</td>
            		</tr>
            	</table>
            </div> 
	<table class="pbp-table">
		<tbody>
			<tr height="332px">
				<td width="30%" style="border-center: 1px solid white; margin-right: 1px;" valign="top" >
		 			<img src="<%=request.getContextPath()%>/servlet/Image?<c:out value="${person.picture}" />" class="img_border" border="2" width="90px;" height="100px;">
				</td>
		
				<td valign="top" style="padding-left: 15px;" colspan="2">
			<table width="100%"> 
				<tr>
					<td class="tdFirst">ชื่อสกุล (ไทย): ${person.titleName}  ${person.thaiName} ${person.thaiSurname}</td> 
				</tr>
 
				<tr>
					<td class="tdFirst">สังกัด:  ${person.facultyDesc}</td>
					 
				</tr>
				<tr>
					<td class="tdFirst">ส่วนงาน:${person.departmentDesc}</td>
					 
				</tr>
				<tr>
					<td class="tdFirst">ประเภท: ${person.employeeType}  </td>
					 
				</tr> 
				<tr>
					<td class="tdFirst">เลขที่อัตรา: ${person.rateNo}  </td>
					 
				</tr> 				
				  <tr>				
					<td class="tdFirst">ตำแหน่งงาน:  ${person.academicRank}</td>
					 		 
				</tr>	
								  <tr>				
					<td class="tdFirst">วุฒิการศึกษา: ${person.maxEducation}</td>
					 		 
				</tr>	
				<tr>
			
					<td class="tdFirst">Email:${person.email}</td>
					 
                </tr>
                
     

				
								<tr>
					<td align="center">
<!-- 						<input value="แก้ไข" class="btn btn-primary" type="button" onclick="edit();"> -->
						&nbsp;
						<br><br> 
						<!-- 
						<a href="#" onclick="detail();">More >></a>
						 -->
						 
					 
					<a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/editProfile.htm?personId=<c:out value="${person.personId}"/>"> 
					
					แก้ไขรูปประจำตัว >>
					
					</a>
					</td>
				</tr>			
			</table>
		</td>
	</tr>			
					
				</tbody> 
			</table> 
		</div>		
	</div>
<!-- 	</td>
 	<td valign="top"> -->
 	<div class="five columns">
 	 		 <div class="pbptableWrapper">
            <div class="pbp-header">
                <table style="width: 100%;">
            		<tr>
            			<td width="100%;">					
	            			
	            			
	           			<c:if test="${principal.personProfile.employeeType == 'ข้าราชการ' }">  
            		<!--  รอบที่   1  -->	
            			</c:if>
            		   
							 
				
							 
							 
						</td>
            			<td>
            						   <a rel="notLoading" onclick="initAcademicWork();" > 
							 	<input value="ดูรายละเอียดการประเมิน" class="btn btn-primary" type="button" onclick="#">
								 </a>
            			 </td>
            		</tr>
            	</table>
             </div> 
            
          <table class="pbp-table">
				<tbody>
            <td width="100%" style="border-center: 1px solid white;" valign="top">
  		<iframe src=" <c:out value="${person.radarURL}"/>" width="520" height="320" marginwidth="0" marginheight="0" frameborder="no" scrolling="no"
			style="background:#FFF;padding-bottom: 5px;">

 		</iframe>
		</td>	
		</tbody>
		</table>
		</div>	
 	</div>
<!--  	<!-- </td> -->
 </tr>
 <tr> 
 	<section class="twelve columns">
<!--  	<td colspan="2"> -->
 	
 		 <div class="pbptableWrapper">
            <div class="pbp-header">		
            	
		<table class="pbp-table">
		<thead>
			<tr>
           		<th align="left">    <span class="lsf-icon colororange" title="list"></span>ผลงานประจำปี ${person.pBPWorkTypeWrapper.academicYear}  </th>
           		<th ><span class="lsf-icon colororange" title="upload"></span>
           			 <a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/initWorkImport.htm">
						<input value="นำเข้าผลงาน" class="btn btn-primary" type="button" onclick="#">
						</a>
           		</th>
           	</tr>
			<tr>
				<th  class="thLast" width="250px;">   ประเภทภาระงาน      </th> 		 
 				<th   class="thFirst" style="width: 80px;">ระดับคะแนน </th> 				 
			</tr> 
		</thead>		
		<tbody>
				<c:forEach items="${person.pBPWorkTypeWrapper.pBPWorkTypeList}" var="domain" varStatus="status">
			<tr>
				<td class="tdLast" style="border-bottom: 1px solid #e1e1e1;">			
			       <input type="hidden" name="pBPWorkTypeList[${status.index}].workTypeId" value="${domain.workTypeId}" >
					${status.index+1} <c:out value="${domain.name}"/>  
	 
				</td>
  
 				<td class="thLast" style="border-bottom: 1px solid #e1e1e1; text-align: center; width: 50px;"> 
								<c:if test="${domain.compareBaseStatus=='UNDER'}">
				  <span style="color: red;"><c:out value="${domain.totalInPercentCompareBaseWorkType}"/></span>
                 </c:if>
                  <c:if test="${domain.compareBaseStatus=='NORMAL'}">
				<c:out value="${domain.totalInPercentCompareBaseWorkType}"/>
                 </c:if>
                <c:if test="${domain.compareBaseStatus=='OVER'}">
				  <span style="color:green;"> <c:out value="${domain.totalInPercentCompareBaseWorkType}"/></span>
                 </c:if>
				</td>		 
   
			</tr> 
			</c:forEach>
			
			<tr>
				<th  class="thLast"  align="right">   คะแนนรวม    &nbsp; &nbsp; &nbsp; &nbsp;</th>
 				<th  class="thLast" colspan="1" style="text-align: center;">   ${person.pBPWorkTypeWrapper.totalPercentMarkCompareBase} คะแนน </th>
			</tr>	
			
	 					
			
		</tbody> 
 
			</table>
		</div>  
 	</section>
 
</div>
 
</form:form>
<script type="text/javascript">
	
	function edit(){
		window.location.href='<%=request.getContextPath()%>/pam/person/edit.htm';
	}
	
	function detail(){
		window.location.href='<%=request.getContextPath()%>/pam/person/view.htm';
	}
	
	function callWork(id){
		var form = document.forms['mainForm'];
		$("#workTemplateId").val(id);
		form.action ="<%=request.getContextPath()%>/pam/work/init.htm";
		form.method = 'POST';
		form.submit();
	}
	
	function callWorkPerson(id){
		window.location = "<%=request.getContextPath()%>/pam/work/view.htm?workPersonId=" + id;
	}
	
	function callKpiByPerson(){
		var form = document.forms['mainForm'];
		form.action = "<%=request.getContextPath()%>/pam/report/kpisummaryinfaculty/gotoUserHistoryEvaluate.htm";
		form.method = 'POST';
		
		var inputPersonId = document.createElement('input');
		inputPersonId.type = 'hidden';
		inputPersonId.name = 'personId';
		inputPersonId.value = <%= person.getPersonId() %>;
		form.appendChild(inputPersonId);
		
		var inputPersonType = document.createElement('input');
		inputPersonType.type = 'hidden';
		inputPersonType.name = 'personType';
		inputPersonType.value = <%= person.getPersonType() %>;
		form.appendChild(inputPersonType);
		
		form.submit();
	}
	
	function callKpiSummaryRankByPerson(){
		var form = document.forms['mainForm'];
		form.action = "<%=request.getContextPath()%>/pam/report/kpisummaryrank/initByPerson.htm";
		form.method = 'GET';
		
		var inputPersonId = document.createElement('input');
		inputPersonId.type = 'hidden';
		inputPersonId.name = 'personId';
		inputPersonId.value = <%= person.getPersonId() %>;
		form.appendChild(inputPersonId);
		
		form.submit();
	}
	
	function initAcademic(){
		var form = document.forms['mainForm'];
		form.action = "<%=request.getContextPath()%>/pam/person/initAcademic.htm";
		form.method = 'POST';
 
		
		form.submit();
	}
	
	function initAcademicWork(){
		var form = document.forms['mainForm'];
		form.action = "<%=request.getContextPath()%>/pam/person/initAcademicWork.htm";
		form.method = 'POST';
 
		
		form.submit();
	}
	 
</script>

