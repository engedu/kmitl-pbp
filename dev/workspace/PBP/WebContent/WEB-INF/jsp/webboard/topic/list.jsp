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
<div class="content100">  
<div class="mainContent100"> 
<form:form  modelAttribute="topic"	action="search.htm" method="POST" name="mainForm" >   
	<div class="subTopicHeader">Topic   &nbsp;	
	 <sec:authorize ifAnyGranted="ROLE_USER">
	  <a href="<%=request.getContextPath()%>/webboard/topic/create.htm" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
		 </a> 
		 </sec:authorize> 
	 </div> 	 

	<pg:pager url="search.htm"  items="${pagingBean.totalItems}" 	maxPageItems="${pagingBean.maxPageItems}" maxIndexPages="${pagingBean.maxIndexPages}"	isOffset="<%= true %>" export="offset,currentPageNumber=pageNumber"	scope="request">
		<pg:param name="maxPageItems" />
		<pg:param name="maxIndexPages" />	
		
 
	
	
    <div class="webboardWrapper">	
	 
    <c:if test="${empty pagingBean.currentPageItem && doSearch == 'true' }">  	 
    	<div class="searchNotFound">
    		 <spring:message code="message.searchNotFound"/> 
    	</div>
    </c:if > 
    
     	  
 				 
 	 <c:forEach items = "${pagingBean.currentPageItem}" var="domain">
		       
			    <div class="topicList"> 
			      		
							<a  href="<%=request.getContextPath()%>/webboard/topic/viewTopic.htm?topicId=<c:out  value="${domain.topicId}"/>">
			             	<c:out value="${domain.topicHeader}"/>&nbsp; (<c:out value="${domain.messageCount}"/>)         		 
			              	</a>	
		               
							<c:out value="${domain.createBy}"/>&nbsp;
						 
		      	 </div>
	 </c:forEach>
 
	 </div>
 
	
	
		<div class="footerPaging">
		<pg:index>
			<jsp:include page="/WEB-INF/jsp/common/paging.jsp" flush="true" />
		</pg:index>				
		</div>
	</pg:pager>

</form:form>
</div>
</div>
<script type="text/javascript">

	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/webboard/topic/init.htm";
		form.method='GET';	
		form.submit();	
	} 

	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/webboard/topic/create.htm";
		form.method='GET';	
		form.submit();
	}
</script>
	