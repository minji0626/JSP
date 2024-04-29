<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 입력 Form</title>
</head>
<body>
	<form action="processJoining.jsp" method="post">
		아이디 <input type="text" name="id" size="10"><br>
		비밀번호 <input type="password" name="password" size="10"><br>
		이름 <input type="text" name="name" size="10"><br>
		이메일 <input type="email" name="email" size="10"><br>
		주소 <input type="text" name="address" size="30"><br>
		 <input type="submit" value="회원 가입"><br>
	</form>
</body>
</html>