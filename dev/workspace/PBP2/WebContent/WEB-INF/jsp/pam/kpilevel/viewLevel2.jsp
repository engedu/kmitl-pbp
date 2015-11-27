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
		<h2 class="title">กำหนดเกณฑ์การให้คะแนนตัวชี้วัดรายปี</h2>
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
				<th width="30%"  align="left" colspan="2"> ตัวชี้วัด   </th>
				<th width="60%"   align="left"> ระดับการให้คะแนน     
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
				 1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		 		2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		 		3 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		 		4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		 		5 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;	
				</th>
  			</tr>
		</thead>
		<tbody>  
		<c:forEach items="${kpiTree.rootElement.children}" var="domain"  varStatus="status">
		<tr >
		     <td width="5%">
		     	<span class="kpiLevel1"><c:out value="${domain.data.childOrder}"/> </span>
		     </td>
		    <td width="5%">
				 
				 <span class="kpiLevel1"> <c:out value="${domain.data.name}"/> &nbsp;
				 </span> 	 
			  	
						  		  
				</td>
			    <td width="80%" colspan="2">
					<table>
					<c:forEach items="${domain.children}" var="domain2">
						<tr>
						   <td> 
						 <c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>&nbsp; : <c:out value="${domain2.data.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
	 					 
							</td>	 
					      <td>
					      
					      <table>
					      <tr>
					      <c:forEach items="${domain2.data.markLevel.markLevelDetailList}" var="kpiLevel" varStatus="count">
					      <td>
					       <u id="domain_${domain.data.childOrder}_${domain2.data.childOrder}" style="font-weight: bold; color: red;" onclick="openDialog('${count.index}','${domain2.data.name}' ,'${kpiLevel.markLevelDetailId}' ,this,'${domain2.data.categoryId}','${kpi.yearId}', ${kpiLevel.mark});" 
									 onmouseover="this.style.cursor='pointer'" >
					      ${kpiLevel.mark}
					      </u>
					      </td>
					      </c:forEach> 
					      
					      </tr>
					      
					      </table> 
					      </td>
					      
					      <td>
 
									<c:forEach items="${domain2.children}" var="domain3"> 
										<li>
											<span class="li-line">
												<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>.<c:out value="${domain3.data.childOrder}"/>&nbsp; : <c:out value="${domain3.data.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
												<c:out value="${domain3.data.mark}"/>&nbsp;&nbsp;&nbsp;&nbsp; 	
												<c:out value="${domain3.data.markTypeDesc}"/>&nbsp;&nbsp;&nbsp;&nbsp; 
								 
								<c:if test="${ domain3.data.isLeave == 'Y'}">
 
					      <table>
					      <tr>
					      <c:forEach items="${domain3.data.markLevel.markLevelDetailList}" var="kpiLevel3" varStatus="count1">
					      <td>
					       <u id="domain_${domain.data.childOrder}_${domain3.data.childOrder}" style="font-weight: bold; color: red;" onclick="openDialog('${count1.index}','${domain3.data.name}' ,'${kpiLevel3.markLevelDetailId}' ,this,'${domain3.data.categoryId}','${kpi.yearId}', ${kpiLevel3.mark});" 
									 onmouseover="this.style.cursor='pointer'" >
					       ${kpiLevel3.mark}
					      </u>
					      </td>
					      </c:forEach> 					      
					      </tr>					      
					      </table>  
									</c:if>
											</span>											
									 
										</li>
									</c:forEach> 
					      </td> 
					 </tr>
					  </c:forEach>
					 </table>
				</td> 
		</tr>
		</c:forEach>   
	</tr> 
	</tbody>
	</table>	 
</div>		
</form:form>
<%@include file="/WEB-INF/jsp/pam/kpilevel/ajustWeightDialog.jsp" %>
<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/marklevel/init.htm";
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
	var level ="";
	var oldMark ="";
	function openDialog(countIndex,text, evalId, item,evalGroupId,evalYearId,mark){
		 
		var countx =  parseInt(countIndex)+1;
		 
		id = $(item).attr("id");
		evaluateKpiId = evalId;
		groupId=evalGroupId;
		yearId=evalYearId;
		level=countx;
		oldMark = mark;
		
		//alert(" evalId:"+evalYearId+" :"+evalYearId+"mark:"+mark);
		//var point = $("#"+id).text().trim();
		var point = oldMark;
	 
		$( "#evaluate-name" ).text(text+'  ระดับ  '+countx);
		$( "#evaluate-point" ).focus().val(Number(point));
		$( "#dialog-form-lavel" ).dialog( "open" );
		
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
			//	updateTips("คะแนนต้องอยู่ในช่วง"+min+"-"+max+" เท่านั้น");
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
		
		$( "#dialog-form-lavel" ).dialog({
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
						$("#dialog-form-lavel").dialog( "close" );
						document.location.href="<%=request.getContextPath()%>/admin/marklevel/updateMarkLevel.htm?yearId="+yearId+"&groupId="+groupId+"&levelId="+evaluateKpiId+"&mark="+Number(val)+"&level="+level;
						
					}
				},
				"ยกเลิก": function() {
					$( "#dialog-form-lavel" ).dialog( "close" );
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
 