<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<form:form modelAttribute="kpi"	action="search.htm" method="POST" name="mainForm"> 	 
<div class="post">
	<h2 class="title">ตัวชี้วัด</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
		<table width="100%" id="tableSearch">
			<tr>
				<td class="label-form">Name:</td>
				<td><form:input cssClass="input" path="name" />
					<form:errors path="name" cssClass="require" /> <input
					value="<spring:message code="label.button.search"/>" type="submit" class="btn btn-primary">
				</td>
	
				<td  align="right"><input
					value="<spring:message code="label.button.new"/>" type="button" class="btn btn-primary" onclick="create();"></td>
			</tr>
		</table>
		<div class="line">&nbsp;</div>
		<div style="clear: both;">&nbsp;</div>
		<div>
				<pg:pager url="search.htm"
					items="${pagingBean.totalItems}"
					maxPageItems="${pagingBean.maxPageItems}"
					maxIndexPages="${pagingBean.maxIndexPages}" isOffset="<%= true %>"
					export="offset,currentPageNumber=pageNumber" scope="request">
				<pg:param name="maxPageItems" />
				<pg:param name="maxIndexPages" />
		
				<table class="tableSearchResult">
					<thead class="tableHeader">
						<tr>
							<th class="headerTH">Code</th>
							<th class="headerTH">Name</th>
							<th class="headerTH">KPI</th>
							<th class="headerTH"><spring:message code="label.edit" /></th>
							<th class="headerTH"><spring:message code="label.delete" /></th>
						</tr>
					</thead>
					<tbody>
						<c:if
							test="${empty pagingBean.currentPageItem && doSearch == 'true' }">
							<tr class="row">
								<td colspan="4" class="row" align="center">
									<div class="searchNotFound"><spring:message code="message.searchNotFound" /></div>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${pagingBean.currentPageItem}" var="domain">
							<tr class="row">
								<td align="left"> <c:out value="${domain.code}"/>&nbsp;</td>
			 					<td align="left"> <c:out value="${domain.name}"/>&nbsp;</td>
			 					<td align="center">    
						            <a href="<%=request.getContextPath()%>/admin/kpi/initByCat.htm?kpiCategoryId=<c:out value="${domain.kpiCategoryId}"/>" >	           
						          		KPI
						            </a>  			 
								</td>
								<td align="center"><a href="<%=request.getContextPath()%>/admin/kpiCategory/edit.htm?kpiCategoryId=<c:out value="${domain.kpiCategoryId}"/>" >
									<img src="<c:url value="/images/edit.png"/>" /> </a></td>
								<td align="center"><a rel="notLoading" href="<%=request.getContextPath()%>/admin/kpiCategory/delete.htm?kpiCategoryId=<c:out  value="${domain.kpiCategoryId}"/>"  
									onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.name}"/> ?')">
								<img src="<c:url value="/images/delete.png"/>" /> </a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="footerPaging"><pg:index>
					<jsp:include page="/WEB-INF/jsp/common/paging.jsp" flush="true" />
				</pg:index></div>
			</pg:pager>
		</div>
	</div>
</div>		  
	<div class="searchFormNoBorder"> 
	 <div class="subTopicHeaderNoBorder">KPI &nbsp; Category</div> 
		<table width="100%"> 
		<tr>
		  <td colspan="5">
		     <c:forEach items = "${kpiCategorList}" var="domain1">      
		      
	            <a href="<%=request.getContextPath()%>/admin/kpi/initByCat.htm?kpiCategoryId=<c:out value="${domain1.kpiCategoryId}"/>" >	           
	          <c:out value="${domain1.name}"/>&nbsp;   
      
    		</c:forEach>  
		  </td>
		</tr>
 	
		</table>		
 
</div>


	<div class="searchFormNoBorder"> 
	 <div class="subTopicHeaderNoBorder">&nbsp;<c:out value="${kpi.categoryName}"/> 
	 	   	&nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  	        
		 <a href="<%=request.getContextPath()%>/admin/kpi/create.htm?kpiCategoryId=<c:out value="${kpi.kpiCategoryId}"/>" >	           
	          	<input class="btn_2" value="<spring:message code="label.button.new"/>"  type="button" >
	    </a> 
	 </div>  
	 
	 	<table class="searchResultTable" >
	 	
    <c:if test="${empty kpiList && doSearch == 'true' }">  	 
    	<tr >
    		<td colspan="4" align="center">
    		<div class="searchNotFound">
    		<spring:message code="message.searchNotFound"/>
    		</td>
    	</tr>
    </c:if >
        <c:forEach items = "${kpiList}" var="domain">
         <tr class="rgRow">     	
			 <td align="left"> <c:out value="${domain.code}"/>&nbsp;</td>
			 <td align="left"> <c:out value="${domain.name}"/>&nbsp;</td>
			 
			 <td align="center">    
	            <a href="<%=request.getContextPath()%>/admin/kpi/edit.htm?kpiId=<c:out value="${domain.kpiId}"/>" >	           
	          	<img src="<c:url value="/images/edit.png"/>" />
	            </a>  			 
			 </td>
			 <td align="center">	                  
	              <a rel="notLoading" href="<%=request.getContextPath()%>/admin/kpi/delete.htm?kpiId=<c:out  value="${domain.kpiId}"/>"  onclick="return confirmPage('ยืนยันการลบข้อมูล <c:out value="${domain.name}"/> ?')">
	             		<img src="<c:url value="/images/delete.png"/>"    />	             		 
	              </a>	              		 
			 </td>
		</tr>              
    </c:forEach>  
    
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
 