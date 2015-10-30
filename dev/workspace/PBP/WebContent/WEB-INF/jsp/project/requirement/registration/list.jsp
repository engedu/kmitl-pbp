<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %> 
<A NAME="top"></A>
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %>
<div class="content100">  
<div class="mainContent100"> 
<form:form   action="search.htm" method="POST" name="mainForm"> 
	<div class="subTopicHeader">Use Case Description ฝ่ายทะเบียน (Registration) 	
	
			<sec:authorize ifAnyGranted="ROLE_PROJECT_SA ">
			<a href="<%=request.getContextPath()%>/project/requirement/usecase/create.htm" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
			</a> 
		</sec:authorize> 
	 
	</div> 	
	<div class="searchFormNoBorder">	
	<br> 
	<div class="usecaseHeaderTxt">
	
	<table width="80%">
		<tr>
			<td align="left"><a href="#"># นำนักเรียนเข้าระบบ </a></td>
			<td align="left"><a href="#"># จัดห้องเรียน  </a> </td> 
			<td align="left"><a href="#"># กำหนดอาจารย์ที่ปรึกษา  </a></td>
		</tr>
		<tr>
			<td align="left"><a href="#"># กำหนดห้อง </a></td>
			<td align="left"><a href="#"># เลขที่ให้นักเรียน  </a> </td> 
			<td align="left"><a href="#"># คาบเรียน  </a></td>
		</tr>		
		<tr>
			<td align="left"><a href="#"># ออกบัตรประจำตัวนักเรียน </a></td>
			<td align="left"><a href="#">   </a> </td> 
			<td align="left"><a href="#">   </a></td>
		</tr>		
	</table> 
	</div> 
	<br>
	<br> 
         
    <div class="backtToTop"><a href="#top">Back To Top</a></div>
    <div class="usecase">
      <table  >
      	<tr>
      		<td class="usecaseheader">Name:</td>
      		<td>UC1 นำนักเรียนเข้าระบบ</td>
      	</tr>
      	<tr>
      		<td class="usecaseheader">Summary:</td>
      		<td>เป็น use case ที่ใช้ในการ นำนักเรียนเข้าระบบ ทั้งนำเข้าจาก file (.txt,.xls) และนำเข้าที่ละคนผ่านโปรแกรม</td>
      	</tr>      	
       	<tr>
      		<td class="usecaseheader">Actor:</td>
      		<td>ครูฝ่ายทะเบียน</td>
      	</tr>       	
        	<tr>
      		<td class="usecaseheader">Basic Flow:</td>
      		<td> </td>
      	</tr>      
        	<tr>
      		<td class="usecaseheader">Alternative Flows:</td>
      		<td> </td>
      	</tr>      	
      	 	   
      </table>   
    </div>   
 
 	<br>
	<br> 
        
    <div class="backtToTop"><a href="#top">Back To Top</a></div>
    <div class="usecase">
      <table  >
      	<tr>
      		<td class="usecaseheader">Name:</td>
      		<td>UC2 จัดห้องเรียน</td>
      	</tr>
      	<tr>
      		<td class="usecaseheader">Summary:</td>
      		<td>เป็น use case ที่ใช้ในการ นำนักเรียนเข้าระบบ ทั้งนำเข้าจาก file (.txt,.xls) และนำเข้าที่ละคนผ่านโปรแกรม</td>
      	</tr>      	
       	<tr>
      		<td class="usecaseheader">Actor:</td>
      		<td>ครูฝ่ายทะเบียน</td>
      	</tr>       	
        	<tr>
      		<td class="usecaseheader">Basic Flow:</td>
      		<td> </td>
      	</tr>      
        	<tr>
      		<td class="usecaseheader">Alternative Flows:</td>
      		<td> </td>
      	</tr>      	   
      </table>   
    </div>  
     
    	<br>
	<br> 
       
    <div class="backtToTop"><a href="#top">Back To Top</a></div>
    <div class="usecase">
      <table  >
      	<tr>
      		<td class="usecaseheader">Name:</td>
      		<td>UC3 กำหนดอาจารย์ที่ปรึกษา</td>
      	</tr>
      	<tr>
      		<td class="usecaseheader">Summary:</td>
      		<td>เป็น use case ที่ใช้ในการ นำนักเรียนเข้าระบบ ทั้งนำเข้าจาก file (.txt,.xls) และนำเข้าที่ละคนผ่านโปรแกรม</td>
      	</tr>      	
       	<tr>
      		<td class="usecaseheader">Actor:</td>
      		<td>ครูฝ่ายทะเบียน</td>
      	</tr>       	
        	<tr>
      		<td class="usecaseheader">Basic Flow:</td>
      		<td> </td>
      	</tr>      
        	<tr>
      		<td class="usecaseheader">Alternative Flows:</td>
      		<td> </td>
      	</tr>     	   
      </table>   
    </div>     
	</div>
</form:form>
</div>
</div>

 
	