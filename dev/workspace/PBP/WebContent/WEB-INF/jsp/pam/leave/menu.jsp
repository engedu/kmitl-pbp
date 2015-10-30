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
 
		<li>
			<a href="<%=request.getContextPath()%>/admin/leaveQuota/init.htm"><span>สิทธิ์การลาประจำปี</span></a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/admin/holiday/init.htm"><span>วันหยุดประจำปี</span></a>
		</li>
 		<li>
			<a href="<%=request.getContextPath()%>/officer/leaveaccumulate/init.htm"><span>กำหนดวันลาสะสมตั้งต้น</span></a>
		</li>
	</ul>
	</li>



 
	<li><a href="#" class="parent" rel='notLoading'><span>ข้อมูลการลา</span></a>
	<ul>
 
		<li><a href="<%=request.getContextPath()%>/leave/initOfficer.htm" ><span>สถานะใบลา</span></a>
		</li> 
	</ul>
	</li>

	<li><a href="#" class="parent" rel='notLoading'><span>รายงาน</span></a>
	<ul>
 
		<li><a onclick="report();" rel='notLoading'><span>ออกรายงานสถิติการลาประจำปี</span></a>
		</li> 
		<li><a href="<%=request.getContextPath()%>/leave/summary/summaryleaveView.htm" rel='notLoading'><span>สรุปวันลาประจำปีคณะวิศวกรรมศาสตร์</span></a>
		</li> 
		<li><a href="<%=request.getContextPath()%>/leave/summary/facultyLeaveView.htm" rel='notLoading'><span>สรุปวันลาประจำปีตามภาควิชา</span></a>
		</li> 
	</ul>
	</li>
	 
</ul>
</div>

<script type="text/javascript">

	function report(){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/leave/summary/report.htm";
		form.method='GET';	
		form.submit();	
	}
	
</script>