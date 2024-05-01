<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.board.dao.BoardDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="kr.board.vo.BoardVO"/>
<jsp:setProperty property="*" name="board"/>
<%	
	// 클라이언트의 ip 주소 저장
	board.setIp(request.getRemoteAddr());

	BoardDAO dao = BoardDAO.getInstance();
	dao.insert(board);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style2.css">
</head>
<body>
	<div class="page-main">
		<h1>글 등록 완료</h1>
		<div class="result-display">
			<div class="align-center">
				글 등록 성공!  
				<p>
				<button onclick="location.href='list.jsp'">글 목록</button>
			</div>
		</div>
	</div>
</body>
</html>