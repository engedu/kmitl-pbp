<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %> 
 
	
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
<div class="content100">  
<div class="mainContent100"> 
<form:form modelAttribute="menu"	action="search.htm" method="POST" name="mainForm">  
	<div class="subTopicHeader">Menu</div> 	
	<div class="searchFormNoBorder"> 
	<table width="100%">	
		
			<tr>	
				<td class="formLabel">
					 Code:
				</td>
				<td class="formValue">
					<form:input cssClass="tb1"  path="code"  /> 
				</td> 
				<td class="formLabel">
					 Desc:
				</td>
				<td class="formValue">
					<form:input cssClass="tb1"   path="desc"  />  
 
				<input class="btn_2" value="<spring:message code="label.button.search"/>" type="submit"> 	 &nbsp;&nbsp;   
			<!--	<input class="btn_2" value="<spring:message code="label.button.reset"/>" type="button" onclick="init();">	 &nbsp;&nbsp;     --> 
				<input class="btn_2" value="<spring:message code="label.button.new"/>"  type="button" onclick="create();">					
				</td>
			</tr>	
 				
		</table>		
  

	<div class="searchResult">  
	<pg:pager url="search.htm"  items="${pagingBean.totalItems}" 	maxPageItems="${pagingBean.maxPageItems}" maxIndexPages="${pagingBean.maxIndexPages}"	isOffset="<%=true%>" export="offset,currentPageNumber=pageNumber"	scope="request">
 		<pg:param name="maxPageItems" />
		<pg:param name="maxIndexPages" />	

	<table cellspacing="0" style="width: 80%;" >
	<thead>
          <tr  class="searchResultHeader">
         <th class="headerTH">Code</th>
        	<th class="headerTH">Name</th>
        	<th class="headerTH">URL</th>
        	 
        	<th class="headerTH">Status</th>   
        	<th class="headerTH">Order</th>  
        	<th class="headerTH">Down</th>  
        	<th class="headerTH">Up</th>  
        	<th class="headerTH"><spring:message code="label.edit"/></th>   
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
         <tr class="rgRow">           	 	
        	 
        	 <td align="left"> <c:out value="${domain.code}"/>&nbsp;</td>
        	  <td align="left"> <c:out value="${domain.name}"/>&nbsp;</td>
			 <td align="left"> <c:out value="${domain.url}"/>&nbsp;</td>
			 
			  <td align="left"> <c:out value="${domain.statusTxt}"/>&nbsp;</td>
			  <td align="left"> <c:out value="${domain.orderNo}"/>&nbsp;</td>
			  
			  <td align="center"><a href="<%=request.getContextPath()%>/admin/menu/moveDown.htm?menuId=<c:out value="${domain.menuId}"/>&topOrder=<c:out value="${domain.topOrder}"/>&downOrder=<c:out value="${domain.downOrder}"/>&topMenuId=<c:out value="${domain.topMenuId}"/>&downMenuId=<c:out value="${domain.downMenuId}"/>&orderNo=<c:out value="${domain.orderNo}"/>" > Down</a></td>
			   <td align="center"><a href="<%=request.getContextPath()%>/admin/menu/moveUp.htm?menuId=<c:out value="${domain.menuId}"/>&topOrder=<c:out value="${domain.topOrder}"/>&downOrder=<c:out value="${domain.downOrder}"/>&topMenuId=<c:out value="${domain.topMenuId}"/>&downMenuId=<c:out value="${domain.downMenuId}"/>&orderNo=<c:out value="${domain.orderNo}"/>" > Up</a></td>
			  
			 <td align="center">    
	            <a href="<%=request.getContextPath()%>/admin/menu/edit.htm?menuId=<c:out value="${domain.menuId}"/>" >	           
	          	<img src="<c:url value="/images/edit.png"/>" />
	            </a>  			 
			 </td>
			 <td align="center">	                  
	              <a rel="notLoading" href="<%=request.getContextPath()%>/admin/menu/delete.htm?menuId=<c:out  value="${domain.menuId}"/>"  onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.code}"/> ?')">
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
</form:form>
</div>
</div>
<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/menu/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/menu/create.htm";
		form.method='GET';	
		form.submit();
	}
</script>