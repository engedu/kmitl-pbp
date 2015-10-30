<!--
	@Author : Teerawoot Charoenporn(Tor)
	@Create : Aug 17, 2012 10:27:49 PM
-->
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!-- <link charset="utf-8" href="/PAM/css/tree.css" media="screen" rel="stylesheet" type="text/css"> -->

<form:form modelAttribute="worklineMapping"	action="#" method="POST" name="mainForm">   
<form:hidden path="parentCode"/>
<form:hidden path="worklineName"/>
<div class="post">
	<h2 class="title">กำหนดสายการบังคับบัญชา</h2>
	<div class="entry">
			<table width="100%">
				<tr> 
					<td align="left">
						<input class="btn btn-primary" value="<spring:message code="label.button.new"/>"  type="button" onclick="add()" />
						<div class="line">&nbsp;</div>
						<div style="clear: both;">&nbsp;</div>
 				    </td>
 				    
 			    </tr>
				<tr>	
					<td class="formValue" style="padding: 0 120px;">
					
						<c:if test="${!empty hierarchy}">
							<span class="label-form">สายการบังคับบัญชา</span>
<!-- 							<ul class="label-form" > -->
							<ul class="tree fully-open">
							<c:forEach items="${hierarchy}" var="parent" varStatus="status">
<%-- 								<c:if test="${!status.last}"> --%>
<!-- 									<li> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${status.last}"> --%>
<!-- 									<li class="last" > -->
<%-- 								</c:if> --%>
								<li>
									<span class="label-form">${parent.worklineName}</span> &nbsp;
									<a href="<%=request.getContextPath()%>/admin/workline/addworklinehierarchy.htm?
										parentCode=<c:out value="${parent.worklineCode}"/>&worklineName=<c:out value="${parent.worklineName}"/>">Add</a> &nbsp;
									<a href="<%=request.getContextPath()%>/admin/workline/editworklinehierarchy.htm?
										worklineCode=<c:out value="${parent.worklineCode}"/>&worklineName=<c:out value="${parent.worklineName}"/>">Edit</a> &nbsp;
									<c:if test="${empty parent.childWorklineList}">
										<a rel="notLoading" href="<%=request.getContextPath()%>/admin/workline/deleteworklinehierarchy.htm?
											worklineCode=<c:out value="${parent.worklineCode}"/>"
											onclick="return confirmPage('Are you sure to delete <c:out value="${parent.worklineName}"/> ?')">Delete</a>
									</c:if>
								<c:if test="${!empty parent.childWorklineList}">
									<ul>
								  	<c:forEach items="${parent.childWorklineList}" var="childLv1" varStatus="status">
<%-- 								  		<c:if test="${!status.last}"> --%>
<!-- 											<li> -->
<%-- 										</c:if> --%>
<%-- 										<c:if test="${status.last}"> --%>
<!-- 											<li class="last" > -->
<%-- 										</c:if> --%>
										<li>
								  			<span class="label-form">${childLv1.worklineName}</span> &nbsp;
											<a href="<%=request.getContextPath()%>/admin/workline/addworklinehierarchy.htm?
												parentCode=<c:out value="${childLv1.worklineCode}"/>&worklineName=<c:out value="${childLv1.worklineName}"/>">Add</a> &nbsp;
											<a href="<%=request.getContextPath()%>/admin/workline/editworklinehierarchy.htm?
												worklineCode=<c:out value="${childLv1.worklineCode}"/>&worklineName=<c:out value="${childLv1.worklineName}"/>">Edit</a> &nbsp;
											<c:if test="${empty childLv1.childWorklineList}">
												<a href="<%=request.getContextPath()%>/admin/workline/deleteworklinehierarchy.htm?
													worklineCode=<c:out value="${childLv1.worklineCode}"/>"
													onclick="return confirmPage('Are you sure to delete <c:out value="${childLv1.worklineName}"/> ?')">Delete</a>
											</c:if>
								  		<c:if test="${!empty childLv1.childWorklineList}">
											<ul>
										  	<c:forEach items="${childLv1.childWorklineList}" var="childLv2" varStatus="status">
<%-- 										  		<c:if test="${!status.last}"> --%>
<!-- 													<li> -->
<%-- 												</c:if> --%>
<%-- 												<c:if test="${status.last}"> --%>
<!-- 													<li class="last" > -->
<%-- 												</c:if> --%>
												<li>
										  			<span class="label-form">${childLv2.worklineName}</span>  &nbsp;
													<a href="<%=request.getContextPath()%>/admin/workline/addworklinehierarchy.htm?
														parentCode=<c:out value="${childLv2.worklineCode}"/>&worklineName=<c:out value="${childLv2.worklineName}"/>">Add</a> &nbsp;
													<a href="<%=request.getContextPath()%>/admin/workline/editworklinehierarchy.htm?
														worklineCode=<c:out value="${childLv2.worklineCode}"/>&worklineName=<c:out value="${childLv2.worklineName}"/>">Edit</a> &nbsp;
													<c:if test="${empty childLv2.childWorklineList}">
														<a href="<%=request.getContextPath()%>/admin/workline/deleteworklinehierarchy.htm?
															worklineCode=<c:out value="${childLv2.worklineCode}"/>"
															onclick="return confirmPage('Are you sure to delete <c:out value="${childLv2.worklineName}"/> ?')">Delete</a>
													</c:if>
										  		<c:if test="${!empty childLv2.childWorklineList}">
													<ul>
												  	<c:forEach items="${childLv2.childWorklineList}" var="childLv3" varStatus="status">
