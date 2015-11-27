<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<form:form
	modelAttribute="workTemplate" action="create.htm" method="POST"
	name="mainForm">
<div class="post">
	<h2 class="title">กำหนดตัวชี้วัด</h2>
	<div class="entry">
		<c:if test="${empty kpiTree}"> 
			<div class="searchNotFound"><spring:message code="message.searchNotFound" /></div>
		</c:if>
		<div id="kpi-tree">
				<span class="header"><c:out value="${kpiTree.rootElement.data.name}"/></span>
				<ul>
					<c:forEach items="${kpiTree.rootElement.children}" var="domain"> 
						<li class="node1">
							<span class="li-line">
								<c:if test="${empty domain.children}"> 
									<form:checkbox id="nodeP-${domain.data.kpiId}"  path="kpi" value="${domain.data.kpiId}" />
								</c:if>
								<c:out value="${domain.data.childOrder}"/>&nbsp; : <c:out value="${domain.data.name}"/>
								<c:if test="${empty domain.children}"> 
									 &nbsp;<c:out value="${domain .data.mark}"/>&nbsp;<c:out value="${domain.data.markTypeDesc}"/>
								</c:if>
							</span>
							<ul>
								<c:forEach items="${domain.children}" var="domain2">
									<li class="node-${domain.data.kpiId}">
										<span class="li-line">
											<c:if test="${empty domain2.children}">
												<form:checkbox path="kpi" value="${domain2.data.kpiId}" parentTop="${domain.data.kpiId}"/>
											</c:if>
											<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>&nbsp; : <c:out value="${domain2.data.name}"/>
											<c:if test="${empty domain2.children}"> 
												 &nbsp;<c:out value="${domain2 .data.mark}"/>&nbsp;<c:out value="${domain2.data.markTypeDesc}"/>
											</c:if>
										</span>
										<ul>
											<c:forEach items="${domain2.children}" var="domain3"> 
												<li>
													<span class="li-line">
														<c:if test="${empty domain3.children}">
															<form:checkbox path="kpi" value="${domain3.data.kpiId}" parentTop="${domain.data.kpiId}"/>
														</c:if>
														<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>.<c:out value="${domain3.data.childOrder}"/>&nbsp; : <c:out value="${domain3.data.name}"/>
														<c:if test="${empty domain3.children}"> 
															 &nbsp;<c:out value="${domain3 .data.mark}"/>&nbsp;<c:out value="${domain3.data.markTypeDesc}"/>
														</c:if>
													</span>
													<ul>
														<c:forEach items="${domain3.children}" var="domain4"> 
															<li>
																<span class="li-line">
																	<c:if test="${empty domain4.children}">
																		<form:checkbox path="kpi" value="${domain4.data.kpiId}" parentTop="${domain.data.kpiId}"/>
																	</c:if>
																	<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>.<c:out value="${domain4.data.childOrder}"/>.<c:out value="${domain3.data.childOrder}"/>&nbsp; : <c:out value="${domain4.data.name}"/>
																	<c:if test="${empty domain4.children}"> 
																		 &nbsp;<c:out value="${domain4 .data.mark}"/>&nbsp;<c:out value="${domain4.data.markTypeDesc}"/>
																	</c:if>
																</span>
															</li>
														</c:forEach>
													</ul> 
												</li>
											</c:forEach>
										</ul>
									</li>
								</c:forEach>
							</ul>
						</li>
					</c:forEach>
				</ul>
			</div>
			<table>
				<tr>
					<td align="center">
						<c:if test="${!empty kpiTree}">
							 <input value="<spring:message code="label.button.save"/>" class="btn btn-primary" type="submit" onclick="save();" rel="notLoading">
						</c:if>
						<input class="btn btn-primary" value="<spring:message code="label.button.cancel"/>" rel="notLoading" type="button" onclick="window.close();">
					</td>
				</tr>
			</table>
			
	</div>
</div>
<input type="hidden" value="${attrIndex}" id="attrIndex"/>
</form:form>

<script type="text/javascript">

	function save(){
		var value="0";
		if($('input:checkbox[name=*]:checked').val()!=null)
			value = $('input:checkbox[name=*]:checked').val();
			
		window.opener.setKpiFromPopup($("#attrIndex").val(),value);
		window.close();
	}

	$(document).ready(function(){
		$('input:checkbox').click(function(){
			var value = $(this).val();
			$("input:checkbox").each( function(index) {
				if ($(this).val() != value)
					$(this).removeAttr("checked");
			});
		});
	});
</script>