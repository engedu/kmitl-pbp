<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib  prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.buckwa.domain.*" %>
<%@ page import="java.util.*" %>  
<div class="content100">  
<div class="mainContent100"> 
 
	 <div class="headerTech"> 
	  	Technologies
	<br>
	<br> 

	
	<table class="searchResultTable" >
	<thead class="tableHeader">
        <tr  class="searchResultHeader">        	     
        	<th class="headerTH" style="text-align: left;padding-left: 10px;">
        	Configuration 		 
			<a href="<%=request.getContextPath()%>/project/module/create.htm" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
			</a> 			       	
        	</th>     
        </tr>        
    </thead>
    <tbody>
          <tr class="rgRow" >     	
			 <td style="font-size: 17px; text-align: left; padding-left:10px;"> <a href="#"> Mail Server on Cent OS</a>        </td>
		  </tr> 
          <tr class="rgRow" >     	
			 <td style="font-size: 17px; text-align: left; padding-left:10px;"> <a href="#"> SVN on Cent OS</a>        </td>
		  </tr> 
           <tr class="rgRow" >     	
			 <td style="font-size: 17px; text-align: left; padding-left:10px;"><a href="<%=request.getContextPath()%>/tech/config/installMySQLOnCentOS.htm" >Install MySQL on Cent OS</a>        </td>
		  </tr> 		  		     
    </tbody>	
    </table>
     <br>
    <br>   
	<table class="searchResultTable" >
	<thead class="tableHeader">
        <tr  class="searchResultHeader">        	     
        	<th class="headerTH" style="text-align: left;padding-left: 10px;">
        	Hardware 		 
			<a href="<%=request.getContextPath()%>/project/module/create.htm" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
			</a> 			       	
        	</th>     
        </tr>        
    </thead>
    <tbody>
          <tr class="rgRow" >     	
			 <td style="font-size: 17px; text-align: left; padding-left:10px;"> <a href="#"> Print Slip</a>        </td>
		  </tr> 
          <tr class="rgRow" >     	
			 <td style="font-size: 17px; text-align: left; padding-left:10px;"> <a href="#"> FingerPrint Scan</a>        </td>
		  </tr> 
          <tr class="rgRow" >     	
			 <td style="font-size: 17px; text-align: left; padding-left:10px;"> <a href="#"> Camera</a>        </td>
		  </tr> 		  		     
    </tbody>	
    </table>
     <br>
    <br>   
    
    	<table class="searchResultTable" >
	<thead class="tableHeader">
        <tr  class="searchResultHeader">        	     
        	<th class="headerTH" style="text-align: left;padding-left: 10px;">
        	Software 		 
			<a href="<%=request.getContextPath()%>/project/module/create.htm" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
			</a> 			       	
        	</th>     
        </tr>        
    </thead>
    <tbody>
          <tr class="rgRow" >     	
			 <td style="font-size: 17px; text-align: left; padding-left:10px;">  <a href="<%=request.getContextPath()%>/tech/initThread.htm" > Thread</a>        </td>
		  </tr> 
          <tr class="rgRow" >     	
			 <td style="font-size: 17px; text-align: left; padding-left:10px;">  <a href="<%=request.getContextPath()%>/tech/initWS.htm" > Spring WS</a>        </td>
		  </tr>		  
          <tr class="rgRow" >     	
			 <td style="font-size: 17px; text-align: left; padding-left:10px;">  <a href="<%=request.getContextPath()%>/tech/initREST.htm" > REST</a>        </td>
		  </tr>  		  
		  		  		     
    </tbody>	
    </table>	
    
    <br>
    <br>
    
   <table class="searchResultTable" >
	<thead class="tableHeader">
        <tr  class="searchResultHeader">        	     
        	<th class="headerTH" style="text-align: left;padding-left: 10px;">
        	Network 		 
			<a href="<%=request.getContextPath()%>/project/module/create.htm" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
			</a> 			       	
        	</th>     
        </tr>        
    </thead>
    <tbody>
          <tr class="rgRow" >     	
			 <td style="font-size: 17px; text-align: left; padding-left:10px;"> <a href="#"> Wireless Network</a>        </td>
		  </tr> 	  		     
    </tbody>	
    </table>
	
     <br>
     <br>
   <table class="searchResultTable" >
	<thead class="tableHeader">
        <tr  class="searchResultHeader">        	     
        	<th class="headerTH" style="text-align: left;padding-left: 10px;">
        	Android 		 
			<a href="<%=request.getContextPath()%>/project/module/create.htm" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
			</a> 			       	
        	</th>     
        </tr>        
    </thead>
    <tbody>
          <tr class="rgRow" >     	
			 <td style="font-size: 17px; text-align: left; padding-left:10px;"> <a href="#"> Android Call REST</a>        </td>
		  </tr> 	  		     
    </tbody>	
    </table>
    
    
     <br>
     <br>
   <table class="searchResultTable" >
	<thead class="tableHeader">
        <tr  class="searchResultHeader">        	     
        	<th class="headerTH" style="text-align: left;padding-left: 10px;">
        	jQuery 		 
			<a href="<%=request.getContextPath()%>/project/module/create.htm" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
			</a> 			       	
        	</th>     
        </tr>        
    </thead>
    <tbody>
          <tr class="rgRow" >     	
			 <td style="font-size: 17px; text-align: left; padding-left:10px;"> <a href="#"> Calendar</a>        </td>
		  </tr> 
          <tr class="rgRow" >     	
			 <td style="font-size: 17px; text-align: left; padding-left:10px;"> <a href="#"> Menu</a>        </td>
		  </tr> 		  
		  	  		     
    </tbody>	
    </table>    
       <br>
     <br>
   <table class="searchResultTable" >
	<thead class="tableHeader">
        <tr  class="searchResultHeader">        	     
        	<th class="headerTH" style="text-align: left;padding-left: 10px;">
        	Provider 		 
			<a href="<%=request.getContextPath()%>/project/module/create.htm" >
				<img src="<c:url value="/images/plus.jpg"/>"/> 
			</a> 			       	
        	</th>     
        </tr>        
    </thead>
    <tbody>
              <tr class="rgRow" >     	
			 <td style="font-size: 17px; text-align: left; padding-left:10px;"> 
			 <a href="<%=request.getContextPath()%>/tech/sms/initSMS.htm" > SMS Gateway</a>       
			  </td>
		  </tr> 
          <tr class="rgRow" >     	
			 <td style="font-size: 17px; text-align: left; padding-left:10px;"> <a href="#"> ไปรษณีย์ </a>        </td>
		  </tr> 
  
          <tr class="rgRow" >     	
			 <td style="font-size: 17px; text-align: left; padding-left:10px;"> <a href="#"> Smart Card</a>        </td>
		  </tr> 			      
    </tbody>	
    </table>          
	 </div> 
 </div>
 </div>