<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int snum = Integer.parseInt(request.getParameter("snum"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style3.css">
</head>
<body>
<div class="page-main">
 <h2>글 삭제</h2>
 <p class="align-center">
 <span>정말 삭제하시겠습니까?</span>
 </p>
 <form action="delete.jsp">
 	<input type="hidden" name="snum" value="<%= snum%>">
 	<div class="align-center">
 		<input type="submit" value="삭제">
 		<input type="button" value="목록" onclick="location.href='list.jsp'">
 	</div>
 </form>
</div>
</body>
</html>