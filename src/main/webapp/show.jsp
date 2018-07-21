<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show all Employees</title>
<script src="static/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var ids = ${requestScope.ids};
		for (let i = 0; i < ids.length; i++) {
			$("#delete-" + ids[i]).click(function() {
				var path = "employees/" + ids[i];
				$("#form").attr({"method":"post","action":path}).submit();
			});
		}
		for (let i = 0; i < ids.length; i++) {
			$("#update-" + ids[i]).click(function() {
				$(location).attr("href","beforeAddEmployee/"+ids[i]);
			});
		}
	});
</script>
</head>
<body>
	<c:if test="${ empty requestScope.employees }">
		<h2 align="center">员工列表为空</h2>
	</c:if>
	<c:if test="${ !empty requestScope.employees }">
		<h1 align="center">显示所有的员工</h1>
		<table width="500px" border="1" align="center">
			<tr>
				<td>ID</td>
				<td>NAME</td>
				<td>EMAIL</td>
				<td>GENDER</td>
				<td>DEPARTMENT</td>
				<td>DELETE</td>
				<td>UPDATE</td>
			</tr>
			<c:forEach items="${requestScope.employees}" var="employee">
				<tr>
					<td>${employee.id }</td>
					<td>${employee.name }</td>
					<td>${employee.email }</td>
					<!--进行判断:0为男性,1为女性-->
					<td><c:if test="${employee.gender==0}">男</c:if> <c:if
							test="${employee.gender!=0}">女</c:if></td>
					<td>${employee.department.deptName }</td>
					<td><button id="delete-${employee.id }">DELETE</button></td>
					<td><button id="update-${employee.id }">UPDATE</button></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<form method="post" id="form">
		<input type="hidden" name="_method" value="DELETE" />
	</form>
</body>
</html>