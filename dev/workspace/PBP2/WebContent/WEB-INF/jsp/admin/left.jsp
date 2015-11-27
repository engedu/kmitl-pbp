<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>   
<security:authorize ifAnyGranted="ROLE_ADMIN">
<div class="sidbarpost">
	<h2 class="title">การจัดการ</h2>
	<ul>
		<li>
			<a href="<%=request.getContextPath()%>/admin/role/init.htm">สิทธิ์ในการใช้งาน</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/group/init.htm">กลุ่มผู้ใช้งาน</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/user/init.htm">รายชื่อบุคลากร</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/leaveQuota/init.htm">สิทธิ์การลาประจำปี</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/holiday/init.htm">วันหยุดประจำปี</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/lovHeader/init.htm"><span>ค่าคงที่</span></a>
		</li>
	</ul>
</div>
<div class="sidbarpost">
	<h2 class="title">สายการบังคับบัญชา</h2>
	<ul>
		<li>
			<a href="<%=request.getContextPath()%>/admin/workline/init.htm"><spring:message code="label.workline"/></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/workline/hierarchy.htm"><spring:message code="label.workline.hierarchy"/></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/workline/listpersonworkline.htm"><spring:message code="label.workline.worklineperson"/></a>
		</li>
	</ul>
</div>
<div class="sidbarpost">
	<h2 class="title">ตัวชี้วัด</h2>
	<ul>
		<li>
			<a href="<%=request.getContextPath()%>/admin/unit/init.htm">หน่วยการให้คะแนน</a>
		</li>	 
		<li>
			<a href="<%=request.getContextPath()%>/admin/kpiCategory/init.htm">กลุ่มตัวชี้วัด</a>
		</li>
	  
		<li>
			<a href="<%=request.getContextPath()%>/admin/kpiTemplate/init.htm">กำหนด Template ตัวชี้วัด</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/kpiyear/init.htm">กำหนดตัวชี้วัดรายปี</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/kpiweight/init.htm"><span>กำหนดน้ำหนักตัวชี้วัดรายปี</span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/target/init.htm"><span>กำหนดเป้าหมายตัวชี้วัดรายปี</span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/marklevel/init.htm"><span>กำหนดเกณฑ์การให้คะแนนตัวชี้วัดรายปี</span></a>
		</li>		
		<li>
			<a href="<%=request.getContextPath()%>/admin/kpiSchedule/init.htm">กำหนดช่วงเวลาประเมิน</a>
		</li>
	 <li>
			<a href="<%=request.getContextPath()%>/admin/worktemplate/init.htm">รูปแบบผลงาน</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/manageTemplate/init.htm"><span>กำหนด น้ำหนัก เป้าหมาย เกณฑ์การให้คะแนน</span></a>
		</li>
	</ul>
</div>
<div class="sidbarpost">
	<h2 class="title"><spring:message code="label.importdata"/></h2>
	<ul>
		<li>
			<a href="<%=request.getContextPath()%>/admin/importdata/profile/initProfileHistory.htm"><spring:message code="label.importdata.profile"/></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/importdata/timetable/initTimeTableHistory.htm"><spring:message code="label.importdata.timetable"/></a>
		</li>
	</ul>
</div>
<div class="sidbarpost">
	<h2 class="title">ปีการศึกษา</h2>
	<ul>
		<li>
			<a href="<%=request.getContextPath()%>/admin/year/init.htm">ปีการศึกษา</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/semester/init.htm">ภาคการศึกษา</a>
		</li>
	</ul>
</div>	
</security:authorize>