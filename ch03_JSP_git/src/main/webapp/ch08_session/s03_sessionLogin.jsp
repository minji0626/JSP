<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%
		//Post 방식으로 전송된 데이터 인코딩 타입 지정
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		//테스트용으로 id와 password가 같으면 로그인 처리
		if(id.equals(password)){ // 로그인 성공
								// 속성명	속성값
			session.setAttribute("user_id", id);
%>
	ID <%=id %> Logged in<br>
	<input type="button" value="Login Check" onclick="location.href='s04_sessionLoginCheck.jsp'">
	<input type="button" value="Logout" onclick="location.href='s05_sessionLogout.jsp'">
	
<% 
	} else{ // 로그인 실패
		%>
		<script type="text/javascript">
			alert('아이디와 비밀번호가 불일치합니다. 로그인에 실패하였습니다.');
			history.go(-1);
		</script>
		<%
	}
	%>
</body>
</html>