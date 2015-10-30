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
	EVL001A.sum_weightScore = 0 ;
	EVL001A.run_lv_01 = 0;
	EVL001A.run_lv_02 = 0;
	EVL001A.run_lv_03 = 0;
</script>
	
<link href="/PAM/css/evaluate.css" rel="stylesheet" type="text/css" />

<form:form modelAttribute="evaluate" action="search.htm" method="POST"	name="mainForm">

	<div class="post">
 	<h2 class="title">กำหนด น้ำหนัก เป้าหมาย เกณฑ์การให้คะแนน </h2>
		<div class="entry" >
		
			<div style="clear: both;">&nbsp;</br></div>
 
			<div class="text" style="font-size: 1.2em; width: 100%; " align="left"><b><u> กลุ่ม    ${kpiTree.rootElement.data.name}  ประจำปี  ${yearName}</u></b></div>
	 
  
			<br/>
			 
			<div style="clear: both;">&nbsp;</div>
			
			<!-- +++++  TABLE +++++++ -->
			<div   class="oute#0fa356">
				<table class="tableSearchResult" style=" width:1160px;">
					<thead >
						<tr>
							<th class="headerTH" width="130px" rowspan="2">ยุทธศาสตร์/เป้าประสงค์</th>
							<th class="headerTH"  width="250px" rowspan="2">ตัวชี้วัด</th>
							<th class="headerTH" width="120px" rowspan="2">หน่วยวัด</th>
							<th class="headerTH" width="50px"  rowspan="2">เป้าหมาย</th>							 
							<th class="headerTH" width="50px"  rowspan="2">น้ำหนัก (%)</th>
							<th class="headerTH" width="270px" colspan="5" >เกณฑ์การให้คะแนน</th>
						</tr>
						<tr>

							<th class="headerTH" width="20px" >1</th>
							<th class="headerTH" width="20px" >2</th>
							<th class="headerTH" width="20px" >3</th>
							<th class="headerTH" width="20px" >4</th>
							<th class="headerTH" width="20px" >5</th>
						</tr>
	 			
						
						
					</thead>
					<tbody>
							<tr style="border: none;">
								<!-- +++++++++++ column 1 ประเด็นยุทธศาสตร์เป้าประสงค์  ++++++++++++++-->
								<td>
									<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >
										 <c:out value="${domain.data.childOrder}"/>&nbsp;
										<script type="text/javascript">   
											var text = '${domain.data.name}';
											if(text.length > 22){
												text = text.substr(0,22)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
											}
											document.write(text);
										</script>
										 
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
										 <script type="text/javascript">   
											var text = '${domain.data.name}';
											if(text.length > 30){
												text = text.substr(30)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
											}
											document.write(text);
										</script> 
										<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">
												<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>&nbsp; : 
													<script type="text/javascript">   
														var text = '${domain2.data.name}';
														if(text.length > 30){
															text = text.substr(0,30)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
														}
														document.write(text);
													</script>
												<c:forEach items="${domain2.children}" var="domain3"><ul>
															<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>.<c:out value="${domain3.data.childOrder}"/>&nbsp; : 
