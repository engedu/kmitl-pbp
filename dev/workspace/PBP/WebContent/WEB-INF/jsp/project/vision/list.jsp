<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %> 
<%@include file="/WEB-INF/jsp/common/pageInfo.jsp" %> 
<div class="content100">  
<div class="mainContent100"> 
<form:form   modelAttribute="project"  action="search.htm" method="POST" name="mainForm"> 
 
	<div class="subTopicHeaderNoBorder"><c:out value="${project.projectName}"/> : Vision 
			<sec:authorize ifAnyGranted="ROLE_PROJECT_PM ">
			<a href="<%=request.getContextPath()%>/project/vision/edit.htm?projectId=<c:out value="${project.projectId}"/>" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
			</a> <span class="messageDetailUser"> Last Update By: <c:out value="${project.vision.updateBy}"/> &nbsp; <span class="messageDetailDate"><c:out value="${project.vision.updateDateTimeStr}"/></span></span>
		</sec:authorize>
	</div> 	
 
		<table width="95%">			
		<tr>	
		<td width="70%"> 
			 <div class=frameworkBody>
			 <div class="frameworkHeader"> Mission&nbsp;</div>  	 
			 <br>
			  <div class="frameworkBodyInner">
			 <c:set var="msg" value="${project.vision.summary}" scope="page" />
   		 	 <c:out value='${msg}' escapeXml="false" />   
   		 	 </div>			 
			 </div> 
			 
			 
   		 	 <div class="frameworkHeader">Architecture &nbsp;</div>  	 
			 <div class=frameworkBody>
			
			 <c:forEach items = "${project.vision.imagePathList}" var="domain"> 			 
			 <img src="<%=request.getContextPath()%>/servlet/Image?<c:out value="${domain.fullImagePath}"/>"/>			 
			 </c:forEach>
		 
			 </div> 	
			 
			  <div class="frameworkHeader">Detail &nbsp;</div>  	 
			 <div class=frameworkBody>
			 <c:set var="msg2" value="${project.vision.detail}" scope="page" />
   		 	 <c:out value='${msg2}' escapeXml="false" /> 
   		 	 </div>
   		 	   
 
 			  <div class="frameworkHeader">Reference &nbsp;</div>  	 
			 <div class=frameworkBody>  		 	  
   		 	 <c:set var="msg2" value="${project.vision.reference}" scope="page" />
   		 	 <c:out value='${msg2}' escapeXml="false" /> 
   		 	 </div> 			 
			 
			 
			 		 
		</td>
		<td width="30%"> 
		
		
			 
			 
			 
			 <div class=frameworkBody>
			 <div class="frameworkHeader">Development&nbsp;</div>  
			 <br>
			 
				<div class="download-block">  
				<div class="download-infos"> 
				<a href="<%=request.getContextPath()%>/project/requirement/useCase/initAll.htm?moduleId=">
				<b>Use Case Description</b><br> 
				</a>
				</div>
				<div class="clear"></div>
				</div> 				 
 
 				<div class="download-block">  
				<div class="download-infos"> 
				<a href="<%=request.getContextPath()%>/project/requirement/detailDesign/initAll.htm?moduleId=">
				<b>Detail Design</b><br> 
				</a>
				</div>
				<div class="clear"></div>
				</div> 	
				
				
				<div class="download-block">  
				<div class="download-infos"> 
				<a href="<%=request.getContextPath()%>/project/development/init.htm">
				<b>Development</b><br> 
				</a>
				</div>
				<div class="clear"></div>
				</div> 					
				
				<div class="download-block">  
				<div class="download-infos"> 
				<a href="<%=request.getContextPath()%>/project/testing/initAll.htm">
				<b>Testing</b><br> 
				</a>
				</div>
				<div class="clear"></div>
				</div> 	
				
								
				<div class="download-block">  
				<div class="download-infos"> 
				<a href="<%=request.getContextPath()%>/project/team/init.htm">
				<b>Team</b><br> 
				</a>
				</div>
				<div class="clear"></div>
				</div> 					
 							 
			 </div> 			
		
		
		      <br> 
		
		
			 <div class=frameworkBody> 
			 
			 <div class="frameworkHeader">Relate Documents&nbsp;</div>  
			 <br>
			 
<div class="download-block"> <a href="#" class="download-32">
<img src="<c:url value="/images/download-32.png"/>"/>
 </a>
				<div class="download-infos">
				
				<b>Vision   <img src="<c:url value="/images/icon/acrobat.gif"/>"/> </b><br>
				    0.9 MB<br>
				 
				</div>
				<div class="clear"></div>
				</div> 				 
			 
			 
<div class="download-block"> <a href="#" class="download-32">
<div class="tooltip-below" style="width:100%;height:100%;">
<div class="tooltipcontent" style="display:none;"><b>Name:</b> AeroVista_Mac.dmg<br><b>Type:</b> dmg<br><b>Size:</b> 7.3 MB</div>
<div class="tooltip" style="display: none; left: 63px; top: 514px; "><b>Name:</b> SRS Document<br><b>Type:</b> 
dmg<br><b>Size:</b> 7.3 MB</div></div></a>
				<div class="download-infos">
				
				<b>SRS Document <img src="<c:url value="/images/icon/word.gif"/>"/></b><br>
				   0.9 MB<br>
				</div>
				<div class="clear"></div>
				</div> 	
				
				
				
				
				<div class="download-block"> <a href="#" class="download-32"> </a>
				<div class="download-infos">				
				<b>Detail Design Document <img src="<c:url value="/images/icon/excel.gif"/>"/></b><br>
				  7.3 MB<br>
				</div>
				<div class="clear"></div>
				</div> 			 
			 </div> 
			 
			 
		 
			  <br> 
			 
			  <div class="frameworkHeader">File &nbsp;</div>  	 
			 <div class=frameworkBody>
			      <c:forEach items = "${project.vision.filePathList}" var="domain">     
			         <img src="<c:url value="/images/docCat-17.png"/>"  />&nbsp;<a href="<%=request.getContextPath()%>/updown/download.htm?filePath=<c:out value="${domain.fullImagePath}"/>&type=android"><c:out value="${domain.fileName}"/></a>
	                 </a>
		 		     <br>
			        </c:forEach>  
   		 	 </div> 			 
			 
		</td>
		
		</tr>
		</table>
 
 
	
	<div class="visionWrapp"> 
		<table width="100%">			
		<tr>	
			<td class="formValue">	 
			<div class="frameworkWrap">		
 
 

			  

   		 	 
   		 	
            </div>
			</td> 
		</tr>				 			
		</table>	
		

	</div> 		 
 
</form:form>

     		 	 <br>   		 	 
   		 	 <div class="leftHeaderTxt"> <div class="greenTitle">&nbsp;</div>Talk.. </div>  
   		 	  <hr class="hrSeparate">
 			<jsp:include page="/WEB-INF/jsp/webboard/topic/viewTopicInclude.jsp"></jsp:include> 	
</div>
</div>


 
	