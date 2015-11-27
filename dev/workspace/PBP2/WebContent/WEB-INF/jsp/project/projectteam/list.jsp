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
<form:form modelAttribute="team"	action="search.htm" method="POST" name="mainForm">  
 <div class="subTopicHeader"><c:out value="${team.projectName}"/>: User Mapping	  </div> 	  
 <br> 
 <br> 	 
 <div class="usecaseHeaderTxt"> 
	   <div class="usecase">  
		 User Name:	<form:input cssClass="tb1" path="username" /> <form:errors path="username" cssClass="require" /> 
		 <input class="btn_2" value="<spring:message code="label.button.search"/>" type="submit"> 	 &nbsp;&nbsp;  	 
 		</div> 
 </div>
	<br/>	
 
	<div class="usecaseHeaderTxt"> 
    <div class="usecase">
      <table >      
        <c:if test="${empty pagingBean.currentPageItem && doSearch == 'true' }">  	 
    	<tr class="searchNotFound">
    		<td colspan="2" align="center"><spring:message code="message.searchNotFound"/></td>
    	</tr>
    </c:if >
       <c:forEach items = "${pagingBean.currentPageItem}" var="domain">
        <tr >           	 	
        	  
			 <td> <c:out value="${domain.username}"/>&nbsp;</td>
 
				 <td align="center"> 
	 				<a href="<%=request.getContextPath()%>/project/pm/team/edit.htm?username=<c:out value="${domain.username}"/>&projectName=<c:out value="${team.projectName}"/>">          
		          		Add to Project
		          	</a>  
				</td> 
				 
        </tr>  
       </c:forEach> 
      </table>  
	
      </div>  
	</div>
	
	<br>
	<div>
   
          <a href="<%=request.getContextPath()%>/project/init.htm">
		 <input class="btn_2" value="<spring:message code="label.button.back"/>"  type="button"  >	
		 </a>	
	</div>
</form:form>
</div>
</div>

 
	
 