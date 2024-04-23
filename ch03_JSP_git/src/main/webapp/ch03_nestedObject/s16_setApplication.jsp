<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application 기본 객체 속성 저장</title>
</head>
<body>
	<%
	String name = "id";
	String value = "dragon";
	application.setAttribute(name, value);
	%>
	application 기본 객체의 속성 설정 :
	<%= name %> = <%=value %>
</body>
</html>