 <%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
<div class="content">  
<div class="mainContent"> 
<form:form  modelAttribute="topic"	action="search.htm" method="POST" name="mainForm" >   
	<div class="subTopicHeader">Admin Topic</div> 	
	<div class="searchFormNoBorder">	  
		<table  width="100%">	
			<tr>	
				<td class="formLabel">
					Topic:
				</td>
				<td class="formValue">
					<form:input cssClass="tb1"  path="topicHeader"  /> 
				</td>  
				<td>
				<input class="btn_2" value="<spring:message code="label.button.search"/>" type="submit"> 	 &nbsp;&nbsp;   				  
				<input class="btn_2" value="<spring:message code="label.button.new"/>"  type="button" onclick="create();">	
				</td>
			</tr>	
		</table> 
</div>
 
	<div class="searchResult">  
	<pg:pager url="search.htm"  items="${pagingBean.totalItems}" 	maxPageItems="${pagingBean.maxPageItems}" maxIndexPages="${pagingBean.maxIndexPages}"	isOffset="<%= true %>" export="offset,currentPageNumber=pageNumber"	scope="request">
		<pg:param name="maxPageItems" />
		<pg:param name="maxIndexPages" />	

	<table cellspacing="0" style="width: 100%;" >
	<thead>
          <tr  class="searchResultHeader">   
          	<th class="headerTH">ID</th>         
        	<th class="headerTH">Topic</th>
        	<th class="headerTH">Create By</th>   
        	<th class="headerTH">Status</th>   
        	<th class="headerTH"><spring:message code="label.edit"/></th>   
        	<th class="headerTH"><spring:message code="label.delete"/></th>   
        	<th class="headerTH">Disable</th>  
        	<th class="headerTH">Enable</th>  
        </tr>
    </thead>
    <c:if test="${empty pagingBean.currentPageItem && doSearch == 'true' }">  	 
    	<tr class="searchNotFound">
    		<td colspan="4" align="center"><spring:message code="message.searchNotFound"/></td>
    	</tr>
    </c:if >
        <c:forEach items = "${pagingBean.currentPageItem}" var="domain">
         <tr class="rgRow"> 
          	<td> <c:out value="${domain.topicId}"/>&nbsp;</td>    	
			 <td> 
	              <a  href="<%=request.getContextPath()%>/admin/webboard/topic/viewTopic.htm?topicId=<c:out  value="${domain.topicId}"/>">
	             	<c:out value="${domain.topicHeader}"/>&nbsp; (<c:out value="${domain.messageCount}"/>)             		 
	              </a>		 
			  </td>
			 <td> <c:out value="${domain.createBy}"/>&nbsp;</td>
			  <td> <c:out value="${domain.status}"/>
			   <c:if test="${ domain.status == '1'}">
					Enable
				 </c:if>
			    <c:if test="${ domain.status!= '1'}">
					Disable
				 </c:if>  
			  
			  </td>
			 
			 <td align="center">    
	            <a href="<%=request.getContextPath()%>/admin/webboard/topic/edit.htm?topicId=<c:out value="${domain.topicId}"/>" >	           
	          	Edit
	            </a>  			 
			 </td>
			 <td align="center">	                  
	              <a  href="<%=request.getContextPath()%>/admin/webboard/topic/delete.htm?topicId=<c:out  value="${domain.topicId}"/>"  onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.topicHeader}"/> ?')">
	             		Delete	             		 
	              </a>	              		 
			 </td>
			 <td align="center">	                  
	              <a  href="<%=request.getContextPath()%>/admin/webboard/topic/disable.htm?topicId=<c:out  value="${domain.topicId}"/>"  >
	             		Disable	             		 
	              </a>	              		 
			 </td>
			 <td align="center">	                  
	              <a  href="<%=request.getContextPath()%>/admin/webboard/topic/enable.htm?topicId=<c:out  value="${domain.topicId}"/>"   >
	             		Enable	             		 
	              </a>	              		 
			 </td>			  
			 
		</tr>              
    </c:forEach>   
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
		form.action ="<%=request.getContextPath()%>/admin/webboard/topic/init.htm";
		form.method='GET';	
		form.submit();	
	}
 

	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/webboard/topic/create.htm";
		form.method='GET';	
		form.submit();
	}
</script>
	