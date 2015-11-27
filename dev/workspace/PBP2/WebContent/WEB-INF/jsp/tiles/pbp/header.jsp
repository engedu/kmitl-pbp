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
	<td style="background: #343434; width: 20%;">
		 	<!--
<img src="<c:url value="/images/logo6.png"/>"  /> 
  -->
	    		<sec:authorize ifAnyGranted="ROLE_USER">
				 <span class="userloginInfo"><spring:message code="label.username"/> : <sec:authentication property="principal.username" />	 </span>&nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp; 
				 <a href="<%=request.getContextPath()%>/j_spring_security_logout"> <span class="userloginInfo"><spring:message code="label.logout"/> </span> </a>	&nbsp;&nbsp; 
				</sec:authorize>
			   <sec:authorize ifNotGranted="ROLE_USER">	
					<a href="<%=request.getContextPath()%>/preLogin.htm"> <span class="userloginInfo"><spring:message code="label.login"/></span></a>&nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp; 
				</sec:authorize>	
		 
	</td>
	<td width="70%"> 
		<!-- 
	<img src="<c:url value="/images/h_right_test.jpg"/>"  />
 -->
	   <table style="width: 100%;">
	   		<tr>
	   			<td>		
		   			<table style="width: 90%;">
						<tr>
							<td class="th_1"><a href="#" rel="notLoading">ข้อมูลส่วนตัว</a></td>
							<td class="th_1"> <a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicYear/init.htm">ปีการศึกษา</td>
							<td class="th_1"><a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/faculty/init.htm">หน่วยงาน</td>
							<td class="th_1"> รายงาน</td>
							 
						</tr>
						<tr>
							<td class="th_1"><a href="#" rel="notLoading">เกณฑ์ภาระงาน 2013</a></td>
							<td class="th_1">กฎระเบียบ</td>
							<td class="th_1">ภาพรวมผลคะแนน</td>
							<td class="th_1">ผู้ดูแลระบบ</td>
							 
						</tr>			
					</table>
				</td>
	   		</tr> 
		</table>	 

	</td>
	<td width="10%" > 
	<h3 style="font-size: 30px; color: white;">${academicYear} </h3>
	</td>
</tr>
</table>