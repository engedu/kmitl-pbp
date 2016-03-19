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
 
<div class="post">  
		    <div id="example" style="padding: 0;margin: 0;">
		    <div class="demo-section k-content">
		        <div id="chart"></div>
		        <br>
		         <div id="grid"></div>
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
                            url: "<%=request.getContextPath()%>/json/person/getRadarPlot",
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