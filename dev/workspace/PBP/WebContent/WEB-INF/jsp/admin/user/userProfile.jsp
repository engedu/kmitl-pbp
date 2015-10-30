<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
<div class="content">  
<div class="mainContent"> 
<form:form modelAttribute="user"	action="register.htm" method="POST" name="mainForm"> 
 
	
	<div class="searchForm">	
 <div class="topicHeader">User Profile </div> 	
    <table width="100%">
    	<tr>
    		<td width="60%" style="border-right: 1px solid white;">
 			<table width="100%">	 			
				<tr>	
					<td class="formLabel">Login Name:</td><td class="formValue">  ${user.username}</td> 
				</tr>				
				<tr>	
					<td class="formLabel">First Name:</td><td class="formValue">  ${user.first_name}</td> 
				</tr>				
				<tr>	
					<td class="formLabel"> Last Name:</td><td class="formValue">  ${user.last_name}</td> 
				</tr> 
			</table>		
    		
    		</td>
    		<td>
			<table width="100%">			
				<tr>	
					<td >  <a href="<%=request.getContextPath()%>/user/changePassword.htm"> เปลี่ยนรหัสผ่าน</a></td> 
				</tr>	
				<tr>	
					<td > <a href="<%=request.getContextPath()%>/userregistration/edit.htm?username=<c:out  value="${user.username}"/>"> แก้ไขข้อมูลผู้ใช้</a></td> 
					
				</tr>							 		
			</table>    		
    		
    		</td>
    	</tr>
    	<tr>
    		<td>
 
    		</td>
    	</tr>
    </table>

 </div>
 
<!--  
	<div class="subTopicHeader">Default Shpping Address </div> 	 
    <table width="100%">
    	<tr>
    		<td width="70%">
 			<table width="100%">	
 							<tr>	
					<td class="formLabel"> Last Name:</td><td class="formValue">  ${user.last_name}</td> 
				</tr>  			
				<tr>	
					<td class="formLabel">เลขที่:</td><td class="formValue">  ${user.username}</td> 
				</tr>				
				<tr>	
					<td class="formLabel">ซอย:</td><td class="formValue">  ${user.first_name}</td> 
				</tr>				
				<tr>	
					<td class="formLabel">ถนน:</td><td class="formValue">  ${user.last_name}</td> 
				</tr> 
				<tr>	
					<td class="formLabel">ตำบล:</td><td class="formValue">  ${user.last_name}</td> 
				</tr> 
				<tr>	
					<td class="formLabel">อำเภอ:</td><td class="formValue">  ${user.last_name}</td> 
				</tr> 
				<tr>	
					<td class="formLabel">จังหวัด:</td><td class="formValue">  ${user.last_name}</td> 
				</tr> 
				<tr>	
					<td class="formLabel">รหัสไปรษณีย์:</td><td class="formValue">  ${user.last_name}</td> 
				</tr>  																				
			</table>		
    		
    		</td>
    		<td>
			<table width="100%">			
				<tr>	
					<td >  <a href="<%=request.getContextPath()%>/user/changePassword.htm"> แก้ไขข้อมูลการจัดส่ง</a></td> 
				</tr>	
				<tr>	
					<td > &nbsp; </td> 
					
				</tr>							 		
			</table>    		
    		
    		</td>
    	</tr>
    	<tr>
    		<td>
 
    		</td>
    	</tr>
    </table>


</div>

-->
</form:form>
 </div>	
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/user/search.htm";
		form.method='GET';	
		form.submit();	
	}
</script>