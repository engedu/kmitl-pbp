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
	<div class="subTopicHeader">Topic</div> 	
	<div class="searchFormNoBorder">	  
	  <div class="webboardtopicHeader">
	     <c:out value="${topic.topicHeader}"/> 
	     <div class="topicDetail">
	         <c:set var="msg" value="${topic.topicDetail}" scope="page" />
   		 	<c:out value='${msg}' escapeXml="false" />  	       
	     </div> 
	 </div> 
</div> 
	<div class="searchResult">  
 	
        <c:forEach items = "${topic.messageList}" var="domain">        
	        <div class="messageDetail">                	   
	         <c:set var="msg" value="${domain.messageDetail}" scope="page" />
	   		 <c:out value='${msg}' escapeXml="false" />  
	   		 <div class="messageDetailUser">  <c:out value="${domain.createBy}"/> &nbsp; <span class="messageDetailDate"><c:out value="${domain.createDateStr}"/></span></div>
	        </div>    
   		 </c:forEach>  
   		  <sec:authorize ifAnyGranted="ROLE_USER">	 
   		 <div class="messageReply"> 
   		  <form:errors path="replyMessage" cssClass="require" />
   		 	<form:textarea path="replyMessage" cssClass="tinymce" rows="10" cols="80" />
   		 	<span class ="require"  >*</span> 
   		 </div> 
   		 </sec:authorize>
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
				  
				<a href="<%=request.getContextPath()%>/webboard/topic/init.htm?catType=GENERAL">
				<input class="btn_2" value="<spring:message code="label.button.back"/>"  type="button"  >	
				</a>    				
				
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
		form.action ="<%=request.getContextPath()%>/webboard/topic/init.htm?catType=GENERAL";
		alert("action:"+form.action);
		form.method='GET';	
		form.submit();	
	}
 
</script>
	