<%-- 															<c:out value="${domain3.data.name}"/> --%>
															<script type="text/javascript">   
																var text = '${domain3.data.name}';
																if(text.length > 30){
																	text = text.substr(0,30)+' <img src="<c:url value="/images/more1.png"/>" title="'+text+'"  style="height: 12px; width: 12px;" />';
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
														<c:when test="${empty domain2.data.target}">
														  <u id="t_${domain.data.childOrder}_${domain2.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogTarget('${domain2.data.name}' ,'${domain2.data.kpiId}' ,this,'${domai2.data.categoryId}','${yearName}');" 
																 onmouseover="this.style.cursor='pointer'" >
															 0
													 		</u>	
														</c:when>
														<c:otherwise>
															 <u id="t_${domain.data.childOrder}_${domain2.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogTarget('${domain2.data.name}' ,'${domain2.data.kpiId}' ,this,'${domai2.data.categoryId}','${yearName}');" 
																 onmouseover="this.style.cursor='pointer'" >
															 ${domain2 .data.target}
													 		</u>	
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>&nbsp;</c:otherwise>
											</c:choose>
											<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
															<c:choose>
																<c:when test="${empty domain3.data.target}">
								<u id="t_${domain.data.childOrder}_${domain2.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogTarget('${domain3.data.name}' ,'${domain3.data.kpiId}' ,this,'${domai3.data.categoryId}','${kpi.yearId}');" 
									 onmouseover="this.style.cursor='pointer'" >
								0
						 		</u>
																</c:when>
																<c:otherwise>
								<u id="t_${domain.data.childOrder}_${domain2.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogTarget('${domain3.data.name}' ,'${domain3.data.kpiId}' ,this,'${domai3.data.categoryId}','${kpi.yearId}');" 
									 onmouseover="this.style.cursor='pointer'" >
								 ${domain3 .data.target}
						 		</u>
																
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
 
								
									<!-- +++++++++++ column 6 น้ำหนัก ++++++++++++++-->
									<td align="center">
									
										<c:forEach items="${evaluateKpiTree.rootElement.children}" var="domain" >
												<div > 
												<u id="domain_${domain.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogWight('${domain.data.name}' ,'${domain.data.kpiId}' ,this,'${domain.data.categoryId}','${kpi.yearId}');" 
															 onmouseover="this.style.cursor='pointer'" >
														 ${domain.data.weight}
												 </u>													 
												</div>
																
											<c:forEach items="${domain.children}" var="domain2"><ul style="margin-left: -40px;">
												<div  >												
												 <u id="domain_${domain.data.childOrder}_${domain2.data.childOrder}" style="font-weight: bold; color: #0fa356;" 
												 onclick="openDialogWight('${domain2.data.name}' ,'${domain2.data.kpiId}' ,this,'${domain2.data.categoryId}','${kpi.yearId}');"  onmouseover="this.style.cursor='pointer'" >
														 ${domain2 .data.weight}
												 </u>												
												</div>
													<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">																
													 <u id="domain_${domain.data.childOrder}_${domain2.data.childOrder}_${domain3.data.childOrder}" style="font-weight: bold; color: #0fa356;" 
													 onclick="openDialogWight('${domain3.data.name}' ,'${domain3.data.kpiId}' ,this,'${domain3.data.categoryId}','${kpi.yearId}');"  onmouseover="this.style.cursor='pointer'" >
															 ${domain3 .data.weight}
													 </u>	 	
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
														
												       <u id="m_0${domain.data.childOrder}_${domain2.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogMarkLevel('0','${domain2.data.name}' ,'${domain2.data.markLevel.markLevelDetailList[0].markLevelDetailId}' ,this,'${domain2.data.categoryId}','${yearName}', ${domain2.data.markLevel.markLevelDetailList[0].mark});" 
																 onmouseover="this.style.cursor='pointer'" >
												    ${domain2.data.markLevel.markLevelDetailList[0].mark}
												      </u>														
															 
														</c:when>
														<c:otherwise>&nbsp;</c:otherwise>
													</c:choose>
												<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
												       <u id="m_0${domain.data.childOrder}_${domain2.data.childOrder}_${domain3.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogMarkLevel('0','${domain3.data.name}' ,'${domain3.data.markLevel.markLevelDetailList[0].markLevelDetailId}' ,this,'${domain3.data.categoryId}','${yearName}', ${domain3.data.markLevel.markLevelDetailList[0].mark});" 
																 onmouseover="this.style.cursor='pointer'" >
												    ${domain3.data.markLevel.markLevelDetailList[0].mark}
												      </u>	
													<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -40px;">
													       <u id="m_0${domain.data.childOrder}_${domain2.data.childOrder}_${domain3.data.childOrder}_${domain4.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogMarkLevel('0','${domain4.data.name}' ,'${domain4.data.markLevel.markLevelDetailList[0].markLevelDetailId}' ,this,'${domain4.data.categoryId}','${yearName}', ${domain4.data.markLevel.markLevelDetailList[0].mark});" 
																 onmouseover="this.style.cursor='pointer'" >
												    ${domain4.data.markLevel.markLevelDetailList[0].mark}
												      </u>	
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
														
												       <u id="m_1${domain.data.childOrder}_${domain2.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogMarkLevel('1','${domain2.data.name}' ,'${domain2.data.markLevel.markLevelDetailList[1].markLevelDetailId}' ,this,'${domain2.data.categoryId}','${yearName}', ${domain2.data.markLevel.markLevelDetailList[1].mark});" 
																 onmouseover="this.style.cursor='pointer'" >
												    ${domain2.data.markLevel.markLevelDetailList[1].mark}
												      </u>														
															 
														</c:when>
														<c:otherwise>&nbsp;</c:otherwise>
													</c:choose>
												<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
												       <u id="m_1${domain.data.childOrder}_${domain2.data.childOrder}_${domain3.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogMarkLevel('1','${domain3.data.name}' ,'${domain3.data.markLevel.markLevelDetailList[1].markLevelDetailId}' ,this,'${domain3.data.categoryId}','${yearName}', ${domain3.data.markLevel.markLevelDetailList[1].mark});" 
																 onmouseover="this.style.cursor='pointer'" >
												    ${domain3.data.markLevel.markLevelDetailList[1].mark}
												      </u>	
													<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -40px;">
													       <u id="m_1${domain.data.childOrder}_${domain2.data.childOrder}_${domain3.data.childOrder}_${domain4.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogMarkLevel('1','${domain4.data.name}' ,'${domain4.data.markLevel.markLevelDetailList[1].markLevelDetailId}' ,this,'${domain4.data.categoryId}','${yearName}', ${domain4.data.markLevel.markLevelDetailList[1].mark});" 
																 onmouseover="this.style.cursor='pointer'" >
												    ${domain4.data.markLevel.markLevelDetailList[1].mark}
												      </u>	
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
														
												       <u id="m_2${domain.data.childOrder}_${domain2.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogMarkLevel('2','${domain2.data.name}' ,'${domain2.data.markLevel.markLevelDetailList[2].markLevelDetailId}' ,this,'${domain2.data.categoryId}','${yearName}', ${domain2.data.markLevel.markLevelDetailList[2].mark});" 
																 onmouseover="this.style.cursor='pointer'" >
												    ${domain2.data.markLevel.markLevelDetailList[2].mark}
												      </u>														
															 
														</c:when>
														<c:otherwise>&nbsp;</c:otherwise>
													</c:choose>
												<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
												       <u id="m_2${domain.data.childOrder}_${domain2.data.childOrder}_${domain3.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogMarkLevel('2','${domain3.data.name}' ,'${domain3.data.markLevel.markLevelDetailList[2].markLevelDetailId}' ,this,'${domain3.data.categoryId}','${yearName}', ${domain3.data.markLevel.markLevelDetailList[2].mark});" 
																 onmouseover="this.style.cursor='pointer'" >
												    ${domain3.data.markLevel.markLevelDetailList[2].mark}
												      </u>	
													<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -40px;">
													       <u id="m_2${domain.data.childOrder}_${domain2.data.childOrder}_${domain3.data.childOrder}_${domain4.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogMarkLevel('2','${domain4.data.name}' ,'${domain4.data.markLevel.markLevelDetailList[2].markLevelDetailId}' ,this,'${domain4.data.categoryId}','${yearName}', ${domain4.data.markLevel.markLevelDetailList[2].mark});" 
																 onmouseover="this.style.cursor='pointer'" >
												    ${domain4.data.markLevel.markLevelDetailList[2].mark}
												      </u>	
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
														
												       <u id="m_3${domain.data.childOrder}_${domain2.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogMarkLevel('3','${domain2.data.name}' ,'${domain2.data.markLevel.markLevelDetailList[3].markLevelDetailId}' ,this,'${domain2.data.categoryId}','${yearName}', ${domain2.data.markLevel.markLevelDetailList[3].mark});" 
																 onmouseover="this.style.cursor='pointer'" >
												    ${domain2.data.markLevel.markLevelDetailList[3].mark}
												      </u>														
															 
														</c:when>
														<c:otherwise>&nbsp;</c:otherwise>
													</c:choose>
												<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
												       <u id="m_3${domain.data.childOrder}_${domain2.data.childOrder}_${domain3.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogMarkLevel('3','${domain3.data.name}' ,'${domain3.data.markLevel.markLevelDetailList[3].markLevelDetailId}' ,this,'${domain3.data.categoryId}','${yearName}', ${domain3.data.markLevel.markLevelDetailList[3].mark});" 
																 onmouseover="this.style.cursor='pointer'" >
												    ${domain3.data.markLevel.markLevelDetailList[3].mark}
												      </u>	
													<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -40px;">
													       <u id="m_3${domain.data.childOrder}_${domain2.data.childOrder}_${domain3.data.childOrder}_${domain4.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogMarkLevel(3','${domain4.data.name}' ,'${domain4.data.markLevel.markLevelDetailList[3].markLevelDetailId}' ,this,'${domain4.data.categoryId}','${yearName}', ${domain4.data.markLevel.markLevelDetailList[3].mark});" 
																 onmouseover="this.style.cursor='pointer'" >
												    ${domain4.data.markLevel.markLevelDetailList[3].mark}
												      </u>	
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
														
												       <u id="m_4${domain.data.childOrder}_${domain2.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogMarkLevel('4','${domain2.data.name}' ,'${domain2.data.markLevel.markLevelDetailList[4].markLevelDetailId}' ,this,'${domain2.data.categoryId}','${yearName}', ${domain2.data.markLevel.markLevelDetailList[4].mark});" 
																 onmouseover="this.style.cursor='pointer'" >
												    ${domain2.data.markLevel.markLevelDetailList[4].mark}
												      </u>														
															 
														</c:when>
														<c:otherwise>&nbsp;</c:otherwise>
													</c:choose>
												<c:forEach items="${domain2.children}" var="domain3"><ul style="margin-left: -40px;">
												       <u id="m_4${domain.data.childOrder}_${domain2.data.childOrder}_${domain3.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogMarkLevel('4','${domain3.data.name}' ,'${domain3.data.markLevel.markLevelDetailList[4].markLevelDetailId}' ,this,'${domain3.data.categoryId}','${yearName}', ${domain3.data.markLevel.markLevelDetailList[4].mark});" 
																 onmouseover="this.style.cursor='pointer'" >
												    ${domain3.data.markLevel.markLevelDetailList[4].mark}
												      </u>	
													<c:forEach items="${domain3.children}" var="domain4"><ul style="margin-left: -40px;">
													       <u id="m_4${domain.data.childOrder}_${domain2.data.childOrder}_${domain3.data.childOrder}_${domain4.data.childOrder}" style="font-weight: bold; color: #0fa356;" onclick="openDialogMarkLevel('4','${domain4.data.name}' ,'${domain4.data.markLevel.markLevelDetailList[4].markLevelDetailId}' ,this,'${domain4.data.categoryId}','${yearName}', ${domain4.data.markLevel.markLevelDetailList[4].mark});" 
																 onmouseover="this.style.cursor='pointer'" >
												    ${domain4.data.markLevel.markLevelDetailList[4].mark}
												      </u>	
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
						<td align="center" colspan="2">

							
							<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="EVL001A.backToMain();"/>

						</td>
					</tr>
					
				</table>
		</div>
	</div>
	
</form:form>

<script type="text/javascript"> 
	
EVL001A.backToMain = function(){
	document.location.href="<%=request.getContextPath()%>/admin/manageTemplate/initSearch.htm";
};

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

 
</script>

<!-- Start Dialog for Target -->

<div>
	<div id="dialog-form-target" class="text"  title="โปรดระบุเป้าหมาย KPI">
		 <div id="evaluate-name-target">xxxx</div></br> 
		<table>
			<tr align="center">
				<td  align="center"><div><label for="evaluate-point-target"><b>เป้าหมาย: </b></label></div></td>
				<td><input	class="input" type="text" name="evaluate-point-target" id="evaluate-point-target" maxlength="5" /></td>
			</tr>
		</table>
		<div id="tooltip-point-target" hidden="true" style="color: #0fa356; margin: 10px;"></div>
	</div>

</div>

<!-- Start Dialog for weight -->

<div>
	<div id="dialog-form-wight" class="text"  title="โปรดระบุน้ำหนัก KPI">
		<div id="evaluate-name">xxxx</div></br> 
		<table>
			<tr align="center">
				<td  align="center"><div><label for="evaluate-point"><b>น้ำหนัก : </b></label></div></td>
				<td><input	class="input" type="text" name="evaluate-point" id="evaluate-point" maxlength="5" /></td>
			</tr>
		</table>
		<div id="tooltip-point" hidden="true" style="color: #0fa356; margin: 10px;"></div>
	</div>
</div>

<!-- Start Dialog for MarkLevel -->

<div>
	<div id="dialog-form-level" class="text"  title="โปรดระบุ ระดับการให้คะแนน  ระดับ">
		 <div id="evaluate-name-level">xxxx</div></br> 
		<table>
			<tr align="center">
				<td  align="center"><div><label for="evaluate-point-level"><b>ระดับการให้คะแนน : </b></label></div></td>
				<td><input	class="input" type="text" name="evaluate-point-level" id="evaluate-point-level" maxlength="5" /></td>
			</tr>
		</table>
		<div id="tooltip-point-level" hidden="true" style="color: #0fa356; margin: 10px;"></div>
	</div>

</div>


<script type="text/javascript">	

var id = "";
var evaluateKpiId = "";
var groupId ="";
var yearId="";

var level ="";
var oldMark ="";

// Weight
function openDialogWight(text, evalId, item,evalGroupId,evalYearId){
	id = $(item).attr("id");
	evaluateKpiId = evalId;
	groupId=evalGroupId;
	yearId=evalYearId;
	
	var point = $("#"+id).text().trim();
	//alert("id:"+id+" point:"+point);
	$( "#evaluate-name" ).text(text);
	$( "#evaluate-point" ).focus().val(Number(point));
	$( "#dialog-form-wight" ).dialog( "open" );
	
}
//Target
function openDialogTarget(text, evalId, item,evalGroupId,evalYearId){
	id = $(item).attr("id");
	evaluateKpiId = evalId;
	groupId=evalGroupId;
	yearId=evalYearId;
	var point = $("#"+id).text().trim();
	//alert("id:"+id+" point:"+point);
	$( "#evaluate-name-target" ).text(text);
	$( "#evaluate-point-target" ).focus().val(Number(point));
	$( "#dialog-form-target" ).dialog( "open" );
	
}
//Level
 
function openDialogMarkLevel(countIndex,text, evalId, item,evalGroupId,evalYearId,mark){
	// alert("openDialogMarkLevel");
	var countx =  parseInt(countIndex)+1;
	// alert("openDialogMarkLevel countx:"+countx);
	id = $(item).attr("id");
	evaluateKpiId = evalId;
	groupId=evalGroupId;
	yearId=evalYearId;
	level=countx;
	oldMark = mark;
 
	var point = oldMark;
	//alert("id:"+id+" point:"+point);
	$( "#evaluate-name-level" ).text(text+'  ระดับ  '+countx);
	$( "#evaluate-point-level" ).focus().val(Number(point));
	$( "#dialog-form-level" ).dialog( "open" );
	
}

$(function() {
	
	$( "#dialog:ui-dialog" ).dialog( "destroy" );
	
	var point = $( "#evaluate-point" ),	allFields = $( [] ).add(point),	tips = $( "#tooltip-point" );
	
	var pointTarget = $( "#evaluate-point-target" ),	allFields = $( [] ).add(point),	tips = $( "#tooltip-point-target" );
	
	var pointLevel = $( "#evaluate-point-level" ),	allFields = $( [] ).add(point),	tips = $( "#tooltip-point-level" );

	function updateTips( t ) {
		tips.text( t ).addClass( "ui-state-highlight" );
		tips.fadeIn();
		setTimeout(function() {		tips.fadeOut();		}, 2000 );
	}


	// Weight
	$( "#dialog-form-wight" ).dialog({
		autoOpen: false,
		minHeight: 210,
//			width: 300,
//			maxheigth : 500,
		modal: true,
		resizable: true,
		buttons: {
			"บันทึก": function() {
				var bValid = true;					
				allFields.removeClass( "ui-state-error" );
				bValid = bValid && checkLength( point, "", 0, 100 );
				bValid = bValid && checkRegexp( point, /^([0-9])+$/i, "กรอกได้เฉพาะตัวเลข เท่านั้น!" );
				if (bValid) {
					
//						alert(point.val()+" > "+id);
					var val = point.val();
//						$("#"+id).text(Number(val));
					$("#dialog-form-wight").dialog( "close" );
					document.location.href="<%=request.getContextPath()%>/admin/manageTemplate/updateWeight.htm?yearId="+yearId+"&groupId="+groupId+"&evaluateKpiId="+evaluateKpiId+"&weight="+Number(val);
					
				}
			},
			"ยกเลิก": function() {
				$( "#dialog-form-wight" ).dialog( "close" );
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "ui-state-error" );
		}
	});
	
	
	
	// Target
	$( "#dialog-form-target" ).dialog({
		autoOpen: false,
		minHeight: 210,
//			width: 300,
//			maxheigth : 500,
		modal: true,
		resizable: true,
		buttons: {
			"บันทึก": function() {
				var bValid = true;					
				allFields.removeClass( "ui-state-error" );
				bValid = bValid && checkLength( pointTarget, "", 0, 100 );
				bValid = bValid && checkRegexp( pointTarget, /^([0-9])+$/i, "กรอกได้เฉพาะตัวเลข เท่านั้น!" );
				if (bValid) {
					
//						alert(point.val()+" > "+id);
					var val = pointTarget.val();
//						$("#"+id).text(Number(val));
					$("#dialog-form-target").dialog( "close" );
 					document.location.href="<%=request.getContextPath()%>/admin/manageTemplate/updateTarget.htm?yearId="+yearId+"&groupId="+groupId+"&evaluateKpiId="+evaluateKpiId+"&weight="+Number(val);
					
				}
			},
			"ยกเลิก": function() {
				$( "#dialog-form-target" ).dialog( "close" );
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "ui-state-error" );
		}
	});
	
	
	
	// Target
	$( "#dialog-form-level" ).dialog({
		autoOpen: false,
		minHeight: 210,
//			width: 300,
//			maxheigth : 500,
		modal: true,
		resizable: true,
		buttons: {
			"บันทึก": function() {
				var bValid = true;					
				allFields.removeClass( "ui-state-error" );
				bValid = bValid && checkLength( pointLevel, "", 0, 100 );
				bValid = bValid && checkRegexp( pointLevel, /^([0-9])+$/i, "กรอกได้เฉพาะตัวเลข เท่านั้น!" );
				if (bValid) {
					
//						alert(point.val()+" > "+id);
					var val = pointLevel.val();
//						$("#"+id).text(Number(val));
					$("#dialog-form-level").dialog( "close" );
  					document.location.href="<%=request.getContextPath()%>/admin/manageTemplate/updateMarkLevel.htm?yearId="+yearId+"&groupId="+groupId+"&levelId="+evaluateKpiId+"&mark="+Number(val)+"&level="+level;

				}
			},
			"ยกเลิก": function() {
				$( "#dialog-form-level" ).dialog( "close" );
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "ui-state-error" );
		}
	});
	
	
});	
	
</script>


<!-- End Dialog for weight -->