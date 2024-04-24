<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login 여부 검사</title>
</head>
<body>
<%
	String user_id = (String)session.getAttribute("user_id");
	if(user_id != null){ // 로그인이 된 경우
%>

	[<%= user_id %>] Logged in!
	<br>	
	<input type="button" value="Logout" onclick="location.href='s05_sessionLogout.jsp'">

		
<%	} else{	// 로그인이 되지 않은 경우
		%>
		Not Logged in.
		<br>
		<input type="button" value="Login" onclick="location.href='s02_sessionLoginForm.jsp'">
		<%
	}
%>
</body>
</html>