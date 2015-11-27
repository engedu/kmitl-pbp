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

<form:form modelAttribute="evaluate" action="search.htm" method="POST"	name="mainForm">

		<div class="post">
	
<!-- 		<table class="title"><thead align="center">แบบประเมินผลการปฏิบัติราชการ</thead> -->
<!-- 		</table> -->
	
		<div class="entry" >
		
			<div style="clear: both;">&nbsp;</br></div>
			
			<div class="text" style="font-size: 1.3em; width: 100%; " align="center"><b><u>แบบประเมินผลการปฏิบัติราชการ</u></b></div>
			
			<div style="clear: both;">&nbsp;</div>
			<h2  class="text" style="font-size: 1em;" ><b><u>รอบการประเมิน </b></u>&nbsp;&nbsp;&nbsp;ประเมินครั้งที่  ${evaluateTerm}</h2>
			
			<div style="clear: both;">&nbsp;</div>
<!-- 			<br/> -->
			<h2  class="text" style="font-size: 1em;" ><b><u>ช่วงเวลาการประเมิน </b></u>&nbsp;&nbsp;&nbsp;${startEvaluateDate}<b>&nbsp;ถึง&nbsp;</b>${endEvaluateDate }</h2>

			<div style="clear: both;">&nbsp;</div>
<!-- 			<br/> -->
			<div class="text" style="font-size: 1em; font-weight: bold;"><u>ผู้เข้ารับการประเมิน</u></div>
			<div style="clear: both;">&nbsp;</div>
			<div width="200px" style="background-color:#eef5fb;" ><%@include file="/WEB-INF/jsp/pam/evaluate/includeProfile.jsp"%></div>
			<div style="clear: both;">&nbsp;</div>
			
			<br/>
			<div class="text" style="font-size: 1em;"><b><u>ส่วนที่  1  ประเมินตามข้อตกลงการฏิบัติงาน</u></b></div>
<!-- 			<div style="clear: both;">&nbsp;</div> -->
			
			<!-- +++++  TABLE +++++++ -->
<%-- 			${groupId} --%>
			<br/>
<%-- 			${kpiEstimateScoreList} --%>
			<div>
				<table class="tableSearchResult" style="border: none;">
					<thead >
						<tr>
							<th class="headerTH" width="200px">ภาระงาน</th>
							<th class="headerTH"  >ประเภทงาน</th>
							<th class="headerTH" width="120px">เกณฑ์คะแนน<br>ของภาระงาน</th>
							<th class="headerTH" width="60px">คะแนนที่ได้<br></th>
							<th class="headerTH" width="60px">คะแนน<br>ประเภทงาน</th>
							<th class="headerTH" width="60px">คะแนน<br>ของภาระงาน</th>
						</tr>
					</thead>
					<tbody>
					
<%-- 					<img src="<c:url value="/images/more1.png"/>" /> --%>
					
					
							<tr style="border: none;">
								<!-- +++++++++++ column 1 ++++++++++++++-->
								<td>
									<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >
										<b><c:out value="${domain.data.childOrder}"/>.&nbsp;
										<script type="text/javascript">   
											var text = '${domain.data.name} (${domain.data.weight}%)';
											if(text.length > 25){
												text = text.substr(0,25)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
											}
											document.write(text);
										</script>
										</b>
										<c:forEach items="${domain.children}" var="domain2"><ul>&nbsp;
											<c:forEach items="${domain2.children}" var="domain3"><ul>&nbsp;
													<c:forEach items="${domain3.children}" var="domain4"><ul>&nbsp;</ul>
													</c:forEach></ul>
											</c:forEach></ul>
										</c:forEach>
										<div class="line"></div>
										<div style="clear: both;">&nbsp;</div>
									</c:forEach>
								</td>
								
								<!-- +++++++++++ column 2 ++++++++++++++-->
								<td>
									<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >
										<b><script type="text/javascript">   
											var text = '${domain.data.name} (${domain.data.weight}%)';
											if(text.length > 45){
												text = text.substr(0,45)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
											}
											document.write(text);
										</script></b>
										<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">
												<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>&nbsp; : 
													<script type="text/javascript">   
														var text = '${domain2.data.name} (${domain2.data.weight}%)';
														if(text.length > 40){
															text = text.substr(0,40)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
														}
														document.write(text);
													</script>
												<c:forEach items="${domain2.children}" var="domain3"><ul>
															<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>.<c:out value="${domain3.data.childOrder}"/>&nbsp; : 
