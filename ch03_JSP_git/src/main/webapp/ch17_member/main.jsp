<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
						<!-- 컨텍스트 경로로 지정해도 문제 없고, 컨텍스트 명이 바뀌더라도 문제 발생이 일어나지 않는다 -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
<title>회원 관리 Main</title>
</head>
<body>
	<%
		String user_id = (String)session.getAttribute("user_id");
	%>
	<div class="page-main">
	 <h1>회원관리 메인</h1>
	 <div class="align-right">
	 	<%
	 		if(user_id == null){	// 로그인 실패
	 	%>
	 		<a href="registerUserForm.jsp">회원 가입</a>
	 		<a href="loginForm.jsp">로그인</a>
	 	<%
	 		} else{	// 로그인 성공
	 	%>
	 		<a href="myPage.jsp">마이페이지</a>
	 		<b><%=user_id %></b> 로그인 중
	 		<a href="logout.jsp">로그아웃</a>
	 	<%		
	 		}
	 	%>
	 </div>
	</div>
</body>
</html>