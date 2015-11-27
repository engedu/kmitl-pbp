<%@page import="com.buckwa.util.BuckWaConstants"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.buckwa.domain.*"%>
<%@ page import="java.util.*"%>
<form:form modelAttribute="kpi"	action="search.htm" method="POST" name="mainForm"> 	 
<div class="post">
		<h2 class="title">กำหนดน้ำหนักตัวชี้วัดรายปี</h2>
 	<div id="kpi-tree">
			<div class="searchFormNoBorder">
				<table width="100%">
					<tr> 
						<td class="label-form" align="right" >ปีการศึกษา :</td>
						<td align="left" width="30%">
		 					 <c:out value="${kpi.yearId}"/>
						</td>
				 		 <td class="label-form" align="right" >กลุ่ม KPI:</td>		
						<td width="30%">						
	 						<c:out value="${kpiTree.rootElement.data.name}"/> 
							</td>	 					
					<td>
					<input   value="<spring:message code="label.button.back"/>"   type="button" class="btn btn-primary" onclick="init();">	
 				
					</td>			 
					</tr>
				</table>
 </div>
 </div>
	<table class="tableSearchResult" style="border: none;">
		<thead >
			<tr>
			    <th width="5%"  align="left"> No   </th>
				<th width="10%"  align="left"> ตัวชี้วัด   </th>
				<th width="80%"   align="left"> นำหนัก (%) </th>
  			</tr>
		</thead>
		<tbody>  
		<c:forEach items="${kpiTree.rootElement.children}" var="domain"  varStatus="status">
		<tr >
		     <td width="5%">
		     	<span class="kpiLevel1"><c:out value="${domain.data.childOrder}"/> </span>
		     </td>
		    <td width="10%">
				 
				 <span class="kpiLevel1"> <c:out value="${domain.data.name}"/> &nbsp;
				 </span> 	 
			 
						 <u id="domain_${domain.data.childOrder}" style="font-weight: bold; color: red;" onclick="openDialog('${domain.data.name}' ,'${domain.data.kpiId}' ,this,'${domain.data.categoryId}','${kpi.yearId}');" 
									 onmouseover="this.style.cursor='pointer'" >
								 ${domain.data.weight}
						 </u>		
						  % 		  
				</td>
			    <td width="80%">
					<table>
					<c:forEach items="${domain.children}" var="domain2">
						<tr>
						   <td> 
						 <c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>&nbsp; : <c:out value="${domain2.data.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
	 					 
							</td>	 
					      <td>					        
						 <u id="domain_${domain.data.childOrder}_${domain2.data.childOrder}" style="font-weight: bold; color: red;" 
						 onclick="openDialog('${domain2.data.name}' ,'${domain2.data.kpiId}' ,this,'${domain2.data.categoryId}','${kpi.yearId}');"  onmouseover="this.style.cursor='pointer'" >
								 ${domain2 .data.weight}
						 </u>
						  % 
					      </td>					      
					      <td> 
									<c:forEach items="${domain2.children}" var="domain3"> 
										<li>
											<span class="li-line">
												<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>.<c:out value="${domain3.data.childOrder}"/>&nbsp; : <c:out value="${domain3.data.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
												<c:out value="${domain3.data.mark}"/>&nbsp;&nbsp;&nbsp;&nbsp; 	
												<c:out value="${domain3.data.markTypeDesc}"/>&nbsp;&nbsp;&nbsp;&nbsp; 
								 
							  <u id="domain_${domain.data.childOrder}_${domain3.data.childOrder}" style="font-weight: bold; color: red;" onclick="openDialog('${domain3.data.name}' ,'${domain3.data.kpiId}' ,this,'${domain3.data.categoryId}','${kpi.yearId}');" 
									 onmouseover="this.style.cursor='pointer'" >
								 ${domain3 .data.weight}
						 </u>
						  % 
								</span>
								</li>
								</c:forEach> 
					      
					      </td>
					 </tr>
					  </c:forEach>
					 </table>
				</td>
				
				<td>   
					
				 </td>
		</tr>
		</c:forEach> 
	</tr> 
	</tbody>
	</table>	 
