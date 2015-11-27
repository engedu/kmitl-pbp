<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<div class="content100">
<div class="mainContent100">
<div class="createSuccessFully"><spring:message code="${msg}"/><br>
<br>
 <a href="<%=request.getContextPath()%>/leave/init.htm"><input class="btn_2" value="<spring:message code="label.leave.button.ok"/>" type="button""/></a>
</div>
</div>
</div>
