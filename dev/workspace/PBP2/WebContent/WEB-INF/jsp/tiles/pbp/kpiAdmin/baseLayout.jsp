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
	@import url("<c:url value="/css/jquery-ui.css"/>");	
	@import url("<c:url value="/css/jquery-ui-1.8.14.custom.css"/>");
 	@import url("<c:url value="/css/pbp.css"/>"); 
 	@import url("<c:url value="/css/kmitl2.css"/>"); 
 	@import url("<c:url value="/css/style2.css"/>");
 	@import url("<c:url value="/css/webboard.css"/>");
 	
</style>   	
<script type="text/javascript" src='<c:url value="/js/jquery/jquery-1.7.2.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/jquery/jquery-ui-1.8.14.custom.min.js"/>'></script> 
<script type="text/javascript" src='<c:url value="/js/jquery/jquery.blockUI.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/jquery/ui/jquery.ui.datepicker.js"/>'></script> 
<script type="text/javascript" src='<c:url value="/js/common-validate-number.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/jquery/ui/i18n/jquery.ui.datepicker-th.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/jquery/jquery.easy-confirm-dialog.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/tiny_mce/jquery.tinymce.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/loading.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/menu.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/pam.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/common-validate-number.js"/>'></script>
</head>
<body>
		<div  style=" text-align: center;" >	 
				  <img src="<c:url value="/images/top/header.jpg"/>"  />  
		</div> 
		<div class="header" >		 
				<tiles:insertAttribute name="header"/> 
		</div>  
		<div class="page">
		<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
			<tiles:insertAttribute name="main" />  
			<table style="width: 100%; height: 300px;"><tr><td>&nbsp;</td></tr></table>
 		</div> 
 
</body>
</html>