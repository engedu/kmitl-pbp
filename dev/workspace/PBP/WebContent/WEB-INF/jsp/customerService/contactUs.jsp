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
 
	<div class="custServiceDetailHead">Contact Us</div> 	
	<div class="searchFormNoBorder">	
	<div class="custServiceDetailSubHead">  Address </div>	
	<div class="pAddress">
	 
		National Geographic Catalog/Online  <br>
		777 South State Road 7 <br>
		Margate, FL 33068 <br>
		United States<br> 
	 	
	</div>

	
	 <div class="custServiceDetailSubHead">  Tel.: </div>
	 <div class="pAddress"> 02-3664475</div>
	 <div class="custServiceDetailSubHead">  Email: </div>
	 <div class="pAddress"> chawean@gmail.com</div>
	 <div class="custServiceDetailSubHead">  Map</div>
	 <div class="pAddress">	 
	 <img src="<c:url value="/images/contactUs.jpg"/>"/>
	 </div>
 
   </div>
 
 
 