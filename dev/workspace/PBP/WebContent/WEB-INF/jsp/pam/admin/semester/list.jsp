<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="semester" action="search.htm" method="POST" name="mainForm"> 	 
<div class="post">
	<h2 class="title">เทอมการศึกษา</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table width="100%" id="tableSearch">
			<tr>
				<td class="label-form" align="left" width="20px">ปีการศึกษา :</td>
				<td class="label-form" align="left">
					<select id="yearList" name="yearId" onchange="changeYear(this.value);">
						<c:forEach items="${yearList}" var="year">
							<option value="<c:out value="${year.yearId}"/>" <c:if test="${semester.yearId == year.yearId}">selected="selected"</c:if>>
								<c:out value="${year.name}"></c:out>
							</option>
						</c:forEach>
					</select>
	    		</td>
				<td  align="right">
					<a href="<%=request.getContextPath()%>/admin/semester/create.htm?yearId=<c:out value="${semester.yearId}"/>" >
						<input value="<spring:message code="label.button.new"/>" type="button" class="btn btn-primary">
					</a>
				</td>
			</tr>
		</table>
		<div class="line">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
		<div>
			<table class="tableSearchResult">
				<thead class="tableHeader">
					<tr>
						<th class="headerTH" width="100px" >ภาคการศึกษาที่</th>
						<th class="headerTH" >วันที่เริ่ม</th>
						<th class="headerTH" >วันที่สิ้นสุด</th>
						<th class="headerTH" width="100px" ><spring:message code="label.edit" /></th>
						<th class="headerTH" width="100px" ><spring:message code="label.delete" /></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty semesterList && doSearch == 'true' }">  	 
						<tr class="row">
							<td colspan="5" class="row" align="center">
								<div class="searchNotFound"><spring:message code="message.searchNotFound" /></div>
							</td>
						</tr>
					</c:if>
					 <c:forEach items = "${semesterList}" var="domain">
						<tr class="row">
							<td align="center"> <c:out value="${domain.name}"/>&nbsp;</td>
							<td align="center"> <c:out value="${domain.startDateStr}"/>&nbsp;</td>
							<td align="center"> <c:out value="${domain.endDateStr}"/>&nbsp;</td>
							<td align="center">
								<a href="<%=request.getContextPath()%>/admin/semester/edit.htm?semesterId=<c:out value="${domain.semesterId}"/>">
									<img src="<c:url value="/images/edit.png"/>" /> 
								</a>
							</td>
							<td align="center">
								<a rel="notLoading"  href="<%=request.getContextPath()%>/admin/semester/delete.htm?semesterId=<c:out value="${domain.semesterId}"/>&yearId=<c:out value="${domain.yearId}"/>"  onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.name}"/> ?')">
					             		<img src="<c:url value="/images/delete.png"/>"    />	             		 
					            </a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>	  
</form:form>

<script type="text/javascript">
	
	function changeYear(value) {
		var form = document.forms['mainForm'];
		form.action ="<%=request.getContextPath()%>/admin/semester/initByYear.htm?yearId=" + value;
		form.method='GET';
		form.submit();
	}
	
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/semester/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/semester/create.htm";
		form.method='GET';	
		form.submit();
	}
 
	    
</script>
 