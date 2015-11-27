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


 
 
<nav role="navigation" class="nav clearfix">
<ul id="mega-navigation" class="mega-navigation" style="border: none;">	

 
<li> <a class="icon-home" rel="notLoading" href="<%=request.getContextPath()%>/welcome.htm"></a></li>




<li class="dropdown"><a href="#"  rel="notLoading">สถาบัน & บุคลากร </a>
<div class="topic-dropdown">
<ul>
<li><a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicYear/init.htm">ปีการศึกษา</a></li>
<li><a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/faculty/init.htm">หน่วยงาน</a></li>
<li><a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/chainOfCommand/init.htm">สายบังคับบัญชา</a></li>
<li><a href="<%=request.getContextPath()%>/admin/importdata/profile/initProfileHistory.htm">นำเข้าบุคลากร</a></a></li>
<li><a href="<%=request.getContextPath()%>/admin/user/init.htm">ข้อมูลบุคลากร</a></a></li>
<li><a href="<%=request.getContextPath()%>/admin/message/init.htm">ข้อความ</a></a></li>
<li><a href="<%=request.getContextPath()%>/admin/importdata/staff/initImport.htm">นำเข้า Staff</a></a></li>
<li><a href="<%=request.getContextPath()%>/admin/importdata/studentInSec/initImport.htm">นำเข้า จำนวนนักศักษา </a></a></li>
<li><a href="<%=request.getContextPath()%>/admin/timetablews/init.htm">นำเข้าตารางสอน (Webservice)ป</a></a></li>
 </ul>
</div>
</li>

<li class="dropdown"><a href="#"  rel="notLoading">ภาระงาน </a>
<div class="topic-dropdown">
<ul>
<li><a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/markRank/init.htm">เกณฑ์คะแนน</a></li>
<li><a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicUnit/init.htm">หน่วยนับ</a></li>
<li><a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/pBPWorkType/init.htm">ประเภทภาระงาน</a></li>
<li><a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicKPI/init.htm"> ภาระงานประจำปี</a></li>
 </ul>
</div>
</li>


<li class="dropdown"><a href="#"  rel="notLoading">ตารางสอน </a>
<div class="topic-dropdown">
<ul>
<li><a rel="notLoading" href="<%=request.getContextPath()%>/admin/importdata/timetable/initTimeTable.htm">นำเข้าตารางสอน</a></li>
<li><a rel="notLoading" href="<%=request.getContextPath()%>/admin/importdata/timetable/initTimeTableDesc.htm">นำเข้าชื่อวิชา</a></li>
<li><a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/faculty/init.htm">ข้อมุลการสอนร่วม</a></li>
<li><a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/staffpartner/init.htm">สัดส่วนสตาฟ</a></li>
 </ul>
</div>
</li>


 <li>		    		
 <sec:authorize ifAnyGranted="ROLE_USER">
	  <sec:authentication property="principal.username" />	  
	 </sec:authorize>
 </li>


 			<li class="navigation-right" style="border: none;">    		
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
 