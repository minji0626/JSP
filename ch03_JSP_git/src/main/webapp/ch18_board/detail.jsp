 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.board.dao.BoardDAO"%>
<%@ page import="kr.board.vo.BoardVO"%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDAO dao = BoardDAO.getInstance();
	BoardVO board = dao.getBoard(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세 정보</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
	<div class="page-main">
		<h1>게시판 글 상세</h1>
		<ul>
			<li>글 번호 : <%=board.getNum() %></li>
			<li>제목 : <%=board.getTitle() %></li>
			<li>작성자 : <%=board.getName() %></li>
		</ul>
		<hr width="100%" size="1" noshade="noshade">
			<p> 
				<%=board.getContent() %>
			</p>
		<hr width="100%" size="1" noshade="noshade">
		
		<div class="align-right">
			작성일 : <%=board.getReg_date() %>
			<input type="button" value="수정" onclick="location.href='updateForm.jsp?num=<%=board.getNum()%>'">
			<input type="button" value="삭제" onclick="location.href='deleteForm.jsp?num=<%=board.getNum()%>'">
			<input type="button" value="목록" onclick="location.href='list.jsp'">
		</div>
	</div>
</body>
</html>
 