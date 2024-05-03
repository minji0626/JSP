<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.story.vo.StoryVO"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%
	// 인코딩 타입 지정
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="kr.story.vo.StoryVO"/>
<jsp:setProperty property="*" name="vo"/>
<%
	StoryDAO dao = StoryDAO.getInstance();
	vo.setIp(request.getRemoteAddr());
	dao.updateStory(vo);
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style3.css">
<script type="text/javascript">
	alert("글 수정이 완료되었습니다.");
	location.href='detail.jsp?snum=<%=vo.getSnum()%>'
</script>

