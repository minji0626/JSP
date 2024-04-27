<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery를 이용한 비동기 통신 구현</title>
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// xml 데이터 읽어오기
	$.ajax({
		url : 'myXML.jsp', // 요청 URL
		success : function(param){
			$(param).find('person').each(function(){
				let name ='<li>' + $(this).find('name').text() + '</li>';
				let job = '<li>' + $(this).find('job').text() + '</li>';
				let age = '<li>' + $(this).find('age').text() + '</li>';
				$('body').append('<ul>'+name+job+age+'</ul>');
			});
		}
	});
});
</script>
</head>
<body>

</body>
</html>