<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="kpi"	action="editweightLevel1.htm" method="POST" name="mainForm"> 	 
<div class="post">
		<h2 class="title">Level 1 View</h2>
 	<div id="kpi-tree">
			<div class="searchFormNoBorder">
				<table width="100%">
					<tr> 
						<td class="label-form" align="right" >ปีการศึกษา :</td>
						<td align="left" width="30%">
		 					 <c:out value="${kpi.yearId}"/>
						</td>
				 		 <td class="label-form" align="right" >กลุ่ม KPI:</td>		
						<td width="30%">						
	 						<c:out value="${kpiTree.rootElement.data.name}"/> 
							</td>	 					
					<td>
					 
 				 
					</td>			 
					</tr>
				</table>
 </div>
 </div>
		
	
	<table class="tableSearchResult" style="border: none;">
		<thead >
			<tr>
			    <th width="20%"  align="left"> No   </th>
				<th width="60%"  align="left"> ตัวชี้วัด   </th>
				<th width="20%"   align="left"> นำหนัก (%) </th>
  			</tr>
		</thead>
		<tbody>  
		<c:forEach items="${kpiTree.rootElement.children}" var="domain"  varStatus="status">
		<tr >
		     <td>
		     	<span class="kpiLevel1"><c:out value="${domain.data.childOrder}"/> </span>
		     </td>
		    <td>
				 
				 <span class="kpiLevel1"> <c:out value="${domain.data.name}"/></span> 	 
				  
				</td>
				
				<td>  
					 
					 <input name="kpiTree.rootElement.children[${status.index}].data.weight" value="${domain.data.weight}"/>
				 </td>
		</tr>
		</c:forEach>  
 
 

	</tr>
	
	
	
	</tbody>
	</table>
</div>	

<br><br>
<div  style="width: 100%; text-align: center;">
 		  <input value="<spring:message code="label.button.save"/>" class="btn btn-primary" type="submit" >
		 <input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init();"> 
 </div>

			 	
</form:form>

<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/kpiweight/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	function createNewMapping(){
		
		var form = document.forms['mainForm']; 
		var yearId = form['yearId'].value;
		var categoryId = form['categoryId'].value;
		
		form.action ="<%=request.getContextPath()%>/admin/kpiyear/createNewMapping.htm?yearId="+yearId+"&categoryId="+categoryId;
		//alert(form.action);
		form.method='GET';	
		form.submit();	
	}
	
 
</script>
 