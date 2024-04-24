<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 에러가 발생할 때 보여질 페이지 지정 --%>
    <%@ page errorPage="/ch06_errorPage/error/viewErrorMessage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 출력</title>
</head>
<body>
name 파라미터의 값 : <%= request.getParameter("name").toUpperCase() %>
</body>
</html>