<%-- 															<c:out value="${domain3.data.name}"/> --%>
															<script type="text/javascript">   
																var text = '${domain3.data.name}';
																if(text.length > 35){
																	text = text.substr(0,35)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
																}
																document.write(text);
															</script>
															<c:forEach items="${domain3.children}" var="domain4"><ul>
																- <c:out value="${domain4.data.name}"/>
																</ul>
															</c:forEach></ul> 
												</c:forEach></ul>
										</c:forEach>
										<div class="line"></div>
										<div style="clear: both;">&nbsp;</div>
									</c:forEach>
								</td>
								
								<!-- +++++++++++ column 3 ++++++++++++++-->
								<td >
									<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >&nbsp;
										<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">
											<c:choose>
												<c:when test="${empty domain2.children}">
<%-- 												<c:out value="${domain2.data.mark} ${domain2.data.markTypeDesc}"/> --%>
												<script type="text/javascript">   
													var text = '${domain2.data.mark} ${domain2.data.markTypeDesc}';
													if(text.length > 15){
														text = text.substr(0,15)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
													}
													document.write(text);
												</script>
												</c:when>
												<c:otherwise>&nbsp;</c:otherwise>
											</c:choose>
											<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
													<c:choose>
														<c:when test="${empty domain3.children}">
<%-- 														<c:out value="${domain3.data.mark} ${domain3.data.markTypeDesc}"/> --%>
														<script type="text/javascript">   
															var text = '${domain3.data.mark} ${domain3.data.markTypeDesc}';
															if(text.length > 15){
																text = text.substr(0,15)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
															}
															document.write(text);
														</script>
														</c:when>
														<c:otherwise>&nbsp;</c:otherwise>
													</c:choose>	
													<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -80px;"></ul>
														<c:choose>
															<c:when test="${empty domain4.children}">
<%-- 															<c:out value="${domain4.data.mark} ${domain4.data.markTypeDesc}"/> --%>
															<script type="text/javascript">   
																var text = '${domain4.data.mark} ${domain4.data.markTypeDesc}';
																if(text.length > 15){
																	text = text.substr(0,15)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
																}
																document.write(text);
															</script>
															</c:when>
															<c:otherwise>&nbsp;</c:otherwise>
														</c:choose>
													</c:forEach></ul>
											</c:forEach></ul>
										</c:forEach>
										<div class="line"></div>
										<div style="clear: both;">&nbsp;</div>
									</c:forEach>
								</td>
								<% 
									int sum_auto = 0 ;
									int sum_estimate = 0 ;
								%>
								<!-- +++++++++++ column 4 ++++++++++++++-->
								<td align="center">
									<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >&nbsp;
										<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">
											<c:choose>
<%-- 												<c:when test="${empty domain2.children}">30<% sum_auto += 30 ;%></c:when> --%>
												<c:when test="${empty domain2.children}">${domain2.data.defaultScore}</c:when>
												<c:otherwise>&nbsp;</c:otherwise>
											</c:choose>
											<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
													<c:choose>
<%-- 														<c:when test="${empty domain3.children}">30<% sum_auto += 30 ;%></c:when> --%>
														<c:when test="${empty domain3.children}">${domain3.data.defaultScore}</c:when>
														<c:otherwise>&nbsp;</c:otherwise>
													</c:choose>	
													<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -80px;"></ul>
														<c:choose>
