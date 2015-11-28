<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  

<form:form modelAttribute="academicKPIWrapper" action="edit.htm" method="POST" name="mainForm"> 	 
<form:hidden path="academicYear"/>

   <div class="row">
   <div class="col-md-2 col-sm-2"></div>
   <div class="col-md-6 col-sm-6">
        <div class="panel panel-default">
          
   			<div class="panel-body">
              <div class="list-group">
              <c:forEach items="${academicKPIWrapper.pBPWorkTypeList}" var="domain5" varStatus="status5"> 
              
          
                
                <a href="<%=request.getContextPath()%>/pam/person/listByWorktype.htm?workTypeCode=<c:out value="${domain5.code}"/>&academicYear=<c:out value="${academicKPIWrapper.academicYear}"/>" class="list-group-item">
               <span style="font-size: 20px; font-weight: bold; color: rgb(92,184,92);">  ${domain5.name}</span> 
                           
                </a>
                     </c:forEach>
              </div>
            </div>
   		</div>
   		
  </div>
  </div>
 
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header" style="text-align: center; font-size: 25px;">
                            เลือกรายการภาระงานเพื่อนำเข้าผลงาน <small></small>
                        </h1>
                    </div>
                </div>
                
    			<table class="pbp-table">
		   	   	<thead>
		   	   		<tr><th colspan="3">
		   	   		<div class="pbp-header"><span class="lsf-icon colororange" title="list"></span>  ${academicKPIWrapper.pBPWorkType.name} </div> 
					
					</th></tr>
		   	   		<tr>
		   	   			<th class="thFirst">ภาระงาน</th>
		   	   			<th class="thFirst">คะแนน</th>
 						<th class="thFirst">หมายเหตุ</th>
		   	   		</tr>
		   	   	</thead>
		   	   	
		   	   	<tbody> 
		   		<c:forEach items="${academicKPIWrapper.academicKPIList}" var="domain" varStatus="status">  
		   			<tr class="row1">
		   				<td class="tdFirst">
		   			  <c:if test="${domain.fromRegis != 'Y' }"> 
		   				<a rel="notLoading" href="<%=request.getContextPath()%>/pam/person/importwork.htm?academicKPICode=<c:out  value="${domain.code}"/>&academicYear=<c:out  value="${academicKPIWrapper.academicYear}"/>"> 
		   				     ${domain.name}
		   				</a>		
		   				</c:if>
		   				 <c:if test="${domain.fromRegis == 'Y' }">    
		   				  ${domain.name}
		   				 </c:if>				 
		   				 </td>
		   				<td class="tdFirst">${domain.mark} ชั่วโมงภาระงาน/ ${domain.unitDesc}</td>
 	   					<td class="tdFirst">
 	   					 ${domain.description}
 	   					<!--  
								    <c:if test="${domain.fromRegis == 'Y' }">  	 
						        ระบบดึงข้อมูลตารางสอนอัตโนมัติจาก สำนักทะเบียน
								    </c:if > 	   					
-->
						 </td>
		   			</tr>
		   			 	   			           
		       </c:forEach>   
		       
		       	 </tbody>		   	   	
			</table> 
</form:form>
 <script type="text/javascript">
    $(document).ready(function() {
       
     $(".row1:odd").css("background-color","rgb(235,235,235)");
    });
 
</script>
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
	
	function changeWorkType (In){		
		var form = document.forms['mainForm']; 
	//	 alert(In);
		form.action ="<%=request.getContextPath()%>/pam/person/listByWorktype.htm?workTypeCode="+In+"&academicYear=<c:out value="${academicKPIWrapper.academicYear}"/>";
		//alert(form.action);
		form.method='GET';	
		form.submit();
	}
</script>
 