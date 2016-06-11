<!DOCTYPE html><%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page import="com.buckwa.domain.*"%> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>  
  <meta name="viewport" content="width=device-width" />
  <title>PBP</title>  	
  
  
  
  
     <link rel="stylesheet" href="<c:url value='/assets/css/bootstrap.css'/>"> 
    <link rel="stylesheet" href="<c:url value='/assets/css/font-awesome.css'/>"> 
    <link rel="stylesheet" href="<c:url value='/assets/js/morris/morris-0.4.3.min.css'/>"> 
 	 <link rel="stylesheet" href="<c:url value='/assets/css/custom-styles.css'/>"> 
 	 
 	 
 	 
        <script type="text/javascript" src='<c:url value="/assets/js/jquery-1.10.2.js"/>'></script> 
   <script type="text/javascript" src='<c:url value="/assets/js/bootstrap.min.js"/>'></script> 
    <script type="text/javascript" src='<c:url value="/assets/js/jquery.metisMenu.js"/>'></script> 
   <script type="text/javascript" src='<c:url value="/assets/js/morris/raphael-2.1.0.min.js"/>'></script>
    <script type="text/javascript" src='<c:url value="/assets/js/morris/morris.js"/>'></script> 
   <script type="text/javascript" src='<c:url value="/assets/js/custom-scripts.js"/>'></script>
   
  
  
  
	<link rel="stylesheet" href="<c:url value='/css/buckwa.css'/>">
	<link rel="stylesheet" href="<c:url value='/css/suite.css'/>">
  	<link rel="stylesheet" href="<c:url value='/stylesheets/foundation.css'/>">
<%--   	<link rel="stylesheet" href="<c:url value='/stylesheets/foundation.min.css'/>"> --%>
	<link rel="stylesheet" href="<c:url value='/stylesheets/main.css'/>">
	<link rel="stylesheet" href="<c:url value='/stylesheets/app.css'/>"> 
	<link rel="stylesheet" href="<c:url value='/kendo/styles/kendo.common.min.css'/>"> 
	<link rel="stylesheet" href="<c:url value='/kendo/styles/kendo.default.min.css'/>"> 
	<link rel="stylesheet" href="<c:url value='/kendo/styles/kendo.dataviz.min.css'/>"> 
	<link rel="stylesheet" href="<c:url value='/kendo/styles/kendo.dataviz.default.min.css'/>">
	<script type="text/javascript" src='<c:url value="/javascripts/modernizr.foundation.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/js/jquery/jquery-1.7.2.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/jquery/jquery-ui-1.8.14.custom.min.js"/>'></script> 
<script type="text/javascript" src='<c:url value="/js/jquery/jquery.blockUI.js"/>'></script> 
<script type="text/javascript" src='<c:url value="/js/common-validate-number.js"/>'></script> 
<script type="text/javascript" src='<c:url value="/js/jquery/jquery.easy-confirm-dialog.js"/>'></script>  
<script type="text/javascript" src='<c:url value="/js/tiny_mce/jquery.tinymce.js"/>'></script>

<script type="text/javascript" src='<c:url value="/js/pbp.js"/>'></script> 
  
  <!-- IE Fix for HTML5 Tags -->
  <!--[if lt IE 9]>   
    <script type="text/javascript" src='<c:url value="http://html5shiv.googlecode.com/svn/trunk/html5.js"/>'></script>
  <![endif]-->
</head>
<body>
	
	<div class="head_div">
	<tiles:insertAttribute name="header"/>	
	</div> 
	
	<section class="twelve columns" style="padding-left: 2%;"> 
	<div class="right_main" style="margin-top: 2px;">
	<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
	<tiles:insertAttribute name="main"/>	
	</div> 
	</section>   
	
	<div class="foot_div">
	<tiles:insertAttribute name="footer"/>	
	</div>
	
	<script type="text/javascript" src='<c:url value="/javascripts/foundation.min.js"/>'></script>		
	<script type="text/javascript" src='<c:url value="/javascripts/app.js"/>'></script>		
	<script type="text/javascript" src='<c:url value="/kendo/js/angular.min.js"/>'></script>
	<script type="text/javascript" src='<c:url value="/kendo/js/kendo.all.min.js"/>'></script>	
	</body>
</html>