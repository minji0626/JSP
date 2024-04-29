<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
	<div class="page-main">
		<h1>회원 가입</h1>
		<form action="registerUser.jsp" method="post" id="register_form">
			<ul>
				<li>
					<label for="id">아이디</label>
					<input type="text" name="id" id="id"  size="7" maxlength="12" autocomplete="off" class="input-check">
					<input type="button" id="confirm_id" value="ID 중복 확인">
					<span id="id_signed"></span>
				</li>
				<li>
					<label for="name">이름</label>
					<input type="text" name="name" id="name" class="input-check" maxlength="10">
				</li>
				<li>
					<label for="passwd">비밀번호</label>
					<input type="password" name="passwd" id="passwd" class="input-check" maxlength="12">
				</li>
				<li>
					<label for="email">이메일</label>
					<input type="email" name="email" id="email" class="input-check" maxlength="50">
				</li>
				<li>
					<label for="phone">전화번호</label>
					<input type="text" name="phone" id="phone" class="input-check" maxlength="15">
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="Register">
				<input type="button" value="Home" onclick="location.href='main.jsp'">
			</div>
		</form>
	</div>
</body>
</html>