<%-- 															<c:when test="${empty domain4.children}">30<% sum_auto += 30 ;%></c:when> --%>
															<c:when test="${empty domain4.children}">${domain4.data.defaultScore}</c:when>
															<c:otherwise>&nbsp;</c:otherwise>
														</c:choose>
													</c:forEach></ul>
											</c:forEach></ul>
										</c:forEach>
										<div class="line"></div>
										<div style="clear: both;">&nbsp;</div>
									</c:forEach>
								</td>
								
								<!-- +++++++++++ column 5 ++++++++++++++-->
<%-- 								<c:if test="${pageAction == 'V'}"> --%>
									<td align="center">
										<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >&nbsp;
											<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">${domain2.data.secondLevelScore}
<%-- 												<c:choose> --%>
	<%-- 												<c:when test="${empty domain2.children}">30<% sum_auto += 30 ;%></c:when> --%>
<%-- 													<c:when test="${empty domain2.children}">${domain2.data.defaultScore}</c:when> --%>
<%-- 													<c:otherwise>&nbsp;B</c:otherwise> --%>
<%-- 												</c:choose> --%>
												<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">&nbsp;
<%-- 														<c:choose> --%>
	<%-- 														<c:when test="${empty domain3.children}">30<% sum_auto += 30 ;%></c:when> --%>
<%-- 															<c:when test="${empty domain3.children}">${domain3.data.defaultScore}</c:when> --%>
<%-- 															<c:otherwise>&nbsp;</c:otherwise> --%>
<%-- 														</c:choose>	 --%>
														<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -80px;"></ul>&nbsp;
<%-- 															<c:choose> --%>
<%-- 	<%-- 															<c:when test="${empty domain4.children}">30<% sum_auto += 30 ;%></c:when> --%> 
<%-- 																<c:when test="${empty domain4.children}">${domain4.data.defaultScore}</c:when> --%>
<%-- 																<c:otherwise>&nbsp;</c:otherwise> --%>
<%-- 															</c:choose> --%>
														</c:forEach></ul>
												</c:forEach></ul>
											</c:forEach>
											<div class="line"></div>
											<div style="clear: both;">&nbsp;</div>
										</c:forEach>
									</td>
<%-- 								</c:if> --%>
								
<%-- 								<c:if test="${pageAction == 'E'}"> --%>
<!-- 									<td align="center"> -->
<%-- 										<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >&nbsp; --%>
<%-- 											<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;"> --%>
<%-- 												<c:choose> --%>
<%-- 													<c:when test="${empty domain2.children}"> --%>
<%-- 														<u id="domain_${domain.data.childOrder}_${domain2.data.childOrder}" style="font-weight: bold; color: red;" onclick="openDialog('${domain2.data.name}' ,'${domain2.data.evaluateKpiId}' ,this);"  --%>
<%-- 														onmouseover="this.style.cursor='pointer'" >${domain2.data.estimateScore}</u> --%>
<%-- 													</c:when> --%>
<%-- 													<c:otherwise>&nbsp;</c:otherwise> --%>
<%-- 												</c:choose> --%>
<%-- 												<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;"> --%>
<%-- 														<c:choose> --%>
<%-- 															<c:when test="${empty domain3.children}"> --%>
<%-- 																<u id="domain_${domain.data.childOrder}_${domain2.data.childOrder}_${domain3.data.childOrder}" style="font-weight: bold; color: red;" onclick="openDialog('${domain3.data.name}' ,'${domain3.data.evaluateKpiId}' ,this);"  --%>
<%-- 																onmouseover="this.style.cursor='pointer'" >${domain3.data.estimateScore}</u> --%>
<%-- 															</c:when> --%>
<%-- 															<c:otherwise>&nbsp;</c:otherwise> --%>
<%-- 														</c:choose>	 --%>
<%-- 														<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -80px;"></ul> --%>
<%-- 															<c:choose> --%>
<%-- 																<c:when test="${empty domain4.children}"> --%>
<%-- 																	<u id="domain_${domain.data.childOrder}_${domain2.data.childOrder}_${domain3.data.childOrder}_${domain4.data.childOrder}" style="font-weight: bold; color: red;" onclick="openDialog('${domain4.data.name}' ,'${domain4.data.evaluateKpiId}',this );"  --%>
<%-- 																	onmouseover="this.style.cursor='pointer'">${domain4.data.estimateScore}</u> --%>
<%-- 																</c:when> --%>
<%-- 																<c:otherwise>&nbsp;</c:otherwise> --%>
<%-- 															</c:choose> --%>
<%-- 														</c:forEach></ul> --%>
<%-- 												</c:forEach></ul> --%>
<%-- 											</c:forEach> --%>
<!-- 											<div class="line"></div> -->
<!-- 											<div style="clear: both;">&nbsp;</div> -->
<%-- 										</c:forEach> --%>
<!-- 									</td> -->
<%-- 								</c:if> --%>
								
									<!-- +++++++++++ column 6 ++++++++++++++-->
									<td align="center">
										<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >${domain.data.firstLevelScore}
											<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">&nbsp;
