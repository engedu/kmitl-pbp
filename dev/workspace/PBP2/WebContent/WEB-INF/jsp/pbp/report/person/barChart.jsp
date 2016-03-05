<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

	<link rel="stylesheet" href="<c:url value='/kendo/styles/custom.css'/>"> 
	<link rel="stylesheet" href="<c:url value='/kendo/styles/kendo.common.min.css'/>"> 
	<link rel="stylesheet" href="<c:url value='/kendo/styles/kendo.default.min.css'/>"> 
	<link rel="stylesheet" href="<c:url value='/kendo/styles/kendo.dataviz.min.css'/>"> 		
	<link rel="stylesheet" href="<c:url value='/kendo/styles/kendo.dataviz.default.min.css'/>"> 
 
<script type="text/javascript" src='<c:url value="/kendo/js/jquery.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/kendo/js/angular.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/kendo/js/kendo.all.min.js"/>'></script> 	 
<body> 
<h1 id="exampleTitle"> 
            <span ><img src="<c:url value="/images/chart_example.jpg"/>"    /></span>
            <strong>ระดับคะแนนในภาควิชา    ${departmentName} 
        <!--     <a href="<%=request.getContextPath()%>/json/person/getBarchart">JSON Object</a> -->
            </h1> 
  <div id="example">
    <div class="demo-section k-content">
        <div id="chart"></div>
      <!-- <div id="grid"></div>  -->  
    </div>
    <script>
        function createChart() {
        	 $("#chart").kendoChart({
                 dataSource: {
                     transport: {
                         read: {
                         	 url: "<%=request.getContextPath()%>/json/person/getBarchart",
                             dataType: "json"
                         }
                     }, 
                      
                 },
          
        	        title: {
        	            text: "ระดับคะแนนในภาควิชา"
        	        },
        	        series: [{
        	            type: "column",
        	            field: "axisValue",
        	            name: "ระดับคะแนน"
        	        }],
        	        categoryAxis: {
        	            field: "axisName",
        	            labels: {
        	                rotation: -90
        	            }
        	        },
        	        valueAxis: {
        	            min: 0,
        	            max: 4000,
        	            majorUnit: 300,
        	            plotBands: [{
            	            from: 99,
            	            to: 100,
            	            color: "#f99"
            	        }]
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
      		                url:    "<%=request.getContextPath()%>/json/person/getBarchart",
      		                dataType: "Json"
      		            }
      		        }
      		    }
          	 
          	 ,
      		    columns   : [
      		        { field: "axisName", title: "ชื่อ" },
      		        { field: "axisValue", title: "คะแนน" }
      		    ]
      		});    
            
        }

        $(document).ready(createChart);
        $(document).bind("kendo:skinChange", createChart);
 
    </script>
</div>
 

</body>