<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="kpiTree"	action="search.htm" method="POST" name="mainForm"> 	 
<div class="post">
	<h2 class="title">ตัวชี้วัด</h2>
	<div id="kpi-tree">
			<span class="header"><c:out value="${kpiTree.rootElement.data.name}"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<%=request.getContextPath()%>/admin/kpi/initAddNode.htm?kpiId=<c:out value="${kpiTree.rootElement.data.kpiId}"/>">Add </a> &nbsp;
			</span>
			<ul>
				<c:forEach items="${kpiTree.rootElement.children}" var="domain"> 
					<li>
						<span class="li-line">
							<c:out value="${domain.data.childOrder}"/>&nbsp; : <c:out value="${domain.data.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;							
							<c:out value="${domain.data.markTypeDesc}"/>&nbsp;&nbsp;&nbsp;&nbsp; 
							<a href="<%=request.getContextPath()%>/admin/kpi/initAddNode.htm?kpiId=<c:out value="${domain.data.kpiId}"/>">Add </a> &nbsp;
							<a href="<%=request.getContextPath()%>/admin/kpi/initEditNode.htm?kpiId=<c:out value="${domain.data.kpiId}"/>">Edit </a> &nbsp;
							<a rel="notLoading" href="<%=request.getContextPath()%>/admin/kpi/deleteNode.htm?kpiId=<c:out value="${domain.data.kpiId}"/>"
							onclick="return confirmPage('ยืนยันการลบข้อมูล  <c:out value="${domain.data.name}"/> ?')">Delete </a>
						</span>
						<ul>
							<c:forEach items="${domain.children}" var="domain2">
								<li>
									<span class="li-line">
										<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>&nbsp; : <c:out value="${domain2.data.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
										<c:out value="${domain2.data.markTypeDesc}"/>&nbsp;&nbsp;&nbsp;&nbsp; 
										<a href="<%=request.getContextPath()%>/admin/kpi/initAddNode.htm?kpiId=<c:out value="${domain2.data.kpiId}"/>">Add </a> &nbsp;
										<a href="<%=request.getContextPath()%>/admin/kpi/initEditNode.htm?kpiId=<c:out value="${domain2.data.kpiId}"/>">Edit </a> &nbsp;
										<a rel="notLoading"  href="<%=request.getContextPath()%>/admin/kpi/deleteNode.htm?kpiId=<c:out value="${domain2.data.kpiId}"/>"
										onclick="return confirmPage('ยืนยันการลบข้อมูล  <c:out value="${domain2.data.name}"/> ?')">Delete </a>
									</span>
									
									<ul>
									<c:forEach items="${domain2.children}" var="domain3"> 
										<li>
											<span class="li-line">
												<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>.<c:out value="${domain3.data.childOrder}"/>&nbsp; : <c:out value="${domain3.data.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
												<c:out value="${domain3.data.markTypeDesc}"/>&nbsp;&nbsp;&nbsp;&nbsp; 
												<a href="<%=request.getContextPath()%>/admin/kpi/initAddNode.htm?kpiId=<c:out value="${domain3.data.kpiId}"/>">Add </a> &nbsp;
												<a href="<%=request.getContextPath()%>/admin/kpi/initEditNode.htm?kpiId=<c:out value="${domain3.data.kpiId}"/>">Edit </a> &nbsp;
												<a rel="notLoading" href="<%=request.getContextPath()%>/admin/kpi/deleteNode.htm?kpiId=<c:out value="${domain3.data.kpiId}"/>"
												onclick="return confirmPage('ยืนยันการลบข้อมูล  <c:out value="${domain3.data.name}"/> ?')">Delete </a>
											</span>
											
											<ul>
												<c:forEach items="${domain3.children}" var="domain4"> 
													<li>
														<span class="li-line">
															<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>.<c:out value="${domain4.data.childOrder}"/>.<c:out value="${domain3.data.childOrder}"/>&nbsp; : <c:out value="${domain4.data.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
															<c:out value="${domain4.data.markTypeDesc}"/>&nbsp;&nbsp;&nbsp;&nbsp; 
															<a href="<%=request.getContextPath()%>/admin/kpi/initAddNode.htm?kpiId=<c:out value="${domain4.data.kpiId}"/>">Add </a> &nbsp;
															<a href="<%=request.getContextPath()%>/admin/kpi/initEditNode.htm?kpiId=<c:out value="${domain4.data.kpiId}"/>">Edit </a> &nbsp;
															<a rel="notLoading" href="<%=request.getContextPath()%>/admin/kpi/deleteNode.htm?kpiId=<c:out value="${domain4.data.kpiId}"/>"
															onclick="return confirmPage('ยืนยันการลบข้อมูล  <c:out value="${domain4.data.name}"/> ?')">Delete </a>
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
</div>		
</form:form>

<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/kpi/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/kpi/create.htm";
		form.method='GET';	
		form.submit();
	}
 
	    
</script>
 