<%-- 												  		<c:if test="${!status.last}"> --%>
<!-- 															<li> -->
<%-- 														</c:if> --%>
<%-- 														<c:if test="${status.last}"> --%>
<!-- 															<li class="last" > -->
<%-- 														</c:if> --%>
														<li>
												  			<span class="label-form">${childLv3.worklineName}</span> &nbsp;
															<a href="<%=request.getContextPath()%>/admin/workline/addworklinehierarchy.htm?
																parentCode=<c:out value="${childLv3.worklineCode}"/>&worklineName=<c:out value="${childLv3.worklineName}"/>">Add</a> &nbsp;
															<a href="<%=request.getContextPath()%>/admin/workline/editworklinehierarchy.htm?
																worklineCode=<c:out value="${childLv3.worklineCode}"/>&worklineName=<c:out value="${childLv3.worklineName}"/>">Edit</a> &nbsp;
															<c:if test="${empty childLv3.childWorklineList}">
																<a href="<%=request.getContextPath()%>/admin/workline/deleteworklinehierarchy.htm?
																	worklineCode=<c:out value="${childLv3.worklineCode}"/>"
																	onclick="return confirmPage('Are you sure to delete <c:out value="${childLv3.worklineName}"/> ?')">Delete</a>
															</c:if>
												  		<c:if test="${!empty childLv3.childWorklineList}">
															<ul>
														  	<c:forEach items="${childLv3.childWorklineList}" var="childLv4" varStatus="status">
<%-- 														  		<c:if test="${!status.last}"> --%>
<!-- 																	<li> -->
<%-- 																</c:if> --%>
<%-- 																<c:if test="${status.last}"> --%>
<!-- 																	<li class="last" > -->
<%-- 																</c:if> --%>
																<li>
														  			<span class="label-form">${childLv4.worklineName}</span> &nbsp;
																	<a href="<%=request.getContextPath()%>/admin/workline/addworklinehierarchy.htm?
																		parentCode=<c:out value="${childLv4.worklineCode}"/>&worklineName=<c:out value="${childLv4.worklineName}"/>">Add</a> &nbsp;
																	<a href="<%=request.getContextPath()%>/admin/workline/editworklinehierarchy.htm?
																		worklineCode=<c:out value="${childLv4.worklineCode}"/>&worklineName=<c:out value="${childLv4.worklineName}"/>">Edit</a> &nbsp;
																	<c:if test="${empty childLv4.childWorklineList}">
																		<a href="<%=request.getContextPath()%>/admin/workline/deleteworklinehierarchy.htm?
																			worklineCode=<c:out value="${childLv4.worklineCode}"/>"
																			onclick="return confirmPage('Are you sure to delete <c:out value="${childLv4.worklineName}"/> ?')">Delete</a>
																	</c:if>
														  		<c:if test="${!empty childLv4.childWorklineList}">
																	<ul>
																	<c:forEach items="${childLv4.childWorklineList}" var="childLv5" varStatus="status">
<%-- 																	  		<c:if test="${!status.last}"> --%>
<!-- 																				<li> -->
<%-- 																			</c:if> --%>
<%-- 																			<c:if test="${status.last}"> --%>
<!-- 																				<li class="last" > -->
<%-- 																			</c:if> --%>
																		<li>
																  			<span class="label-form">${childLv5.worklineName}</span> &nbsp;
<%-- 																			<a href="<%=request.getContextPath()%>/admin/workline/addworklinehierarchy.htm? --%>
<%-- 																				parentCode=<c:out value="${childLv5.worklineCode}"/>">Add</a> &nbsp; --%>
																			<a href="<%=request.getContextPath()%>/admin/workline/editworklinehierarchy.htm?
																				worklineCode=<c:out value="${childLv5.worklineCode}"/>&worklineName=<c:out value="${childLv5.worklineName}"/>">Edit</a> &nbsp;
																			<c:if test="${empty childLv5.childWorklineList}">
																				<a href="<%=request.getContextPath()%>/admin/workline/deleteworklinehierarchy.htm?
																					worklineCode=<c:out value="${childLv5.worklineCode}"/>"
																					onclick="return confirmPage('Are you sure to delete <c:out value="${childLv5.worklineName}"/> ?')">Delete</a>
																			</c:if>
																  		</li>
																  	</c:forEach>
																  	</ul>
														  		</li>
																</c:if>
														  	</c:forEach>
														  	</ul>
												  		</li>
														</c:if>
												  	</c:forEach>
												  	</ul>
										  		</li>
												</c:if>
										  	</c:forEach>
										  	</ul>
								  		</li>
										</c:if>
								  	</c:forEach>
								  	</ul>
								</c:if>
								</li>
							</c:forEach>
							</ul>
						</c:if>
					</td> 
				</tr>	
															
<!-- 				<tr>  -->
<!-- 					<td> </td> -->
<!-- 					<td align="left"> -->
<!-- 						<input class="btn btn-primary" value="<spring:message code="label.button.cancel"/>"  type="button" onclick="init();>	 -->
<!--  				    </td> -->
<!--  			    </tr>			 -->
			</table>
	</div>
</div>
</form:form>	
 
<!--  <script charset="utf-8" type="text/javascript" src="/PAM/js/tree.js"/> -->
 <script type="text/javascript">
// 	var worklinelist;

// 	$(document).ready(function() {
// 		worklineList = new Array();
// 	});
	$(document).ready(function () {
		$('ul.tree li:last-child').addClass('last');
	});

	function add() {
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/workline/addworklinehierarchy.htm";
		form.method='GET';	
		form.submit();	
	}
	
	
</script>