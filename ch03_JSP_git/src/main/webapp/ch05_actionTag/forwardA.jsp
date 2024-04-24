<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward test</title>
</head>
<body>
forwardA.jsp페이지, 보여지지 않습니다.
</body>
</html>
<jsp:forward page="forwardB.jsp">
	<jsp:param value="오렌지" name="color"/>
</jsp:forward>