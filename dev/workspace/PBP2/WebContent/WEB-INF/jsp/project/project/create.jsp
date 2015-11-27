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
<form:form modelAttribute="project"	action="create.htm" method="POST" name="mainForm">  
	<div class="subTopicHeader">Project Create </div>	 
	<br> 
	<div class="usecaseHeaderTxt"> 
    <div class="usecase"> 
	 &nbsp;<form:textarea cssClass="tb200" path="projectName"  /><span class ="require"  >*</span> <form:errors path="projectName" cssClass="require" />
      <br>
      <br>
      <br>
	 <input class="btn_2" value="<spring:message code="label.button.save"/>"  type="submit" >	 
	<a href="<%=request.getContextPath()%>/project/init.htm">
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
		form.action ="<%=request.getContextPath()%>/project/init.htm";
		form.method='GET';	
		form.submit();	
	}
</script>
 
	