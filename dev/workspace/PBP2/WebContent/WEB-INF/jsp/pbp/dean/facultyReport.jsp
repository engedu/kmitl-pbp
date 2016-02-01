<%@page import="com.buckwa.domain.pam.Person"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
 
<form:form modelAttribute="faculty" action="search.htm" method="POST" name="mainForm">
<div class="post"> 
<div class="entry"> 
		<table class="pbp-table"> 
		<thead>
			<tr>
				<th>
				<span class="lsf-icon colororange" title="graph"></span>คะแนนภาพรวมระดับคณะ  ${faculty.name} 
				</th>
			</tr>
		</thead>
		<tr><td>
			<!--   <a href="<%=request.getContextPath()%>/json/person/getRadarPlot">JSON Object</a> -->
		    <div id="example">
		    <div class="demo-section k-content">
		        <div id="chart"></div>
		        <br>
		        <div id="grid"></div>
		    </div>
			</div>
		</td></tr>
		</table>
 
    
</div>
</div></div>
</form:form>
<script>
        function createChart() {
            $("#chart").kendoChart({
                title: {
                    text: "คะแนนภาพรวมระดับคณะ"
                },
                dataSource: {
                    transport: {
                        read: {
                            url: "<%=request.getContextPath()%>/json/dean/facultyReport",
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
                    max: 60
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
       		                url:    "<%=request.getContextPath()%>/json/dean/facultyReport",
       		                dataType: "Json"
       		            }
       		        }
       		    },
       		    columns   : [
       		        { field: "axisName", title: "ภาควิชา" },
       		        { field: "axisValue", title: "คะแนน เฉลี่ย" }
       		    ]
       		});          
            
            
        }
        
        
        
        

        $(document).ready(createChart);
        $(document).bind("kendo:skinChange", createChart);
    </script>