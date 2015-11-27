<!DOCTYPE html><%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page import="com.buckwa.domain.*"%> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<head>  
  <meta name="viewport" content="width=device-width" />
  <title>PBP</title>  	
	<link rel="stylesheet" href="<c:url value='/css/buckwa.css'/>">
	<link rel="stylesheet" href="<c:url value='/css/suite.css'/>">
  	<link rel="stylesheet" href="<c:url value='/stylesheets/foundation.min.css'/>">
	<link rel="stylesheet" href="<c:url value='/stylesheets/main.css'/>">
	<link rel="stylesheet" href="<c:url value='/stylesheets/app.css'/>"> 
 
 
	<script type="text/javascript" src='<c:url value="/javascripts/foundation.min.js"/>'></script>		
	<script type="text/javascript" src='<c:url value="/javascripts/app.js"/>'></script>	
  
  <!-- IE Fix for HTML5 Tags -->
  <!--[if lt IE 9]>   
    <script type="text/javascript" src='<c:url value="http://html5shiv.googlecode.com/svn/trunk/html5.js"/>'></script>
  <![endif]-->
<body>
	<div class="head_div">
	
	<tiles:insertAttribute name="header"/>	
	</div> 
	<section class="twelve columns">
	<div class="one columns"></div>  
	<div class="ten columns">
	<div class="right_main">
	<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
	<tiles:insertAttribute name="main"/>	
	</div>
	</div>
	<div class="one columns"></div>
	</section>   
	<div class="foot_div">
	<tiles:insertAttribute name="footer"/>	
	</div>
 
	</body>
</html>