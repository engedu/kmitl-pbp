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
<form:form modelAttribute="anonymousWrapper" action="search.htm" method="POST" name="mainForm"> 			 	
 
   <div class="col-md-6 col-sm-6" style="margin-left: 15%;">
         <div class="panel panel-default">
          <div class="panel-heading">  <h4>Download คู่มือการใช้งาน</h4></div>
   			<div class="panel-body">
              <div class="list-group">
               <a href="<%=request.getContextPath()%>/downloadDoc.htm?fileCode=manual1" class="list-group-item"> <img src="<c:url value="/images/icon/pdf_logo.png"/>" /> &nbsp; <b> ผู้ใช้งานทั่วไป</b></a>
               <a href="<%=request.getContextPath()%>/downloadDoc.htm?fileCode=manual2" class="list-group-item"><img src="<c:url value="/images/icon/pdf_logo.png"/>" /> &nbsp; <b>  ผู้ดูแลระบบ</b></a>
                <a href="<%=request.getContextPath()%>/downloadDoc.htm?fileCode=manual3" class="list-group-item"><img src="<c:url value="/images/icon/pdf_logo.png"/>" /> &nbsp;  <b> หัวหน้าภาควิชา</b></a>
                <a href="<%=request.getContextPath()%>/downloadDoc.htm?fileCode=manual4" class="list-group-item"><img src="<c:url value="/images/icon/pdf_logo.png"/>" /> &nbsp;  <b>  ผู้บริหาร</b></a>
              </div>
            </div>
   		</div>
 
</div>
 

</form:form>
 