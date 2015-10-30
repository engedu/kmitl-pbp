	<%@ page pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<nav>
     
		<div class="logo">
        	<a href="index.html"><img src="<c:url value="/images/Logo02.png"/>" />  </a>
        </div>
        <ul id="menu-header" class="nav-bar horizontal right">
         <li class=""><span class="lsf-icon colororange" title="home"></span><a href="<%=request.getContextPath()%>/welcome.htm">หน้าแรก</a></li>
         
         
          <sec:authorize ifNotGranted="ROLE_ADMIN">	
          
          
          <sec:authorize ifAnyGranted="ROLE_USER">
	          <li class=""><span class="lsf-icon colororange" title="tile"></span><a href="<%=request.getContextPath()%>/pam/person/initWorkImport.htm">นำเข้าผลงาน</a></li> 
	          <li class=""><span class="lsf-icon colororange" title="tile"></span><a href="<%=request.getContextPath()%>/pam/person/initAcademicWork.htm">ผลงานประจำปี</a></li>
	          <li class=""><span class="lsf-icon colororange" title="tile"></span><a href="<%=request.getContextPath()%>/anonymous.htm">กฎระเบียบ</a></li>
	          <li class=""><span class="lsf-icon colororange" title="tile"></span><a href="<%=request.getContextPath()%>/message/init.htm">ข้อความ</a></li>
	          <li class=""><span class="lsf-icon colororange" title="tile"></span><a href="<%=request.getContextPath()%>/personReport/init.htm"> รายงานคะแนน</a></li>
	          <li class=""><span class="lsf-icon colororange" title="tile"></span><a href="<%=request.getContextPath()%>/personTimeTable/init.htm?academicYear="> ตารางสอน</a></li> 
          </sec:authorize>   
		 <sec:authorize ifAnyGranted="ROLE_HEAD">
		           <li class="has-flyout"><span class="lsf-icon colororange" title="tile"></span>
		           <a href="#">หัวหน้าภาควิชา </a><a href="#" class="flyout-toggle"></a>
		            <ul class="flyout"><!-- Flyout Menu -->
		              <li class="has-flyout"><a href="<%=request.getContextPath()%>/head/pbp/init.htm">อนุมัติผลงาน</a></li>
		              <li class="has-flyout"><a href="<%=request.getContextPath()%>/head/pbp/viewMarkDepartment.htm">คะแนนในภาควิชา</a></li>		 
		            </ul> 
		          </li>  
		 </sec:authorize>        
         
          <sec:authorize ifAnyGranted="ROLE_PRESIDENT">
           <li class="has-flyout"><span class="lsf-icon colororange" title="tile"></span><a href="<%=request.getContextPath()%>/president/init.htm">อธิการบดี</a></li>
          </sec:authorize>  
        
      </sec:authorize>
      
      <sec:authorize ifAnyGranted="ROLE_ADMIN">
          <li class="has-flyout"><span class="lsf-icon colororange" title="tile"></span>
           <a href="#">สถาบัน & บุคลากร</a><a href="#" class="flyout-toggle"></a>
            <ul class="flyout"><!-- Flyout Menu -->
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/pbp/academicYear/init.htm">ปีการศึกษา</a></li>
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/pbp/faculty/init.htm">หน่วยงาน</a></li>
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/pbp/chainOfCommand/init.htm">สายบังคับบัญชา</a></li>
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/importdata/profile/initProfileHistory.htm">นำเข้าบุคลากร</a></li>
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/user/init.htm">ข้อมูลบุคลากร</a></li>
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/message/init.htm">ข้อความ</a></li>
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/importdata/staff/initImport.htm">นำเข้า Staff</a></li>
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/importdata/studentInSec/initImport.htm">นำเข้า จำนวนนักศักษา </a></li>
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/timetablews/init.htm">นำเข้าตารางสอน (Webservice) </a></li>
            </ul> 
          </li><!-- END Flyout Menu -->
          
 
           <li class="has-flyout"><span class="lsf-icon colororange" title="tile"></span>
           <a href="#">ภาระงาน</a><a href="#" class="flyout-toggle"></a>
            <ul class="flyout"><!-- Flyout Menu -->
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/pbp/markRank/init.htm">เกณฑ์คะแนน</a></li>
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/pbp/academicUnit/init.htm">หน่วยนับ</a></li>
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/pbp/pBPWorkType/init.htm">ประเภทภาระงาน</a></li>
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/pbp/academicKPI/init.htm">ภาระงานประจำปี</a></li>
 
            </ul> 
          </li><!-- END Flyout Menu -->
 
 
                   
           <li class="has-flyout"><span class="lsf-icon colororange" title="tile"></span>
           <a href="#">ตารางสอน</a><a href="#" class="flyout-toggle"></a>
            <ul class="flyout"><!-- Flyout Menu -->
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/importdata/timetable/initTimeTable.htm">นำเข้าตารางสอน</a></li>
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/importdata/timetable/initTimeTableDesc.htm">นำเข้าชื่อวิชา</a></li>
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/pbp/faculty/init.htm">ข้อมุลการสอนร่วม</a></li>
              <li class="has-flyout"><a href="<%=request.getContextPath()%>/admin/pbp/staffpartner/init.htm">สัดส่วนสตาฟ</a></li>
 
            </ul> 
          </li><!-- END Flyout Menu -->     

        </sec:authorize>  
          
          
<%--           <li class=""><span class="lsf-icon colororange" title="key"></span>
 		    		<sec:authorize ifAnyGranted="ROLE_USER">
				  <a href="<%=request.getContextPath()%>/j_spring_security_logout">  ออกจากระบบ   </a>	  
				 </sec:authorize>         
          
           <sec:authorize ifAnyGranted="ROLE_USER">
				  <sec:authentication property="principal.username" />	  
		 </sec:authorize>  
		 
		   
		    
		  <sec:authorize ifNotGranted="ROLE_USER">	
					<a href="<%=request.getContextPath()%>/preLogin.htm">  เข้าสู่ระบบ </a> 
			 </sec:authorize>       
            
          </li> --%> 

        </ul>
      </div>  
      <div class="twelve columns header_nav_fullwidth">
        <ul id="menu-header" class="bottom-menu horizontal right">
         	<li class="">
         	ปีการศึกษา  ${academicYearStr}
         	 | 
         	<span class="lsf-icon colororange" title="notify"></span>
         		<a herf="#">ข้อความเตือน</a>
         	 | 
		     <span class="lsf-icon colororange" title="key"></span>
		    	<sec:authorize ifAnyGranted="ROLE_USER">
			 <a href="<%=request.getContextPath()%>/j_spring_security_logout">  ออกจากระบบ   </a>	  
			 </sec:authorize>         
	          
	           <sec:authorize ifAnyGranted="ROLE_USER">
					  <sec:authentication property="principal.username" />	  
			 </sec:authorize>  
			 
			   
			    
			  <sec:authorize ifNotGranted="ROLE_USER">	
						<a href="<%=request.getContextPath()%>/preLogin.htm">  เข้าสู่ระบบ </a> 
				 </sec:authorize>       
	            
	          
          </ul>
       
	</nav>
	
 