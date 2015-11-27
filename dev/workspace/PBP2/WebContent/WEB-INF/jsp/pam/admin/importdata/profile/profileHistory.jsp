<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.buckwa.domain.*"%>
<%@ page import="java.util.*"%>

<form:form modelAttribute="importData" action="search.htm" method="POST" name="mainForm">
<div class="post"> 
	<div class="entry">
	
		 <div class="pbptableWrapper">
            <div class="pbp-header"> 	ประวัติการนำเข้าข้อมูลบุคลากร    &nbsp;   &nbsp;&nbsp;   &nbsp;&nbsp;   &nbsp;&nbsp;   &nbsp;&nbsp;   &nbsp;&nbsp;   &nbsp;&nbsp;   &nbsp;&nbsp;   &nbsp;
<!--   					<input type="button" class="btn btn-primary" value="นำเข้าข้อมูล" onclick="importFile();"/>  -->
  					<input type="button" class="btn btn-primary" value="นำเข้าข้อมูลทั้งหมด" onclick="importFileAll();"/>     </div> 
	 
		
		</div>	
		
		<br>
		
<!-- 		<div> -->
<!-- 			<table width="100%">	 -->
<!-- 				<tr>	 -->
<!-- 					<td class="label-form">&#3594;&#3639;&#3656;&#3629;&#3652;&#3615;&#3621;&#3660; : </td> -->
<!-- 					<td > -->
<!-- 						<input class="input"  id="fileName" name="fileName" />  -->
<!-- 						<errors path="fileName" cssClass="require" /> -->
<%-- 						<input class="btn btn-primary" value="<spring:message code="label.button.search"/>"  type="submit" > --%>
<!-- 					</td>  -->
<!-- 				</tr>	 -->
<!-- 			</table> -->
<!-- 		</div>	 -->
		
<!-- 		<br> -->
		
<%-- 				<pg:pager url="search.htm" --%>
<%-- 					items="${pagingBean.totalItems}" --%>
<%-- 					maxPageItems="${pagingBean.maxPageItems}" --%>
<%-- 					maxIndexPages="${pagingBean.maxIndexPages}" isOffset="<%= true %>" --%>
<%-- 					export="offset,currentPageNumber=pageNumber" scope="request"> --%>
<%-- 				<pg:param name="maxPageItems" /> --%>
<%-- 				<pg:param name="maxIndexPages" />			 --%>
		
<!-- 				<table class="pbp-table"> -->
<!-- 				<thead> -->
<!-- 					<th class="thFirst">ลำดับ</th> -->
<!-- 					<th class="thFirst">ชื่อไฟล์</th> -->
<!-- 					<th class="thFirst">รายละเอียด</th> -->
<!-- 					<th class="thFirst">ดาวน์โหลด</th> -->
<!-- 	 				<th class="thLast">ลบ</th> -->
<!-- 				</thead> -->
<!-- 					<tbody> -->
<%-- 						<c:if --%>
<%-- 							test="${empty pagingBean.currentPageItem && doSearch == 'true' }"> --%>
<!-- 							<tr class="row"> -->
<!-- 								<td colspan="4" class="row" align="center"> -->
<%-- 									<div class="searchNotFound"><spring:message code="message.searchNotFound" /></div> --%>
<!-- 								</td> -->
<!-- 							</tr> -->
<%-- 						</c:if> --%>
<%-- 						<c:forEach items="${pagingBean.currentPageItem}" var="domain" varStatus="status"> --%>
<!-- 							<tr  > -->
<%-- 								<td align="center">${status.count}</td> --%>
<%-- 								<td align="left" ><c:out value="${domain.fileName}${domain.fileExtension}" /></td> --%>
<%-- 								<td align="left"><c:out value="${domain.fileDesc}" /></td> --%>
<%-- 								<td align="center"><a rel="notLoading" href="<%=request.getContextPath()%>/admin/importdata/profile/download.htm?fileCode=<c:out value="${domain.fileCode}"/>" > --%>
<%-- 									<img src="<c:url value="/images/excel.png"/>" style="height: 15px; width: 15px; "/></a> --%>
<!-- 								</td> -->
<%-- 								<td align="center" ><a rel="notLoading" href="<%=request.getContextPath()%>/admin/importdata/profile/delete.htm?fileCode=<c:out value="${domain.fileCode}"/>" --%>
<%-- 									onclick="return confirmPage('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3607;&#3637;&#3656;&#3592;&#3632;&#3621;&#3610;&#3652;&#3615;&#3621;&#3660; : <c:out value="${domain.fileName}${domain.fileExtension}"/> ?')" > --%>
<%-- 									<img src="<c:url value="/images/delete.png"/>"/></a> --%>
<!-- 								</td>  -->
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
<!-- 					</tbody> -->
<!-- 			</table>	 -->
		
		
<%-- 					<div class="footerPaging"><pg:index> --%>
<%-- 					<jsp:include page="/WEB-INF/jsp/common/paging.jsp" flush="true" /> --%>
<%-- 				</pg:index></div> --%>
<%-- 			</pg:pager>	 --%>
 
		
	</div>
</div>
</form:form>

<script type="text/javascript">
	function create(){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/importdata/profile/initProfile.htm";
		form.method='GET';	
		form.submit();
	}
	
	function showHistory(){		
		document.location.href= "<%=request.getContextPath()%>/admin/importdata/profile/initProfileHistory.htm";
	}
	
	function importFile(){
		document.location.href="<%=request.getContextPath()%>/admin/importdata/profile/initProfile.htm";
	}
	function importFileAll(){
		document.location.href="<%=request.getContextPath()%>/uploadMgr/process.htm";
	}
</script>
