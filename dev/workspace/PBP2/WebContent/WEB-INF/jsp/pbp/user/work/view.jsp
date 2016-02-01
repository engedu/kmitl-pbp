<%@page import="com.buckwa.domain.pam.Person"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<% Person person = (Person) request.getAttribute("person"); %>
<form:form modelAttribute="person" action="search.htm" method="POST" name="mainForm">
<div class="post"> 
<div class="entry">  
 		 <div class="pbptableWrapper">
            <div class="pbp-header">
            <table style="width: 100%;">
            	<tr>
            		<td width="90%" align="left">    ผลงานประจำปี ${person.pBPWorkTypeWrapper.academicYear}  </td>
            		<td>
            			<a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/initWorkImport.htm"> นำเข้าผลงาน</a>
            		</td>
            	</tr>
            </table>
            </div> 
			<table class="pbp-table"> 
		<thead>
			<tr>
				<th  class="thLast" width="200px;">   ประเภทภาระงาน      </th>
				<th   class="thFirst">งาน </th>
				<th   class="thFirst" width="300px;">ภาระงาน/คะแนน </th>
				<th   class="thFirst" width="50px;">สถานะ </th>
				<th   class="thFirst" width="50px;">คะแนน </th>
 				<th   class="thFirst" width="50px;">รวม </th>
 				<th   class="thFirst" width="50px;">%  </th>
 				<th   class="thFirst" style="width: 80px;">ฐานการคำนวณ </th>
			</tr> 
		</thead>		
		<tbody>
				<c:forEach items="${person.pBPWorkTypeWrapper.pBPWorkTypeList}" var="domain" varStatus="status">
			<tr>
				<td class="tdLast" style="border-bottom: 1px solid #e1e1e1;">			
			       <input type="hidden" name="pBPWorkTypeList[${status.index}].workTypeId" value="${domain.workTypeId}" >
					${status.index+1} <c:out value="${domain.name}"/>  
	 
				</td>
				<td class="thLast" style="border-bottom: 1px solid #e1e1e1; "  colspan="4">  
				<table class="pbp-table" >
					 <c:forEach items="${domain.academicKPIUserMappingList}" var="domain2" varStatus="status2">
					<tr>
					<td class="tdBoth" style="font-size: 12px;"  > 
					     <c:forEach items="${domain2.academicKPIAttributeValueList}" var="domain3" varStatus="status3">
					         <c:if test="${domain3.name=='ชื่องาน'}"> 
								 <a rel="notLoading" href="#"> <c:out value="${domain3.value}"/> </a> 
							</c:if>
							 
						</c:forEach>  
					</td>
					 <td class="tdBoth" style="font-size: 8px; width: 300px;"  > 
						<c:out value="${domain2.academicKPI.name}"/>    ${domain2.academicKPI.mark} ชั่วโมงภาระงาน/ ${domain2.academicKPI.unitDesc}  
					</td>
					<td class="tdBoth" style="font-size: 12px; width: 50px;" >
					<c:if test="${domain2.status=='CREATE'}">
					 <span class="require" style="font-size: 12px;" >รออนุมัติ</span>
					</c:if>
					 <c:if test="${domain2.status=='CREATE_CO_TEACH'}">
					 <span class="require" style="font-size: 12px;" >รออนุมัติสอนร่วม</span>
					</c:if>
					 <c:if test="${domain2.status=='APPROVED'}">
					  อนุมัติ 
					</c:if>
					
					
					</td>
					 <td class="tdBoth" style="font-size: 12px; width: 50px;" > 
						<c:out value="${domain2.totalInMapping}"/>   
					</td>
					</tr>
					</c:forEach>
				 </table>
				</td>
				<td class="thLast" style="border-bottom: 1px solid #e1e1e1; text-align: center;"> 
				 
				<c:out value="${domain.totalInWorkType}"/>
 
				</td>	
 				<td class="thLast" style="border-bottom: 1px solid #e1e1e1; text-align: center;"> 
				
				<c:out value="${domain.totalInPercentWorkType}"/>
 
				</td>		
				 <td class="thLast" style="border-bottom: 1px solid #e1e1e1; text-align: center; width: 50px;"> 
				
				<c:out value="${domain.limitBase}"/>
 
				</td>	 
 
			</tr> 
			</c:forEach>
			
			<tr>
				<td colspan="7">
				
			
				
				</td>
			</tr>
			
	 
		</tbody> 
			</table>
		</div>  
		
		
		<div class="pbptableWrapper" style="height: 110px;">
            <div class="pbp-header">
            <table style="width: 100%;">
			<tr>
				<td   colspan="5" align="right">   คะแนนรวม    &nbsp; &nbsp; &nbsp; &nbsp;</td>
 				<td    colspan="1" align="right">  ${person.pBPWorkTypeWrapper.totalMark}    ชั่วโมง     &nbsp; &nbsp; </td>
				<td   colspan="1" align="right">  ${person.pBPWorkTypeWrapper.totalPercentMark} % </td>
			</tr>	
 
            </table>
            </div> 	
           <!-- 
            <div class="pbp-header" style="text-align: center;"><span style="font-size:30px; color: rgb(112,146,190);">
             	อัตราการขึ้นเงินเดือน     &nbsp;  ${person.pBPWorkTypeWrapper.increaseSalaryRate}
            </div>   
            -->         
            <div class="pbp-header" style="text-align: center;"><span style="font-size:30px; color: rgb(112,146,190);">
             	ระดับคะแนน  &nbsp;  ${person.pBPWorkTypeWrapper.totalPercentMarkCompareBase}
            </div>	
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
</script>
