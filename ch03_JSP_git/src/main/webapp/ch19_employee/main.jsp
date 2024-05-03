<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
						<!-- 컨텍스트 경로로 지정해도 문제 없고, 컨텍스트 명이 바뀌더라도 문제 발생이 일어나지 않는다 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<title>SIST Home</title>
</head>
<body>
	<%
		String user_id = (String)session.getAttribute("user_id");
	%>
	<div class="page-main">
	 <h1>SIST</h1>
	 <div class="align-right">
	 <a href="list.jsp" style="margin-right: 15px;">사내 게시판</a>
	 	<%
	 		if(user_id == null){	// 로그인 실패
	 	%>
	 		<a href="insertEmployeeForm.jsp" style="margin-right: 15px;">회원 가입</a>
	 		<a href="loginForm.jsp" style="margin-right: 15px;">로그인</a>
	 	<%
	 		} else{	// 로그인 성공
	 	%>
	 		<a href="myPage.jsp" style="margin-right: 15px;">마이페이지</a>
	 		<b><%=user_id %></b>
	 		<a href="logout.jsp" style="margin-right: 15px;">로그아웃</a>
	 	<%		
	 		}
	 	%>
	 	<div class="align-center" style="margin-top: 50px;">
	 		<p>
			 <b>쌍용 교육센터 사내 페이지에 오신걸 환영합니다.</b><br><br>
			더 다양한 기능은 로그인 후 사용 가능합니다.<br>
			지속적으로 로그인에 실패하셨다면 회원가입을 진행해주세요.
		 </div>
	 </div>
	</div>
</body>
</html>