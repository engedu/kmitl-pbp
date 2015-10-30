<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.buckwa.domain.*"%>
<%@ page import="java.util.*"%>
 

 <form:form modelAttribute="kpiYearMapping" action="createNewMapping.htm" method="POST" name="mainForm">
		
	<div class="post">
	<h2 class="title">เลือกปีการศึกษา และ กลุ่ม KPI</h2>
	
	<br>
	<div id="kpi-tree">
			<div class="searchFormNoBorder">
				<table width="100%">
					<tr> 
						<td class="label-form" align="right" >ปีการศึกษา :</td>
						<td align="left" width="20%">
							<form:select path="yearId" id="year-dropdown"   >
  									<form:option value="0" label="--- กรุณาเลือก---" />   
									<form:options items="${yearList}" itemValue="yearId" itemLabel="name" />
							</form:select> 			
							<span class="require">*</span> <form:errors path="yearId" cssClass="require" />				
						</td>
				 		 <td class="label-form" align="right" >กลุ่ม KPI:</td>		
						<td width="20%">						
						 <form:select path="categoryId" id="year-dropdown"   >
  									<form:option value="0" label="--- กรุณาเลือก---" />   
									<form:options items="${kpiCategoryList}" itemValue="kpiCategoryId" itemLabel="name" />
							</form:select> 
							<span class="require">*</span> <form:errors path="categoryId" cssClass="require" />
							</td>	 					
					<td>
					<input value="Create" type="submit" class="btn btn-primary">						
					<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init();"></td>			
					</td>			 
					</tr>
				</table>
			</div>


</div>
</div> 
		</form:form> 
</body>


<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/kpiyear/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
 
	
 
</script>
