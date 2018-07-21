<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addEmployee</title>
<script src="../static/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<!-- 使用form标签库好处:
       1.可以自动完成回显
       2.可以取代传统jsp中的复杂操作
     常用form标签:
       1.<form:form>：可以完成回显,通过ｍodelAttribute实现回显
         通过modelAttribute指定key,如果没有指定则默认为command
       2.<form input path="">
 -->
	<form:form id="form" method="post" action="employees" modelAttribute="command">
		<c:if test="${id==0}">
			<h1>增加员工</h1>
		</c:if>
		<c:if test="${id!=0}">
			<h1>修改员工</h1>
		</c:if>
		<table>
			<tr>
				<td>NAME</td>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td>EMAIL</td>
				<td><form:input path="email" /></td>
			</tr>
			<tr>
				<td>GENDER</td>
				<td><form:radiobuttons path="gender"
						items="${requestScope.genders}" /></td>
			</tr>
			<tr>
				<td>DEPARTMENT</td>
				<td><form:select path="department.deptName"
						items="${requestScope.departments }" itemLabel="deptName"
						itemValue="deptId" /></td>
			</tr>
		</table>
		<c:if test="${requestScope.id!=0 }">
			<input type="hidden" name="_method" value="PUT" />
		</c:if>
		<button id="btn1" type="submit">提交</button>
	</form:form>
	</form:form>
</body>
</html>