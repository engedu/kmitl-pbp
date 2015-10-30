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
<form:form  modelAttribute="topic"	action="replyMessage.htm" method="POST" name="mainForm" >   
	<div class="subTopicHeader">Admin View Topic</div> 	
	<div class="searchFormNoBorder">	  
	  <div class="webboardtopicHeader">
	     <c:out value="${topic.topicHeader}"/> 
	     <div class="topicDetail">
	         <c:set var="msg" value="${topic.topicDetail}" scope="page" />
   		 	<c:out value='${msg}' escapeXml="false" />  	       
	     </div> 

	 </div> 
	 
	  <div>
	       <c:if test="${ topic.status == '1'}">
					Enable
				 </c:if>
			    <c:if test="${ topic.status!= '1'}">
					Disable
		 </c:if> 	
	    </div>
</div> 
	<div class="searchResult">  
 	
        <c:forEach items = "${topic.messageList}" var="domain">        
	        <div class="messageDetail">                	   
	         <c:set var="msg" value="${domain.messageDetail}" scope="page" />
	   		 <c:out value='${msg}' escapeXml="false" />  
	   		 <div class="messageDetailUser">  
	   		 	<c:out value="${domain.createBy}"/> &nbsp; <span class="messageDetailDate"><c:out value="${domain.createDateStr}"/></span> 
	   		 	
			   <c:if test="${ domain.status == '1'}">
					Enable
				 </c:if>
			    <c:if test="${ domain.status!= '1'}">
					Disable
				 </c:if> 	
				 | 
			  <a  href="<%=request.getContextPath()%>/admin/webboard/topic/disableMessage.htm?topicId=<c:out  value="${topic.topicId}"/>&messageId=<c:out  value="${domain.messageId}"/>"  >
	             		Disable	             		 
	              </a>	
	            &nbsp;&nbsp;
	             <a  href="<%=request.getContextPath()%>/admin/webboard/topic/enableMessage.htm?topicId=<c:out  value="${topic.topicId}"/>&messageId=<c:out  value="${domain.messageId}"/>"   >
	             		Enable	             		 
	            </a>	  
	               
	   		 </div>
	        </div>    
   		 </c:forEach>   
	</div>
	  <div>
	    <table>
		 <tr>  <td colspan="3">&nbsp; </tr>								
			<tr> 
				<td> </td>
				<td align="left">
				<sec:authorize ifAnyGranted="ROLE_USER">
				 <input class="btn_2" value="<spring:message code="label.button.save"/>"  type="submit" >	
				 </sec:authorize>
				<input class="btn_2" value="<spring:message code="label.button.back"/>"  type="button" onclick="init();">	 
			    </td>
		     </tr>			
		</table>	  
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
 
</script>
	