</div>		
</form:form>
<%@include file="/WEB-INF/jsp/pam/kpiweight/ajustWeightDialog.jsp" %>
<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/kpiweight/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	function createNewMapping(){ 
		var form = document.forms['mainForm']; 
		var yearId = form['yearId'].value;
		var categoryId = form['categoryId'].value;
		
		form.action ="<%=request.getContextPath()%>/admin/kpiyear/createNewMapping.htm?yearId="+yearId+"&categoryId="+categoryId;
		//alert(form.action);
		form.method='GET';	
		form.submit();	
	}
	

	$("#end-estimate").easyconfirm({
		locale: { 
			title: 'สิ้นสุดการประเมิน ?',
			button: ['ยกเลิก','ตกลง'],
			text: 'คุณต้องการที่จะสิ้นสุดการประเมิน ใช่หรือไม่ ? '
		}
	});
	$("#end-estimate").click(function() {
		document.location.href= "<%=request.getContextPath()%>/pam/evaluate/endEvaluateSession.htm?personId=${personId}";
	});
	
	$("#print-evaluate").click(function() {
		alert("Print TEST !!!!");
		document.location.href="<%=request.getContextPath()%>/pam/evaluate/initEvaluateForm.htm?personId=${personId}&groupId=${groupId}&evaluateTerm=${evaluateTerm}";
	});
	
	var id = "";
	var evaluateKpiId = "";
	var groupId ="";
	var yearId="";
	function openDialog(text, evalId, item,evalGroupId,evalYearId){
		id = $(item).attr("id");
		evaluateKpiId = evalId;
		groupId=evalGroupId;
		yearId=evalYearId;
		var point = $("#"+id).text().trim();
		$( "#evaluate-name" ).text(text);
		$( "#evaluate-point" ).focus().val(Number(point));
		$( "#dialog-form" ).dialog( "open" );
		
	}
	
	function estimate(){
		document.location.href= "<%=request.getContextPath()%>/pam/evaluate/updateKpiEvaluate.htm?personId=${personId}&groupId=${groupId}&evaluateTerm=${evaluateTerm}"; 
	}
	function backToView(){
		document.location.href="<%=request.getContextPath()%>/pam/evaluate/initEvaluateForm.htm?personId=${personId}&groupId=${groupId}&evaluateTerm=${evaluateTerm}";
	}
	
	function backToMain(){
		document.location.href="<%=request.getContextPath()%>/pam/evaluate/init.htm";
	}

// 	function save(){	
// 		alert('บันทึกการประเมินเรียบร้อยแล้ว');
<%-- 		 	document.location.href= "<%=request.getContextPath()%>/pam/evaluate/initEvaluateForm.htm?personId=${personId}";  --%>
// 	}
	
	
	// For Dialog
	
	$(function() {
		
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
		
		var point = $( "#evaluate-point" ),
			allFields = $( [] ).add(point),
			tips = $( "#tooltip-point" );

		function updateTips( t ) {
			tips.text( t ).addClass( "ui-state-highlight" );
			tips.fadeIn();
			setTimeout(function() {
				tips.fadeOut();
			}, 2000 );
		}

		function checkLength( o, n, min, max ) {
			//if ( o.val() > max || o.val() < min ) {
			//	o.addClass( "ui-state-error" );
			//	updateTips("น้ำหนักต้อง อยู่ในช่วง "+min+"-"+max+" เท่านั้น");
			//	return false;
			//} else {
				return true;
			//}
		}

		function checkRegexp( o, regexp, n ) {
			if ( !( regexp.test( o.val() ) ) ) {
				o.addClass( "ui-state-error" );
				updateTips( n );
				return false;
			} else {
				return true;
			}
		}
		
		$( "#dialog-form" ).dialog({
			autoOpen: false,
			minHeight: 210,
// 			width: 300,
// 			maxheigth : 500,
			modal: true,
			resizable: true,
			buttons: {
				"บันทึก": function() {
					var bValid = true;					
					allFields.removeClass( "ui-state-error" );
					bValid = bValid && checkLength( point, "", 0, 100 );
					bValid = bValid && checkRegexp( point, /^([0-9])+$/i, "กรอกได้เฉพาะตัวเลข เท่านั้น!" );
					if (bValid) {
						
// 						alert(point.val()+" > "+id);
						var val = point.val();
// 						$("#"+id).text(Number(val));
						$("#dialog-form").dialog( "close" );
						document.location.href="<%=request.getContextPath()%>/admin/kpiweight/updateWeight.htm?yearId="+yearId+"&groupId="+groupId+"&evaluateKpiId="+evaluateKpiId+"&weight="+Number(val);
						
					}
				},
				"ยกเลิก": function() {
					$( "#dialog-form" ).dialog( "close" );
				}
			},
			close: function() {
				allFields.val( "" ).removeClass( "ui-state-error" );
			}
		});

	});	
	
// 	function sumEstimatePoint(point){
// 		var sum = 0;
// 		sum += point;
// 		$( "#estimate-point" )
// 	}
	
	
</script>
 