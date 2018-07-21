<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<body>
<h1>rest风格的增删改查</h1>
<a href="employees">显示所有的员工</a><br/>
<!-- 并不是直接跳转到addEmployee.jsp,而是先跳转到addEmployee业务方法查询gender和Department -->
<a href="beforeAddEmployee/0">添加员工</a>
</body>
</html>