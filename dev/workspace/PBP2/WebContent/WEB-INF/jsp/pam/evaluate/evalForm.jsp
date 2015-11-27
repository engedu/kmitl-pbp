<%@page import="com.buckwa.util.BuckWaDateUtils"%>
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

<script type="text/javascript">
	EVL001A = {}
	EVL001A.sum_defaultScore = 0;
	EVL001A.sum_firstLevelScore = 0;
	EVL001A.sum_secoundLevelScore = 0 ;
	EVL001A.sum_weight = 0 ;
	EVL001A.sum_weightScore = 0 ;
	EVL001A.run_lv_01 = 0;
	EVL001A.run_lv_02 = 0;
	EVL001A.run_lv_03 = 0;
</script>
	
<link href="/PAM/css/evaluate.css" rel="stylesheet" type="text/css" />

<form:form modelAttribute="evaluate" action="search.htm" method="POST"	name="mainForm">

	<div class="post">
	
<!-- 		<table class="title"><thead align="center">แบบประเมินผลการปฏิบัติราชการ</thead> -->
<!-- 		</table> -->
	
		<div class="entry" >
		
			<div style="clear: both;">&nbsp;</br></div>
			
			<div class="text" style="font-size: 1.3em; width: 100%; " align="center"><b><u>แบบประเมินผลการปฏิบัติราชการ</u></b></div>
			
			<div style="clear: both;">&nbsp;</div>
			<h2  class="text" style="font-size: 1em;" ><b><u>รอบการประเมิน </b></u>&nbsp;&nbsp;&nbsp;รอบที่  ${evaluateTerm}</h2>
			
			<div style="clear: both;">&nbsp;</div>
<!-- 			<br/> -->
			<h2  class="text" style="font-size: 1em;" ><b><u>ช่วงเวลาการประเมิน </b></u>&nbsp;&nbsp;&nbsp;${startEvaluateDate}<b>&nbsp;ถึง&nbsp;</b>${endEvaluateDate }</h2>

			<div style="clear: both;">&nbsp;</div>
<!-- 			<br/> -->
			<div class="text" style="font-size: 1em; font-weight: bold;"><u>ผู้เข้ารับการประเมิน</u></div>
			<div style="clear: both;">&nbsp;</div>
			<div width="200px" class="featured"><%@include file="/WEB-INF/jsp/pam/evaluate/includeProfile.jsp"%></div>
			<div style="clear: both;">&nbsp;</div>
			
			<br/>
			<div class="text" style="font-size: 1em;"><b><u>ส่วนที่  1  ประเมินตามข้อตกลงการฏิบัติงาน</u></b></div>
			<div style="clear: both;">&nbsp;</div>
			
			<!-- +++++  TABLE +++++++ -->
			<div  class="outered">
			<!-- <div style="overflow: auto;" class="outered"> -->
				<table class="tableSearchResult" style=" width:1600px;">
					<thead >
						<tr>
							<th class="headerTH" width="120px" rowspan="2">ประเด็นยุทธศาสตร์/เป้าประสงค์</th>
							<th class="headerTH"  width="220px" rowspan="2">ตัวบ่งชี้</th>
							<th class="headerTH" width="80px" rowspan="2">หน่วยวัด</th>
							<th class="headerTH" width="50px" colspan="2"><script type="text/javascript">document.write(parseInt('${yearName}')+543);</script></th>
							<th class="headerTH" width="50px"  rowspan="2">น้ำหนัก (%)</th>
							<th class="headerTH" width="120px" colspan="5" >เกณฑ์การให้คะแนน</th>
							<th class="headerTH" width="50px" rowspan="2">คะแนนที่ได้<br></th>
							<th class="headerTH" width="50px" rowspan="2">คะแนน<br>ตามตัวบ่งชี้</th>
							<th class="headerTH" width="50px" rowspan="2">คะแนน<br>ถ่วงน้ำหนัก</th>
