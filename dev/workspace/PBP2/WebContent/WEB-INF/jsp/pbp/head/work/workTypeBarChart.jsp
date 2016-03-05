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
            <strong>ระดับคะแนนแต่ละด้านในภาควิชา    ${departmentName}   
        <!--     <a href="<%=request.getContextPath()%>/json/head/getBarchart">JSON Object</a> -->
            </h1> 
  <div id="example">
    <div class="demo-section k-content">
        <div id="chart1"></div>
        <div id="chart2"></div>
         <div id="chart3"></div>
        <div id="chart4"></div>
         <div id="chart5"></div>
    </div>
    <script>
        function createChart1() {
        	 $("#chart1").kendoChart({
                 dataSource: {
                     transport: {
                         read: {
                         	 url: "<%=request.getContextPath()%>/json/head/getWorkTypeBarchart/1",
                             dataType: "json"
                         }
                     } 
                 }
        	 ,  
        	        title: {
        	            text: "ระดับคะแนนในภาควิชา ด้านวิชาการ"
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
        	        	max: 2000,
        	        	majorUnit: 200
        	        },
                    tooltip: {
                        visible: true,
                        template: "#= series.name #: #= value #"
                    }
        	    });
        	
            
        }
        function createChart2() {
       	 $("#chart2").kendoChart({
                dataSource: {
                    transport: {
                        read: {
                        	 url: "<%=request.getContextPath()%>/json/head/getWorkTypeBarchart/2",
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
              	}    ,
       	        title: {
       	            text: "ระดับคะแนนในภาควิชา ด้านงานพัฒนาวิชาการ"
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
    	        	max: 2000,
    	        	majorUnit: 200
       	    	}
       	    });
       	
           
       }

        function createChart3() {
          	 $("#chart3").kendoChart({
                   dataSource: {
                       transport: {
                           read: {
                           	 url: "<%=request.getContextPath()%>/json/head/getWorkTypeBarchart/3",
                               dataType: "json"
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
          	}   ,
                   
          	        title: {
          	            text: "ระดับคะแนนในภาควิชา ด้านงานวิจัย"
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
        	        	max: 2000,
        	        	majorUnit: 200
          	    	}
          	    });
          	
              
          }
        
        function createChart4() {
          	 $("#chart4").kendoChart({
                   dataSource: {
                       transport: {
                           read: {
                           	 url: "<%=request.getContextPath()%>/json/head/getWorkTypeBarchart/4",
                               dataType: "json"
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
          	}   ,
                 
          	        title: {
          	            text: "ระดับคะแนนในภาควิชา ด้านงานบริการวิชาการ"
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
        	        	max: 2000,
        	        	majorUnit: 200
          	    	}
          	    });
          	
              
          }
        
        function createChart5() {
          	 $("#chart5").kendoChart({
                   dataSource: {
                       transport: {
                           read: {
                           	 url: "<%=request.getContextPath()%>/json/head/getWorkTypeBarchart/5",
                               dataType: "json"
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
          	}    ,
          	        title: {
          	            text: "ระดับคะแนนในภาควิชา ด้านงานทำนุบำรุงศิลป"
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
        	        	max: 2000,
        	        	majorUnit: 200
          	    	}
          	    });
          	
              
          }        
        
        $(document).ready(createChart1);
        $(document).ready(createChart2);
        $(document).ready(createChart3);
        $(document).ready(createChart4);
        $(document).ready(createChart5);
        
        $(document).bind("kendo:skinChange", createChart1);
        $(document).bind("kendo:skinChange", createChart2);
        $(document).bind("kendo:skinChange", createChart3);
        $(document).bind("kendo:skinChange", createChart4);
        $(document).bind("kendo:skinChange", createChart5);
    </script>
</div>
 

</body>