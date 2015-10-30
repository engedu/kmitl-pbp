<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page	import="org.springframework.security.core.AuthenticationException"%>


<h1>Change Password</h1>
<form method="post">
<label for="oldpassword">Old Password</label>:
<input id="oldpassword" name="oldpassword" size="20" maxlength="50"
	type="password" /> <br />
<label for="password">New Password</label>: <input id="password"
	name="password" size="20" maxlength="50" type="password" /> <br />
</form>