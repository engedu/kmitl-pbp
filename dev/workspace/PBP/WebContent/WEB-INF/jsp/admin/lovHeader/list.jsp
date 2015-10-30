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
	<h2 class="title">ประเภทค่าคงที่</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table width="100%" id="tableSearch">	
 			<tr>	
				<td class="label-form">
					  Code:
				</td>
				<td class="formValue">
					<form:input cssClass="tb1"  path="code"  /> 
				</td> 
				<td class="label-form">
					  Name:
				</td>
				<td class="formValue">
					<form:input cssClass="tb1"   path="name"  />  
 
				<input  value="<spring:message code="label.button.search"/>" type="submit" class="btn btn-primary"> 	 &nbsp;&nbsp;   
			<!--	<input class="btn_2" value="<spring:message code="label.button.reset"/>" type="button" onclick="init();">	 &nbsp;&nbsp;     --> 
				<input   value="<spring:message code="label.button.new"/>"  type="button" onclick="create();" class="btn btn-primary">					
				</td>
			</tr>	 				
		</table>	
		
		<div class="line">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
		<div>
	<pg:pager url="search.htm"  items="${pagingBean.totalItems}" 	maxPageItems="${pagingBean.maxPageItems}" maxIndexPages="${pagingBean.maxIndexPages}"	isOffset="<%=true%>" export="offset,currentPageNumber=pageNumber"	scope="request">
 		<pg:param name="maxPageItems" />
		<pg:param name="maxIndexPages" />		
		<table class="tableSearchResult">
	<thead>
          <tr  class="searchResultHeader">
         <th class="headerTH">Code</th>
        	<th class="headerTH">Name</th>
 
 			<th class="headerTH">View</th>
        	<th class="headerTH"><spring:message code="label.edit"/></th>   
        	<th class="headerTH">Manage</th>
        	<th class="headerTH"><spring:message code="label.delete"/></th>   
        </tr>
    </thead>
    <tbody>
    <c:if test="${empty pagingBean.currentPageItem && doSearch == 'true' }">  	 
    	<tr class="searchNotFound">
    		<td colspan="5" align="center"><spring:message code="message.searchNotFound"/></td>
    	</tr>
    </c:if >
        <c:forEach items = "${pagingBean.currentPageItem}" var="domain">
         <tr class="trGray">          	 	
        	 
        	 <td align="left"> <img src="<c:url value="/images/tr_arrow1.gif"/>"/> &nbsp;<c:out value="${domain.code}"/>&nbsp;</td>
        	  <td> <c:out value="${domain.name}"/>&nbsp;</td> 
        	  <td><a href="<%=request.getContextPath()%>/admin/lovHeader/view.htm?lovHeaderId=<c:out value="${domain.lovHeaderId}"/>" >	
        	  View</a></td>
			 <td align="center">    
	            <a href="<%=request.getContextPath()%>/admin/lovHeader/edit.htm?lovHeaderId=<c:out value="${domain.lovHeaderId}"/>" >	           
	          	<img src="<c:url value="/images/edit.png"/>" />
	            </a>  			 
			 </td>
			 <td><a href="<%=request.getContextPath()%>/admin/lovHeader/manage.htm?lovHeaderId=<c:out value="${domain.lovHeaderId}"/>" >	Manage</a></td>
			 <td align="center">	                  
	              <a rel="notLoading"  href="<%=request.getContextPath()%>/admin/lovHeader/delete.htm?lovHeaderId=<c:out  value="${domain.lovHeaderId}"/>"  onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.code}"/> ?')">
	             		<img src="<c:url value="/images/delete.png"/>"    />	             		 
	              </a>	              		 
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
			
			
  
</div>
 
</div>
</form:form>
 
<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/lovHeader/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/lovHeader/create.htm";
		form.method='GET';	
		form.submit();
	}
</script>