<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
 
<form:form modelAttribute="lovHeader"	action="view.htm" method="POST" name="mainForm">  
 
	<div class="post">
	<h2 class="title">ประเภทค่าคงที่ > View </h2>
		<div class="entry">
		<table width="100%">	
		
		
		
			<tr>	
				<td class="formLabel">
					  Code:
				</td>
				<td class="formValue">
					${lovHeader.code} 
				</td> 
 	
				<td class="formLabel">
					  Name:
				</td>
				<td class="formValue">
					${lovHeader.name} 
				</td> 
				<td align="left">				 
				<input class="btn_2" value="<spring:message code="label.button.back"/>"  type="button" onclick="init();">	
					    
			    </td>
			</tr>			
 			
			 <tr>	
				<td class="formLabel">
					Status:
				</td>
				<td class="formValue">
				 <form:radiobutton  path="status"  id="status0"  value="0" />Enable
				<form:radiobutton path="status" id="status1" value="1"   />Disable
				</td> 
                <td colspan="3"> &nbsp;</td>

		     </tr>			
		</table>
		
	 
	 
		<div class="line">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>		

   	<h2 class="title">ประเภทค่าคงที่ </h2>
       
 
	<table class="tableSearchResult">
			<thead>
          <tr  class="searchResultHeader">
         <th class="headerTH">Code</th>
        	<th class="headerTH">Name</th>
 
        </tr>
    </thead>
 
	
	<c:forEach items = "${lovHeader.detailList}" var="domain">	
	

      <tbody>
         <tr class="trGray">          	 	
        	 
        	 <td align="left"> <img src="<c:url value="/images/tr_arrow1.gif"/>"/> &nbsp;<c:out value="${domain.code}"/>&nbsp;</td>
        	  <td> <c:out value="${domain.name}"/>&nbsp;</td> 
 
		</tr>    
		</tbody>          
    </c:forEach>  
    </table>	
  
	</div>
	</div>
</form:form>	
 
 <script type="text/javascript">

	function init (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/lovHeader/init.htm";
		form.method='GET';	
		form.submit();	
	}

	function addNewLOV (){
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/lovHeader/addNewLOV.htm";
		form.method='POST';	
		form.submit();	
	}
</script>