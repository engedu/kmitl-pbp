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
   <div class="row entry">
<!--  	<div class="one columns"></div> -->
 	<div class="six columns">
 		 <div class="pbptableWrapper">
            <div class="pbp-header"> 
            	<table style="width: 100%;">
            		<tr>
            		
            			<td width="30%;" style="text-align: center;  vertical-align: middle; height: 50px; font-size: 22px;font-weight: bold;"> 
            			ข้อมูลส่วนตัว  
            			</td>
            			<td style="text-align: center;  vertical-align: middle;">
            			 ปีการศึกษา  &nbsp; 
	            			<form:select path="academicYear" cssStyle="width:20%" > 
								<form:options items="${person.academicYearList}" itemValue="name" itemLabel="name" />
							</form:select> 
						
<!--             			</td> -->
<!--             			<td style="text-align: center;  vertical-align: middle;"> -->
            			
	            			<sec:authentication var="principal" property="principal" />
	            			
	            			<c:if test="${principal.personProfile.employeeType == 'ข้าราชการ' }">  
	            				 &nbsp;&nbsp;&nbsp;   รอบ  &nbsp; 
	            				 <form:select path="evaluateRound"  cssStyle="width:20% " onchange="initAcademic();"> 
									<form:options items="${person.evaluateRoundList}" itemValue="name" itemLabel="name" />
								</form:select> 
	            			</c:if>
	            			
<%-- 	            			 <c:if test="${principal.personProfile.employeeType != 'ข้าราชการ' }">   --%>
	            			 
<%-- 	            			</c:if> --%>
            			
<!--             			 	<a rel="notLoading" onclick="initAcademic();" >  -->
<!-- 							 <input value="ผลประเมิน" class="btn btn-primary" type="button" onclick="#"> -->
<!-- 							</a> -->
            			
            			</td>
            		</tr>
            	</table>
            </div> 
	<table class="pbp-table">
		<tbody>
			<tr height="410px">
				<td width="30%" style="border-center: 1px solid white; margin-right: 1px; text-align: center;" valign="top" >
		 			<img src="<%=request.getContextPath()%>/servlet/Image?<c:out value="${person.picture}" />" class="img_border" border="2" width="90px;" height="100px;">
				
				<br><br><br><br>
					<a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/editProfile.htm?personId=<c:out value="${person.personId}"/>"> 
					
					แก้ไขรูปประจำตัว 
					
					</a>
				</td>
		
				<td valign="top" style="padding: 10px;" colspan="2">
					<table width="100%" id="profile"> 
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
 	<div class="six columns">
 	 		 <div class="pbptableWrapper">
            <div class="pbp-header">
                <table style="width: 100%;">
            		<tr>
            		
							<td width="100%;" style="text-align: right; vertical-align: middle; height: 50px; font-size: 22px;font-weight: bold;">
								<c:if
									test="${principal.personProfile.employeeType == 'ข้าราชการ' }">
									<!--  รอบที่   1  -->
								</c:if> คะแนนรวม  = ${person.pBPWorkTypeWrapper.totalMark}</td>
							<td>
         						   <a rel="notLoading" onclick="recalculate();" > 
							 	<input value="คำนวณคะแนนให้เป็นปัจจุบัน" class="btn btn-primary" type="button" onclick="#">
								 </a>							
							</td>
								
							<td>
            						   <a rel="notLoading" onclick="initAcademicWork();" > 
							 	<input value="ดูรายละเอียดการประเมิน" class="btn btn-primary" type="button" onclick="#">
								 </a>
            			 </td>
            		</tr>
            	</table>
             </div> 
            
          <table class="pbp-table" style="padding:0; margin: 0;">
				<tbody>
            <td width="100%" style="border-center: 1px solid white;" valign="top">
  		 
		        <div id="chart"></div>		    
		    
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
				<th  class="thLast" width="250px;">   ประเภทภาระงาน      </th> 		 
 				<th   class="thFirst" style="width: 80px;">ระดับคะแนนคาดการณ์ (คะแนน) </th> 	
 				<th   class="thFirst" style="width: 80px;">ระดับคะแนน (คะแนน) </th			 
			</tr> 
		</thead>		
		<tbody>
				<c:forEach items="${person.pBPWorkTypeWrapper.radarPlotReportList}" var="domain" varStatus="status">
			<tr>
				<td class="tdLast" style="border-bottom: 1px solid #e1e1e1;">			
			      
					${status.index+1} <c:out value="${domain.axisName}"/>  
	 
				</td>
  
 				<td class="thLast" style="border-bottom: 1px solid #e1e1e1; text-align: center; width: 50px;"> 
								 
				   <c:out value="${domain.axisValue2}"/> 
          
				</td>		 
 				<td class="thLast" style="border-bottom: 1px solid #e1e1e1; text-align: center; width: 50px;"> 
								 
				   <c:out value="${domain.axisValue}"/> 
          
				</td>	   
			</tr> 
			</c:forEach>
			
			<tr>
				<th  class="thLast" style="text-align: right; font-size: 22px;">   คะแนนรวม    &nbsp; &nbsp; &nbsp; &nbsp;</th>
				<th  class="thLast" colspan="1" style="text-align: center; font-size: 22px;">   ${person.pBPWorkTypeWrapper.totalMark_E} </th>
 				<th  class="thLast" colspan="1" style="text-align: center; font-size: 22px;">   ${person.pBPWorkTypeWrapper.totalMark} </th>
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
	
	
	function recalculate(){
		var form = document.forms['mainForm'];
		form.action = "<%=request.getContextPath()%>/pam/person/recalculate.htm";
		form.method = 'GET';
 
		
		form.submit();
	}
	 
</script>
<script>
        function createChart() {
            $("#chart").kendoChart({
                title: {
                    text: "คะแนนประจำปี"
                },
                dataSource: {
                    transport: {
                        read: {
                            url: "<%=request.getContextPath()%>/json/person/getRadarPlotNew",
                            cache: false,
                            dataType: "json"
                        }
                    } 
                },
                seriesDefaults: {
                    type: "radarLine"
                },
                series: [{
                    name: "คะแนนรวมอนุมัติ",
                    field: "axisValue"
                },
                {
                    name: "คะแนนรวมรออนุมัติ",
                    field: "axisValue2"
                }                
                ],
                categoryAxis: {
                    field: "axisName"
                },
                valueAxis: {
                    labels: {
                    	format: "{0}",
                        visible: true,
                    },
                    min: 0,
                    max: 1000
                },
                tooltip: {
                    visible: true,
                    template: "#= series.name #: #= value #"
                }
            });
            
  
            
          	 $("#grid").kendoGrid({     
     		    
     		    dataSource: {
     		        transport: {
     		            read: {
     		                url:    "<%=request.getContextPath()%>/json/person/getRadarPlot",
     		                dataType: "Json"
     		            }
     		        }
     		    },
     		    columns   : [
     		        { field: "axisName", title: "ประเภทภาระงาน " },
     		        { field: "axisValue", title: "คะแนน" }
     		    ]
     		});              
            
        }

        $(document).ready(createChart);
        $(document).bind("kendo:skinChange", createChart);
       
    </script>
