<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
<%
	// 세션 안의 모든 속성을 제거해서 세션을 갱신
	session.invalidate();
%>
Logged out.<br>
	<input type="button" value="Login Check" onclick="location.href='s04_sessionLoginCheck.jsp'">
	<input type="button" value="Login" onclick="location.href='s02_sessionLoginForm.jsp'">
</body>
</html>