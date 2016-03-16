<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="academicKPI" action="edit.htm" method="POST" name="mainForm"> 	 
<form:hidden path="academicYear"/>
 
<div class="post"> 
<div class="entry">	  
	 
		<div class="pbptableWrapper">
             
             
			<table class="pbp-table">
 		 
		   	   	<thead>
		   	   		<tr>
		   	   		
		   	   		<th  colspan="2">   แก้ไขภาระงาน    &nbsp;
 					
					</th>
 					</tr>
 
		   	   	</thead>			
			 
			  <tbody> 
			<tr>
				<td class="tdFirst">ชื่อภาระงาน:</td>
				<td class="tdLast"><form:input cssClass="input" path="name" size="80"/> <span class="require">*</span> <form:errors
					path="name" cssClass="require" /></td>
			</tr>
			<tr>
				<td class="tdFirst">คะแนน:</td>
				<td class="tdLast"><form:input path="mark" maxlength="10" cssClass="input"/> <span class="require">*</span> <form:errors
					path="mark" cssClass="require" /></td>
			</tr>
			<tr>
				<td class="tdFirst">หน่วย:</td>
				<td class="tdLast">
					<form:select path="unitCode"  >
		     			<option value="0" label=" - Select - " ></option>
		     			<form:options items="${academicKPI.academicUnitList}" itemLabel="name" itemValue="code"/>
		     			  <span class="require">*</span> <form:errors
					path="unitCode" cssClass="require" />
					</form:select>
					
				</td>
			</tr>	 
						 <tr>
				<td class="tdFirst">ตัวคูณ:</td>
				<td class="tdLast"><form:input path="multiplyValue" maxlength="10" cssClass="input"/> </td>
			</tr>
			
							 <tr>
				<td class="tdFirst">ลำดับการจัดเรียง:</td>
				<td class="tdLast"><form:input path="orderNo" maxlength="10" cssClass="input"/> </td>
			</tr>	
			
			 <tr>
				<td class="tdFirst">หมายเหตุ:</td>
				<td class="tdLast"><form:input path="description"  size="80"  cssClass="input"/> </td>
			</tr>
			
			 <tr>
				<td class="tdFirst">ดึงข้อมูลอัตโนมัติจากสำนักทะเบียน:</td>
				<td class="tdLast">	<form:checkbox path="fromRegis" value="Y" />  
				 </td>
			</tr>	
			</tbody>			
		</table>
 
    </div>
    
    <br>
    <br>
    
	<div class="pbptableWrapper">
            <div class="pbp-header"> <span style="color: gray; font-size: 20px;">รูปแบบการกรอกข้อมูลผู้ใช้งาน</span> 
 	                   		<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicKPI/addNewAttribute.htm?academicKPIId=<c:out  value="${academicKPI.academicKPIId}"/>"  >
	                   		<img class="imagePlus" src="<c:url value="/images/plus1.png"/>" /></a>   
            </div>
             
			<table class="pbp-table">
 		 		 <thead>
	 			  <tr>
	 					<th class="thFirst">ชื่อ</th>
	 					<th class="thFirst">ใช้ในการคำนวณ</th>
	 					<th class="thFirst">Validate Number</th>
	 					<th class="thLast">Delete</th>
	 				</tr> 
			 	 </thead>
	 			<tbody>
		 			<c:forEach items="${academicKPI.academicKPIAttributeList}" var="domain" varStatus="status">
						<tr>
							<td class="tdFirst">
							<input style="width: 150px;"  name="academicKPIAttributeList[${status.index}].name" value="${domain.name}"  <c:if test="${domain.mandatory=='Y'}">readonly</c:if> />
							</td>
							<td class="tdLast">
								<c:if test="${domain.mandatory=='Y'}"> 
								  <input type="checkbox" disabled="disabled" name="academicKPIAttributeList[${status.index}].isCalculate"   <c:if test="${domain.isCalculate=='Y'}">checked</c:if>/> 
								</c:if>  
								 
								<c:if test="${domain.mandatory!='Y'}"> 
								 <input type="checkbox"  name="academicKPIAttributeList[${status.index}].isCalculate"   <c:if test="${domain.isCalculate=='Y'}">checked</c:if>/>   
							 </td>
							 
							 <td>
							 
							  <input type="checkbox"  name="academicKPIAttributeList[${status.index}].isValidateNumber"   <c:if test="${domain.isValidateNumber=='Y'}">checked</c:if>/>
							 
							 </td>
							</c:if>  
						  		<td>
						   		<c:if test="${domain.mandatory!='Y'}"> 
                   					<a rel="notLoading" href="<%=request.getContextPath()%>/admin/pbp/academicKPI/deleteAttribute.htm?academicKPIAtributeId=<c:out  value="${domain.academicKPIAtributeId}"/>&academicKPIId=<c:out  value="${academicKPI.academicKPIId}"/>"  >
                  		 			Delete</a>	
                  		 			</c:if>						  
						  		</td> 
						</tr>
					</c:forEach>			 			
	 			</tbody>	 
			
		</table>
 
    </div>     
    
    
    
    	<div class="pbptableWrapper">
           <span style="color: gray;">
            กำหนดคุณสมบัติ (เฉพาะด้านวิชาการ) 
 	                   	   
           </span>
             
			<table class="pbp-table">
 		 		 <thead>
	 			  <tr>
	 					<th class="thFirst">คุณสมบัติ</th>
	 					<th class="thFirst" width="200px;">ค่า</th>
	 					<th class="thFirst">Remark</th>
	 				 
	 				</tr> 
			 	 </thead>
	 			<tbody>
 
						<tr>
							<td class="tdFirst">ระดับ </td>
							<td class="tdLast">
							
					<form:select path="specialP1"  >
		     			 
		     			 <form:option value="1" label="ป.ตรี " />
		     			 <form:option value="2" label="ป.โท -เอก" />
		     			  
					</form:select>
							
							 </td> 
							<td class="tdLast"> 1: ป.ตรี   <br>2:โท-เอก </td> 
		 
						</tr>
						<tr>
							<td class="tdFirst"> ประเภทวิชา </td>
							<td class="tdLast"> 					
							<form:select path="specialP2"  >
 
		     			 <form:option value="ท" label="ทฤษฎี" />
		     			 <form:option value="ป" label=" ปฎิบัติ " />				     			 
				     			 
							</form:select></td> 
							<td class="tdLast"> ท:ทฤษฎี  <br> ป: ปฎิบัติ </td> 
		 
						</tr>
						<tr>
							<td class="tdFirst"> ผู้ช่วยสอน (TA)</td>
							<td class="tdLast">  
							<form:select path="specialP3"  >
				     			 
			     			 <form:option value="1" label="มี" />
		     			 <form:option value="2" label="ไม่มี" />			     			 
				     			 
							</form:select></td> 							
							
							</td> 
		 					<td class="tdLast"> 1: มี  <br> 2: ไม่มี </td>
						</tr>
						<tr>
							<td class="tdFirst"> Project Base Learning</td>
							<td class="tdLast">  
							<form:select path="specialP5"  >
				     			 
			     			 <form:option value="1" label="ไช่" />
		     			 <form:option value="2" label="ไม่ไช่" />			     			 
				     			 
							</form:select></td> 							
							
							</td> 
		 					<td class="tdLast"> 1: ไช่ <br> 2: ไม่ไช่</td>
						</tr>								
								
						<tr>
							<td class="tdFirst"> ใช้จำนวนนักศึกษาคำนวณหรือไม่</td>
							<td class="tdLast">
							<form:select path="specialP4"  >
			 
				     			 <form:option value="1" label="ใช้ในการคำนวณ" />
		     			 <form:option value="2" label="ไม่ใช้ในการคำนวณ " />				     			 
				     			 
							</form:select></td> 
							</td> 
							<td class="tdLast"> 1:ใช้ในการคำนวณ <br>  2: ไม่ใช้ในการคำนวณ</td> 
						</tr>	
						<tr>
							<td class="tdFirst"> จำนวนนักศึกษาระหว่่าง</td>
							<td class="tdLast"> ระหว่าง  <form:input path="totalStudentFrom"  size="80"  cssClass="input"/>  -<form:input path="totalStudentTo"  size="80"  cssClass="input"/>  </td> 
							<td class="tdLast"> กำหนดช่วงจำนวนนักศึกษากรณ๊ใช้นักศึกษาในการคำนวณคะแนน</td> 
						</tr>						
																				 			 			
	 			</tbody>	 
			
		</table>
 
    </div> 
 
 	<div  class="back_center">	
	<input class="btn btn-primary"	value="<spring:message code="label.button.save"/>" type="submit" >	
	 &nbsp;
	 
	
	<a class="btn btn-primary" href="<%=request.getContextPath()%>/admin/pbp/academicKPI/listByWorktype.htm?workTypeCode=<c:out  value="${academicKPI.workTypeCode}"/>&academicYear=<c:out  value="${academicKPI.academicYear}"/>&facultyCode=<c:out  value="${academicKPI.facultyCode}"/>"> ย้อนกลับ</a>
	</div>

	
</div> 
 </div>

</form:form>
 
 
 <script type="text/javascript">
	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/academicKPI/init.htm";
		form.method='GET';	
		form.submit();	
	}
	function create (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/academicKPI/create.htm";
		form.method='GET';	
		form.submit();
	}
	
	function listByWorktype (){		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/pbp/academicKPI/listByWorktype.htm?workTypeCode=<c:out  value="${academicKPI.workTypeCode}"/>&academicYear=<c:out  value="${academicKPI.academicYear}"/>&facultyCode=<c:out  value="${academicKPI.facultyCode}"/>";
		 
		form.method='GET';	
		form.submit();
	}
	
</script>
 