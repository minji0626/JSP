<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 사진 업로드 폼</title>
<script type="text/javascript">
/* 미리보기 보여주기, 올라오면 submit 버튼 보여주기 */

</script>
</head>
<body>
<h2>Profile Image Upload</h2>
<img src="../images/face.png" width="200" height="200">
<form action="/ch03_JSP/profile" method="post" enctype="multipart/form-data">

	<input type="file" name="file" id="file" accept="image/gif,image/png,image/jpeg">
	<input type="submit" value="Profile Upload" id="submit_btn" style="display: none;">
</form>
</body>
</html>