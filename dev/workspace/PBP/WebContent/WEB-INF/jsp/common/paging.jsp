<%@ page session="false"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<jsp:useBean id="currentPageNumber" type="java.lang.Integer" scope="request" />
 
 
 
 		 <div class="pbptableWrapper" style="border: none;">
        
             
			<table class="pbp-table" style="border: none;">
 
 	<tr>
 		<td width="30%" style="border: none;">&nbsp;</td>
 		<td style="border: none;"> 
 <table  style="border: none;">
	<tr align="center">			
		<% request.setAttribute("pageUrl","paging"); %>					
		<pg:prev export="pageUrl" ifnull="<%= true %>">
			<%	
				if (pageUrl != null) {
					//System.out.println(" prev pageUrl:"+pageUrl);
			%>
			<td class="tdFirst" style="border: none;">
				<A HREF="<%=pageUrl%>"> 	<b>Previous</b></A>
			</td>
			<%
				} else {
			%>
			<td class="tdFirst" style="border: none;">				
			</td>
			<%
				}
			%>					
		</pg:prev>		
		<td style="border: none;"> &nbsp;</td>	
		<pg:pages>
			<%
				if (pageNumber == currentPageNumber) {
			%>
			<td class="tdFirst" style="border: none;">
				<font color="#a90a08"> <%=pageNumber%></font>
			</td>
			<%
				} else {					
				//	System.out.println(" != pageUrl:"+pageUrl);
			%>
			<td class="tdFirst" style="border: none;">
				<A HREF="<%=pageUrl%>"> <%=pageNumber%></A>
			</td>
			<%
				}
			%>
		</pg:pages>
		<td style="border: none;"> &nbsp;</td>
		<pg:next export="pageUrl" ifnull="<%= true %>">
			<%
				if (pageUrl != null) {
					//System.out.println(" next pageUrl:"+pageUrl);
			%>
			<td class="tdFirst" style="border: none;">
				<A HREF="<%=pageUrl%>"><b>Next</b></A>
			</td>
			<%
				} else {
			%>
			<td class="tdFirst" style="border: none;">	
            </td>
			<%
				}
			%>
		</pg:next>
	</tr>
</table>		
 		</td>
 		<td width="30%" style="border: none;">&nbsp;</td>
 	</tr>
 </table>

 </div>

