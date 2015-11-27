<!DOCTYPE html><%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page import="buckwa.domain.*"%> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>  
  <meta name="viewport" content="width=device-width" />
  <title>PBP</title>  	
 
	
		<link rel="stylesheet" href="<c:url value='/kendo/styles/custom.css'/>"> 
		<link rel="stylesheet" href="<c:url value='/kendo/styles/kendo.common.min.css'/>"> 
		<link rel="stylesheet" href="<c:url value='/kendo/styles/kendo.default.min.css'/>"> 
		<link rel="stylesheet" href="<c:url value='/kendo/styles/kendo.dataviz.min.css'/>"> 
		<link rel="stylesheet" href="<c:url value='/kendo/styles/kendo.dataviz.default.min.css'/>"> 
   	

<script type="text/javascript" src='<c:url value="/kendo/js/jquery.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/kendo/js/angular.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/kendo/js/kendo.all.min.js"/>'></script> 
</head>
<body>
 
	<div class="head_div">
	
	<tiles:insertAttribute name="header"/>	
	</div> 
	<div class="right_main">
	<%@include file="/WEB-INF/jsp/common/headerInfo.jsp" %>
	<tiles:insertAttribute name="main"/>	
	</div>
	<div class="foot_div">
	<tiles:insertAttribute name="footer"/>	
	</div>   			
 
	</body>
</html>