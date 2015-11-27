<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<div id="menusub">
<ul class="menu">
	<li><a href="#" class="parent" rel='notLoading'><span>การจัดการ</span></a>
	<ul>
		<li><a href="<%=request.getContextPath()%>/admin/role/init.htm"><span>สิทธิ์ในการใช้งาน</span></a>
		</li>
		<li><a
			href="<%=request.getContextPath()%>/admin/group/init.htm"><span>กลุ่มผู้ใช้งาน</span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/user/init.htm"><span>รายชื่อบุคลากร</span></a>
		</li>
		<!--  
		<li>
			<a href="<%=request.getContextPath()%>/admin/leaveQuota/init.htm"><span>สิทธิ์การลาประจำปี</span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/holiday/init.htm"><span>วันหยุดประจำปี</span></a>
		</li>
-->
		<li>
			<a href="<%=request.getContextPath()%>/admin/lovHeader/init.htm"><span>ค่าคงที่</span></a>
		</li>		
	</ul>
	</li>
	<li><a href="#" class="parent" rel='notLoading'><span>กำหนดสิทธิ์ในการประเมิน</span></a>
	<!-- <ul>
		<li>
			<a href="<%=request.getContextPath()%>/admin/workline/init.htm"><span><spring:message code="label.workline"/></span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/workline/hierarchy.htm"><span><spring:message code="label.workline.hierarchy"/></span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/workline/listpersonworkline.htm"><span><spring:message code="label.workline.worklineperson"/></span></a>
		</li>
	</ul>
	 -->
	<ul>
		<li>
			<a href="<%=request.getContextPath()%>/admin/estimategroup/init.htm"><span>สิทธิ์ในการประเมิน</span></a>
		</li>
		<!--  
		<li>
			<a href="<%=request.getContextPath()%>/admin/workline/init.htm"><span>สายบังคับบัญชา</span></a>
		</li>
		-->	
	</ul>
	</li>
	<li><a href="#" class="parent" rel='notLoading'><span>ตัวชี้วัด</span></a>
	<ul>
		<li>
			<a href="<%=request.getContextPath()%>/admin/unit/init.htm"><span>หน่วยการให้คะแนน</span></a>
		</li>	 
		<li>
			<a href="<%=request.getContextPath()%>/admin/kpiCategory/init.htm"><span>กลุ่มตัวชี้วัด</span></a>
		</li>
	  
		<li>
			<a href="<%=request.getContextPath()%>/admin/kpiTemplate/init.htm"><span>กำหนด Template ตัวชี้วัด</span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/kpiyear/init.htm"><span>กำหนดตัวชี้วัดรายปี</span></a>
		</li>
		
		<!--
		<li>
			<a href="<%=request.getContextPath()%>/admin/kpiweight/init.htm"><span>กำหนดน้ำหนักตัวชี้วัดรายปี</span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/target/init.htm"><span>กำหนดเป้าหมายตัวชี้วัดรายปี</span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/marklevel/init.htm"><span>กำหนดเกณฑ์การให้คะแนนตัวชี้วัดรายปี</span></a>
		</li>	
		  -->		
		<li>
			<a href="<%=request.getContextPath()%>/admin/kpiSchedule/init.htm"><span>กำหนดช่วงเวลาประเมิน</span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/worktemplate/init.htm"><span>รูปแบบผลงาน</span></a>
		</li>
		<!-- 
		<li>
			<a href="<%=request.getContextPath()%>/admin/manageTemplate/init.htm?groupId=11&evaluateTerm=2&yearId=2012"><span>กำหนด น้ำหนัก เป้าหมาย เกณฑ์การให้คะแนน</span></a>
		</li>	
		 -->	
		<li>
			<a href="<%=request.getContextPath()%>/admin/manageTemplate/initSearch.htm"><span>กำหนด น้ำหนัก เป้าหมาย เกณฑ์การให้คะแนน</span></a>
		</li>
	</ul>
	</li>
	<li><a href="#" class="parent" rel='notLoading'><span><spring:message code="label.importdata"/></span></a>
	<ul>
		<li>
			<a href="<%=request.getContextPath()%>/admin/importdata/profile/initProfileHistory.htm"><span><spring:message code="label.importdata.profile"/></span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/importdata/timetable/initTimeTableHistory.htm"><span><spring:message code="label.importdata.timetable"/></span></a>
		</li>
	</ul>
	</li>
	<li><a href="#" class="parent" rel='notLoading'><span>ปีการศึกษา</span></a>
	<ul>
		<li>
			<a href="<%=request.getContextPath()%>/admin/year/init.htm"><span>ปีการศึกษา</span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/semester/init.htm"><span>ภาคการศึกษา</span></a>
		</li>
	</ul>
	</li>
</ul>
</div>