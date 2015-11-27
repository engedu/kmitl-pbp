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
<table style="width:100%">
<tr>
<td style="width: 10%;">
		 	<!-- 
<img src="<c:url value="/images/logo6.png"/>"  /> 
 &nbsp;
  -->
   </td>
	<td width="70%"> 
 
	   <table style="width: 100%;">
	   		<tr>
	   			<td>		
		   			<table style="width: 90%;">
	 		
					</table>
				</td>
	   		</tr> 
		</table>	 

	</td>
	<td width="15%" > 
	<h3 style="font-size: 30px; color: rgb(255,127,39);">${academicYearStr} </h3> <br>
		    		<sec:authorize ifAnyGranted="ROLE_USER">
				 <span class="userloginInfo"> <sec:authentication property="principal.firstLastName" />	 </span>&nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp; 
				 <br>
				 <a href="<%=request.getContextPath()%>/j_spring_security_logout"> <span class="userloginInfo"><spring:message code="label.logout"/> </span> </a>	&nbsp;&nbsp; 
				</sec:authorize>
				
			   <sec:authorize ifNotGranted="ROLE_USER">	
					<a href="<%=request.getContextPath()%>/preLogin.htm"> <span class="userloginInfo"><spring:message code="label.login"/></span></a>&nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp; 
				</sec:authorize>	
	</td>
</tr>
</table>