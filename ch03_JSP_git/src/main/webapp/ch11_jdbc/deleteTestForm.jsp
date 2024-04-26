<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 제품 삭제하기</title>
<link rel="stylesheet" href="../css/style2.css" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<%
int num = Integer.parseInt(request.getParameter("num"));
%>
	<div class="page-main">
	 <h2>제품 삭제</h2>
	<form action="deleteTest.jsp" id="myForm">
 		<input type="hidden" name="num" value="<%= num%>">
 			<div class="align-center">
 				<p class="align-center">
				<span>해당 제품을 삭제하시겠습니까?</span>
				</p>
				<br>
 				<input type="submit" class="button" value="삭제">
 				<input type="button" value="목록"  class="button" onclick="location.href='selectTest.jsp'">
 			</div>
	</form>
	</div>
</body>
</html>