<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
<form action="/ch03_JSP/fileUpload" method="post" enctype="multipart/form-data">
	작성자 <input type="text" name="user"><br><br>
	제목 <input type="text" name="title"><br><br>
	파일명 <input type="file" name="uploadFile"><br><br>
	<input type="submit" value="파일 올리기">
</form>
</body>
</html>