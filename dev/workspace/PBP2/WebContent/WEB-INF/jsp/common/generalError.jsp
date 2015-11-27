<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <div class="errorForm">
 	<div class="notice-error">
		 
			<img src="<c:url value="/images/warning.png"/>"  />  เกิดความผิดพลาด กรุณาติดต่อผู้ดูแลระบบ 
		 
	</div>
	<br>
	<br>
	<div>
		<a href="<%=request.getContextPath()%>/pam/person/init.htm">กลับสู่หน้าหลัก</a>
	</div>
 </div>

 
