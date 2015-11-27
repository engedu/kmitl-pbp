<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
 
<div class="content100">  
<div class="mainContent100"> 
<form:form modelAttribute="evaluate"	action="search.htm" method="POST" name="mainForm"> 	 
 
  <div class="searchForm">	
 <div class="topicHeader">User : <c:out value="${evaluate.userName}"/> </div> 	
    <table width="100%">
    	<tr>
    	<td width="10%" style="border-right: 1px solid white;">
    		<img src="<c:url value="/images/person_test.jpg"/>"  class="img_border" />
    	</td>
    		<td width="30%"  >
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
				<tr>	
					<td class="formLabel">Login Name:</td><td class="formValue">  ${user.username}</td> 
				</tr>				
				<tr>	
					<td class="formLabel">First Name:</td><td class="formValue">  ${user.first_name}</td> 
				</tr>				
				<tr>	
					<td class="formLabel"> Last Name:</td><td class="formValue">  ${user.last_name}</td> 
				</tr> 
				<tr>	
					<td class="formLabel">Login Name:</td><td class="formValue">  ${user.username}</td> 
				</tr>				
				<tr>	
					<td class="formLabel">First Name:</td><td class="formValue">  ${user.first_name}</td> 
				</tr>				
				<tr>	
					<td class="formLabel"> Last Name:</td><td class="formValue">  ${user.last_name}</td> 
				</tr> 
				<tr>	
					<td class="formLabel">Login Name:</td><td class="formValue">  ${user.username}</td> 
				</tr>				
 		
				
				
				
				
			</table>		
    		
    		</td>
    		<td width="40%"  >
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
    	</tr>
    	<tr>
    		<td>
 
    		</td>
    	</tr>
    </table>
  
	</div>

 
	
	
 <div class="searchForm">	
 <div class="topicHeader">xxxxxxxxxx</div> 	
    <table width="100%">
    	<tr>
 <td width="10%">
 &nbsp;
 </td>
    		<td width="40%"  >
 			<table width="50%">	 			
				<tr>	
					<td class="formLabel"> 
			
			<div class="topicHeader">ตำแหน่งวิชาการ</div> 	 		
			<table width="50%">	 			
				<tr>	
					<td class="formLabel"> N/A</td> 
				</tr>
			</table>	
			
			<div class="topicHeader">กรรมการ</div> 	 		
			<table width="50%">	 			
				<tr>	
					<td class="formLabel"> N/A</td> 
				</tr>
			</table>				
			
			<div class="topicHeader">อบรม ดูงาน วิจัย</div> 	 		
			<table width="50%">	 			
				<tr>	
					<td class="formLabel"> N/A</td> 
				</tr>
			</table>						
			<div class="topicHeader">เกรียติบัตร รางวัล</div> 	 		
			<table width="50%">	 			
				<tr>	
					<td class="formLabel"> N/A</td> 
				</tr>
			</table>	
	 						
					
					</td> 
				</tr>	 
			</table>	 
    		</td>
    		
    		
    		
    		<td width="40%"  >
 			<table width="50%">	 			
				<tr>	
					<td class="formLabel"> 
			
			<div class="topicHeader">ตำแหน่งบริหาร</div> 	 		
			<table width="50%">	 			
				<tr>	
					<td class="formLabel"> N/A</td> 
				</tr>
			</table>	
			
			<div class="topicHeader">สิทธิบัตร</div> 	 		
			<table width="50%">	 			
				<tr>	
					<td class="formLabel"> N/A</td> 
				</tr>
			</table>				
			
			<div class="topicHeader">โครงการวิจัย</div> 	 		
			<table width="50%">	 			
				<tr>	
					<td class="formLabel"> N/A</td> 
				</tr>
			</table>						
			<div class="topicHeader">บทความวิชาการ</div> 	 		
			<table width="50%">	 			
				<tr>	
					<td class="formLabel"> N/A</td> 
				</tr>
			</table>	
 					
					
					</td> 
				</tr>	 
			</table>	
			</table>	  
    		</td>
    	</tr>
 
    </table>
 
   
   
	</div>

 	
</form:form>

</div>
</div>
 
 
</body>
 

<script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/kpi/init.htm";
		form.method='GET';	
		form.submit();	
	}
	
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/kpi/create.htm";
		form.method='GET';	
		form.submit();
	}
 
	    
</script>
 