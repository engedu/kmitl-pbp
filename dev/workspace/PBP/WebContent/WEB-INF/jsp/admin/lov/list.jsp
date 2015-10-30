<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>
 
<form:form modelAttribute="lovHeader"	action="search.htm" method="POST" name="mainForm">  
 
<div class="post">
	<h2 class="title">ค่าคงที่</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table width="100%" id="tableSearch">		
		
					
		<tr>	
			<td class="formLabel">
				LOV Type: 
			</td>
			<td>
			<form:select path="lovTypeCode" onchange="changeLOVType();" id="lovTypeCode" cssClass="select1">
				<form:option value="" label="--- Select ---"/>
				<form:options items="${lovHeader.lovHeaderList}" itemValue="lovTypeCode" itemLabel="lovTypeCodeDesc" />
			</form:select>
			<form:errors path="lovTypeCode" cssClass="lovTypeCode" />			 
			</td> 
		</tr>			 		
		</table>		
		<div class="buttonSearchGrop">
			<input class="btn_2" value="<spring:message code="label.button.search"/>" type="button" onclick="init();"> 	 &nbsp;&nbsp;   
			<input class="btn_2" value="<spring:message code="label.button.reset"/>" type="button" onclick="init();">	 &nbsp;&nbsp;    
			<input class="btn_2" value="<spring:message code="label.button.new"/>"  type="button" onclick="createHeader();">				
		</div>
	</div>
	<div class="searchResult">
	<!--
	<c:if test="${initstatus == 'true' }">  </c:if>	
	<c:if test="${initstatus != 'true' }"> 	  -->
	<pg:pager url="search.htm"  items="${pagingBean.totalItems}" 	maxPageItems="${pagingBean.maxPageItems}" maxIndexPages="${pagingBean.maxIndexPages}"	isOffset="<%= true %>" export="offset,currentPageNumber=pageNumber"	scope="request">
		<pg:param name="maxPageItems" />
		<pg:param name="maxIndexPages" />	
	<div class="footerPaging">
		<pg:index>
			<jsp:include page="/WEB-INF/jsp/common/paging.jsp" flush="true" />
		</pg:index>				
	</div>
	</pg:pager>
	
	<!-- </c:if>	-->
	</div>
</div>
</form:form>
 
<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/lov/init.htm";
		form.method='GET';	
		form.submit();	
	}	
	function createHeader (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/lov/createHeader.htm";
		form.method='GET';	
		form.submit();
	}
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/lov/create.htm";
		form.method='GET';	
		form.submit();
	}
	function changeLOVType (){		
 		alert(" changeLOVType");
	}	
</script>
	