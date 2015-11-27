<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
create<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %> 
<A NAME="top"></A>
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
<div class="content100">  
<div class="mainContent100"> 
<form:form modelAttribute="detailDesign"	action="create.htm" method="POST" name="mainForm">  

	<div class="subTopicHeader"><c:out value="${detailDesign.moduleName}"/> <br> Detail Design Create</div>	 
	<br> 
	<div class="usecaseHeaderTxt">
 
    <div class="usecase">
 

 
      <table  >
      	<tr>
      		<td class="usecaseheader">Name:</td>
      		<td>
      		
	 &nbsp;<form:input cssClass="tb300" path="name" /><span class ="require"  >*</span> <form:errors path="name" cssClass="require" />

      		
      		</td>
      	</tr>
      	<tr>
      		<td class="usecaseheader">Summary:</td>
      		<td>
	 		&nbsp;<form:textarea cssClass="tinymce" path="summary"  cols="120" rows="5"/>  
      		</td>
      	</tr>      	
  
       	<tr>
      		<td class="usecaseheader">Step:</td>
      		<td>
	 		&nbsp;<form:textarea cssClass="tinymce" path="step"  cols="120" rows="20"/>  
      		</td>
      	</tr>    
      	
      	<tr>
      		<td class="usecaseheader">Database:</td>
      		<td>
	 		&nbsp;<form:textarea cssClass="tinymce" path="dataPart"  cols="120" rows="10"/>  
      		</td>
      	</tr>          	     	
      	      	 
      </table>    
      <br>
		<input class="btn_2" value="<spring:message code="label.button.save"/>"  type="submit" >	 
		<a href="<%=request.getContextPath()%>/project/requirement/detailDesign/init.htm?moduleId=<c:out value="${detailDesign.moduleId}"/>">
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
		form.action ="<%=request.getContextPath()%>/project/requirement/detailDesign/init.htm";
		form.method='GET';	
		form.submit();	
	}
</script>
 
	