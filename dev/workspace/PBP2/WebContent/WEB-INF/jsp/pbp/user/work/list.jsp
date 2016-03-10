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
			<table class="pbp-table"> 
		<thead>
			<tr>
           		<th colspan="5" align="left">    <span class="lsf-icon colororange" title="list"></span>ผลงานประจำปี ${person.pBPWorkTypeWrapper.academicYear}  </td>
           		<th colspan="2" ><span class="lsf-icon colororange" title="upload"></span>
           			<a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/initWorkImport.htm" style="color: white;"> นำเข้าผลงาน</a>
           		</th>
           	</tr> 
			<tr>
				<th  class="thLast" width="200px">ประเภทภาระงาน     </th>
				<th   class="thFirst" width="380px">งาน </th>
				<th   class="thFirst" width="450px">ภาระงาน/คะแนน </th>
				<th   class="thFirst" width="65px">สถานะ </th>	
				<th   class="thFirst" width="65px">สัดส่วน </th>
				<th   class="thFirst" width="65px">คะแนน </th>
 				<th   class="thFirst" width="65px">รวม </th>
 				
<!-- 				<th  class="thLast" width="15%">   ประเภทภาระงาน      </th>
				<th   class="thFirst" width="30%">งาน </th>
				<th   class="thFirst" width="35%">ภาระงาน/คะแนน </th>
				<th   class="thFirst" width="5%">สถานะ </th>	
				<th   class="thFirst" width="5%">สัดส่วน </th>
				<th   class="thFirst" width="5%">คะแนน </th>
 				<th   class="thFirst" width="5%">รวม </th> -->
 				 
 				 <!-- 
 				<th   class="thFirst" style="width: 80px;">ฐานการคำนวณ </th>
 				<th   class="thFirst" style="width: 80px;">% เทียบฐาน </th>
 				 -->
			</tr> 
		</thead>		
		<tbody>
				<c:forEach items="${person.pBPWorkTypeWrapper.pBPWorkTypeList}" var="domain" varStatus="status">
			<tr>
				<td class="tdLast" style="border-bottom: 1px solid #e1e1e1;">			
			       <input type="hidden" name="pBPWorkTypeList[${status.index}].workTypeId" value="${domain.workTypeId}" >
					${status.index+1} <c:out value="${domain.name}"/>  
	 
				</td>
				
				<td class="td-detail" style="border-bottom: 1px solid #e1e1e1; "  colspan="5">  
				<table class="pbp-table noshadow">
					 <c:forEach items="${domain.academicKPIUserMappingList}" var="domain2" varStatus="status2">
						<tr>
						<td class=""> 
						     <c:forEach items="${domain2.academicKPIAttributeValueList}" var="domain3" varStatus="status3">
						      <c:if test="${status3.index==0}">
						         <a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/viewImportWork.htm?kpiUserMappingId=<c:out value="${domain2.kpiUserMappingId}"/>"> <c:out value="${domain3.value}"/></a>
								 
						 </c:if>
								 
							</c:forEach>  
						</td>
						 
						 <td class=""> 
							<c:out value="${domain2.academicKPI.name}"/>    ${domain2.academicKPI.mark} คะแนน/ ${domain2.academicKPI.unitDesc}  
						</td>
						
						
						<td class="">
							<c:if test="${domain2.status=='CREATE'}">
	<!-- 						 <span class="require" style="font-size: 12px; color: red;" >รออนุมัติ</span> -->
							 	<img alt="รออนุมัติ" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAUjSURBVFhHrZdrbFNlGMf/bU93qWu7Mbobu6gEHRPYFglGpsYscclw47JpYkQTwxcx8RJNJhI/6AcS0Bk1isJXw0iMDgbOAEpENEAcEjbC2GA4sq6MbnS3sq679ObzvOe0a+npZbpf8u/znrfnPc9z3svzvkeDJOn9qmgZmXpSNamCVEIykxgnyUrqIp0hta9+2zZONiEJAyDHj5H5gPQiKZXrkmCO1EraS4FcEzUxiBkAOc4gs5f0BknHdf8BH+kAaTcF4hI196EaADlfTaaN9Kio+P/cIG2jIHrlywWiAiDnT5A5ScoSFUvHBKmWguiQL2UiAlDe/DxpqZ0H4SCqwnsiFIAy5pdIcbs9PX89TKWNMJCVjAWizjtlh9v+N+5dP4IZOz8iLjwc64NzIjyAr8m8KV9FI2XkIa/6U2SUPKvUqOOynsXwmV3wuuxKjSr7KYC3uCACIOe81K6QVGd7anYpirYehmSwiGunvRdDV3/GlOMmEACMOauwYm0dzPk8gtQjbgdsx7Zjbuy6uFaBV0c5BXEtGMAhMq9w+X506dl48KWT0FMPeGan0Nm2C7bOo8q/kRRVNqBy2yfQpxnhcQ1j4Pta+GbGlH+jaKEAXtWQc85wd0hRSSZAb5df8yUySxvgnXfjz4MNmLjNyS42WYUVeGbnUUgpBjhvtMH+6zvKP1FwsirQ0g+nV9UMN5NSCPMjW0S5+8SehM4ZvofvZUzUVm8qFmUV2Gc9B8C5PYrJaR9SijdBo9VhdsqBWx08SsnB93IbjUYL46rnlVpVqjkA3lgicM36cWfch6yiSnF99+YfCPg8opwMfC+3YdJzox4fTgUHwLtaiNn5AGyjXp7cSDPmiLrp8UFhF0OwjU5ZOTEo4QCCWyo83gCsox742TvhV95aK6UIuxhCbfxe2apj5gAEPvJqpTf38gpVmB7nLR7ILFgj7GIItpl3ys+IBQfgDNB6426f8yivruDo520BsKysQpopT5STId2UL9ow7tsXhI2BU0vOrTzhpucinTND3Scw756AVqfHurqPldpItFIqpFTeRhZYW/eRaOObncRU/ymlVhWrlpxfmXT7letIfJR8ek5/JspFFVtRVtMkykHSzfmoaTqHTR9eDk3Yspr3xb3MaMfnCHhnRDkGXbotGx7gSSi3UGHC1kU5vgwmyveWhzdixmnH5NBVSrcmPP16K4yWlQj4fRgbuIjyzXvw0IaXRTvnP6fgOC8npDh8oaWOb6cCp8UYBHDx8E7Yuo7RqvBSgrlLyUnCk699B3OevPlwd1ftaEFeqZzTHD3HYf+FN9boYQ2DfbaLzai1KbeFzHYux4OzIr+tiRw/997vSu0CrrEB9P3WDP3QT9BLoZ0+FmIzEsuQbt1HJmwBqsPOmXvDvRi8zIdemfHBTpz9djNON28EBo8n45wfxD7FMkRj80g3mYNcTpZLP7yLkT453WYVrhNDU5ClhSE1lFricYDPAlwI3U0x89m/T75KTMDvwV+HdsBx6wIdTPqRKTlhNiTlnI9ku+Vi2JGMoblQRuYcaVGHUna8YpmOdr+EXR91KI0I+YXmkR4ytSS+MSkMKRoUJO+cj+UR3wZRfUZB8Ln9KVLC4dDTCbJouQRtYufc7fzmEd8EjOqgKT3xOOkbkurq0JLPYoseki6uc267n8TH8KivIiZh6EeactdQOuFJ00gKHd1KLBIy0mJOOk4yP5L2BWd7LBIGEIQmaDaZempQnWPWlS836Zbg8xz4FxlywBLBiRGzAAAAAElFTkSuQmCC" />
							</c:if>
							<c:if test="${domain2.status=='CREATE_CO_TEACH'}">
	<!-- 						 <span class="require" style="font-size: 12px; color: red;" >รออนุมัติสอนร่วม</span> -->
							 	<img alt="รออนุมัติสอนร่วม" src="data:image/png;base64,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" />
							 
							</c:if>
							 <c:if test="${domain2.status=='APPROVED'}">
								 <img alt="อนุมัติ" src="data:image/png;base64,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" />
							</c:if>
							
						
						</td>					
						
					 <td class="" > 
							 <c:forEach items="${domain2.academicKPIAttributeValueList}" var="domain3" varStatus="status3">					      
						           
						            <c:if test="${domain3.name=='สัดส่วน(%)'}">
						          
						           <c:out value="${domain3.value}"/> %
						            </c:if>
								    
							</c:forEach>  
						</td>					
						
	
						 <td class="" > 
							<c:out value="${domain2.totalInMapping}"/>   
						</td>
					</tr>
					</c:forEach>
					
					
					
				 </table>
				 
				</td>
				<td class="thLast" style="border-bottom: 1px solid #e1e1e1; text-align: center;"> 
				
				<c:if test="${domain.compareBaseStatus=='UNDER'}">
				  <span style="color: red;"><c:out value="${domain.totalInWorkType}"/></span>
                 </c:if>
                  <c:if test="${domain.compareBaseStatus=='NORMAL'}">
				<c:out value="${domain.totalInWorkType}"/>
                 </c:if>
                <c:if test="${domain.compareBaseStatus=='OVER'}">
				  <span style="color:green;"> <c:out value="${domain.totalInWorkType}"/></span>
                 </c:if>
                  
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
 				<td    colspan="1" align="right">  ${person.pBPWorkTypeWrapper.totalMark}   คะแนน    &nbsp; &nbsp; </td>
		<!--  		<td   colspan="1" align="right">  ${person.pBPWorkTypeWrapper.totalPercentMark} % </td>-->
				
			<!--	
				<td   colspan="5" align="right">   คะแนนรวมเทียบฐาน    &nbsp; &nbsp; &nbsp; &nbsp;</td>
		  		  <td    colspan="1" align="right">  ${person.pBPWorkTypeWrapper.totalMarkCompareBase}    ชั่วโมง     &nbsp; &nbsp; </td>
				<td   colspan="1" align="right">  ${person.pBPWorkTypeWrapper.totalPercentMarkCompareBase} % </td>-->
			</tr>	
 
            </table>
            </div> 	
             <!-- 
            <div class="pbp-header" style="text-align: center;"><span style="font-size:30px; color: rgb(112,146,190);">
             	ระดับคะแนน     &nbsp;  ${person.pBPWorkTypeWrapper.increaseSalaryRate}
            </div>   
                    -->
            <div class="pbp-header" style="text-align: center;"><span style="font-size:30px; color: rgb(112,146,190);">
             	ระดับคะแนน   &nbsp;  ${person.pBPWorkTypeWrapper.totalMark}
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
