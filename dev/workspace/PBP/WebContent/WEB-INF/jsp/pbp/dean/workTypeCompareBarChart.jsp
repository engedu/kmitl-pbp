<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
	<span><img src="<c:url value="/images/chart_example.jpg"/>" /></span>
	<strong>ระดับคะแนนเปรียบเทียบแต่ละด้านในภาควิชา ${facultyName} ประจำปีการศึกษา 2557 
</h1>
<form:form modelAttribute="workTypeCompareReport" action="workTypeCompareBarChart.htm" method="POST" name="mainForm">
<table> 
<tr>
	<td><form:checkbox path="type1" /> ด้านวิชาการ</td>
	<td><form:checkbox path="type2" /> งานพัฒนาวิชาการ</td> 
	<td><form:checkbox path="type3" /> งานวิจัย หรือ สร้างสรรค์</td>
	<td><form:checkbox path="type4" /> งานบริการวิชาการ</td>
	<td><form:checkbox path="type5" /> งานทำนุบำรุงศิลป วัฒนธรรมและสร้างชื่อเสียงให้กับสถาบัน</td>
</tr>
<tr>
	<td colspan="5"><input class="btn btn-primary" value="เปรียบเทียบ" type="submit"></td>
</tr>
</table>
</form:form>
<div id="example">
	<div class="demo-section k-content">
		<div id="columnChart"></div>
	</div>
<script>
var jsonData = ${rptObjJSON};
function createColumnChart() {
	$("#columnChart").kendoChart({
		title: {
			text: "ระดับคะแนนในภาควิชา"
		},
		dataSource: new kendo.data.DataSource({
			data: jsonData,
		 	group: {
		 		field: "groupName"
		 	},
		 	sort: {
		 		field: "orderNo",
		 		dir: "asc"
	 		},
			schema: {
		        model: {
		            fields: {
		        		categoryName: { type: "string" },
		        		groupName: { type: "string" },
		            	score: { type: "string" },
		        		orderNo: { type: "number" }
		            }
		        }
			}
		}),
		series: [{
			type: "column",
			field: "axisValue",
			name: "#= group.value #"
		}],
		legend: {
            position: "top"
        },
		valueAxis: {
			min: 0,
			max: 60,
			majorUnit: 10
		},
		categoryAxis: {
			field: "categoryName",
			labels: {
				rotation : -90
			}
		},
		tooltip: {
			visible: true,
			template: "#= series.name #: #= value #"
		}
	});
}

if (!jQuery.isEmptyObject(jsonData)) {
	$(document).ready(createColumnChart);
	$(document).bind("kendo:skinChange", createColumnChart);
}
</script>
</div>


</body>