<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style2.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
window.onload = function () {
	const form = document.getElementById('write_form');
	form.onsubmit = function () {
		const items = document.querySelectorAll('input[type="text"],input[type="password"],textarea')
		for(let i = 0; i < items.length; i++){
			if(items[i].value.trim() == ''){
				const label = document.querySelector('label[for="'+items[i].id+'"]');
				alert(label.textContent + ' 항목은 필수 입력하셔야 합니다.');
				
				items[i].value='';
				items[i].focus();
				return false;
			}	// end of if
		} // end of for
	};
};
</script>
</head>
<body>
<div class="page-main"> 
<h1>글 작성</h1>
<form action="write.jsp" id="write_form">
<ul>
	<li>
		<label for="title">제목</label>
		<input type="text" id="title" name="title" size="30" maxlength="50">
	</li>
	<li>
		<label for="name">작성자</label>
		<input type="text" id="name" name="name" size="10" maxlength="10">
	</li>
	<li>
		<label for="passwd">비밀번호</label>
		<input type="password" id="passwd" name="passwd" size="10" maxlength="12">
	</li>
	<li>
		<label for="content">내용</label>
		<textarea rows="5" cols="40" id="content" name="content"></textarea>
	</li>
</ul>
	<div class="align-center">
		<input type="submit" value="등록">
		<input type="button" value="목록" onclick="loaction.href='list.jsp'">
		<input type="button" value="목록" onclick="location.href='list.jsp'">
	</div>
</form>
</div>
</body>
</html>