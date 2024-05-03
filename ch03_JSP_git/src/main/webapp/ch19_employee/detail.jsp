<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO"%>
<%@ page import="kr.story.vo.StoryVO"%>
<%
int snum = Integer.parseInt(request.getParameter("snum"));
String user_id = (String) session.getAttribute("user_id");
StoryDAO dao = StoryDAO.getInstance();
StoryVO vo = dao.getStory(snum);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세 정보</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style3.css">
</head>
<body>
	<div class="page-main">
		<h1>게시판 글 상세</h1>
		<ul>
			<li>글 번호 : <%= vo.getSnum() %></li>
			<li>제목 : <%= vo.getTitle()%></li>
			<li>작성자 : <%= vo.getId()%></li>
		</ul>
		<hr width="100%" size="1" noshade="noshade">
			<p> 
				<%= vo.getContent()%>
			</p>
		<hr width="100%" size="1" noshade="noshade">
		
		<div class="align-right">
			작성일 : <%= vo.getReg_date()%>
<%
Integer user_num = (Integer) session.getAttribute("user_num");
if(user_num == null || !user_id.equals(vo.getId())){ // 로그인이 안 된 상태 또는 작성자가 아닌 경우
%>
<input type="button" value="목록" onclick="location.href='list.jsp'">
<%
} else {
%>
<input type="button" value="수정" onclick="location.href='updateForm.jsp?snum=<%=vo.getSnum()%>'">
<input type="button" value="삭제" onclick="location.href='deleteForm.jsp?snum=<%=vo.getSnum()%>'">
<input type="button" value="목록" onclick="location.href='list.jsp'">
<%
	} 
%>			
		</div>
	</div>
</body>
</html>