<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 사진 업로드 처리</title>
</head>
<body>
<h2>저장된 프로필 사진</h2>
<img src="/ch03_JSP/upload/<%= request.getAttribute("fileName") %>" width="500">
</body>
</html>