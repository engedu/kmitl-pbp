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
<form:form modelAttribute="evaluate" action="search.htm" method="POST" name="mainForm"> 	  
  <div class="searchForm">	 
 <table width="100%">
  <tr>
   <td width="40%"> <span class="evalHeaderYear"> 
   
   		
   		 <div class="styled-select">
   		  ปีการศึกษา : 
   		 <form:select path="evalYear" id="evalYear" cssClass="styled-select">
			 <!--<form:option value="" label="--- Select ---" /> -->
			 <form:options items="${yearList}" itemValue="name" itemLabel="name" />
		 </form:select>
		 </div>
       
   <td><span class="evalHeader"> 
			 <form:radiobutton  path="evalNo"  id="evalNo0"  value="1" />&nbsp;อาจารย์เทอม(1)&nbsp;&nbsp;
			<form:radiobutton path="evalNo" id="evalNo1" value="2"   />&nbsp;อาจารย์ เทอม(2)&nbsp;&nbsp;
			<form:radiobutton path="evalNo" id="evalNo1" value="2"   />&nbsp;บุคลากร&nbsp;&nbsp;
			<form:radiobutton path="evalNo" id="evalNo1" value="4"   />&nbsp;ทั้งหมด  
		</span>	  
   </td>
   </tr>
   <tr>
   <td width="40%">  &nbsp;   </td>
   <td><span class="evalHeader">  
					<form:input cssClass="tb1"  path="citizenId"  /> <form:errors path="citizenId" cssClass="require" />
					<form:input cssClass="tb1"  path="firstName"  /> <form:errors path="firstName" cssClass="require" />
					<input class="btn_2" value="<spring:message code="label.button.search"/>" type="submit"> 	 &nbsp;&nbsp; 	
			 
		</span>	  
   </td>
   </tr>  
   
 </table>
 
    <table width="100%">
    	<tr>
    	<td width="10%" style="border-right: 1px solid white;">
    	</td> 

    	</tr>
 
    </table>
  
	 

 
	
	
  
 	
</form:form>

</div>
</div>
 
 
</body>
 

<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/kpi/init.htm";
		form.method='GET';	
		form.submit();	
	}
 
	    
</script>
 