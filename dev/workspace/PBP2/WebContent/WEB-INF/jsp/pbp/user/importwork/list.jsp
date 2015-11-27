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
 
 
        <div id="page-wrapper">
            <div id="page-inner">


                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header" style="text-align: center; font-size: 25px;">
                                      เลือกกลุ่มภาระงานเพื่อนำเข้าผลงาน <small></small>
                        </h1>
                    </div>
                </div>
                
                <br>
                 
                	<c:forEach items="${academicKPIWrapper.pBPWorkTypeList}" var="domain5" varStatus="status5"> 
                	
                	<a href="<%=request.getContextPath()%>/pam/person/listByWorktype.htm?workTypeCode=<c:out value="${domain5.code}"/>&academicYear=<c:out value="${academicKPIWrapper.academicYear}"/>">
                       <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-green">
                            <div class="panel-body">
                               
                              <h4>   <span style="font-size: 25px; font-weight: bold; color: rgb(92,184,92);">  ${domain5.name}</span> </h4>
                            </div>
                            <div class="panel-footer back-footer-blue"> &nbsp;  </div>       
                        </div>
                    </div>   
                    </a>
                              	
                	
                	</c:forEach> 
                    
         </div>
                </div>
 
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
 