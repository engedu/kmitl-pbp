<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div id="menusub">
<ul class="menu">
		<li><a href="#" class="parent" rel='notLoading'><span>การประเมิน</span></a>
		<ul>
			<li><a href="<%=request.getContextPath()%>/pam/evaluate/init.htm"><span>รายการประเมินปัจจุบัน</span></a>
			</li>
			<li><a
				href="<%=request.getContextPath()%>/pam/evaluate/historyEvaluate.htm"><span>ประวัติการประเมินย้อนหลัง</span></a>
			</li>
		</ul>
	</li>
</ul>
</div>

