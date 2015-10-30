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
			<a href="#">สิทธิ์การลาประจำปี</a>
		</li>
		<li>
			<a href="#">วันหยุดประจำปี</a>
		</li>
	</ul>
</div>
<div class="sidbarpost">
	<h2 class="title">ข้อมูลการลา</h2>
	<ul>
		<li>
			<a href="<%=request.getContextPath()%>/leave/init.htm">สถานะใบลา</a>
		</li>
		<li>
			<a href="#">ยื่นใบลา</a>
		</li>
	</ul>
</div>
