<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>


<div class="sidbarpost">
	<h2 class="title">การประเมิน</h2>
	<ul>
		<li>
			<a href="<%=request.getContextPath()%>/pam/evaluate/init.htm">รายการประเมินปัจจุบัน</a>
		</li>
<!-- 		<li> -->
<%-- 			<a href="<%=request.getContextPath()%>/pam/evaluate/initResult.htm">ผลการประเมินทั้งหมด</a> --%>
<!-- 		</li> -->
<!-- 		<li> -->
<%-- 			<a href="<%=request.getContextPath()%>/pam/evaluate/init.htm">สรุปผลการประเมิน</a> --%>
<!-- 		</li> -->
		<li>
			<a href="<%=request.getContextPath()%>/pam/evaluate/historyEvaluate.htm">ประวัติการประเมินย้อนหลัง</a>
		</li>
	</ul>
</div>
