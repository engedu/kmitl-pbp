<!DOCTYPE html><%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.buckwa.domain.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="shortcut icon" href="../images/favicon.ico">
<title>ระบบภาระงานบุคลากรสายวิชาการ  (PBP)</title>
<style type="text/css" media="screen">
	@import url("<c:url value="/kendo/styles/custom.css"/>");  
	@import url("<c:url value="/kendo/styles/kendo.common.min.css"/>");  
	@import url("<c:url value="/kendo/styles/kendo.default.min.css"/>");  
	@import url("<c:url value="/kendo/styles/kendo.dataviz.min.css"/>");	
	@import url("<c:url value="/kendo/styles/kendo.dataviz.default.min.css"/>");
</style>   	

<script type="text/javascript" src='<c:url value="/kendo/js/jquery.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/kendo/js/angular.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/kendo/js/kendo.all.min.js"/>'></script> 
 
</head>
<body>
 		<div  style=" text-align: center;" >	 
				  <img src="<c:url value="/images/top/header.jpg"/>"  />  
		</div> 
 
		<div class="header" >	 
				<tiles:insertAttribute name="header"/> 
		</div>
 
				 
		<div class="pageInfo">
			<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
		</div>
		
		<div class="page">
			<tiles:insertAttribute name="main" />
			<table style="width: 100%; height: 400px;"><tr><td>&nbsp;</td></tr></table>
		</div>			
					
		
					 
    	
 
	<!-- end #page -->
 
<div class="footer">
	<tiles:insertAttribute name="footer" />
</div>
<!-- end #footer -->
</body>
</html>