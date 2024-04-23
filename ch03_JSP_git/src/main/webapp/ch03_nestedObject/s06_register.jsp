<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 입력 내역</title>
</head>
<body>
<h3><%=request.getParameter("name")%> 님의 마이페이지</h3>
이름 : <%=request.getParameter("name")%> <br>
ID : <%=request.getParameter("id")%>	<br>
PW : <%=request.getParameter("password")%><br>
전화 번호 : <%=request.getParameter("phone")%><br>
취미 : <% String[] hobbies = request.getParameterValues("hobby");
	if(hobbies != null){
		for(int i = 0; i< hobbies.length; i++){
			%>
			<%= hobbies[i]%>
			<% if (i < hobbies.length-1)
				out.println(", ");
		}
	}
%><br>
자기 소개 : <%=request.getParameter("content")%><br>
</body>
</html>