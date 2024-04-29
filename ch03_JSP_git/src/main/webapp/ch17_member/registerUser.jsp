<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.member.dao.MemberDAO"%>
<%
	// 전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member" class="kr.member.vo.MemberVO" />
<%-- request로부터 전송된 데이터를 읽어들여 자바빈에 저장 --%>
<jsp:setProperty property="*" name="member" />
<%
	MemberDAO dao = MemberDAO.getInstance();
	dao.insertMember(member);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
	<div class="page-main">
		<h1>회원 가입 완료</h1>
		<div class="result-display">
			<div class="align-center">
				회원가입 성공!
				<p>
				<button onclick="location.href='main.jsp'">Home</button>
			</div>
		</div>
	</div>
</body>
</html>