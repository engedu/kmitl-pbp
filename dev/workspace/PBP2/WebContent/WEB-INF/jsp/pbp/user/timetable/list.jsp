<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<style type="text/css" media="screen">
	@import url("<c:url value="/kendo/styles/custom.css"/>");  
	@import url("<c:url value="/kendo/styles/kendo.common.min.css"/>");  
	@import url("<c:url value="/kendo/styles/kendo.default.min.css"/>");  
	@import url("<c:url value="/kendo/styles/kendo.dataviz.min.css"/>");	
	@import url("<c:url value="/kendo/styles/kendo.dataviz.default.min.css"/>");
</style>   	

<script type="text/javascript" src='<c:url value="/kendo/js/jquery.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/kendo/js/angular.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/kendo/js/kendo.all.min.js"/>'></script> 
 
 <div style=" width: 100%; padding-left: 0px;">
 <form:form modelAttribute="timetableReport" action="search.htm" method="POST" name="mainForm"> 
 <table class="pbp-table"> 
		<thead><tr><th>
	 <span class="lsf-icon colororange" title="table"></span>ตารางสอนประจำปีการศึกษา  ${academicYearSelect }	 
 </th>
 
 <th width="150px;"  >
 <form:select path="academicYearSelect" onchange="getReportByAcademicYear(this.value);"> 
							<form:options items="${timetableReport.academicYearList}" itemValue="name" itemLabel="name" />
						</form:select> 
 </th>
 
  
 </tr></thead>
		<tr><td colspan="2">      
		
      
 <div id="example">
     <h4 style="color:#FD7A39; font-weight: bold; text-align: center;">ภาคการศึกษา  1</h4>
     <div id="grid"></div>
  
  
     <h4 style="color:#FD7A39; font-weight: bold; text-align: center;">ภาคการศึกษา  2</h4>
     <div id="grid2"></div>
 
 </div>
 
 </td></tr>
		</table>
		
		</form:form>
 </div>
    <br><br>
    
     <script type="text/javascript">
 
	
		function getReportByAcademicYear (In){		
			var form = document.forms['mainForm']; 
		  //alert(In);
			form.action ="<%=request.getContextPath()%>/personTimeTable/init.htm?academicYearSelect="+In;
			//alert(form.action);
			form.method='GET';	
			form.submit();
		}
		
 $(document).ready(function () {
	 
	 
	var _columns = [
            {
                field: "subjectCode",
                title: "รหัสวิชา",
                attributes:{ class:"text-center" } ,
                width: 100
            },
            {
                field: "engName",
                title: "ชื่อวิชา",
                width: 250
            }
            ,  
            {
                field: "lecOrPrac",
                title: "ป/ท",
                attributes:{ class:"text-center" } ,
                width: 80
            }     
            ,  
            {
                field: "teachHr",
                title: "ชั่วโมงสอน",
                attributes:{ class:"text-right" } ,
                width: 80
            } 
            ,  
            {
                field: "credit",
                title: "หน่วยกิต",
                attributes:{ class:"text-right" } ,
                width: 80
            } 
            ,                    
            {
                field: "degreeStr",
                title: "ระดับ",
                attributes:{ class:"text-right" } ,
                width: 100
            } 
            ,                    
            {
                field: "totalStudent",
                title: "จำนวนนักศึกษา",
                attributes:{ class:"text-right" } ,
                width: 100
            } ,                    
            {
                field: "secNo",
                title: "Section",
                attributes:{ class:"text-right" } ,
                width: 100
            } 
            ,                    
            {
                field: "teachDayStr",
                title: "วัน",
                attributes:{ class:"text-left" } ,
                width: 100
            }
            
            ,                    
            {
                field: "remark",
                title: "หมายเหตุ",
                attributes:{ class:"text-left" } ,
                width: 100
            }

        ];
	
	
  
   $("#grid").kendoGrid({
       dataSource: {
           transport: {
               read: {
                   url: "<%=request.getContextPath()%>/json/personTimeTable/getTimeTable?academicYearSelect=${timetableReport.academicYearSelect}&userName=${userName}&semester=1",
                       dataType: "json"
                   }
               },
               pageSize: 100
           },
        title: {
           text: "ระดับคะแนนในภาควิชา"
       },
           selectable: "multiple cell",
           pageable: false,
           sortable: true,
           columns: _columns
   });
   
   $("#grid2").kendoGrid({
       dataSource: {
           transport: {
               read: {
                   url: "<%=request.getContextPath()%>/json/personTimeTable/getTimeTable?academicYearSelect=${timetableReport.academicYearSelect}&userName=${userName}&semester=2",
                       dataType: "json"
                   }
               },
               pageSize: 100
           },
        title: {
           text: "ระดับคะแนนในภาควิชา"
       },
           selectable: "multiple cell",
           pageable: false,
           sortable: true,
           columns: _columns
    });
 });
</script>