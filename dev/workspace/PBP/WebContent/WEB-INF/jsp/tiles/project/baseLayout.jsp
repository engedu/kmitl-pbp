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
	@import url("<c:url value="/css/main.css"/>");  
	@import url("<c:url value="/css/jquery-ui.css"/>");	
	@import url("<c:url value="/css/product.css"/>"); 
	@import url("<c:url value="/css/webboard.css"/>");  
	@import url("<c:url value="/css/project.css"/>");  
</style>   	
<script type="text/javascript" src='<c:url value="/js/jquery/jquery-1.7.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/jquery/jquery-ui-1.8.14.custom.min.js"/>'></script> 
<script type="text/javascript" src='<c:url value="/js/jquery/ui/jquery.ui.datepicker.js"/>'></script> 
<script type="text/javascript" src='<c:url value="/js/jquery/ui/i18n/jquery.ui.datepicker-th.js"/>'></script>

 <script type="text/javascript" src='<c:url value="/js/tiny_mce/jquery.tinymce.js"/>'></script>
 <script type="text/javascript" src='<c:url value="/js/common-validate-number.js"/>'></script>
<script type="text/javascript">
	$().ready(function() {

		setTimeout('$("#post-msg").hide()', 3000);
		
		$('textarea.tinymce').tinymce({
			// Location of TinyMCE script
			script_url : '<c:url value="/js/tiny_mce/tiny_mce.js"/>',

			// General options
			//theme : "advanced",
			//plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,advlist",

			// Theme options
			//theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
			//theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
			//theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
			//theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
			//theme_advanced_toolbar_location : "top",
			//theme_advanced_toolbar_align : "left",
			//theme_advanced_statusbar_location : "bottom",
			theme_advanced_resizing : true,

			// Example content CSS (should be your site CSS)
			//content_css : "<c:url value="/css/content.css"/>",

			// Drop lists for link/image/media/template dialogs
			//template_external_list_url : "lists/template_list.js",
			//external_link_list_url : "lists/link_list.js",
			//external_image_list_url : "lists/image_list.js",
			//media_external_list_url : "lists/media_list.js",

			// Replace values for the template plugin
			template_replace_values : {
				username : "Some User",
				staffid : "991234"
			}
		});
	});
</script>
 
</head>
<body class="body">
<div class="outbound">
<div class="inbound">
<table class="main" width="100%"  cellpadding="0"	cellspacing="0"> 
	<tr>
		<td valign="top">
			<!--  <div class="header"><tiles:insertAttribute name="header" /></div>-->
		<div class="subheader"><tiles:insertAttribute name="subheader" /></div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td  align="left" valign="top">
				<tiles:insertAttribute name="top" />
				</td>
			</tr>
	      <tr >   
	        <td  align="left" valign="top" >
	        <tiles:insertAttribute name="main" />
	        </td>
	      </tr>
		</table>
		<div class="footer"><tiles:insertAttribute name="footer" /></div>
		</td>
	</tr>
</table>
</div>
</div>
</body>
</html>