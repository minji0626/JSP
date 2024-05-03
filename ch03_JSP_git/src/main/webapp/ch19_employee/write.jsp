<%@page import="kr.story.vo.StoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%
	Integer user_num = (Integer) session.getAttribute("user_num");
		request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="story" class="kr.story.vo.StoryVO"/>
<jsp:setProperty property="*" name="story"/>
<%	
	// 작성자의 ip 받아와서 설정
	story.setIp(request.getRemoteAddr());
	story.setNum(user_num);
	StoryDAO dao = StoryDAO.getInstance();
	dao.insertStory(story);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록 완료</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style3.css">
</head>
<body>
	<div class="page-main">
		<h1>글 등록</h1>
		<div class="result-display">
			<div class="align-center">
				글 등록이 완료되었습니다.<br>
				내용 확인하시려면 목록으로 돌아가서 확인바랍니다.
				<p>
				<button onclick="location.href='list.jsp'">글 목록</button>
			</div>
		</div>
	</div>
</body>
</html>
