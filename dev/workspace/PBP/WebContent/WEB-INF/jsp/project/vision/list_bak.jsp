<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %> 
<div class="content100">  
<div class="mainContent100"> 
<form:form   modelAttribute="project"  action="search.htm" method="POST" name="mainForm"> 
	<div class="subTopicHeader">Vision : <c:out value="${project.projectName}"/></div> 	
	   <div class="usecase">
		<table width="100%">			
		<tr>	
			<td class="formValue">
			<div style="padding-left: 20px;">
				<p>
				Huaywa เป็นระบบบริหารจัดการโรงเรียนระดับ มัฐยมแบบครบวงจร ระบบสนับสนุนการทำงานของแผนกต่าง ๆ ในโรงเรียน <br>
				และเพิ่มความสดวกสบายของผู้ใช้จึงมีฟังชั่นงานที่อยู่บน Tablet  
				</p>
				<br> 
				<img src="<c:url value="/images/huaywa_architecture.gif"/>"  /> 
				<br>
				<br>
				<br>
				<H3>ประกอบด้วยงานดังต่อไปนี้</H3>
				<div class="searchResult">  
				<table width="80%" >
					<tr class="trGray">
						<td> Admin </td>
						<td align="left">
							ผู้ใช้งาน <br>
							สิทธิ์การใช้งานระบบ <br>  
						</td>
					</tr>
 					<tr class="trGray">
						<td>  การรับนักเรียนใหม่ </td>
						<td align="left">
							รับสมัคร <br> 
							การสอบ/คะแนน <br> 
							มอบตัว <br> 
							โอนนักเรียนเข้าระะบบ <br> 							 					
						</td>
					</tr>					
 					<tr class="trGray">
						<td> ทะเบียน </td>
						<td align="left">
							นำนักเรียนเข้าระบบ <br> 
							จัดห้องเรียน <br> 
							กำหนดอาจารย์ที่ปรึกษา <br> 
							กำหนดห้อง,เลขที่ให้นักเรียน <br> 
							คาบเรียน <br> 	
							ออกบัตรประจำตัวนักเรียน<br> 						
						</td>
					</tr>	 
 					<tr class="trGray">
						<td> วิชาการ </td>
						<td align="left">
						          กำหนดเทอม/ปีการศึกษา <br> 
							กำหนดรายวิชาที่เปิดสอน <br> 
							โครงสร้างคะแนน <br> 
						</td>
					</tr>
 					<tr class="trGray">
						<td> ปกครอง </td>
						<td align="left">
							กำหนดหัวข้อการลงโทษและคะแนน <br>
							ขอออกนอกโรงเรียน <br>
							การตัดคะแนน <br>
							การ scan ลายนิ้วมือเข้า-ออก <br> 
							ดูรายงานพฤติกรรมนักเรียน <br> 
						</td>
					</tr>
 					<tr class="trGray">
						<td> บุคลากร </td>
						<td align="left">

						</td>
					</tr>										
 					<tr class="trGray">
						<td> ครู   </td>
						<td align="left">
							ตารางสอน <br> 
						</td>
					</tr>
					  <tr class="trGray">
						<td> นักเรียน </td>
						<td align="left">
							ตารางเรียน<br> 
						</td>
					</tr>
					  <tr class="trGray">
						<td> ผู้บริหาร </td>
						<td align="left">
							ดูรายงาน/สถิติ ต่าง ๆ <br> 
						</td>
					</tr>	
					
					  <tr class="trGray">
						<td> ห้องสมุด </td>
						<td align="left">
							 จัดทำทะเบียนหนังสือ<br>
							 บาร์โค๊ด<br>
							  สืบค้น<br> 
							  ยืม-คืน<br>  
							  รายงาน /สถิติ<br>
						</td>
					</tr>		
					  <tr class="trGray">
						<td> ห้องพยาบาล </td>
						<td align="left">
							 สต๊อกยา<br> 
							 การเข้าใช้บริการ<br> 
						</td>
					</tr>						
					  <tr class="trGray">
						<td> อื่น ๆ </td>
						<td align="left">
							 ประกาศ<br> 
							 เว็บบอร์ด<br> 
							ชุมนุม ต่าง ๆ <br> 
							ทุนการศึกษา กำหนดทุน ผู้ให้ ผู้รับ <br> 
						</td>
					</tr>														
 					<tr class="trGray">
						<td> Technical Requirement </td>
						<td align="left">
							อับโหลด ข้อมูลขึ้น host  แบบอัตโนมัติ ตามเวลาที่กำหนด <br> 
							
						</td>
					</tr> 
 					<tr class="trGray">
						<td> Server Monitoring </td>
						<td align="left">
							1. Server รันปรกติ หร <br> 
							2. การติดต่อกะระบบอื่นอปรกติอยู่หรือไม่ เช่น database , webservice ที่เรียกไป ระบบ อื่น <br>
							3. สุขภาพ Server เป็นไงบ้าง heap เหลือเท่าไหร่ CPU ใช้ไปเท่าไหร่ มี Thread อยู่เท่าไหร่		<br>				
							- 	traffic number of requests <br>
							- 		memory : yes<br>
							- 		threads : yes<br>
							- 		requests : yes, http but also sql<br>
							- 		cpu : yes<br>
							- 		logs : yes<br>
						</td>
					</tr>					
				</table> 
                <br> 

			</div> 
			</div>
			</td> 
		</tr>				 			
		</table>	 
 </div>
</form:form>
</div>
</div>

 
	