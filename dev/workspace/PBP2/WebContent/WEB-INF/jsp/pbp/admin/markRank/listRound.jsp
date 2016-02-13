<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="markRankWrapper" action="editRound.htm" method="POST" name="mainForm"> 	 
<form:hidden path="academicYear"/>
 
<div class="post">
<div class="entry">	

		  <div class="pbptableWrapper">
            <div class="pbp-header" style="text-align: center;"> ข้อมูลระดับคะแนน ประจำปีการศึกษา  ${markRankWrapper.academicYear} 
            </div>  
             
	 
	  		  <div class="pbptableWrapper">
            <div class="pbp-header">  
			<table style="width: 100%">
				<tr>
					<td width="80%;">						<c:if test="${markRankWrapper.employeeType=='0'}">ข้าราชการรอบที่   <c:out value="${markRankWrapper.round}"/>  </c:if> 
            		     <c:if test="${markRankWrapper.employeeType=='1'}">พนักงาน    </c:if> </td>
					<td>
					            <a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/markRank/createRound.htm?employeeType=<c:out value="${markRankWrapper.employeeType}"/>&round=<c:out value="${markRankWrapper.round}"/>">
  					 <input value="สร้าง" type="button" class="btn btn-primary"  > 
  					 </a>
					</td>
				</tr>
			</table>

            

            </div>  
	
	<table style="width: 70%; border: 1px solid white;">
		<thead>
			<tr>
				<td> ภาระงานที่ปฎิบัติสำเร็จ(%)   </td>
				<td>ระดับคะแนน (%) </td>
				<td>Detete</td>
			</tr>
		</thead>

  		<tbody>
		<c:forEach items="${markRankWrapper.markRankList}" var="domain" varStatus="status">
		<tr> 
		<td style=" border: 1px solid white;">
	
	
			<input style="width: 50px;"  name="markRankList[${status.index}].markFrom" value="${domain.markFrom}"  />
			-
			<input style="width: 50px;"  name="markRankList[${status.index}].markTo" value="${domain.markTo}"  />
	 
		</td>
		<td style=" border: 1px solid white;"> 
 
			 <input style="width: 50px;"  name="markRankList[${status.index}].salaryLevel" value="${domain.salaryLevel}"  />
		 
			 
		</td>
		
		<td style=" border: 1px solid white;">	 
		<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/markRank/delete.htm?markRankId=<c:out  value="${domain.markRankId}"/>"
									onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.markFrom}"/>- <c:out value="${domain.markTo}"/> ?')">
									Delete
									</a>
			 
			 
		</td>	
		</tr>
	</c:forEach>	
 
 		</tbody>
	</table>
 
	
	<div class="back_center">
	
	<input class="btn btn-primary" value="<spring:message code="label.button.back"/>" type="button" onclick="init();">
	
	&nbsp;&nbsp;&nbsp;
	<input class="btn btn-primary"	value="<spring:message code="label.button.save"/>" type="submit" >
	
	</div>
	
</div>
</div>
 
</form:form>
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/markRank/init.htm";
		form.method='GET';	
		form.submit();	
	}
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/markRank/createRound.htm";
		form.method='GET';	
		form.submit();
	}
</script>
 