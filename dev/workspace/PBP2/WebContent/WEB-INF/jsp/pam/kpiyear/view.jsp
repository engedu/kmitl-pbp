<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="kpi"	action="search.htm" method="POST" name="mainForm"> 	 
<div class="post">
		<h2 class="title">กำหนดตัวชี้วัดรายปี</h2>
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
				<th width="100%" colspan="2" align="left"> ตัวชี้วัด   </th>
  			</tr>
		</thead>
		<tbody>
		<tr >
		<td>		
	
	<div id="kpi-tree">
			<span class="header">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<%=request.getContextPath()%>/admin/kpiyear/initAddNode.htm?kpiId=<c:out value="${kpiTree.rootElement.data.kpiId}"/>">Add </a> &nbsp;
			</span>
			<ul>
				<c:forEach items="${kpiTree.rootElement.children}" var="domain"> 
					<li>
						<span class="li-line">
							<span class="kpiheader1"><c:out value="${domain.data.childOrder}"/>&nbsp; : <c:out value="${domain.data.name}"/></span>&nbsp;&nbsp;&nbsp;&nbsp;	
							 						
							<c:out value="${domain.data.markTypeDesc}"/>&nbsp;&nbsp;&nbsp;&nbsp; 
							<a href="<%=request.getContextPath()%>/admin/kpiyear/initAddNode.htm?kpiId=<c:out value="${domain.data.kpiId}"/>">Add </a> &nbsp;
							<a href="<%=request.getContextPath()%>/admin/kpiyear/initEditNode.htm?kpiId=<c:out value="${domain.data.kpiId}"/>">Edit </a> &nbsp;
							<a rel="notLoading" href="<%=request.getContextPath()%>/admin/kpiyear/deleteNode.htm?kpiId=<c:out value="${domain.data.kpiId}"/>"
							onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.data.name}"/> ?')">Delete </a>
						</span>
						<ul>
							<c:forEach items="${domain.children}" var="domain2">
								<li>
									<span class="li-line">
										<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>&nbsp; : <c:out value="${domain2.data.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
										<c:out value="${domain2 .data.mark}"/>&nbsp;&nbsp;&nbsp;&nbsp; 	
										<c:out value="${domain2.data.markTypeDesc}"/>&nbsp;&nbsp;&nbsp;&nbsp; 
										<a href="<%=request.getContextPath()%>/admin/kpiyear/initAddNode.htm?kpiId=<c:out value="${domain2.data.kpiId}"/>">Add </a> &nbsp;
										<a href="<%=request.getContextPath()%>/admin/kpiyear/initEditNode.htm?kpiId=<c:out value="${domain2.data.kpiId}"/>">Edit </a> &nbsp;
										<a rel="notLoading" href="<%=request.getContextPath()%>/admin/kpiyear/deleteNode.htm?kpiId=<c:out value="${domain2.data.kpiId}"/>"
										onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain2.data.name}"/> ?')">Delete </a>
									</span>
									
									<ul>
									<c:forEach items="${domain2.children}" var="domain3"> 
										<li>
											<span class="li-line">
												<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>.<c:out value="${domain3.data.childOrder}"/>&nbsp; : <c:out value="${domain3.data.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
												<c:out value="${domain3.data.mark}"/>&nbsp;&nbsp;&nbsp;&nbsp; 	
												<c:out value="${domain3.data.markTypeDesc}"/>&nbsp;&nbsp;&nbsp;&nbsp; 
												<a href="<%=request.getContextPath()%>/admin/kpiyear/initAddNode.htm?kpiId=<c:out value="${domain3.data.kpiId}"/>">Add </a> &nbsp;
												<a href="<%=request.getContextPath()%>/admin/kpiyear/initEditNode.htm?kpiId=<c:out value="${domain3.data.kpiId}"/>">Edit </a> &nbsp;
												<a rel="notLoading" href="<%=request.getContextPath()%>/admin/kpiyear/deleteNode.htm?kpiId=<c:out value="${domain3.data.kpiId}"/>"
												onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain3.data.name}"/> ?')">Delete </a>
											</span>
											
											<ul>
												<c:forEach items="${domain3.children}" var="domain4"> 
													<li>
														<span class="li-line">
															<c:out value="${domain.data.childOrder}"/>.<c:out value="${domain2.data.childOrder}"/>.<c:out value="${domain4.data.childOrder}"/>.<c:out value="${domain3.data.childOrder}"/>&nbsp; : <c:out value="${domain4.data.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
															<c:out value="${domain4.data.markTypeDesc}"/>&nbsp;&nbsp;&nbsp;&nbsp; 
															<a href="<%=request.getContextPath()%>/admin/kpiyear/initAddNode.htm?kpiId=<c:out value="${domain4.data.kpiId}"/>">Add </a> &nbsp;
															<a href="<%=request.getContextPath()%>/admin/kpiyear/initEditNode.htm?kpiId=<c:out value="${domain4.data.kpiId}"/>">Edit </a> &nbsp;
															<a rel="notLoading" href="<%=request.getContextPath()%>/admin/kpiyear/deleteNode.htm?kpiId=<c:out value="${domain4.data.kpiId}"/>"
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
		form.action ="<%=request.getContextPath()%>/admin/kpiyear/init.htm";
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
	
 
</script>
 