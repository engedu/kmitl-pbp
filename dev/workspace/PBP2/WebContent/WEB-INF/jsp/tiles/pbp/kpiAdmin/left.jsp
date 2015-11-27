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


<div class="share-bar">
 
<nav role="navigation" class="nav clearfix">
<ul id="mega-navigation" class="mega-navigation" style="border: none;">	
 		
<li> <a class="icon-home" rel="notLoading" href="<%=request.getContextPath()%>/welcome.htm"></a></li>

<sec:authorize ifAnyGranted="ROLE_HEAD">
<li class="dropdown"><a href="#"  rel="notLoading">หัวหน้าภาควิชา </a>
<div class="topic-dropdown">
<ul>
<li><a rel="notLoading" href="<%=request.getContextPath()%>/head/pbp/init.htm"> อนุมัติผลงาน</a></li>
<li><a rel="notLoading" href="<%=request.getContextPath()%>/head/pbp/viewMarkDepartment.htm"> คะแนนในภาควิชา</a></li>
 
 </ul>
</div>
</li>

</sec:authorize>

<li> <sec:authorize ifAnyGranted="ROLE_USER"><a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/initWorkImport.htm"> นำเข้าผลงาน</a></sec:authorize></li>
<li><sec:authorize ifAnyGranted="ROLE_USER"><a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/initAcademicWork.htm"> ผลงานประจำปี</a></sec:authorize></li>



 			<li  >    		
		    		<sec:authorize ifAnyGranted="ROLE_USER">
				  <a rel="notLoading" href="<%=request.getContextPath()%>/anonymous.htm"> กฎระเบียบ</a>	  
				 </sec:authorize>
		  </li>	
		  
	  			<li  >    		
		    		<sec:authorize ifAnyGranted="ROLE_USER">
				  <a rel="notLoading" href="<%=request.getContextPath()%>/anonymous.htm"> ตารางสอน</a>	  
				 </sec:authorize>
		  </li>		  

 			<li  style="border:  none; padding-left: 10px;"> 	
		    		<sec:authorize ifAnyGranted="ROLE_USER">
				  <sec:authentication property="principal.personProfile.thaiName" /> <sec:authentication property="principal.personProfile.thaiSurname" />	   (<sec:authentication property="principal.personProfile.employeeType" /> ) 
				 </sec:authorize>
		  </li>	


 			<li class="navigation-right" style="border:  none;">    		
		    		<sec:authorize ifAnyGranted="ROLE_USER">
				 <a href="<%=request.getContextPath()%>/j_spring_security_logout">  <spring:message code="label.logout"/>   </a>	
				 
				 </sec:authorize>
		  </li>	    
 
		
		<li class="navigation-right"  style="border: none;">    		
			   <sec:authorize ifNotGranted="ROLE_USER">	
					<a href="<%=request.getContextPath()%>/preLogin.htm">  <spring:message code="label.login"/> </a> 
				</sec:authorize>
		</li>	
						<li class="navigation-right"  style="border: none;">    		
			  <sec:authorize ifAnyGranted="ROLE_USER">
					ปีการศึกษา    ${academicYearStr}
				</sec:authorize>
				 
		</li>
</ul>
</nav>
</div>
 