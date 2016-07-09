<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<link rel="stylesheet" href="<c:url value='/kendo/styles/custom.css'/>"> 
	<link rel="stylesheet" href="<c:url value='/kendo/styles/kendo.common.min.css'/>"> 
	<link rel="stylesheet" href="<c:url value='/kendo/styles/kendo.default.min.css'/>"> 
	<link rel="stylesheet" href="<c:url value='/kendo/styles/kendo.dataviz.min.css'/>"> 		
	<link rel="stylesheet" href="<c:url value='/kendo/styles/kendo.dataviz.default.min.css'/>"> 
 
<script type="text/javascript" src='<c:url value="/kendo/js/jquery.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/kendo/js/angular.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/kendo/js/kendo.all.min.js"/>'></script> 	 
<body> 
<form:form modelAttribute="departmentReport" action="departmentBarChart.htm" method="POST" name="mainForm">

<br>
<div style="width: 90%; text-align: center; font-size: 18px;"> 

 	            			<form:select  path="departmentNameSelect" cssStyle="width:20%;font-size: 25px;" onchange="initDepartment();" > 
								<form:options   items="${departmentReport.departmentList}" itemValue="name" itemLabel="name" />
							</form:select>   
							
							
 
</div>

<h1 id="exampleTitle"> 
            <span ><img src="<c:url value="/images/chart_example.jpg"/>"    /></span>
            <strong>ระดับคะแนนในภาควิชา   ${departmentName}    
        
            </h1> 
  <div id="example">
    <div class="demo-section k-content">
        <div id="chart"></div>
        <br>
        <div id="grid"></div>
    </div>
    <script>
        function createChart() {
        	 $("#chart").kendoChart({
                 dataSource: {
                     transport: {
                         read: {
                         	 url: "<%=request.getContextPath()%>/json/dean/getDepartmentBarchart/${headName}",
                             dataType: "json"
                         }
                     } 
                 },
                 chema: {
               	  data: function(response) {
               	    for (var i = 0; i < response.length; i++) {
               	      response[i].orderNo = new Number(response[i].orderNo);
               	    }
               	    return response;
               	  }
               	}                 
                ,
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
        	        	max: ${maxValue} ,
        	        	majorUnit: ${interval} 
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
        		                url:    "<%=request.getContextPath()%>/json/dean/getDepartmentBarchart/${headName}",
        		                dataType: "Json"
        		            }
        		        }
        		    }
        	 ,
             chema: {
           	  data: function(response) {
           	    for (var i = 0; i < response.length; i++) {
           	      response[i].orderNo = new Number(response[i].orderNo);
           	    }
           	    return response;
           	  }
           	}    
        	 ,
        		    columns   : [        		       
        		        { field: "axisName", title: "บุคลากร" },
        		        { field: "axisValue", title: "คะแนน" }
        		    ]
        		});        	 
        	 
        }

        $(document).ready(createChart);
        $(document).bind("kendo:skinChange", createChart);
    </script>
</div>
 </form:form>
 
 <script type="text/javascript">
	function initDepartment(){
		var form = document.forms['mainForm'];
		form.action = "<%=request.getContextPath()%>/deanReport/departmentBarChart.htm";
		form.method = 'POST'; 
		form.submit();
	}
</script>
</body>