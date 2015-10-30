<%@ page pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<table width="100%">
	<tr>	
		<td width="10%"></td>
		<td width="10%"><a href="<%=request.getContextPath()%>/welcome.htm">Home</a></td>
		<td>jQuery </td>
		<td>Ajax</td>
		<td>Spring</td>
		<td>Tomcat|Websphere</td>
		<td>MySQL|Oracle</td>
		<td>
			<a href="<%=request.getContextPath()%>/tech/poi/init.htm">Poi</a>
		</td>
		<td>
		</td>
	   <td   align="right" >
	    		<sec:authorize ifAnyGranted="ROLE_USER">
				 <span class="userloginInfo"><spring:message code="label.username"/> : <sec:authentication property="principal.username" />	 </span>&nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp; 
				 <a href="<%=request.getContextPath()%>/j_spring_security_logout"> <span class="userloginInfo"><spring:message code="label.logout"/> </span> </a>	&nbsp;&nbsp; 
				</sec:authorize>    
		    	<sec:authorize ifNotGranted="ROLE_USER">	
					<a href="<%=request.getContextPath()%>/preLogin.htm"> <span class="userloginInfo"><spring:message code="label.login"/></span></a>&nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp; 
				</sec:authorize>	
		   <span class="userloginInfo"> <a href="?lang=th">Thai </a>  &nbsp;|&nbsp;<a href="?lang=en"> Eng </a>    &nbsp;  &nbsp;  &nbsp;  &nbsp; </span>
	</td>		
	</tr>
</table> 