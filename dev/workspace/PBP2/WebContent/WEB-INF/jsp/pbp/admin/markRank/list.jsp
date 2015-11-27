<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="markRankWrapper" action="edit.htm" method="POST" name="mainForm"> 	 
<form:hidden path="academicYear"/>
 
<div class="post">
<div class="entry">	
		  <div class="pbptableWrapper">
            
			    <div class="pbptableWrapper">
			    <c:forEach items="${markRankWrapper.markRankRoundList}" var="domain" varStatus="status">
			        <div class="pbp-header"> 
		            <table>
		                <thead><tr><th colspan="2"><div class="pbp-header" style="text-align: left: ;"> ข้อมูลอัตราการขึ้นเงินเดือน ประจำปีการศึกษา  ${markRankWrapper.academicYear} </div>  </th></tr></thead>
		            	<tr>
		            		<td width="70%" >    
		            		 	<c:if test="${domain.employeeType=='0'}">ข้าราชการรอบที่   <c:out value="${domain.round}"/>  </c:if> 
		            		     <c:if test="${domain.employeeType=='1'}">พนักงาน    </c:if> 
		            		     </td>
		            		<td> 
		            		<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/markRank/initEditRound.htm?academicYear=<c:out value="${anonymousWrapper.academicYear}"/>&employeeType=<c:out value="${domain.employeeType}"/>&round=<c:out value="${domain.round}"/>">
		            		<input value="แก้ไข" type="button" class="btn btn-primary" > 
		            		</a>
		            		</td>
		            	</tr>
		            </table> 
		            </div> 
		   			<table class="pbp-table"">
				   	   	<thead>
				   	   		<tr>
				   	   			<th class="thFirst" >ภาระงานที่ปฎิบัติสำเร็จ(%) </th>
				   	   			<th class="thFirst">อัตราการขึ้นเงินเดือน (%) </th>
			 
				   	   		</tr>
				   	   	</thead>
				   	   	
				   	   	<tbody> 
							<c:forEach items="${domain.markRankList}" var="domain2" varStatus="status2">
							<tr> 
							<td style=" border: 1px solid white; text-align: center;"> 
						 		${domain2.markFrom} 	 -  ${domain2.markTo}
							</td>
							<td style=" border: 1px solid white; text-align: center;">  
								 
								 ${domain2.salaryLevel}
							</td> 
						 
							</tr>
						</c:forEach>	
				       
				       	 </tbody>		   	   	
					</table>          
		            
		            <br><br>
		            
			    </c:forEach> 
		 </div>
 
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
		form.action ="<%=request.getContextPath()%>/admin/pbp/markRank/create.htm";
		form.method='GET';	
		form.submit();
	}
</script>
 