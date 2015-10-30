<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="kpiTemplate"	action="search.htm" method="POST" name="mainForm"> 	 
<div class="post">
 
	<table class="tableSearchResult" style="border: none;">
		<thead >
			<tr>
				<th width="100%" colspan="2" align="left"><H4>KPI Template  &nbsp;<c:out value="${kpiTemplateTree.rootElement.data.name}"/></H4></th>
  			</tr>
		</thead>
		<tbody>
		<tr >
		<td>	
	
	<div id="kpiTemplate-tree">
 
			<a href="<%=request.getContextPath()%>/admin/kpiTemplate/initAddNode.htm?kpiTemplateId=<c:out value="${kpiTemplateTree.rootElement.data.kpiTemplateId}"/>">Add </a> &nbsp;
			</span>
			<ul>
				<c:forEach items="${kpiTemplateTree.rootElement.children}" var="domain"> 
					<li>
						<span class="li-line">
							<c:out value="${domain.data.childOrder}"/>&nbsp; : <c:out value="${domain.data.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;							
							<c:out value="${domain.data.mark}"/>&nbsp;&nbsp;&nbsp;&nbsp; <c:out value="${domain.data.markTypeDesc}"/>&nbsp;&nbsp;&nbsp;&nbsp; 
							<a href="<%=request.getContextPath()%>/admin/kpiTemplate/initAddNode.htm?kpiTemplateId=<c:out value="${domain.data.kpiTemplateId}"/>">Add </a> &nbsp;
							<a href="<%=request.getContextPath()%>/admin/kpiTemplate/initEditNode.htm?kpiTemplateId=<c:out value="${domain.data.kpiTemplateId}"/>">Edit </a> &nbsp;
							<a rel="notLoading" href="<%=request.getContextPath()%>/admin/kpiTemplate/deleteNode.htm?kpiTemplateId=<c:out value="${domain.data.kpiTemplateId}"/>"
							onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.data.name}"/> ?')">Delete </a>
						</span>
						<ul>
							<c:forEach items="${domain.children}" var="domain2">
								<li>
									<span class="li-line">
										<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>&nbsp; : <c:out value="${domain2.data.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
										<c:out value="${domain2.data.mark}"/>&nbsp;&nbsp;&nbsp;&nbsp; <c:out value="${domain2.data.markTypeDesc}"/>&nbsp;&nbsp;&nbsp;&nbsp; 
										<a href="<%=request.getContextPath()%>/admin/kpiTemplate/initAddNode.htm?kpiTemplateId=<c:out value="${domain2.data.kpiTemplateId}"/>">Add </a> &nbsp;
										<a href="<%=request.getContextPath()%>/admin/kpiTemplate/initEditNode.htm?kpiTemplateId=<c:out value="${domain2.data.kpiTemplateId}"/>">Edit </a> &nbsp;
										<a rel="notLoading" href="<%=request.getContextPath()%>/admin/kpiTemplate/deleteNode.htm?kpiTemplateId=<c:out value="${domain2.data.kpiTemplateId}"/>"
										onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain2.data.name}"/> ?')">Delete </a>
									</span>
									
									<ul>
									<c:forEach items="${domain2.children}" var="domain3"> 
										<li>
											<span class="li-line">
												<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>.<c:out value="${domain3.data.childOrder}"/>&nbsp; : <c:out value="${domain3.data.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
												<c:out value="${domain3.data.mark}"/>&nbsp;&nbsp;&nbsp;&nbsp; <c:out value="${domain3.data.markTypeDesc}"/>&nbsp;&nbsp;&nbsp;&nbsp; 
												<a href="<%=request.getContextPath()%>/admin/kpiTemplate/initAddNode.htm?kpiTemplateId=<c:out value="${domain3.data.kpiTemplateId}"/>">Add </a> &nbsp;
												<a href="<%=request.getContextPath()%>/admin/kpiTemplate/initEditNode.htm?kpiTemplateId=<c:out value="${domain3.data.kpiTemplateId}"/>">Edit </a> &nbsp;
												<a rel="notLoading" href="<%=request.getContextPath()%>/admin/kpiTemplate/deleteNode.htm?kpiTemplateId=<c:out value="${domain3.data.kpiTemplateId}"/>"
												onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain3.data.name}"/> ?')">Delete </a>
											</span>
											
											<ul>
												<c:forEach items="${domain3.children}" var="domain4"> 
													<li>
														<span class="li-line">
															<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>.<c:out value="${domain4.data.childOrder}"/>.<c:out value="${domain3.data.childOrder}"/>&nbsp; : <c:out value="${domain4.data.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
															<c:out value="${domain4.data.mark}"/>&nbsp;&nbsp;&nbsp;&nbsp; <c:out value="${domain4.data.markTypeDesc}"/>&nbsp;&nbsp;&nbsp;&nbsp; 
															<a href="<%=request.getContextPath()%>/admin/kpiTemplate/initAddNode.htm?kpiTemplateId=<c:out value="${domain4.data.kpiTemplateId}"/>">Add </a> &nbsp;
															<a href="<%=request.getContextPath()%>/admin/kpiTemplate/initEditNode.htm?kpiTemplateId=<c:out value="${domain4.data.kpiTemplateId}"/>">Edit </a> &nbsp;
															<a rel="notLoading" href="<%=request.getContextPath()%>/admin/kpiTemplate/deleteNode.htm?kpiTemplateId=<c:out value="${domain4.data.kpiTemplateId}"/>"
															onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain4.data.name}"/> ?')">Delete </a>
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
	
</td>
</tr>
 
</tbody>
</table>	
 
	
</div>		
</form:form>

<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/role/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/kpiTemplate/create.htm";
		form.method='GET';	
		form.submit();
	}
 
	    
</script>
 