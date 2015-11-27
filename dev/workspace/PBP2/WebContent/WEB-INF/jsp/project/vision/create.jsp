<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %> 
<A NAME="top"></A>
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
<div class="content100">  
<div class="mainContent100"> 
<form:form modelAttribute="vision"	action="create.htm" method="POST" name="mainForm">  

	<div class="subTopicHeader">Vision Create</div>	 
	<br> 
	<div class="usecaseHeaderTxt">
 
    <div class="usecase">
 
      <table  >
 
      	<tr>
      		<td class="usecaseheader">Summary:</td>
      		<td>
	 		&nbsp;<form:textarea cssClass="tinymce" path="summary"  cols="90" rows="4"/>  
      		</td>
      	</tr>      	
       	<tr>
      		<td class="usecaseheader">Actor:</td>
      		<td>
	 			&nbsp;<form:textarea cssClass="tinymce" path="actor"  cols="90" rows="4"/>  
      		</td>
      	</tr>       	
        	<tr>
      		<td class="usecaseheader">Basic Flow:</td>
      		<td > 
      		  <form:textarea path="basicFlow" cssClass="tinymce" rows="10" cols="90" />
  	 			&nbsp; <span class ="require"  >*</span> <form:errors path="basicFlow" cssClass="require" /> 
      		 </td>
      	</tr>      
        	<tr>
      		<td class="usecaseheader">Alternative Flows:</td>
      		<td  >  
 	  			<form:textarea path="alternateFlow" cssClass="tinymce" rows="10" cols="90" /> 
      		</td>
      	</tr>      	
      	 	   
      </table>   
  
 

      <br>
		<input class="btn_2" value="<spring:message code="label.button.save"/>"  type="submit" >	 
		<a href="<%=request.getContextPath()%>/project/requirement/useCase/init.htm?moduleId=<c:out value="${useCase.moduleId}"/>">
		<input class="btn_2" value="<spring:message code="label.button.back"/>"  type="button"  >	
		</a>    
		</div>   
 
	</div>
</form:form>
</div>
</div>
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/project/requirement/useCase/init.htm";
		form.method='GET';	
		form.submit();	
	}
</script>
 
	