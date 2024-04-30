<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
 $(function(){
	// 이벤트 연결
	$('#login_form').submit(function(){
		if($('#id').val().trim()==''){
			alert('ID를 입력하세요.');
			$('#id').val('').focus();
			return false;
		};
			
		if($('#passwd').val().trim()==''){
			alert('PW를 입력하세요.');
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
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" maxlength="12">
			</li>
			<li>
				<label for="passwd">비밀번호</label> 
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