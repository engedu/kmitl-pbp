<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="academicKPI" action="create.htm" method="POST" name="mainForm"> 	 
<form:hidden path="academicYear"/>
 
<div class="post">
  
<div class="entry">	 
	
	
		 <div class="pbptableWrapper">
          
             
			<table class="pbp-table">
 		 			 
 		 
		   	   	<thead>
		   	   		<tr>
		   	   		
		   	   		<th  colspan="2">   สร้างภาระงาน    &nbsp;
 					
					</th>
 					</tr>
 
		   	   	</thead>			
			 
			  <tbody> 
			<tr>
				<td class="tdFirst">ชื่อภาระงาน:</td>
				<td class="tdLast"><form:input cssClass="input" path="name"/> <span class="require">*</span> <form:errors
					path="name" cssClass="require" /></td>
			</tr>
			<tr>
				<td class="tdFirst">คะแนน:</td>
				<td class="tdLast"><form:input path="mark" maxlength="10" cssClass="input"/> <span class="require">*</span> <form:errors
					path="mark" cssClass="require" /></td>
			</tr>
			<tr>
				<td class="tdFirst">หน่วย:</td>
				<td class="tdLast">
					<form:select path="unitCode"  >
		     			<option value="0" label=" - Select - " ></option>
		     			<form:options items="${academicKPI.academicUnitList}" itemLabel="name" itemValue="code"/>
		     			  <span class="require">*</span> <form:errors
					path="unitCode" cssClass="require" />
					</form:select>
					
				</td>
			</tr>
			 <tr>
				<td class="tdFirst">ตัวคูณ:</td>
				<td class="tdLast"><form:input path="multiplyValue" maxlength="10" cssClass="input"/> </td>
			</tr>	 
			
				 <tr>
				<td class="tdFirst">ลำดับการจัดเรียง:</td>
				<td class="tdLast"><form:input path="orderNo" maxlength="10" cssClass="input"/> </td>
			</tr>	
				<tr>
				<td class="tdFirst">หมายเหตุ:</td>
				<td class="tdLast"><form:input path="description" size="80" cssClass="input"/> </td>
			</tr>
			
			</tbody>	 
		</table>
 
    </div>
    
 
 
	<br><br><br>
	<div class="back_center">	
	<input class="btn btn-primary"	value="<spring:message code="label.button.save"/>" type="submit" >	
	 &nbsp;
	<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init();">
	</div>
	
</div>

 </div>
 
</form:form>
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/academicKPI/init.htm";
		form.method='GET';	
		form.submit();	
	}
 
</script>
 