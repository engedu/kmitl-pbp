<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.AuthenticationException"%>

<div class="customerServiceHeaderTxt"> บริการลูกค้า</div>
<div class="customerServiceHeader"> 
	<div class="customerServiceElement"> <a  href="<%=request.getContextPath()%>/customerService/order.htm">วิธีการสั่งซื้อ</a> </div>
	<div class="customerServiceElement"><a  href="<%=request.getContextPath()%>/customerService/payment.htm">การชำระเงิน</a> </div>
	<div class="customerServiceElement"><a  href="<%=request.getContextPath()%>/customerService/shipment.htm">วิธีการจัดส่งสินค้า</a></div>
	<div class="customerServiceElement"><a  href="<%=request.getContextPath()%>/customerService/contactUs.htm">ติดต่อเรา </a></div>
	<div class="customerServiceElement"> <a  href="<%=request.getContextPath()%>/customerService/orderTracking.htm">Order Tracking</a></div>
	<div class="customerServiceElement"> <a  href="<%=request.getContextPath()%>/customerService/faq.htm">FAQs</a></div>
 
<table height="100px;">
 	<tr>
 	<td>&nbsp;</td>
 	</tr>
 </table>
</div>
 
