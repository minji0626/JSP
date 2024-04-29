<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.web.member.MemberVO"%>
<%
    	// 전송된 데이터 인코딩 타입 지정
    	request.setCharacterEncoding("UTF-8");
    	// 자바 빈 생성
    	MemberVO member = new MemberVO();
    	member.setId(request.getParameter("id"));
    	member.setPassword(request.getParameter("password"));
    	member.setName(request.getParameter("name"));
    	member.setEmail(request.getParameter("email"));
    	member.setAddress(request.getParameter("address"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
아이디 : <%= member.getId() %><br>
비밀번호 : <%= member.getPassword() %><br>
이름 : <%= member.getName() %><br>
이메일 : <%= member.getEmail() %><br>
주소 : <%= member.getAddress() %><br>
</body>
</html>