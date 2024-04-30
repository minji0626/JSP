<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.member.dao.MemberDAO"%>
<%@ page import="kr.member.vo.MemberVO"%>
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
	<title>회원 상세 정보</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
	</head>
	<body>
	<%
		MemberDAO dao = MemberDAO.getInstance();
		MemberVO member = dao.getMember(user_num);
		
		if(member.getPhone() == null){
			member.setPhone("");
		}
	%>
	<div class="page-main">
		<h1>회원 정보</h1>
		<ul>
			<li>아이디 : <%= member.getId() %></li>
			<li>이름 : <%= member.getName() %></li>
			<li>이메일 : <%= member.getEmail() %></li>
			<li>전화번호 : <%= member.getPhone() %></li>
			<li>가입일 : <%=member.getReg_date() %></li>
		</ul>
		<hr size="1" width="100%" noshade="noshade">
		<div class="align-right">
			<input type="button" value="Member Update" onclick="location.href='modifyUserForm.jsp'">
			<input type="button" value="Delete Account" onclick="location.href='deleteUserForm.jsp'">
			<input type="button" value="Home" onclick="location.href='main.jsp'">
		</div>
	</div>
	</body>
	</html>
<%
	}
%>
