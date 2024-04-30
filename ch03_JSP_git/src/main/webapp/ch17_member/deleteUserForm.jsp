<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Integer user_num = (Integer)session.getAttribute("user_num");
	if(user_num==null){ // 로그인 되지 않은 경우
		response.sendRedirect("loginForm.jsp");
		return;
	}else{ // 로그인 된 경우
%>

	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>회원 탈퇴</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
	$(function() {
		// 이벤트 연결
		$('#delete_form').submit(function () {
			if($('#id').val().trim()==''){
				alert('아이디를 입력하세요');
				$('#id').val('').focus();
				return false;
			}	
			if($('#passwd').val().trim()==''){
				alert('비밀번호를 입력하세요');
				$('#passwd').val('').focus();
				return false;
			}
			if($('#cpasswd').val().trim()==''){
				alert('비밀번호 확인란을 입력하세요');
				$('#cpasswd').val('').focus();
				return false;
			}
			//비밀번호와 비밀번호 확인 일치 여부
			if($('#passwd').val() != $('#cpasswd').val()){
				alert('비밀번호와 비밀번호 확인이 불일치합니다.');
				$('#cpasswd').val('').focus();
				return false;
			} 
		});
	});
	
	</script>
	</head>
	<body>
	<div class="page-main">
		<h1>회원 탈퇴</h1>
		<form action="deleteUser.jsp" id="delete_form" method="post">
			<ul>
				<li>
					<label for="id">ID</label>
					<input type="text" id="id" name="id" maxlength="12">
				</li>
				<li>
					<label for="passwd">PW</label>
					<input type="password" id="passwd" name="passwd" maxlength="12">
				</li>
				<li>
					<label for="passwd">PW Check</label>
					<input type="password" id="cpasswd" maxlength="12">
				</li>
			</ul>
				<div class="align-center">
					<input type="submit" value="Delete Account">
					<input type="button" value="Home" onclick="location.href='main.jsp'">
				</div>
		</form>
	</div>
	</body>
	</html>
<%
	}
%>