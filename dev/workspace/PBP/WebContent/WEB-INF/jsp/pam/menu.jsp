<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div id="menusub">
<ul class="menu">
	<li><a href="#" class="parent" rel='notLoading'><span>ข้อมูลส่วนตัว</span></a>
	<ul>
		<li><a href="<%=request.getContextPath()%>/pam/person/init.htm"><span>ประวัติ</span></a>
		</li>
		<li><a
			href="<%=request.getContextPath()%>/pam/admin/holiday/init.htm"><span>วันหยุดประจำปี</span></a>
		</li>
	</ul>
	</li>
	<li><a href="#" class="parent" rel='notLoading'><span>ข้อมูลการลา</span></a>
	<ul>
		<li><a
			href="<%=request.getContextPath()%>/leave/summary/view.htm"><span>สิทธิ์การลาประจำปี</span></a>
		</li>
		<li><a href="<%=request.getContextPath()%>/leave/init.htm"><span>สถานะใบลา</span></a>
		</li>
	</ul>
	</li>
	<li><a href="#" class="parent" rel='notLoading'><span>ยื่นใบลา</span></a>
	<ul>
		<li>
			<a href="<%=request.getContextPath()%>/leave/research/init.htm"><span>ไปศึกษา ฝึกอบรม ปฎิบัติการวิจัย ดูงาน ราชการ</span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/leave/vacation/init.htm"><span>ลาพักผ่อน</span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/leave/sick/init.htm"><span>ลาป่วย</span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/leave/personal/init.htm"><span>ลากิจ</span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/leave/maternity/init.htm"><span>ลาคลอด</span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/leave/monkhood/init.htm"><span>ลาอุปสมบท</span></a>
		</li>
	</ul>
	</li>
	<li><a href="#" class="parent" rel='notLoading'><span>การประเมินประจำปี</span></a>
	<ul>
		<li><a
			href="<%=request.getContextPath()%>/pam/evaluate/userHistoryEvaluate.htm"><span>ประวัติการประเมินย้อนหลัง</span></a>
		</li>
		<li><a
			href="<%=request.getContextPath()%>/pam/evaluate/raisesalary/init.htm"><span>การสร้างเอกสารบัญชีเลื่อนเงินเดือน</span></a>
		</li>
	</ul>
	</li>
	<li><a href="#" class="parent" rel='notLoading'><span>งานสอน</span></a>
	<ul>
		<li><a
			href="<%=request.getContextPath()%>/pam/person/teachtable/init.htm"><span>ตารางสอนประจำปี</span></a>
		</li>
		<li><a
			href="<%=request.getContextPath()%>/pam/person/teachtable/initSubject.htm"><span>รายวิชาประจำปี</span></a>
		</li>
	</ul>
	</li>
</ul>
</div>