<%-- 												<c:choose> --%>
	<%-- 												<c:when test="${empty domain2.children}">30<% sum_auto += 30 ;%></c:when> --%>
<%-- 													<c:when test="${empty domain2.children}">${domain2.data.defaultScore}</c:when> --%>
<%-- 													<c:otherwise>&nbsp;B</c:otherwise> --%>
<%-- 												</c:choose> --%>
												<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">&nbsp;
<%-- 														<c:choose> --%>
	<%-- 														<c:when test="${empty domain3.children}">30<% sum_auto += 30 ;%></c:when> --%>
<%-- 															<c:when test="${empty domain3.children}">${domain3.data.defaultScore}</c:when> --%>
<%-- 															<c:otherwise>&nbsp;</c:otherwise> --%>
<%-- 														</c:choose>	 --%>
														<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -80px;"></ul>&nbsp;
<%-- 															<c:choose> --%>
<%-- 	<%-- 															<c:when test="${empty domain4.children}">30<% sum_auto += 30 ;%></c:when> --%> 
<%-- 																<c:when test="${empty domain4.children}">${domain4.data.defaultScore}</c:when> --%>
<%-- 																<c:otherwise>&nbsp;</c:otherwise> --%>
<%-- 															</c:choose> --%>
														</c:forEach></ul>
												</c:forEach></ul>
											</c:forEach>
											<div class="line"></div>
											<div style="clear: both;">&nbsp;</div>
										</c:forEach>
									</td>
								
							</tr>
						</tbody>
					</table>
						
				</div>		
				
				<table>
					<tr>
						<td width="80%">&nbsp;</td>
						<td >
							<table>
							
								<tr>
									<td width="50%"  align="right">
										<b class="text" style="font-size: 1.2em;">คะแนนรวมที่ได้ :</b>
									</td>
									<td align="right">
										<b id="estimate-point" class="text"  style="font-size: 1.2em; color: blue">${totalDefaultScore}</b>
									</td>
									<td align="left">
										<b class="text" style="font-size: 1.2em;">คะแนน</b>
									</td>
								</tr>							
							
								<tr>
									<td width="50%" align="right">
										<b class="text" style="font-size: 1.2em;">คะแนนรวมตามน้ำหนักของภาระงาน  :</b>
									</td>
									<td align="right">
										<b id="auto-point" class="text" style="font-size: 1.2em; color: blue">${totalFirstLevelScore}</b>
									</td>
									<td align="left">
										<b class="text" style="font-size: 1.2em;">คะแนน</b>
									</td>
								</tr>
								
								<!-- 
								<tr>
									<td width="50%" align="right">
										<b class="text" style="font-size: 1.2em;">รวมคะแนนระดับ 2 :</b>
									</td>
									<td align="right">
										<b id="auto-point" class="text" style="font-size: 1.2em; color: blue">${totalSecondLevelScore}</b>
									</td>
									<td align="left">
										<b class="text" style="font-size: 1.2em;">คะแนน</b>
									</td>
								</tr>
								
								-->
