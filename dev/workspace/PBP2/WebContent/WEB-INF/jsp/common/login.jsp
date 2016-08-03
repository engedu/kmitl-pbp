<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form modelAttribute="user" action="j_spring_security_check" method="POST" name="mainForm">

<div class="post"> 
<div class="entry" style="text-align: center;">	
<!-- 		  <div class="pbptableWrapper" style="width: 50%; margin-left: 20%;"> -->
			<section class="twelve columns">
			  <div class="four columns"></div>
			  <div class="four columns">
	            <div class="pbp-login">
				<table>
	              <thead>
	                  <tr><th><h4><center><span class="lsf-icon colororange" title="key"></span>เข้าสู่ระบบ</center></h4></th></tr>
	              </thead>
	              <tbody>
	                  <tr>
	                  	<td>
	                        <label><strong>ชื่อผู้เข้าใช้:</strong></label>
	                        <input type="text" name="j_username" id="j_username" class="input"/>
	                        <label><strong>รหัสผ่าน:</strong></label>
	                        <input type="password" name="j_password" id="j_password" class="input"/>
	                        <center>
	                        <input value="ตกลง" id="loginBtn" type="button" class="btn btn-primary"/>&nbsp;&nbsp;&nbsp;&nbsp;<input value="เคลียร์"
							id="cancelBtn" type="button" class="btn btn-primary" rel="notLoading" />
	                        </center>
	                     </td>

	                  </tr>

	              </tbody>
	            </table>
				</div>
				
				<div >
				<br>
				<span style="color: red; font-size: 17px;">  <b>ขยายเวลาการนำเข้าผลงานจนถึง  15 สิงหาคม 2559</b></span>
				<br>
					<br>
						<br>
				 <span style="color: red;"> * </span><b>ชื่อผู้เข้าใช้ และรหัสผ่าน คือ email และ password ของแอคเคาท์เก่า(Generation1) ของเมล์สถาบันฯ </b>
				 <br>
				 
				</div>
			  </div>
			  <div class="four columns"></div>
			</section>
<!-- 						<table style="height: 200px;" class="noshadow"> -->
			
			</table>
	</div>
</div>
</form:form>
<script type="text/javascript">
	$(document).ready(function(){
		$('#loginBtn').click(function() { 
		    submitForm();
	    });
		
		// Function to add event listener
		$('#j_username').bind('keyup',function(e){ 
			if(e.keyCode=='13'){
				submitForm();
			}
	    });
		$('#j_password').bind('keyup',function(e){ 
			if(e.keyCode=='13'){
				submitForm();
			}
	    });
// 		$('#j_captcha').bind('keyup',function(e){ 
// 			if(e.keyCode=='13'){
// 				submitForm();
// 			}
// 	    });

	    $('#cancelBtn').click(function(){
			$(".input").val('');
		 });
	});
	
	function submitForm (){		 
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/j_spring_security_check";
		form.method = 'POST';
		form.submit();
	}
</script>