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
	  	Install MySQL on CentOS     
	  	
	
 
 	<div class="techP">
ตรวจสอบว่า มีการลง mysql อยู่แล้วหรือไม่ <br>
which mysql<br>
หากระบบเจอจะแจ้งว่ามีการลงไว้แล้ว<br>
<br>
หากต้องการลบออกใช้คำสั่งดังนี้<br>
yum remove mysql-server<br>
yum remove mysql<br>
<br>
หากต้องการลงใหม่ใช้คำสั่งดังนี้<br>
yum install mysql-server<br>
yum install mysql<br>
yum install mysql-devel<br>
<br>
หากต้องการใช้ร่วมกับ php<br>
yum install php-mysql<br><br>

สั่ง mysql เริ่มทำงาน<br>
/etc/init.d/mysqld start<br>
<br>

Import database xxxx.sql<br>
mysql -u root -p&lt;xxxx.sql<br>
Enter password:<br><br>

ตั้ง password<br>
mysql<br>
mysql> USE mysql;<br>
mysql> UPDATE user SET Password=PASSWORD(‘new-password’) WHERE user=’root’;<br>
mysql> FLUSH PRIVILEGES;<br>
quit	
	<br>
	</div>
 		       	
 	</div>
 

 </div>
 </div>