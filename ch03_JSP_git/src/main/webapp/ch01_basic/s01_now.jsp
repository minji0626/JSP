<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 날짜와 시간</title>
</head>
<body>
<%
	Date nowTime = new Date();	
%>
현재 날짜와 시간 <%= nowTime %> 입니다.
<br>
-------------------------------
<br>
<%
	SimpleDateFormat sf = 
	      new SimpleDateFormat("yyyy년MM월dd일 a hh:mm:ss");
%>
현재 날짜와 시간은 <%= sf.format(nowTime) %> 입니다.
</body>
</html>