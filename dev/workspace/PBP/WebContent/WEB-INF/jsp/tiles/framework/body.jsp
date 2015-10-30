<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<div class="content100">  
<div class="mainContent100"> 
 <div class="frameworkWrap"> 
 	<table width="100%" >
 	<tr> 	 	
 		<td width="50%" style="vertical-align: top;"> 		
			 <div class="frameworkHeader">
			    Admin
			 </div>
			 <div class="frameworkBody"> 	 
			<a href="<%=request.getContextPath()%>/admin/role/init.htm"> Role</a><br> 
			<a href="<%=request.getContextPath()%>/admin/group/init.htm">Group</a><br> 
			<a href="<%=request.getContextPath()%>/admin/user/init.htm">User</a><br> 
			<a href="<%=request.getContextPath()%>/admin/menu/init.htm">Menu</a>
			 </div> 	 		
 		</td> 		
 		<td width="50%" style="vertical-align: top;"> 		
			 <div class="frameworkHeader">
			    GPS and Account
			 </div>
			 <div class="frameworkBody">	 
			 <a href="<%=request.getContextPath()%>/mobile/gps/init.htm"> Manage GPS   </a><br>
			  <a href="<%=request.getContextPath()%>//mobile/gps/viewer.htm"> GPS Viewer   </a><br>
			 <a href="<%=request.getContextPath()%>/mobile/account/init.htm">  Manage Telephone Account</a><br>		 
			 </div> 		
 		</td> 
 	</tr>  
  </table>  
 </div>
 </div>
 </div>