<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<form:form
	modelAttribute="workTemplate" action="create.htm" method="POST"
	name="mainForm">
<div class="post">
	<h2 class="title">รูปแบบผลงาน > สร้าง</h2>
	<div class="entry">
		<div style="clear: both;">&nbsp;</div>
			<table>
				<tr>
					<td class="label-form">กลุ่ม:</td>
					<td class="text">
						<form:select path="groupId" id="groupId">
							<form:option value="0" label="--- กรุณาเลือกกลุ่ม---"/> 
							<form:options items="${groupList}" itemValue="kpiCategoryId" itemLabel="name" />
						</form:select>
						<span class="require">*</span><form:errors path="groupId" cssClass="require" />
					</td>
				</tr>
				<tr>
					<td class="label-form">ชื่อรูปแบบ :</td>
					<td><form:input cssClass="input" path="name" id="name" /><span class="require">*</span>
					<form:errors path="name" cssClass="require" /></td>
				</tr>
				
			</table>
			<div class="line">&nbsp;</div>
			<table>
				<tr>
					<td class="label-form">รูปแบบ </td>
					<td  align="right">
						<a href="#" onclick="createAttr();return false;" rel="notLoading"><img src="<c:url value="/images/plus.jpg"/>" alt="<spring:message code="label.button.new"/>"/></a>
					</td>
				</tr>
			</table>
			<div id="attrScreen">
				<ul id="attr" class="attr-ul">
					<c:forEach items="${workTemplate.workTemplateAttrList}" var="domain" varStatus="row"> 
						<li class="attr-li" id="attrli-${row.index}">คุณสมบัติ &nbsp;
							<form:input cssClass="input" path="workTemplateAttrList[${row.index}].label"/>
							&nbsp;
							<form:select path="workTemplateAttrList[${row.index}].unitId">
								<form:option value="0">--ระบุ--</form:option>
								<form:options items="${unitList}" itemLabel="name" itemValue="unitId"/>
							</form:select>
							<form:checkbox path="workTemplateAttrList[${row.index}].flagCalculate" value="1"/>คำนวณ
							<form:checkbox path="workTemplateAttrList[${row.index}].isFile" value="1"/>แนบไฟล์
							<span class="require">*</span><form:errors path="workTemplateAttrList[${row.index}].label" cssClass="require" />
							&nbsp;
							<form:hidden path="workTemplateAttrList[${row.index}].kpiId" id="kpi${row.index}"/>
							<form:hidden path="workTemplateAttrList[${row.index}].isDel" id="isDel-${row.index}"/>
							<a href='#' onclick='kpi(${row.index})' rel="notLoading">กำหนดตัวชี้วัด</a>&nbsp;
							<a href="#" onclick="removeAttr(${row.index});return false;" rel="notLoading"><img src="<c:url value="/images/delete.png"/>" alt='ลบ'/></a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<br/>
			<table>
				<tr>
					<td align="center">
						<input value="<spring:message code="label.button.new"/>" class="btn btn-primary" type="button" onclick="create();" rel="notLoading">
						<input class="btn btn-primary" value="<spring:message code="label.button.cancel"/>" type="button" onclick="init();">
					</td>
				</tr>
			</table>
		</div>
</div>
<select id="unitId" style="display: none">
	<option value="0">--ระบุ--</option>
	<c:forEach items="${unitList}" var="domain" varStatus="row">
		<option value="${domain.unitId}"><c:out value="${domain.name}"/></option>
	</c:forEach>
</select>

</form:form>

<script type="text/javascript">

	function init (){
		
		var form = document.forms['mainForm']; 
		form.action ="<%=request.getContextPath()%>/admin/worktemplate/init.htm";
		form.method = 'GET';
		form.submit();
	}

	function create() {
		if($("#attr > li:visible").length==0){
			alert('กรุณากำหนดรูปแบบ');
			return false;
		}else{
			openWaiting();
			var form = document.forms['mainForm']; 
			form.action ="<%=request.getContextPath()%>/admin/worktemplate/create.htm";
			form.method='POST';	
			form.submit();
		}
		
	}

	var index='<c:out value="${fn:length(workTemplate.workTemplateAttrList)}" />';
	var delBtn='<c:url value="/images/delete.png"/>';

	function createAttr(){
		var selectBox = generateSelect(index);
		$("#attr").append("<li class='attr-li' id='attrli-"+index+"'>คุณสมบัติ &nbsp; <input type='text' class='input' name='workTemplateAttrList["+index+"].label' value=''> &nbsp;  "+selectBox+"&nbsp;<input type='checkbox' name='workTemplateAttrList["+index+"].flagCalculate' value='1'/>คำนวณ &nbsp;<input type='checkbox' name='workTemplateAttrList["+index+"].isFile' value='1'>แนบไฟล์ &nbsp;<span class='require'>*</span><form:errors path='workTemplateAttrList["+index+"].label' cssClass='require' />&nbsp;<input type='hidden' name='workTemplateAttrList["+index+"].isDel' id='isDel-"+index+"' value='0'/><input type='hidden' name='workTemplateAttrList["+index+"].kpiId' id='kpi"+index+"' value='0'/><a href='#' onclick='kpi("+index+")' rel='notLoading'>กำหนดตัวชี้วัด</a>&nbsp;<a href='#' onclick='removeAttr("+index+");return false;' rel='notLoading'><img src="+delBtn+" alt='ลบ'/></a></li>");
		index++;
	}
	function removeAttr(indexli){
		$("#isDel-"+indexli).val('1');
		$("#attrli-"+indexli).hide();
	}
	
	function generateSelect(indexS){
		var options="";
		$('#unitId option').each(function() {
			options= options+ "<option value='"+$(this).val()+"'>"+$(this).text()+"</option>";
		});
		return "<select name='workTemplateAttrList["+indexS+"].unitId'>"+options+"</select>";
	}

	function kpi(indexS){
		var url = '<%=request.getContextPath()%>/admin/worktemplate/kpi.htm?attrIndex='+indexS+'&groupId='+$("#groupId").val()+'&kpiId='+$("#kpi"+indexS).val();
		myleft=(screen.width)?(screen.width-600)/2:100;   
	    mytop=(screen.height)?(screen.height-500)/2:100;     
	    properties = "width="+600+",height="+500;  
	    properties +=",scrollbars=yes, top="+mytop+",left="+myleft;     
	    window.open(url,"กำหนดตัวชี้วัด",properties);  
	    
	}

	function setKpiFromPopup(indexS,value){
		$("#kpi"+indexS).val(value);
	}

	$(document).ready( function() {
		if($("#attr > li:visible").length==0)
			createAttr();
	});
</script>