<!-- 								<tr> -->
<!-- 									<td width="50%"  align="right"> -->
<!-- 										<b class="text" style="font-size: 1.2em;">รวมคะแนนที่ประเมิน :</b> -->
<!-- 									</td> -->
<!-- 									<td align="right"> -->
<%-- 										<b id="estimate-point" class="text"  style="font-size: 1.2em; color: blue">${totalEstimateScore}</b> --%>
<!-- 									</td> -->
<!-- 									<td align="left"> -->
<!-- 										<b class="text" style="font-size: 1.2em;">คะแนน</b> -->
<!-- 									</td> -->
<!-- 								</tr> -->

							</table>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2">
<%-- 							<c:if test="${pageAction == 'V'}"> --%>
<%-- 									<% if(request.getSession().getAttribute("evaluateAllowed").equals(BuckWaConstants.EVALUATE_ALLOWED)){ %> --%>
<%-- 										<c:if test="${evaluateStatus == 'W'}">  --%>
<!-- 											<input class="btn btn-primary" value="ทำการประเมิน" type="button" onclick="estimate();"/> -->
<%-- 										</c:if>  --%>
<%-- 										<c:if test="${evaluateStatus == 'P'}"> --%>
<!-- 											<input class="btn btn-primary" value="แก้ไขการประเมิน" type="button" onclick="estimate();"/> -->
<%-- 										</c:if> 	 --%>
<%-- 									<% } %> --%>
<%-- 							</c:if> 	 --%>
<%-- 							<c:if test="${pageAction == 'E'}">	 --%>
<!-- 								<input class="btn btn-primary" id="end-estimate" value="สิ้นสุดการประเมิน" type="button"/> -->
<%-- 							</c:if> --%>
<%-- 							<c:if test="${evaluateStatus == 'S'}">	 --%>
								<input class="btn btn-primary" id="print-evaluate" value="พิมพ์ผลการประเมิน" type="button" rel='notLoading'/>
<%-- 							</c:if> --%>
							
							<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="backToMain();"/>
						</td>
					</tr>
				</table>
		</div>
	</div>
	
</form:form>

<%-- <%@include file="/WEB-INF/jsp/pam/evaluate/evaluateDialog.jsp" %> --%>

<script type="text/javascript">

// 	$("#end-estimate").easyconfirm({
// 		locale: { 
// 			title: 'สิ้นสุดการประเมิน ?',
// 			button: ['ยกเลิก','ตกลง'],
// 			text: 'คุณต้องการที่จะสิ้นสุดการประเมิน ใช่หรือไม่ ? '
// 		}
// 	});
// 	$("#end-estimate").click(function() {
<%-- 		document.location.href= "<%=request.getContextPath()%>/pam/evaluate/endEvaluateSession.htm?personId=${personId}"; --%>
// 	});
	
	$("#print-evaluate").click(function() {
// 		alert("Print TEST !!!!");
<%-- 		document.location.href="<%=request.getContextPath()%>/pam/evaluate/initEvaluateForm.htm?personId=${personId}&groupId=${groupId}&evaluateTerm=${evaluateTerm}"; --%>
		var form = document.forms['mainForm'];
		form.action = "<%=request.getContextPath()%>/pam/report/kpisummaryperson/exportToExcel.htm";
		form.method = 'POST';
		
		var inputPersonId = document.createElement('input');
		inputPersonId.type = 'hidden';
		inputPersonId.name = 'personId';
		inputPersonId.value = ${personId};
		form.appendChild(inputPersonId);
		
		var inputGroupId = document.createElement('input');
		inputGroupId.type = 'hidden';
		inputGroupId.name = 'groupId';
		inputGroupId.value = ${groupId};
		form.appendChild(inputGroupId);
		
		form.submit();
		
	});
	
	var id = "";
	var evaluateKpiId = "";
	
	function openDialog(text, evalId, item){
		id = $(item).attr("id");
		evaluateKpiId = evalId;
		var point = $("#"+id).text();
		$( "#evaluate-name" ).text(text);
		$( "#evaluate-point" ).focus().val(point);
		$( "#dialog-form" ).dialog( "open" );
		
	}
	
