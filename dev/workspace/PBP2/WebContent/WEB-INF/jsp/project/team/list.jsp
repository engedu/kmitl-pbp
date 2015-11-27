<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
<div class="content100">  
<div class="mainContent100"> 
<form:form  modelAttribute="project"	action="search.htm" method="POST" name="mainForm"> 
	<div class="subTopicHeader"><c:out value="${projectName}"/> Team	
			<sec:authorize ifAnyGranted="ROLE_PROJECT_SA">
			<a href="<%=request.getContextPath()%>/project/team/create.htm" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
			</a>  
		</sec:authorize>
	</div> 			
	<div class="searchFormNoBorder">	
	<div class="leftHeaderTxt">Project Manager	</div>
	 <div class="usecase">	 
		      <table  > 
		      	<tr>  		      	
		      		<td class="usecaseheader"  colspan="2">		      		  
		      		<img   src="<%=request.getContextPath()%>/servlet/Image?<c:out value='D:/2012/Project/Huaywa/Dev/wean.jpg'  />" width="25px;" height="30px;"/>
		      		สมศัก ตั้งสิริ
		      		</td>
		      		<td >12/03/2012 - 01/02/2013</td>
		      		<td ><a href="#">Profile</a></td>
		      		<td ><a href="#">การจ่ายเงิน</a></td>
		      	</tr>      	
 		      	<tr>
		      		<td class="usecaseheader"  colspan="2">		      		  
		      		<img   src="<%=request.getContextPath()%>/servlet/Image?<c:out value='D:/2012/Project/Huaywa/Dev/wean.jpg'  />" width="25px;" height="30px;"/>
		      		สมศัก ตั้งสิริ
		      		</td>
		      		<td >01/02/2013 - Current</td>
		      		<td ><a href="#">Profile</a></td>
		      		<td ><a href="#">การจ่ายเงิน</a></td>
		      	</tr>    		      	 	   
		      </table> 	 
	 </div>  
 	<div class="leftHeaderTxt">SA	</div>
	 <div class="usecase">	 
		      <table  > 
		      	<tr>
		      		<td class="usecaseheader"  colspan="2">		      		  
		      		<img   src="<%=request.getContextPath()%>/servlet/Image?<c:out value='D:/2012/Project/Huaywa/Dev/wean.jpg'  />" width="25px;" height="30px;"/>
		      		สมศัก ตั้งสิริsaasfsfsaf
		      		</td>
		      		<td >12/03/2012 - 01/02/2013</td>
		      		<td ><a href="#">Profile</a></td>
		      		<td ><a href="#">การจ่ายเงิน</a></td>
		      	</tr>      	
 		      	<tr>
		      		<td class="usecaseheader"  colspan="2">		      		  
		      		<img   src="<%=request.getContextPath()%>/servlet/Image?<c:out value='D:/2012/Project/Huaywa/Dev/wean.jpg'  />" width="25px;" height="30px;"/>
		      		สมศัก ตั้งสิริ
		      		</td>
		      		<td >01/02/2013 - Current</td>
		      		<td ><a href="#">Profile</a></td>
		      		<td ><a href="#">การจ่ายเงิน</a></td>
		      	</tr>    	 	   
		      </table> 	 
	 </div>  
	 
 	<div class="leftHeaderTxt">Developer	</div>
	 <div class="usecase">	 
		      <table  > 
		      	<tr>
		      		<td class="usecaseheader"  colspan="2">		      		  
		      		<img   src="<%=request.getContextPath()%>/servlet/Image?<c:out value='D:/2012/Project/Huaywa/Dev/wean.jpg'  />" width="25px;" height="30px;"/>
		      		สมศัก ตั้งสิริ
		      		</td>
		      		<td >12/03/2012 - 01/02/2013</td>
		      		<td ><a href="#">Profile</a></td>
		      		<td ><a href="#">การจ่ายเงิน</a></td>
		      	</tr>      	
 		      	<tr>
		      		<td class="usecaseheader"  colspan="2">		      		  
		      		<img   src="<%=request.getContextPath()%>/servlet/Image?<c:out value='D:/2012/Project/Huaywa/Dev/wean.jpg'  />" width="25px;" height="30px;"/>
		      		สมศัก ตั้งสิริ
		      		</td>
		      		<td >01/02/2013 - Current</td>
		      		<td ><a href="#">Profile</a></td>
		      		<td ><a href="#">การจ่ายเงิน</a></td>
		      	</tr>    		      	 	   
		      </table> 	 
	 </div> 		 
 	<div class="leftHeaderTxt">Tester	</div>
	 <div class="usecase">
	 		      <table  > 
		      	<tr>
		      		<td class="usecaseheader">สมศัก ตั้งสิริ</td>
		      		<td >12/03/2012 - 01/02/2013</td>
		      		<td ><a href="#">Profile</a></td>
		      		<td ><a href="#">การจ่ายเงิน</a></td>
		      	</tr>      	
 		      	<tr>
		      		<td class="usecaseheader">อุทัย พิมจันทร์</td>
		      		<td >01/02/2013 - Current</td>
		      		<td ><a href="#">Profile</a></td>
		      		<td ><a href="#">การจ่ายเงิน</a></td>
		      	</tr>    		      	 	   
		      </table> 	 
	 </div> 	 	 
	</div> 
</form:form>
</div>
</div>