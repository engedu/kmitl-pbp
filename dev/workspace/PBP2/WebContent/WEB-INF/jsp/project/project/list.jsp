<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %> 
<A NAME="top"></A>
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
<div class="content100">  
<div class="mainContent100"> 
<form:form   action="search.htm" method="POST" name="mainForm"> 
	<div class="subTopicHeader">Project	
		<sec:authorize ifAnyGranted="ROLE_PROJECT_PM ">
			<a href="<%=request.getContextPath()%>/project/create.htm" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
			</a> 
		</sec:authorize>
		</div> 	  
	<br> 	
	
	<!-- 
	<table>
	<tr>
	<td>
	
	<div class="projectWrap">
	 
	 <c:forEach items = "${projectList}" var="domain">
          <div class="projectIconWrapper">
          	<div class="projectIconSeparate">           	
 				<img src="<%=request.getContextPath()%>/servlet/Image?D:/2012/Project/Dev/workspace/Carp/WebContent/images/shopping_cart.jpg" width="100px" height="80px"/>          	
          	</div>
          	<div class="projectIconSeparate">          	
          	<h3>
          	<c:out value="${domain.projectName}"/>&nbsp;
          	</h3>          	
          	<p> เพื่อทำการทดสอบ ระบบ </p>          	 
          	 </div>          
          </div>
       </c:forEach>      
      </div>     
     </tr> 
     </table> 
        -->
	<div class="usecaseHeaderTxt"> 
    <div class="usecase">
      <table >      
       <c:forEach items = "${projectList}" var="domain">
        <tr> 
      		<td> 
      		<a href="<%=request.getContextPath()%>/project/vision/init.htm?projectId=<c:out value="${domain.projectId}"/>"> <c:out value="${domain.projectName}"/>  </a>  
      		</td> 
      		<td>
	       		<sec:authorize ifAnyGranted="ROLE_PROJECT_PM ">
	      		<span class="brEditTxt">
	      		<a href="<%=request.getContextPath()%>/project/pm/team/init.htm?projectName=<c:out value="${domain.projectName}"/>&projectId=<c:out value="${domain.projectId}"/>" >Manage User</a>
	      		</span> 
	      		</sec:authorize>         		
      		</td>
      		<td width="15%">
	       		<sec:authorize ifAnyGranted="ROLE_PROJECT_PM ">
	      		<span class="brEditTxt">
	      		<a href="<%=request.getContextPath()%>/project/edit.htm?projectId=<c:out value="${domain.projectId}"/>" >Edit</a>
	      		</span> /
	  			<span class="brDeleteTxt">
					<a href="<%=request.getContextPath()%>/project/delete.htm?projectId=<c:out value="${domain.projectId}"/>" onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.projectName}"/> ?')"> Delete</a>
				</span>  
	      		</sec:authorize>   
      		</td>
      	</tr>
       </c:forEach> 
      </table>   
    </div>    
	</div>
</form:form>
</div>
</div>

 
	