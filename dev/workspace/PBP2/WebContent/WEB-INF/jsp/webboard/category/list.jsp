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
 
<div class="content">  
<div class="mainContent"> 
<form:form modelAttribute="category"	action="search.htm" method="POST" name="mainForm">  
	<div class="subTopicHeader">Webboard Category >> ค้นหา</div> 	
	<div class="searchFormNoBorder">		
	
	
<table width="100%">	
		
			<tr>	
				<td class="formLabel">
					Category Name:
				</td>
				<td class="formValue">
					<form:input cssClass="tb1"  path="name"  /> 
				</td> 
				<td class="formLabel">
					Category Desc:
				</td>
				<td class="formValue">
					<form:input cssClass="tb1"   path="desc"  />  
				</td> 
				<td>
				<input class="btn_2" value="<spring:message code="label.button.search"/>" type="submit"> 	 &nbsp;&nbsp;   
				<input class="btn_2" value="<spring:message code="label.button.new"/>"  type="button" onclick="create();">					
				</td>
			</tr>	
 				
		</table>		
  
</div>
	<div class="searchResult">  
	<pg:pager url="search.htm"  items="${pagingBean.totalItems}" 	maxPageItems="${pagingBean.maxPageItems}" maxIndexPages="${pagingBean.maxIndexPages}"	isOffset="<%=true%>" export="offset,currentPageNumber=pageNumber"	scope="request">
 		<pg:param name="maxPageItems" />
		<pg:param name="maxIndexPages" />	

	<table cellspacing="0" style="width: 100%;" >
	<thead>
          <tr  class="searchResultHeader">
      
        	<th class="headerTH">Name</th>         
        	<th class="headerTH">Description</th>   
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
         
        	  <td> <c:out value="${domain.name}"/>&nbsp;</td>			 
			 <td> <c:out value="${domain.desc}"/>&nbsp;</td> 			  
			 <td align="center">    
	            <a href="<%=request.getContextPath()%>/admin/webboard/category/edit.htm?categoryId=<c:out value="${domain.categoryId}"/>" >	           
	          	<img src="<c:url value="/images/edit.png"/>" />
	            </a>  			 
			 </td>
			 <td align="center">	                  
	              <a  href="<%=request.getContextPath()%>/admin/webboard/category/delete.htm?categoryId=<c:out  value="${domain.categoryId}"/>"  onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.name}"/> ?')">
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

</form:form>
</div>
</div>
<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/webboard/category/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/webboard/category/create.htm";
		form.method='GET';	
		form.submit();
	}
</script>