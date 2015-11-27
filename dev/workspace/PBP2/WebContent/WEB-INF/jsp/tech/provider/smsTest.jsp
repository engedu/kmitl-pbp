<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%-- <%@ page import="com.buckwa.sms.*" %> --%>

<%@ page import="java.util.*" %>  
<div class="content100">  
<div class="mainContent100"> 
 
 <form:form modelAttribute="smsDomain"	action="testSMS.htm" method="POST" name="mainForm">  
	 <div class="headerTech"> 
	  	Send SMS
	<br>
	<br> 

	
	<table class="searchResultTable" >
	<thead class="tableHeader">
       	<tr>
      		<td class="usecaseheader">To:</td>
      		<td>
      		
		 &nbsp;<form:input cssClass="tb300" path="sendToNo" /><span class ="require"  >*</span> <form:errors path="sendToNo" cssClass="require" />
       		
      		</td>
      	</tr>
      	<tr>
      		<td class="usecaseheader">Message:</td>
      		<td>
	 		&nbsp;<form:textarea  path="smsBody"  cols="90" rows="4"/>  <span class ="require"  >*</span> <form:errors path="smsBody" cssClass="require" />
      		</td>
      	</tr>
    </thead>
 
    </table>
     <br>
    <br>  
      <br>
	  
		<input class="btn_2" value="Send Message"  type="submit"  >	
		 
		 
	 </div> 
 </form:form>
 </div>
 </div>
 
 