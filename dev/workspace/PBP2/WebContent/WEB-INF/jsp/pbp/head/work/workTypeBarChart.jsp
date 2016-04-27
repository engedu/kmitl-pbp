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

<style type="text/css">
.box{
    width: 2px;
    height: 1px;
    background-color: red;
    
}

.boxYellow{
    width: 2px; height: 1px; background-color: yellow;
    
}

.boxGreen{
    width: 2px;
    height: 1px;
    background-color: green;
    
}

</style>
<body> 
<h1 id="exampleTitle"> 
            <span ><img src="<c:url value="/images/chart_example.jpg"/>"    /></span>
            <strong>ระดับคะแนนแต่ละด้านในภาควิชา    ${departmentName}  
        <!--     <a href="<%=request.getContextPath()%>/json/head/getBarchart">JSON Object</a> -->
            </h1> 
	<div style=" float: right; ">
	 <table style="border: none;">
	 	<tr>
	 		<td style="border: none;"> เกณฑ์ขั้นต่ำ :  &nbsp;<hr style="height:2px;border:none;color:red;background-color:red;" /></td>
			<td style="border: none;"> ค่าเฉลี่ย :  &nbsp;<hr style="height:2px;border:none;color:yellow;background-color:yellow;" /></td>
			<td style="border: none;"> เกณฑ์ขั้นสูง : &nbsp;<hr style="height:2px;border:none;color:green;background-color:green;" /></td>
	 	</tr>
	 </table>
  		 
	</div>            
        <br><br>    
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
        	var start = ${mean1};
            var end = start+2;
            var startMin = ${minValue1};
            var endMin = startMin + 2;
            var startMax = ${maxValue1};
            var endMax = startMax + 2;
        	 $("#chart1").kendoChart({
                 dataSource: {
                     transport: {
                         read: {
                         	 url: "<%=request.getContextPath()%>/json/head/getWorkTypeBarchart/1",
                             dataType: "json"
                         }
                     },
          
                 },
        	        title: {
        	            text: "ระดับคะแนนในภาควิชา ด้านวิชาการ ค่่าเฉลี่ย  ${mean1}  (เกณฑ์ขั้นต่ำ:${minDesc1}   เกณฑ์ขั้นสูง:${maxDesc1})"
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
        	            max: 1000,
        	            majorUnit: 100
        	        } 
        	        ,valueAxis:  {
        	            plotBands: [
        	                        { from: start, to: end, color: "orange" },
        	                        { from: startMax, to: endMax, color: "green" },
        	                        { from: startMin, to: endMin, color: "red" }
        	                    ]
        	                }
        	        ,
                    tooltip: {
                        visible: true,
                        template: "#= series.name #: #= value #"
                    }
        	    });
        	
            
        }
        function createChart2() {
        	var start = ${mean2};
            var end = start+2;
            if(start==0.00){
            	end=0.00;
            }
            
            var startMin = ${minValue2};
            var endMin = startMin + 2;
            if(startMin==0.00){
            	endMin=0.00;
            }
            
            var startMax = ${maxValue2};
            var endMax = startMax + 2;
       	 $("#chart2").kendoChart({
                dataSource: {
                    transport: {
                        read: {
                        	 url: "<%=request.getContextPath()%>/json/head/getWorkTypeBarchart/2",
                            dataType: "json"
                        }
                    },
           
                },
       	        title: {
       	            text: "ระดับคะแนนในภาควิชา ด้านงานพัฒนาวิชาการ  ค่่าเฉลี่ย  ${mean2}  (เกณฑ์ขั้นต่ำ:${minDesc2}   เกณฑ์ขั้นสูง:${maxDesc2})"
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
					max: 1000,
					majorUnit: 100
				}
    	        ,valueAxis:  {
    	            plotBands: [
    	                        { from: start, to: end, color: "orange" },
    	                        { from: startMax, to: endMax, color: "green" },
        	                    { from: startMin, to: endMin, color: "red" }
    	                    ]
    	                }
    	        ,
                tooltip: {
                    visible: true,
                    template: "#= series.name #: #= value #"
                }
       	    });
       	
           
       }

        function createChart3() {
        	var start = ${mean3};
            var end = start+2;
            if(start==0.00){
            	end=0.00;
            } 
            
            var startMin = ${minValue3};
            var endMin = startMin + 2;
            if(startMin==0.00){
            	endMin=0.00;
            } 
            
            var startMax = ${maxValue3};
            var endMax = startMax + 2;
          	 $("#chart3").kendoChart({
                   dataSource: {
                       transport: {
                           read: {
                           	 url: "<%=request.getContextPath()%>/json/head/getWorkTypeBarchart/3",
                               dataType: "json"
                           }
                       },
              
                   },
          	        title: {
          	            text: "ระดับคะแนนในภาควิชา ด้านงานวิจัย   ค่่าเฉลี่ย  ${mean3}  (เกณฑ์ขั้นต่ำ:${minDesc3}   เกณฑ์ขั้นสูง:${maxDesc3})"
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
						max: 1000,
						majorUnit: 100
					}
        	        ,valueAxis:  {
        	            plotBands: [
        	                        { from: start, to: end, color: "orange" },
        	                        { from: startMax, to: endMax, color: "green" },
        	                        { from: startMin, to: endMin, color: "red" }
        	                    ]
        	                }
        	        ,
                    tooltip: {
                        visible: true,
                        template: "#= series.name #: #= value #"
                    }
          	    });
          	
              
          }
        
        function createChart4() {
        	var start = ${mean4};
            var end = start+2;
            if(start==0.00){
            	end=0.00;
            } 
            var startMin = ${minValue4};
            var endMin = startMin + 2;
            
            if(startMin==0.00){
            	endMin=0.00;
            } 
            var startMax = ${maxValue4};
            var endMax = startMax + 2;
          	 $("#chart4").kendoChart({
                   dataSource: {
                       transport: {
                           read: {
                           	 url: "<%=request.getContextPath()%>/json/head/getWorkTypeBarchart/4",
                               dataType: "json"
                           }
                       },
                
                   },
          	        title: {
          	            text: "ระดับคะแนนในภาควิชา ด้านงานบริการวิชาการ   ค่่าเฉลี่ย  ${mean4}  (เกณฑ์ขั้นต่ำ:${minDesc4}   เกณฑ์ขั้นสูง:${maxDesc4})"
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
						max: 1000,
						majorUnit: 100
					}
        	        ,valueAxis:  {
        	            plotBands: [
        	                        { from: start, to: end, color: "orange" },
        	                        { from: startMax, to: endMax, color: "green" },
        	                        { from: startMin, to: endMin, color: "red" }
        	                    ]
        	                }
        	        ,
                    tooltip: {
                        visible: true,
                        template: "#= series.name #: #= value #"
                    }
          	    });
          	
              
          }
        
        function createChart5() {
        	var start = ${mean5};
            var end = start+2;
            if(start==0.00){
            	end=0.00;
            } 
             
            var startMin = ${minValue5};
            var endMin = startMin + 2;
            if(startMin==0.00){
            	endMin=0.00;
            } 
            

            var startMax = ${maxValue5};
            var endMax = startMax + 2;
          	 $("#chart5").kendoChart({
                   dataSource: {
                       transport: {
                           read: {
                           	 url: "<%=request.getContextPath()%>/json/head/getWorkTypeBarchart/5",
                               dataType: "json"
                           }
                       },
            
                   },
          	        title: {
          	            text: "ระดับคะแนนในภาควิชา ด้านงานทำนุบำรุงศิลป   ค่่าเฉลี่ย  ${mean5}  (เกณฑ์ขั้นต่ำ:${minDesc5}   เกณฑ์ขั้นสูง:${maxDesc5})"
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
	          	    	max: 1000,
	          	    	majorUnit: 100
          	    	}
        	        ,valueAxis:  {
        	            plotBands: [
        	                        { from: start, to: end, color: "orange" },
        	                        { from: startMax, to: endMax, color: "green" },
        	                        { from: startMin, to: endMin, color: "red" }
        	                    ]
        	                }
        	        ,
                    tooltip: {
                        visible: true,
                        template: "#= series.name #: #= value #"
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