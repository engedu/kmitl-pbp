<%@ page pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="nav-wrapper" style="height: 166px;">
    <div id="nav">
        <div id="root-nav">  </div>

        <div id="example-nav">

        <h3 style="vertical-align: middle;"><img src="<c:url value="/images/timetable.png"/>" />ตารางสอนประจำปีการศึกษา</h3>
            <ul>    <li><a href="<%=request.getContextPath()%>/personTimeTable/init.htm?academicYear=2555">2555</a></li>
                    <li><a href="<%=request.getContextPath()%>/personTimeTable/init.htm?academicYear=2556">2556</a></li>
                    <li><a href="<%=request.getContextPath()%>/personTimeTable/init.htm?academicYear=2557">2557</a></li> 
           			<li><a href="<%=request.getContextPath()%>/personTimeTable/init.htm?academicYear=2558">2558</a></li> 
            </ul>
        </div>
    </div>
 
</div>
 


