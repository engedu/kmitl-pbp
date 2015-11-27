<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  


<sec:authorize ifAnyGranted="ROLE_ADMIN">
<div class="wrapperleft">
<div class="leftHeaderTxt"> 

<div class="highlight"><p>	  Admin Task </p> </div>
 <div class="customerServiceHeader"> 
  <div class="leftnavboxcontent">   
 		<a href="<%=request.getContextPath()%>/admin/role/init.htm"> Role</a>
 	</div> 
  <div class="leftnavboxcontent">  
 		<a href="<%=request.getContextPath()%>/admin/group/init.htm">Group</a>
 	</div> 
 	<div class="leftnavboxcontent">   
 		<a href="<%=request.getContextPath()%>/admin/user/init.htm">User</a>
 	</div> 
 	<!-- 
 	<div class="leftnavboxcontent">  
 		<a href="<%=request.getContextPath()%>/admin/menu/init.htm">Menu</a>
 	</div> 
 	--> 
</div>   


<div class="highlight"><p>	Person </p> </div>
 <div class="customerServiceHeader"> 
  <div class="leftnavboxcontent">   
 		<a href="#"> Person</a>
 	</div> 
  <div class="leftnavboxcontent">  
 		<a href="#"> Address</a>
 	</div>  
</div>   

<div class="highlight"><p>	Product </p> </div>
 <div class="customerServiceHeader"> 
  <div class="leftnavboxcontent">   
 		<a href="#"> Product Category</a>
 	</div> 
  <div class="leftnavboxcontent">  
 		<a href="#"> Product</a>
 	</div>  
</div>   

<div class="highlight"><p> Shopping Cart </p> </div>
 <div class="customerServiceHeader"> 
  <div class="leftnavboxcontent">   
 		<a href="#"> Cart Admin</a>
 	</div> 
  <div class="leftnavboxcontent">  
 		<a href="#"> Cart</a>
 	</div>  
</div> 


<div class="highlight"><p>	Contact </p> </div>
 <div class="customerServiceHeader"> 
  <div class="leftnavboxcontent">   
 		<a href="#"> Contact Admin </a>
 	</div> 
  <div class="leftnavboxcontent">  
 		<a href="#"> Contact </a>
 	</div>  
</div>   


<div class="highlight"><p>	About </p> </div>
 <div class="customerServiceHeader"> 
  <div class="leftnavboxcontent">   
 		<a href="#"> About Admin</a>
 	</div> 
  <div class="leftnavboxcontent">  
 		<a href="#"> About</a>
 	</div>  
</div>   


<div class="highlight"><p>	Help </p> </div>
 <div class="customerServiceHeader"> 
  <div class="leftnavboxcontent">   
 		<a href="#"> Help Admin</a>
 	</div> 
  <div class="leftnavboxcontent">  
 		<a href="#"> Help</a>
 	</div>  
</div>   


</div>



 
</div>
</sec:authorize>
	