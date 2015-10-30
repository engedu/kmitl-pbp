<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>

<div class="content100">  
<div class="mainContent100"> 
<form:form modelAttribute="paper" action="search.htm" method="POST" name="mainForm"> 	 

<div class="searchFormNoBorder">
<div class="subTopicHeaderNoBorder">Paper&nbsp;<input class="btn_2" value="+ <spring:message code="label.button.new"/>" type="button" onclick="create();">
</div>
</div>

<div class="searchResult">
<pg:pager url="search.htm" items="${pagingBean.totalItems}" maxPageItems="${pagingBean.maxPageItems}" maxIndexPages="${pagingBean.maxIndexPages}" isOffset="<%= true %>" export="offset,currentPageNumber=pageNumber" scope="request">
<pg:param name="maxPageItems" />
<pg:param name="maxIndexPages" />

<table class="searchResultTable">
<thead class="tableHeader">
<tr class="searchResultHeader">
	<th class="headerTH">#</th>
	<th class="headerTH">ระดับการเผยแพร่</th>
	<th class="headerTH">บทความวิชาการ</th>
	<th class="headerTH">สถานะตรวจสอบ</th>
	<th class="headerTH"><spring:message code="label.edit"/></th>
	<th class="headerTH"><spring:message code="label.delete"/></th>
</tr>
</thead>
<tbody>
<c:if test="${empty pagingBean.currentPageItem && doSearch == 'true' }">
<tr>
	<td colspan="4" align="center">
		<div class="searchNotFound">
		<spring:message code="message.searchNotFound"/>
	</td>
</tr>
</c:if >
<c:forEach items = "${pagingBean.currentPageItem}" var="domain" varStatus="status">
<tr class="rgRow">
	<td align="left"><c:out value="${status.count}"/>&nbsp;</td>
	<td align="left"><c:out value="${domain.paperLevel}"/>&nbsp;</td>
	<td align="left"><c:out value="${domain.paperTitle}"/>&nbsp;</td>
	<td align="left"><c:out value="${domain.paperStatus}"/>&nbsp;</td>
	<td align="center">
		<a href="<%=request.getContextPath()%>/pam/person/paper/edit.htm?paperId=<c:out value="${domain.paperId}"/>" >Edit</a>
	</td>
	<td align="center">
		<a rel="notLoading"  href="<%=request.getContextPath()%>/pam/person/paper/delete.htm?paperId=<c:out value="${domain.paperId}"/>"  onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.paperTitle}"/> ?')">Delete</a>
	</td>
</tr>
</c:forEach>
</tbody>
</table>

<div class="footerPaging">
<pg:index>
<jsp:include page="/WEB-INF/jsp/common/paging.jsp" flush="true" />
</pg:index>
</div>

</pg:pager>
</div>

<form:hidden path="personId"/>

</form:form>
</div>
</div>


</body>
 

<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm'];
		form.action ="<%=request.getContextPath()%>/admin/kpiCategory/init.htm";
		form.method='GET';
		form.submit();
	}
	
	function create() {
		var form = document.forms['mainForm'];
		form.action ="<%=request.getContextPath()%>/pam/person/paper/create.htm";
		form.method='GET';
		form.submit();
	}
</script>
 