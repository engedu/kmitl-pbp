<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>

<head>
<script type="text/javascript" src='<c:url value="/js/tiny_mce/jquery.tinymce.js"/>'></script>
<script type="text/javascript">
	$().ready(function() {
		$('textarea.tinymce').tinymce({
			// Location of TinyMCE script
			script_url : '<c:url value="/js/tiny_mce/tiny_mce.js"/>',

			// General options
			theme : "advanced",
			plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,advlist",

			// Theme options
			theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
			theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
			theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
			theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
			theme_advanced_toolbar_location : "top",
			theme_advanced_toolbar_align : "left",
			theme_advanced_statusbar_location : "bottom",
			theme_advanced_resizing : true,

			// Example content CSS (should be your site CSS)
			content_css : "<c:url value="/css/content.css"/>",

			// Drop lists for link/image/media/template dialogs
			template_external_list_url : "lists/template_list.js",
			external_link_list_url : "lists/link_list.js",
			external_image_list_url : "lists/image_list.js",
			media_external_list_url : "lists/media_list.js",

			// Replace values for the template plugin
			template_replace_values : {
				username : "Some User",
				staffid : "991234"
			}
		});
	});
</script>
</head>
<div class="content">  
<form:form modelAttribute="topic"	action="edit.htm" method="POST" name="mainForm">  
	<div class="searchForm">	
	<div class="subTopicHeader">Topic >> Create</div> 
		<table width="100%">
			<tr>	
				<td class="formLabel">
					Topic Name:&nbsp;
				</td>
				<td class="formValue">
				   <c:out value="${topic.topicHeader}"/>
 				</td> 
			</tr>	
			<tr>	
				<td class="formLabel">
					Description:&nbsp;
				</td>
				<td class="formValue">
	 
						<div>
			<form:textarea path="topicDetail" cssClass="tinymce" rows="30" cols="80" style="width: 100%"/>
 	<span class ="require"  >*</span>  <form:errors path="topicDetail" cssClass="require" />
		</div>
				</td> 
			</tr>						

		  
		    <tr>  <td colspan="3">&nbsp; </tr>		
		     <tr>
		     	<td colspan="4"><hr></td>
		     </tr>		      
		        <tr>  <td colspan="3">&nbsp; </tr>	
		     <tr>	
			<td class="formLabel">
				Image or Video : &nbsp;
			</td>
			<td class="formValue">
				 
					<form:input path="fileData" id="uploadFile"   type="file" /> 
					<input class="btn_2" value="Upload"  type="button" onclick="validateUpload();">		
				 
			</td> 
		</tr>
		
			<tr>  <td colspan="3">&nbsp; </tr>								
			<tr> 
				<td> </td>
				<td align="left">
						<input class="btn_2" value="<spring:message code="label.button.save"/>"  type="submit" >	
				<input class="btn_2" value="<spring:message code="label.button.back"/>"  type="button" onclick="init();">	
		    
			    </td>
		     </tr>			
		</table>

	</div>
</form:form>	
</div>
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/webboard/topic/init.htm";
		form.method='GET';	
		form.submit();	
	}

	function validateUpload(){
		var form = document.forms['mainForm']; 	 	 
		//form.action ="<%=request.getContextPath()%>/updown/uploadAndroid.htm";	 
		alert(" validateUpload:"+form.action);
		//form.method='POST';	
		//form.submit();

	}
</script>