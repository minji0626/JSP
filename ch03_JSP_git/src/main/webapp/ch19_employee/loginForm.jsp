<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 로그인</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
 $(function(){
	 $('#login_form').submit(function(){
		if($('#id').val().trim()==''){
			alert('ID를 입력해주세요.');
			$('#id').val('').focus();
			return false;
		};
		if($('#passwd').val().trim()==''){
			alert('PW를 입력해주세요.');
			$('#passwd').val('').focus();
			return false;
		};
	 });
 });
 </script>
</head>
<body>
	<div class="page-main">
	<h1>로그인</h1>
		<form action="login.jsp" method="post" id="login_form">
		<ul>
			<li>
				<label for="id">ID</label>
				<input type="text" name="id" id="id" maxlength="12">
			</li>
			<li>
				<label for="passwd">PW</label> 
				<input type="password"name="passwd" id="passwd" maxlength="12">
			</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="LogIn">
				<input type="button" value="Home" onclick="location.href='main.jsp'">
			</div>
		</form>
	</div>
</body>
</html>