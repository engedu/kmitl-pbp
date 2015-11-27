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
<title>PBP2</title>
<style type="text/css" media="screen">
	@import url("<c:url value="/css/style.css"/>");  
	@import url("<c:url value="/css/properties.css"/>");    
	@import url("<c:url value="/css/fullcalendar.css"/>");		
	@import url("<c:url value="/css/popup.css"/>");	
	@import url("<c:url value="/css/menu.css"/>");
</style>   	
<style type="text/css" media="print">
	@import url("<c:url value="/css/fullcalendar.print.css"/>");
</style>  
<script type="text/javascript" src='<c:url value="/js/jquery/jquery-1.7.2.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/jquery/jquery-ui-1.8.14.custom.min.js"/>'></script> 
<script type="text/javascript" src='<c:url value="/js/fullcalendar/fullcalendar.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/jquery.leanModal.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/jquery/jquery.blockUI.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/loading.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/menu.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/pam.js"/>'></script>
<style type='text/css'>
	#calendar {
		width: 900px;
		margin: 0 auto;
	}
	div#menu-sub { margin:0px auto; }
</style>
</head>
<body>
<div id="wrapper">
	<div id="header-wrapper">
		<div id="header" style="height: 190px;">
			<%@include file="/WEB-INF/jsp/common/headerInfo.jsp" %>
			<div id="menuheader">
				<tiles:insertAttribute name="subheader"/>
			</div>
		</div>
		<tiles:insertAttribute name="menu"/>
	</div>
	<!-- end #header -->
	<div id="page">

		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div style="clear: both;">		 
					<tiles:insertAttribute name="main" />
					<div style="clear: both;">&nbsp;</div>
				</div>
				<!-- end #content -->
			</div>
		</div>
	</div>
	
	<!-- end #page -->
</div>

<div id="footer">
	<tiles:insertAttribute name="footer" />
</div>
<!-- end #footer -->
</body>
</html>