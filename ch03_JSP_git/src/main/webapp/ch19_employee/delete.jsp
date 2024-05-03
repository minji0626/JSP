<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO"%>
<%@ page import="kr.story.vo.StoryVO"%>
<%
	request.setCharacterEncoding("UTF-8");
	int snum = Integer.parseInt(request.getParameter("snum"));
	StoryDAO dao = StoryDAO.getInstance();
	dao.deleteStory(snum);
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style3.css">
<script type="text/javascript">
	alert("글 삭제가 완료되었습니다.");
	location.href='list.jsp';
</script>