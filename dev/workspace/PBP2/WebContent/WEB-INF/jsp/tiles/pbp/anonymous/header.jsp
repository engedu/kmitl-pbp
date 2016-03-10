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
 
<ul id="mega-navigation" class="mega-navigation" style="border: none;">	

 			
<li  style="border: none;"><a class="icon-home" rel="notLoading" href="<%=request.getContextPath()%>/welcome.htm"></a></li>

<!--
<li class="dropdown"><a href="#">Filter Posts  </a>
<div class="topic-dropdown">
<ul>
<li><a href="http://speckyboy.com/category/web-design/" rel="nofollow" class="icon-code">Design &amp; Dev</a></li>
<li><a href="http://speckyboy.com/category/freelance-2/" rel="nofollow" class="icon-user">Freelance</a></li>
<li><a href="http://speckyboy.com/category/galleries/" rel="nofollow" class="icon-picture">Galleries</a></li>
 </ul>
</div>
</li>


<li><a href="#">ทดสอบไทย</a></li>
<li class="dropdown" ><a href="#">Search</a>
<div class="search-dropdown">
<form method="get" action="/index.php">
<input type="text" name="s" placeholder="Enter keywords and press enter" required="">
</form>
</div>
</li>
   -->
		<li class="navigation-right" style="border: none;">    		
			 <sec:authorize ifAnyGranted="ROLE_USER">
				  <sec:authentication property="principal.username" />	  
			 </sec:authorize>
		</li>
		
		<li class="navigation-right" style="border: none;">    		
    		<sec:authorize ifAnyGranted="ROLE_USER">
			  <a href="<%=request.getContextPath()%>/j_spring_security_logout">  ออกจากระบบ   </a>	  
			 </sec:authorize>
	    </li>	    
	    		
		<li class="navigation-right"  style="border: none;">    		
		   <sec:authorize ifNotGranted="ROLE_USER">	
				<a href="<%=request.getContextPath()%>/preLogin.htm">  <spring:message code="label.login"/> </a> 
			</sec:authorize>
		</li>	
					
	 			 

</ul>
 
 



 