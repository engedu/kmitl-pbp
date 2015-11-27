<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.AuthenticationException"%> 
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="com.buckwa.util.*" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %> 
<%@ page import="com.buckwa.domain.project.*" %>  
<%@ page import="com.buckwa.domain.admin.Menu" %>  
 

<A NAME="top"></A>
 <% 
 
List<LabCategory> labCategoryList =   httpRequest.getSession().getAttribute("labCategoryList"); 
 
 
%>
<div class="content100">  
<div class="topProject">
 
 
	  <table width="100%">
	  	<tr>
	  		<td width="50%"> 
               		  <%
 		  if(labCategoryList!=null&&labCategoryList.size()>0){
 			%> 
			<table>	
			<tr>
 			<%  
 	 		    for(LabCategory labCatTmp :labCategoryList){
 	 		    	%> 	 			<td>    
 	 		        &nbsp;|<span class="top"><a href="<%=request.getContextPath()%>/project/vision/init.htm?projectId=<%=labCatTmp.getLabCategoryId()%>"> <%=labCatTmp.getName()%>   </a></span>
   	 		    	</td>
 	 		    	<% 
 	 		    }
 			%>
 			</tr>
 				</table>
 			<%  
 		  } 		  
 		  %>	 
	  		</td>
	  		
	  		<td>
 		  
	  		</td>
	  	</tr>
	  </table> 
 
</div>
</div>

 
	