// 	function estimate(){
<%-- 		document.location.href= "<%=request.getContextPath()%>/pam/evaluate/updateKpiEvaluate.htm?personId=${personId}&groupId=${groupId}&evaluateTerm=${evaluateTerm}";  --%>
// 	}
// 	function backToView(){
<%-- 		document.location.href="<%=request.getContextPath()%>/pam/evaluate/initEvaluateForm.htm?personId=${personId}&groupId=${groupId}&evaluateTerm=${evaluateTerm}"; --%>
// 	}
	
	function backToMain(){
		document.location.href="<%=request.getContextPath()%>/pam/evaluate/userHistoryEvaluate.htm";
	}

// 	function save(){	
// 		alert('บันทึกการประเมินเรียบร้อยแล้ว');
<%-- 		 	document.location.href= "<%=request.getContextPath()%>/pam/evaluate/initEvaluateForm.htm?personId=${personId}";  --%>
// 	}
	
	
	// For Dialog
	
// 	$(function() {
		
// 		$( "#dialog:ui-dialog" ).dialog( "destroy" );
		
// 		var point = $( "#evaluate-point" ),
// 			allFields = $( [] ).add( point ),
// 			tips = $( "#tooltip-point" );

// 		function updateTips( t ) {
// 			tips.text( t ).addClass( "ui-state-highlight" );
// 			tips.fadeIn();
// 			setTimeout(function() {
// 				tips.fadeOut();
// 			}, 2000 );
// 		}

// 		function checkLength( o, n, min, max ) {
// 			if ( o.val() > max || o.val() < min ) {
// 				o.addClass( "ui-state-error" );
// 				updateTips("คะแนนต้อง อยู่ในช่วง "+min+"-"+max+" คะแนน เท่านั้น");
// 				return false;
// 			} else {
// 				return true;
// 			}
// 		}

// 		function checkRegexp( o, regexp, n ) {
// 			if ( !( regexp.test( o.val() ) ) ) {
// 				o.addClass( "ui-state-error" );
// 				updateTips( n );
// 				return false;
// 			} else {
// 				return true;
// 			}
// 		}
		
// 		$( "#dialog-form" ).dialog({
// 			autoOpen: false,
// 			minHeight: 210,
// // 			width: 300,
// // 			maxheigth : 500,
// 			modal: true,
// 			resizable: false,
// 			buttons: {
// 				"บันทึก": function() {
// 					var bValid = true;
					
// 					allFields.removeClass( "ui-state-error" );

// 					bValid = bValid && checkLength( point, "", 0, 100 );
// 					bValid = bValid && checkRegexp( point, /^([0-9])+$/i, "กรอกได้เฉพาะตัวเลข เท่านั้น!" );

// 					if (bValid) {
						
// // 						alert(point.val()+" > "+id);
// 						var val = point.val();
// // 						$("#"+id).text(Number(val));
// 						$("#dialog-form").dialog( "close" );
<%-- 						document.location.href="<%=request.getContextPath()%>/pam/evaluate/updateKpiEstimateScore.htm?personId=${personId}&evaluateKpiId="+evaluateKpiId+"&estimateScore="+Number(val); --%>
						
// 					}
// 				},
// 				"ยกเลิก": function() {
// 					$( "#dialog-form" ).dialog( "close" );
// 				}
// 			},
// 			close: function() {
// 				allFields.val( "" ).removeClass( "ui-state-error" );
// 			}
// 		});

// 	});
	
	
// 	function sumEstimatePoint(point){
// 		var sum = 0;
// 		sum += point;
// 		$( "#estimate-point" )
// 	}
	
	
	
</script>