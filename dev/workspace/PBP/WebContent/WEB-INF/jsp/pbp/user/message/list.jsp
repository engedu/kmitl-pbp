<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="message" action="search.htm" method="POST" name="mainForm"> 	 

<div class="post">
 
	<div class="entry"> 
	
		 <div class="pbptableWrapper">
            

            

 
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table width="100%" id="tableSearch">
		<thead><tr><th colspan="3">
		<div class="pbp-header"><span class="lsf-icon colororange" title="list" ></span> ข้อความ </div>
		</th></tr></thead>
			<tr>
				<td class="label-form">ข้อความ:</td>
				<td><form:input cssClass="input" path="messageDetail" />
					 <input
					value="<spring:message code="label.button.search"/>" type="submit" class="btn btn-primary">
				</td>
	
				<td  align="right"><input
					value="เขียนข้อความ" type="button" class="btn btn-primary" onclick="create();"></td>
			</tr>
		</table>
		<div class="line">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
		<div>
				<pg:pager url="search.htm"
					items="${pagingBean.totalItems}"
					maxPageItems="${pagingBean.maxPageItems}"
					maxIndexPages="${pagingBean.maxIndexPages}" isOffset="<%= true %>"
					export="offset,currentPageNumber=pageNumber" scope="request">
				<pg:param name="maxPageItems" />
				<pg:param name="maxIndexPages" />
		
				<table class="pbp-table">
					<thead >
						<tr>
						 
							<th class="headerTH">ข้อความ</th>
							<th class="headerTH"><spring:message code="label.edit" /></th>
							 
						</tr>
					</thead>
					<tbody>
						<c:if
							test="${empty pagingBean.currentPageItem && doSearch == 'true' }">
							<tr >
								<td align="center">
									<div class="searchNotFound"><spring:message code="message.searchNotFound" /></div>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${pagingBean.currentPageItem}" var="domain">
							<tr>
								 
								<td align="left"><c:out value="${domain.messageDetail}"/>&nbsp;</td>
		
								<td align="center"><a
									href="<%=request.getContextPath()%>/message/edit.htm?messageId=<c:out value="${domain.messageId}"/>">
								<img src="<c:url value="/images/edit.png"/>" /> </a></td>
					 
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="footerPaging"><pg:index>
					<jsp:include page="/WEB-INF/jsp/common/paging.jsp" flush="true" />
				</pg:index></div>
			</pg:pager>
		</div>
	</div>
	</div>
	</div>
	
</div>
</form:form>
<div id="confirm" style="display:none">                    
    <div class="confirmheader"><span>Confirm</span></div>
        <p class="confirmmessage"></p>
    <div class="confirmbuttons">            
        <button id="ButtonYes" class="yui-button">Yes</button>&nbsp;
        <button id="ButtonNo" class="yui-button modalClose">No</button>
    </div>
</div>  
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/message/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/message/create.htm";
		form.method='GET';	
		form.submit();
	}
	function chkConfirm() {
       
	if(confirm('Do you want to visit : http://www.thaicreate.com')==true) 	{ 
	            
	alert('Going to http://www.thaicreate.com'); 
           
	window.location = 'http://www.thaicreate.com'; 
        
	} else {             
		alert('You selected to cancel.');         
	} 
   
	} 

	
 
	 jQuery(document).ready(function () {    

	 
		 var execute = function() {
			 alert(" excecute");
		 };
		 var cancel = function() {
			 alert("cancel");
		 };
		 
	 var dialogOpts = {
			 autoOpen: false,
			 title: '<a href="#">A link title!</a>',
			 width: 300,
			 height: 300,
			 minWidth: 150,
			 minHeight: 150,
			 maxWidth: 450,
			 maxHeight: 450,
			 buttons: {
				 "Ok": execute,
				 "Cancel": cancel
			 }
			 };


		 
	    	$('.deleteItem').click( function(e) {		    	
	    	    var name=   $(this).attr('name');  
	    	    alert("deleteItem name:"+name);
				$( this ).dialog(dialogOpts);

				return false;
	    	} ); 
		 

	    });

	    
</script>
 