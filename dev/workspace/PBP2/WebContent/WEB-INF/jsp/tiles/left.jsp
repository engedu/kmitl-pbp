<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.AuthenticationException"%>

<div>
<table width="220"  border="0" cellspacing="0" cellpadding="0"  >
  <tr>
    <td>
		<div class="accmenu" style="float:left;" id="list1b">
		<sec:authorize ifAnyGranted="ROLE_USER">	 
		</sec:authorize>
		<sec:authorize ifAnyGranted="ROLE_ADMIN">
			<a class="mainMenu"><span class="IconUser"></span>Administration Tasks </a>
		  	<div>
				<table width="100%" border="0">
				<tbody>
					<tr><td class="subMenu"> <a href="<%=request.getContextPath()%>/admin/role/init.htm">Role Management</a></td>	</tr>
					<tr><td class="subMenu"> <a href="<%=request.getContextPath()%>/admin/group/init.htm">Group Management</a></td>	</tr>
					<tr><td class="subMenu"> <a href="<%=request.getContextPath()%>/store/init.htm"">Customer Management</a></td>	</tr>	
					<tr><td class="subMenu"> <a href="<%=request.getContextPath()%>/admin/user/init.htm">User Management</a></td>	</tr>						
                </tbody>
                </table>            
			</div>
		</sec:authorize>
		<sec:authorize ifAnyGranted="ROLE_ADMIN,ROLE_CUSTOMER_SUPER">
		</sec:authorize>
		<sec:authorize ifAnyGranted="ROLE_CUSTOMER_USER">
			<a class="mainMenu"><span class="IconOrder"></span>Customer</a>
		  	<div>
				<table width="100%" border="0">
				<tbody>							
					<tr><td> <a href="<%=request.getContextPath()%>/customer/init.htm"><spring:message code="label.menu.customerDetail"/> </a></td>	</tr>	
					<tr><td> <a href="<%=request.getContextPath()%>/store/user/init.htm"><spring:message code="label.menu.storeUser"/> </a></td>	</tr>	
					<tr><td> <a href="<%=request.getContextPath()%>/balance/init.htm">ยอดค้างชำระ </a></td>	</tr>									
					<tr><td> <a href="<%=request.getContextPath()%>/saleReceive/order/init.htm"><spring:message code="label.menu.customerOrder"/> </a></td>	</tr>
					<tr><td> <a href="<%=request.getContextPath()%>/saleReceive/orderStatus/init.htm"><spring:message code="label.menu.orderStatus"/></a></td>	</tr>
					<tr><td> <a href="<%=request.getContextPath()%>/saleReceive/saleOrderStatus/init.htm"> Sale Order Status</a></td>	</tr>

					<tr><td> <a href="<%=request.getContextPath()%>/shipment/init.htm"><spring:message code="label.menu.shipment"/></a></td>	</tr>
					<tr><td> <a href="<%=request.getContextPath()%>/invoice/init.htm"><spring:message code="label.menu.saleInvoice"/></a></td>	</tr>
					<!-- <tr><td> <a href="<%=request.getContextPath()%>/user/userProfile.htm">ข้อมูลผู้ใช้</a></td>	</tr> -->
				</tbody>
				</table>
			</div>	
		</sec:authorize>	
		<div class="accmenu" style="float:left;" id="list1b">
		 <a class="mainMenu"><span class="IconUser"></span>ภูมิใจไทยซีเมนต์  </a>
		<table width="100%" border="0">
			<tbody>
				<tr><td class="subMenu"> <a href="<%=request.getContextPath()%>/static/about.htm">เกียวกับเรา</a></td>	</tr>
				<tr><td class="subMenu"> <a href="<%=request.getContextPath()%>/static/product.htm">ผลิตภันฑ์</a></td>	</tr>
				<tr><td class="subMenu"> <a href="<%=request.getContextPath()%>/static/activity.htm">กิจกรรมของเรา</a></td>	</tr>
				<tr><td class="subMenu"> <a href="<%=request.getContextPath()%>/static/service.htm">บริการด้านการตลาต</a></td></tr>
				<tr><td class="subMenu"> <a href="<%=request.getContextPath()%>/static/contact.htm">ติดต่อเรา</a></td>	</tr>
				<tr><td class="subMenu"> <a href="<%=request.getContextPath()%>/static/career.htm">ร่วมงานกับเรา</a></td></tr>
				<tr><td class="subMenu"> <a href="<%=request.getContextPath()%>/user/register.htm">ลงทะเบียน</a></td></tr>
		    </tbody>
	   </table>  		
		</div>	
		</div>              
    </td>
  </tr>
</table>
<table width="220"  border="0" cellspacing="0" cellpadding="0" height="100px;" >
  <tr>
  <td>&nbsp;</td>
  </tr>
  </table>
</div>
<script type="text/javascript">
function doLogin(){
	var form = document.forms['mainForm'];
	form.action='<%=request.getContextPath()%>/j_spring_security_check';
	form.submit();
}
</script>

