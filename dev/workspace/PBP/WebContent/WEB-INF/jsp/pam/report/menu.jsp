<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<div id="menusub">
<ul class="menu">
	<li><a href="#" class="parent" rel='notLoading'><span>บุคลากร</span></a>
	<ul>
		<li><a href="<%=request.getContextPath()%>/pam/report/personsummary/init.htm"><span>รายงานประเภทบุคลากร</span></a></li>
		<li><a href="<%=request.getContextPath()%>/pam/report/personbyfaculty/init.htm"><span>รายงานบุคลากรตามตำแหน่งวิชาการและวุฒิการศึกษา</span></a></li>
	</ul>
	</li>
	<li><a href="#" class="parent" rel='notLoading'><span>ตัวชี้วัด ภายในสาขา</span></a>
	<ul>
		<li><a href="<%=request.getContextPath()%>/pam/report/kpisummaryinfaculty/initByPerson.htm"><span><spring:message code="label.report.kpisummary.title.infaculty.byperson" /> (1)</span></a></li>
		<li><a href="<%=request.getContextPath()%>/pam/report/kpisummaryinfaculty/init.htm"><span><spring:message code="label.report.kpisummary.title.infaculty" /></span></a></li>
		<li><a href="<%=request.getContextPath()%>/pam/report/kpisummaryrank/init.htm"><span><spring:message code="label.report.kpisummary.title.rank" /> (7)</span></a></li>
	</ul>
	</li>
	<li><a href="#" class="parent" rel='notLoading'><span>ตัวชี้วัด ของทุกสาขา</span></a>
	<ul>
		<li><a href="<%=request.getContextPath()%>/pam/report/kpisummaryallfaculty/initByFaculty.htm"><span><spring:message code="label.report.kpisummary.title.allfaculty.byfaculty" /> (3)</span></a></li>
		<li><a href="<%=request.getContextPath()%>/pam/report/kpisummaryallfaculty/init.htm"><span><spring:message code="label.report.kpisummary.title.allfaculty" /> (5)</span></a></li>
	</ul>
	</li>
</ul>
</div>