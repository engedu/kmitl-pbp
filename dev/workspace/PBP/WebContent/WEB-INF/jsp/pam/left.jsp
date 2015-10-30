<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div class="sidbarpost">
	<h2 class="title">ข้อมูลส่วนตัว</h2>
	<ul>
		<li>
			<a href="<%=request.getContextPath()%>/pam/person/init.htm">ประวัติ</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/pam/admin/holiday/init.htm">วันหยุดประจำปี</a>
		</li>
	</ul>
</div>
<div class="sidbarpost">
	<h2 class="title">ข้อมูลการลา</h2>
	<ul>
		<li>
			<a href="<%=request.getContextPath()%>/leave/summary/view.htm">สิทธิ์การลาประจำปี</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/leave/init.htm">สถานะใบลา</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/leave/create.htm">ยื่นใบลา</a>
		</li>
	</ul>
</div>
<div class="sidbarpost">
	<h2 class="title">การประเมินประจำปี</h2>
	<ul>
		<li>
			<a href="<%=request.getContextPath()%>/pam/evaluate/userHistoryEvaluate.htm">ประวัติการประเมินย้อนหลัง</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/pam/evaluate/raisesalary/init.htm">การสร้างเอกสารบัญชีเลื่อนเงินเดือน</a>
		</li>
	</ul>
</div>
<div class="sidbarpost">
	<h2 class="title">งานสอน</h2>
	<ul>
		<li>
			<a href="<%=request.getContextPath()%>/pam/person/teachtable/init.htm">ตารางสอนประจำปี</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/pam/person/teachtable/initSubject.htm">รายวิชาประจำปี</a>
		</li>
	</ul>
</div>