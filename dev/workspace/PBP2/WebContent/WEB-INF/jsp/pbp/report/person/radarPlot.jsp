<%@page import="com.buckwa.domain.pam.Person"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%> 
<% Person person = (Person) request.getAttribute("person"); %>
<form:form modelAttribute="person" action="search.htm" method="POST" name="mainForm">

	<div style="width: 100%">
	<div style="width: 50%; float: left; text-align: right;" >
  
            			 ปีการศึกษา  &nbsp; 
	            			<form:select path="academicYear" cssStyle="width:20%" > 
								<form:options items="${person.academicYearList}" itemValue="name" itemLabel="name" />
							</form:select> 
 
            			
	            			<sec:authentication var="principal" property="principal" />
	            			
	            			<c:if test="${principal.personProfile.employeeType == 'ข้าราชการ' }">  
	            				 &nbsp;&nbsp;&nbsp;   รอบ  &nbsp; 
	            				 <form:select path="evaluateRound"  cssStyle="width:20%"> 
									<form:options items="${person.evaluateRoundList}" itemValue="name" itemLabel="name" />
								</form:select> 
	            			</c:if>
                              &nbsp; 
                           <a class="btn btn-primary"  rel="notLoading" onclick="initAcademic()"> ค้นหา</a> 
            
	 
	 
	 </div>
	<div style="width: 40%; float: right;">
		<div style="padding: 10px 10px; text-align: right;">
		 	<b>สถานะ   : </b>&nbsp;<img width="25px" alt="รออนุมัติ" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAUjSURBVFhHrZdrbFNlGMf/bU93qWu7Mbobu6gEHRPYFglGpsYscclw47JpYkQTwxcx8RJNJhI/6AcS0Bk1isJXw0iMDgbOAEpENEAcEjbC2GA4sq6MbnS3sq679ObzvOe0a+npZbpf8u/znrfnPc9z3svzvkeDJOn9qmgZmXpSNamCVEIykxgnyUrqIp0hta9+2zZONiEJAyDHj5H5gPQiKZXrkmCO1EraS4FcEzUxiBkAOc4gs5f0BknHdf8BH+kAaTcF4hI196EaADlfTaaN9Kio+P/cIG2jIHrlywWiAiDnT5A5ScoSFUvHBKmWguiQL2UiAlDe/DxpqZ0H4SCqwnsiFIAy5pdIcbs9PX89TKWNMJCVjAWizjtlh9v+N+5dP4IZOz8iLjwc64NzIjyAr8m8KV9FI2XkIa/6U2SUPKvUqOOynsXwmV3wuuxKjSr7KYC3uCACIOe81K6QVGd7anYpirYehmSwiGunvRdDV3/GlOMmEACMOauwYm0dzPk8gtQjbgdsx7Zjbuy6uFaBV0c5BXEtGMAhMq9w+X506dl48KWT0FMPeGan0Nm2C7bOo8q/kRRVNqBy2yfQpxnhcQ1j4Pta+GbGlH+jaKEAXtWQc85wd0hRSSZAb5df8yUySxvgnXfjz4MNmLjNyS42WYUVeGbnUUgpBjhvtMH+6zvKP1FwsirQ0g+nV9UMN5NSCPMjW0S5+8SehM4ZvofvZUzUVm8qFmUV2Gc9B8C5PYrJaR9SijdBo9VhdsqBWx08SsnB93IbjUYL46rnlVpVqjkA3lgicM36cWfch6yiSnF99+YfCPg8opwMfC+3YdJzox4fTgUHwLtaiNn5AGyjXp7cSDPmiLrp8UFhF0OwjU5ZOTEo4QCCWyo83gCsox742TvhV95aK6UIuxhCbfxe2apj5gAEPvJqpTf38gpVmB7nLR7ILFgj7GIItpl3ys+IBQfgDNB6426f8yivruDo520BsKysQpopT5STId2UL9ow7tsXhI2BU0vOrTzhpucinTND3Scw756AVqfHurqPldpItFIqpFTeRhZYW/eRaOObncRU/ymlVhWrlpxfmXT7letIfJR8ek5/JspFFVtRVtMkykHSzfmoaTqHTR9eDk3Yspr3xb3MaMfnCHhnRDkGXbotGx7gSSi3UGHC1kU5vgwmyveWhzdixmnH5NBVSrcmPP16K4yWlQj4fRgbuIjyzXvw0IaXRTvnP6fgOC8npDh8oaWOb6cCp8UYBHDx8E7Yuo7RqvBSgrlLyUnCk699B3OevPlwd1ftaEFeqZzTHD3HYf+FN9boYQ2DfbaLzai1KbeFzHYux4OzIr+tiRw/997vSu0CrrEB9P3WDP3QT9BLoZ0+FmIzEsuQbt1HJmwBqsPOmXvDvRi8zIdemfHBTpz9djNON28EBo8n45wfxD7FMkRj80g3mYNcTpZLP7yLkT453WYVrhNDU5ClhSE1lFricYDPAlwI3U0x89m/T75KTMDvwV+HdsBx6wIdTPqRKTlhNiTlnI9ku+Vi2JGMoblQRuYcaVGHUna8YpmOdr+EXR91KI0I+YXmkR4ytSS+MSkMKRoUJO+cj+UR3wZRfUZB8Ln9KVLC4dDTCbJouQRtYufc7fzmEd8EjOqgKT3xOOkbkurq0JLPYoseki6uc267n8TH8KivIiZh6EeactdQOuFJ00gKHd1KLBIy0mJOOk4yP5L2BWd7LBIGEIQmaDaZempQnWPWlS836Zbg8xz4FxlywBLBiRGzAAAAAElFTkSuQmCC" /> รออนุมัติ 
		 	<img width="25px" alt="รออนุมัติสอนร่วม" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAF70lEQVR42q2XaVBTVxSAz0vYTCQQUSgCCokoRiSWahVFsexQHZeqBUHFDXCrrba1Ol1mHB3tMmMrBQWpOrYVxK1aWqEMiIoL1LqAWnEDFFAgkoQlqFlez30KDcl7CMr5kZm8c+8931nuPfdS0EMZGRwq7NtPPMpaKPSwtLISA1CUVqtVa9s0lS1K5ZWrOSfUPVmP6s4g3ylTRQ4urrEURUXh33Fo05JjqJ6m6X9Qn6Wue7S35Mjhx68FIA+PtHb08FgLNP0JGrfvUahoupUGSEKQzSVHj7T0GCAgbpHcysYmAw0P75FhMw66Sq/TxRakpxV1GyB4aeI0yoK/H5WC1zHeAQG0Fn8S8nam7HkpQFB8wjQej3+Q4s7zq2IYaBqWIsRuToCABQvl1oI+5/Azp+ciQR/w9RwEUucBILYVMt+ULRq497ABLt2uAnVrWxcMtFav04fmp6cWmgH4hIRavyEdchk4cm4n7ANzAkaDv7cnWPD5rOvr9AY4e/0OZBWWgIoDBGuipkmh8C4+lKXqBBCSuHwDhn0z26Thg5zhgxlBjPckjv/efwhl96qhQd3M6Pvb2cJIDxeQDR4IPIqCZs0TSDqWD9cra9khALbn7Uhe3QEgD4+wdXSX3Me59mzGP50TDlaWFlD+4BHsyS2CBw1K1oVd+tvDojB/8MI5Wp0evjuYA9fYIZ42Kxul5zMzahiA4IRly3k8XjJb2LcueY/xvOjabUj94xQYDPT/NeMzFGoUKrhTW9/xjURgSeRE1A2DlrYnsC79MKiwRliisBGj8BUDEJq44hTGYpLpoPjISRAgH8Z4vml/difjRFZND4SrmIrTpbc6fScQ66MjmZQQ8B2/F7IBlCOAFyULmCx0kcmUFHTedsT77SuiASMD69GLaoV52LkAiDg72ME3S2YRQ7A6OYPZKaYMjTW17tSY6TPGi50HnjXVBo7ygsUREzGHNbAl40/WnHcFQITUjlzqBntzz0LepRtm+mdtbTOpCXNjYoR29r+YKpdiHifLvSDjZDFkXyh9JYCIMd4QG+wHp8tuQWr2KfMBNL2W8o+Zt1IgEiW1f2OKAnNI6H0krpD0Wz4U36wg+5cVgGy1gis3WQHe8hwMa2aFwrUKjGImSxRp2GQG4NpfDBvmvsvUQLuQKv868wRonj7rNN9PJoXYoHHM4tUsW7MDgCON6BQCzI2dJ7Cz22esMIbgMt4uE/FkjHrnbVaIsNHeMD/ED86U3Yad2YUsAcA2P2b6TH+xs/MZUyWBIAunHD/JabxdyPFM9jrx1Fg+nh0Gbw4ZBPvyzkHuxetm87AIZ5FtaOsiG9GIubeAXhQnsQi+jZ/N1NSHOw7A4ybzO0ljba2EqTnsA+ewD/j1lnGsYVj3fgT2B1c4f+Mu/HiswHwQTd/7a2eK9PlRHL9sNY/P+55rwRF4oo3CUO4vKGbdDabG40InQLCvDDRPnsFnPx1C71vZALYgwIbnzSgsQuzoIanCybam40QCG9i2LApsrCyZHO/OKYI6ZROrcUd7W1iIzYhsX51eD9sO58GVuw9YRtLa5sZGz/MHMquM2/FGTMMXbAuTBVdOCwShjTXoDQYoxcOnrKIa6lXP2/GAF+1YLnEDPp/HeJ58vIDDOON9GnqfwESsw0hIqMBJOqQUIaRsc/rh7Sc6cCyM8/Jg+gObGBCupLwCU1XCWnQvjNc3KRpGXDh0UNEJgEjA/Lix+OAgZ6Y1V44dREIYPdQdJHgl62d8JattgIu3KkHRxHkDJ6LX67RT83elneioGdMRwfGJ0RSf/zMq+NCrQpP6/QgvpT8Yf2W/lscnxuDNeDdqrXrHNOjxZ01easp2Ux33w2TBwvFWAsGvOMD9NY3XGXTauPz0tBw2fZdPM5+w8L5OEunnuMoqLM4ePVIw3uT8TlfVPfry76NHON+I3XucRk4Z4ODmthhPmSgE8eliHvYXuhyPqix1fd0ufJxWv2ztbgEYy8igEKe+Dg6+mB4JbkfxC3fVTzWaylaV8vLV3JyXGjWW/wCPbnAZiCrQMAAAAABJRU5ErkJggg==" /> รออนุมัติสอนร่วม 
			 <img width="25px" alt="อนุมัติ" src="data:image/png;base64,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" />
		 อนุมัติ
		</div>	
	
	</div>
	
	</div>
        
 
<div class="post">  
<div class="entry"> 

		    <div id="example" style="padding: 0;margin: 0;">
		    <div class="demo-section k-content">
		        <div id="chart"></div>
		        <br>
		         <div id="grid"></div>
		    </div>
			</div> 
</div> 
</div>
</form:form>
<script>
        function createChart() {
            $("#chart").kendoChart({
                title: {
                    text: "คะแนนประจำปี <c:out value="${person.thaiName}"/> <c:out value="${person.thaiSurname}"/>" 
                },
                dataSource: {
                    transport: {
                        read: {
                            url: "<%=request.getContextPath()%>/json/person/getRadarPlotNew/1",
                            dataType: "json"
                        }
                    } 
                },
                seriesDefaults: {
                    type: "radarLine"
                },
                series: [{
                    name: "คะแนน",
                    field: "axisValue"
                }],
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
     		                url:    "<%=request.getContextPath()%>/json/person/getRadarPlotNew/1",
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