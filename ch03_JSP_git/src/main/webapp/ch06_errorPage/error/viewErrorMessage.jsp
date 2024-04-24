<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%-- isErrorPage="true"는 현재 페이지가 에러가 발생했을 때 동작하는 페이지라고 설정 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외 발생</title>
</head>
<body>
요청 처리 과정에서 예외가 발생했습니다.<br>
빠른 시간 내에 문제를 해결하도록 하겠습니다.<br>
예외 타입 : <%= exception.getClass().getName() %><br>
예외 메시지 : <b><%= exception.getMessage() %></b>
</body>
</html>