<!-- 							<th class="headerTH" width="50px" rowspan="2">ผลการ<br>ประเมิน</th> -->
						</tr>
						<tr>
							<th class="headerTH" width="40px" >เป้าหมาย</th>
							<th class="headerTH" width="40px" >ผลงาน</th>
							<th class="headerTH" width="30px" >1</th>
							<th class="headerTH" width="30px" >2</th>
							<th class="headerTH" width="30px" >3</th>
							<th class="headerTH" width="30px" >4</th>
							<th class="headerTH" width="30px" >5</th>
						</tr>
					</thead>
					<tbody>
							<tr style="border: none;">
								<!-- +++++++++++ column 1 ประเด็นยุทธศาสตร์เป้าประสงค์  ++++++++++++++-->
								<td>
									<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >
										<b><c:out value="${domain.data.childOrder}"/>&nbsp;
										<script type="text/javascript">   
											var text = '${domain.data.name}';
											if(text.length > 22){
												text = text.substr(0,22)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
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
								
								<!-- +++++++++++ column 2   ตัวชี้วัด  ++++++++++++++-->
								<td>
									<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >
										<b><script type="text/javascript">   
											var text = '${domain.data.name}';
											if(text.length > 46){
												text = text.substr(46)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
											}
											document.write(text);
										</script></b>
										<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">
												<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>&nbsp; : 
													<script type="text/javascript">   
														var text = '${domain2.data.name}';
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
																if(text.length > 36){
																	text = text.substr(0,36)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
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
								
								<!-- +++++++++++ column 3 หน่วยวัด ++++++++++++++-->
								<td align="center">
									<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >&nbsp;
										<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">
											<c:choose>
												<c:when test="${empty domain2.children}">
<%-- 												<c:out value="${domain2.data.mark} ${domain2.data.markTypeDesc}"/> --%>
												<script type="text/javascript">   
													var text = '${domain2.data.mark} ${domain2.data.markTypeDesc}';
													if(text.length > 18){
														text = text.substr(0,18)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
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
															if(text.length > 18){
																text = text.substr(0,18)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
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
																if(text.length > 20){
																	text = text.substr(0,20)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
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
								<!-- +++++++++++ column 4 เป้าหมาย ++++++++++++++-->
								<td align="center">
									<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >&nbsp;
										<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">
											<c:choose>
												<c:when test="${empty domain2.children}">
													<c:choose>
														<c:when test="${empty domain2.data.target}">0</c:when>
														<c:otherwise>
															<script>  
																	document.write(parseInt('${domain2.data.target}'));
		 														</script>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>&nbsp;</c:otherwise>
											</c:choose>
											<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
															<c:choose>
																<c:when test="${empty domain3.data.target}">0</c:when>
																<c:otherwise>
																	<script>  
																	document.write(parseInt('${domain3.data.target}'));
																</script>
																</c:otherwise>
													</c:choose>	
															<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -40px;">
																<c:choose>
																	<c:when test="${empty domain4.data.target}">0</c:when> 
																	<c:otherwise>
																		<script>  
																			document.write(parseInt('${domain4.data.target}'));
																		</script>
																	</c:otherwise>
																</c:choose></ul>
															</c:forEach></ul>
												</c:forEach></ul>
										</c:forEach>
										<div class="line"></div>
										<div style="clear: both;">&nbsp;</div>
									</c:forEach>
								</td>
								
								<!-- +++++++++++ column 5 ผลงาน ++++++++++++++-->
									<td align="center">
										<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >&nbsp;
											<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">
													<c:choose>
														<c:when test="${empty domain2.children}">${domain2.data.defaultScore}
														</c:when>
														<c:otherwise>&nbsp;</c:otherwise>
													</c:choose>
												<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">${domain3.data.defaultScore}
													<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -80px;"></ul>&nbsp;
													</c:forEach></ul>
												</c:forEach></ul>
											</c:forEach>
											<div class="line"></div>
											<div style="clear: both;">&nbsp;</div>
										</c:forEach>
									</td>
								
									<!-- +++++++++++ column 6 น้ำหนัก ++++++++++++++-->
									<td align="center">
										<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >&nbsp;
<%-- 												<div class="level1" >${domain.data.weight}</div> --%>
											<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">
												<div class="level2">${domain2.data.weight}</div>
													<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
															${domain3.data.weight}
															<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -80px;"></ul>0.00
															</c:forEach></ul>
													</c:forEach></ul>
											</c:forEach>
											<div class="line"></div>
											<div style="clear: both;">&nbsp;</div>
										</c:forEach>
									</td>
									
									<!-- +++++++++++ column 7  เกณฑ์การให้คะแนน 1 ++++++++++++++-->
									<td align="center">
										<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >&nbsp;
											<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">
													<c:choose>
														<c:when test="${empty domain2.children}">
															<script>document.write(parseInt('${domain2.data.markLevel.markLevelDetailList[0].mark}'));</script>
														</c:when>
														<c:otherwise>&nbsp;</c:otherwise>
													</c:choose>
												<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
														<script>document.write(parseInt('${domain3.data.markLevel.markLevelDetailList[0].mark}'));</script>
													<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -40px;">
														<script>document.write(parseInt('${domain4.data.markLevel.markLevelDetailList[0].mark}'));</script>
													</c:forEach></ul>
												</c:forEach></ul>
											</c:forEach>
											<div class="line"></div>
											<div style="clear: both;">&nbsp;</div>
										</c:forEach>
									</td>
									
									<!-- +++++++++++ column 8  เกณฑ์การให้คะแนน 2 ++++++++++++++-->
									<td align="center">
										<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >&nbsp;
											<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">
													<c:choose>
														<c:when test="${empty domain2.children}">
															<script>document.write(parseInt('${domain2.data.markLevel.markLevelDetailList[1].mark}'));</script>
														</c:when>
														<c:otherwise>&nbsp;</c:otherwise>
													</c:choose>
												<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
														<script>document.write(parseInt('${domain3.data.markLevel.markLevelDetailList[1].mark}'));</script>
													<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -40px;">
														<script>document.write(parseInt('${domain4.data.markLevel.markLevelDetailList[1].mark}'));</script>
													</c:forEach></ul>
												</c:forEach></ul>
											</c:forEach>
											<div class="line"></div>
											<div style="clear: both;">&nbsp;</div>
										</c:forEach>
									</td>
									
									<!-- +++++++++++ column 9 เกณฑ์การให้คะแนน 3 ++++++++++++++-->
									<td align="center">
										<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >&nbsp;
											<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">
													<c:choose>
														<c:when test="${empty domain2.children}">
															<script>document.write(parseInt('${domain2.data.markLevel.markLevelDetailList[2].mark}'));</script>
														</c:when>
														<c:otherwise>&nbsp;</c:otherwise>
													</c:choose>												<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
														<script>document.write(parseInt('${domain3.data.markLevel.markLevelDetailList[2].mark}'));</script>
													<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -40px;">
														<script>document.write(parseInt('${domain4.data.markLevel.markLevelDetailList[2].mark}'));</script>
													</c:forEach></ul>
												</c:forEach></ul>
											</c:forEach>
											<div class="line"></div>
											<div style="clear: both;">&nbsp;</div>
										</c:forEach>
									</td>
									
									<!-- +++++++++++ column 10  เกณฑ์การให้คะแนน 4 ++++++++++++++-->
									<td align="center">
										<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >&nbsp;
											<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">
												<c:choose>
													<c:when test="${empty domain2.children}">
														<script>document.write(parseInt('${domain2.data.markLevel.markLevelDetailList[3].mark}'));</script>
													</c:when>
													<c:otherwise>&nbsp;</c:otherwise>
												</c:choose>
												<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
														<script>document.write(parseInt('${domain3.data.markLevel.markLevelDetailList[3].mark}'));</script>
													<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -40px;">
														<script>document.write(parseInt('${domain4.data.markLevel.markLevelDetailList[3].mark}'));</script>
													</c:forEach></ul>
												</c:forEach></ul>
											</c:forEach>
											<div class="line"></div>
											<div style="clear: both;">&nbsp;</div>
										</c:forEach>
									</td>
									
									<!-- +++++++++++ column 11 เกณฑ์การให้คะแนน 5 ++++++++++++++-->
									<td align="center">
										<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >&nbsp;
											<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">
												<c:choose>
													<c:when test="${empty domain2.children}">
														<script>document.write(parseInt('${domain2.data.markLevel.markLevelDetailList[4].mark}'));</script>
													</c:when>
													<c:otherwise>&nbsp;</c:otherwise>
												</c:choose>
												<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
														<script>document.write(parseInt('${domain3.data.markLevel.markLevelDetailList[4].mark}'));</script>
													<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -40px;">
														<script>document.write(parseInt('${domain4.data.markLevel.markLevelDetailList[4].mark}'));</script>
													</c:forEach></ul>
												</c:forEach></ul>
											</c:forEach>
											<div class="line"></div>
											<div style="clear: both;">&nbsp;</div>
										</c:forEach>
									</td>
									
									<!-- +++++++++++ column 12 คะแนนที่ได้  ++++++++++++++-->
									<td align="center">
										<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >&nbsp;
											<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">&nbsp;
													<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
														<label id="div_12_${domain.data.childOrder}_${domain2.data.childOrder}_${domain3.data.childOrder}" >xx</label>
														<script> 
															var score_12_1 = 0;
														</script>
														<c:choose>
															<c:when test="${empty domain3.children}">
																<c:forEach items="${domain3.data.markLevel.markLevelDetailList}" var="mark_12_1">
																	<script> 
																		var l_id_12_1 = "div_12_"+'${domain.data.childOrder}'+"_"+'${domain2.data.childOrder}'+"_"+'${domain3.data.childOrder}' ;
																		var marks_1 = '${mark_12_1.mark}';
																		var num_12_1 = '${domain3.data.defaultScore}';
																		if(parseInt(num_12_1)>=parseInt(marks_1)){
																			score_12_1 += 1;
																		}
 																	</script>
																</c:forEach>
																<script> 
// 																	sum_score_12_1 +=score_12_1;
																	$( "#"+l_id_12_1).text(score_12_1);
// 																	run_12_1++;
																</script>
															</c:when>
														</c:choose>
														
													<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -80px;"></ul>&nbsp;
													</c:forEach></ul>
													
												</c:forEach></ul>
											</c:forEach>
											<div class="line"></div>
											<div style="clear: both;">&nbsp;</div>
										</c:forEach>
									</td>
									
									<!-- +++++++++++ column 13คะแนนตามตัวบ่่งชี้  ++++++++++++++-->
									<td align="center">
										<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >&nbsp;
<!-- 												<div class="level1">0.00</div> -->
											<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">&nbsp;
											
												<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
														<script> 
															var score_12_1 = 0;
															var weight = '${domain3.data.weight}';
														</script>
														<c:if test="${empty domain3.children}">
															<c:forEach items="${domain3.data.markLevel.markLevelDetailList}" var="mark_12_1">
																<script> 
																	var l_id_12_1 = "div_12_"+'${domain.data.childOrder}'+"_"+'${domain2.data.childOrder}'+"_"+'${domain3.data.childOrder}' ;
																	var marks_1 = '${mark_12_1.mark}';
																	var num_12_1 = '${domain3.data.defaultScore}';
																	if(parseInt(num_12_1)>=parseInt(marks_1)){
																		score_12_1 += 1;
																	}
																</script>
															</c:forEach>
															<script> 
																var score = (weight/5)*score_12_1 ;
// 																//logger.info((weight/5)*score_12_1);
																document.write(score);															
															</script>
														</c:if>
														
													<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -80px;"></ul>&nbsp;
													</c:forEach></ul>
												</c:forEach></ul>
											</c:forEach>
											<div class="line"></div>
											<div style="clear: both;">&nbsp;</div>
										</c:forEach>
									</td>
									
									<!-- +++++++++++ column 14  คะแนนถ่วงน้ำหนัก  ++++++++++++++-->
									<td align="center">
										<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >&nbsp;
<!-- 												<div class="level1">0.00</div> -->
											<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">
											
												<div class="level2">
													<label id="div_14_${domain.data.childOrder}_${domain2.data.childOrder}" >xx</label>
												</div>
												<script> 
													var l_id_14_1 = "div_14_"+'${domain.data.childOrder}'+"_"+'${domain2.data.childOrder}' ;
													var score_w = 0;
													var weight_w = '${domain2.data.weight}';
													
												</script>
												<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">&nbsp;
														<script> 
															var score_12_1 = 0;
															var weight = '${domain3.data.weight}';
														</script>
														<c:if test="${empty domain3.children}">
															<c:forEach items="${domain3.data.markLevel.markLevelDetailList}" var="mark_12_1">
																<script> 
																	var l_id_12_1 = "div_12_"+'${domain.data.childOrder}'+"_"+'${domain2.data.childOrder}'+"_"+'${domain3.data.childOrder}' ;
																	var marks_1 = '${mark_12_1.mark}';
																	var num_12_1 = '${domain3.data.defaultScore}';
																	if(parseInt(num_12_1)>=parseInt(marks_1)){
																		score_12_1 += 1;
																	}
																</script>
															</c:forEach>
															<script> 
																var score = (weight/5)*score_12_1 ;
// 																//logger.info(weight+" : "+score);
																score_w += score;
// 																document.write(score);															
															</script>
														</c:if>
														
													<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -80px;"></ul>&nbsp;
													</c:forEach></ul>
													
												</c:forEach></ul>
												
												<script> 
// 													var score = (weight/5)*score_12_1 ;
													EVL001A.sum_weightScore += ((score_w*parseInt(weight_w))/100);
													EVL001A.sum_weight += parseInt(weight_w);
// 													//logger.info("#div_14_"+l_id_14_1+" : "+(score_w*weight_w)/100);
													$("#"+l_id_14_1).text(((score_w*parseInt(weight_w))/100).toFixed(2));
// 													score_w += score;
// 													document.write(score);															
												</script>
												
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
							
<!-- 								<tr> -->
<!-- 									<td width="50%"  align="right"> -->
<!-- 										<b class="text" style="font-size: 1.2em;">คะแนนรวมที่ได้ :</b> -->
<!-- 									</td> -->
<!-- 									<td align="right"> -->
<!-- 										<b id="estimate-point" class="text"  style="font-size: 1.2em; color: blue"><script>document.write((EVL001A.sum_defaultScore/EVL001A.run_lv_03).toFixed(4));</script></b> -->
<%-- <%-- 										<b id="estimate-point" class="text"  style="font-size: 1.2em; color: blue">${totalDefaultScore}</b> --%>
<!-- 									</td> -->
<!-- 									<td align="left"> -->
<!-- 										<b class="text" style="font-size: 1.2em;">คะแนน  ต่อ 5  คะแนน</b> -->
<!-- 									</td> -->
<!-- 								</tr>							 -->
							
<!-- 								<tr> -->
<!-- 									<td width="50%"  align="right"> -->
<!-- 										<b class="text" style="font-size: 1.2em;">คะแนนรวมที่ได้ :</b> -->
<!-- 									</td> -->
<!-- 									<td align="right"> -->
<!-- 										<b id="estimate-point" class="text"  style="font-size: 1.2em; color: blue"><script>document.write((EVL001A.sum_defaultScore/EVL001A.run_lv_03*20).toFixed(4));</script></b> -->
<%-- <%-- 										<b id="estimate-point" class="text"  style="font-size: 1.2em; color: blue">${totalDefaultScore}</b> --%>
<!-- 									</td> -->
<!-- 									<td align="left"> -->
<!-- 										<b class="text" style="font-size: 1.2em;">คะแนน  ต่อ 100  คะแนน</b> -->
<!-- 									</td> -->
<!-- 								</tr>							 -->
							
								<tr>
									<td width="50%" align="right">
										<b class="text" style="font-size: 1.2em;">ผลรวม  :</b>
									</td>
									<td align="right">
<%-- 										<b id="auto-point" class="text" style="font-size: 1.2em; color: blue">${totalFirstLevelScore}</b> --%>
										<b id="auto-point" class="text" style="font-size: 1.2em; color: blue"><script>document.write(EVL001A.sum_weightScore.toFixed(2));</script></b>
									</td>
									<td align="left">
										<b class="text" style="font-size: 1.2em;">คะแนน</b>
									</td>
								</tr>
								
<!-- 								<tr> -->
<!-- 									<td width="50%" align="right"> -->
<!-- 										<b class="text" style="font-size: 1.2em;">รวมคะแนนระดับ 2 :</b> -->
<!-- 									</td> -->
<!-- 									<td align="right"> -->
<%-- 										<b id="auto-point" class="text" style="font-size: 1.2em; color: blue">${totalSecondLevelScore}</b> --%>
<!-- 									</td> -->
<!-- 									<td align="left"> -->
<!-- 										<b class="text" style="font-size: 1.2em;">คะแนน</b> -->
<!-- 									</td> -->
<!-- 								</tr> -->
								
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
<%-- 							<c:if test="${evaluateStatus == 'S'}">	 --%>
<!-- 								<input class="btn btn-primary" id="print-evaluate" value="พิมพ์ผลการประเมิน" type="button"/> -->
<%-- 							</c:if> --%>
							
							<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="EVL001A.backToMain();"/>
<%-- 							<c:if test="${evaluateStatus == 'W'}">	 --%>
<!-- 								<input class="btn btn-primary" id="end-estimate" value="สิ้นสุดการประเมิน" type="button"/> -->
<%-- 							</c:if> --%>
<%-- 							${evaluateTerm} >> 	${evaluateStatus}						 --%>
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
	$("#end-estimate").click(function() {
		document.location.href= "<%=request.getContextPath()%>/pam/evaluate/endEvaluateSession.htm?personId=${personId}&evaluateTerm=${evaluateTerm}";
	});
	
// 	$("#print-evaluate").click(function() {
// 		alert("Print TEST !!!!");
<%-- 		document.location.href="<%=request.getContextPath()%>/pam/evaluate/initEvaluateForm.htm?personId=${personId}&groupId=${groupId}&evaluateTerm=${evaluateTerm}"; --%>
// 	});
	
// 	var id = "";
// 	var evaluateKpiId = "";
	
// 	function openDialog(text, evalId, item){
// 		id = $(item).attr("id");
// 		evaluateKpiId = evalId;
// 		var point = $("#"+id).text();
// 		$( "#evaluate-name" ).text(text);
// 		$( "#evaluate-point" ).focus().val(point);
// 		$( "#dialog-form" ).dialog( "open" );
		
// 	}
	
// 	function estimate(){
<%-- 		document.location.href= "<%=request.getContextPath()%>/pam/evaluate/updateKpiEvaluate.htm?personId=${personId}&groupId=${groupId}&evaluateTerm=${evaluateTerm}";  --%>
// 	}
EVL001A.backToView = function(){
	document.location.href="<%=request.getContextPath()%>/pam/evaluate/initEvaluateForm.htm?personId=${personId}&groupId=${groupId}&evaluateTerm=${evaluateTerm}";
}
	
EVL001A.backToMain = function(){
	document.location.href="<%=request.getContextPath()%>/pam/evaluate/init.htm";
}
	
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

// 					bValid = bValid && checkLength( point, "", 0, 1000 );
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