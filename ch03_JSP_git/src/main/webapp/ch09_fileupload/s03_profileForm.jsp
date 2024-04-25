<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 사진 업로드 폼</title>
<script type="text/javascript">
/* 미리보기 보여주기, 올라오면 submit 버튼 보여주기 */
	window.onload = function(){
	
/* 		const image = document.getElementById('image');
		const file = document.getElementById('file');
		const submit_btn = document.getElementById('submit_btn');

		file.onchange = function () {
                if (!file.files[0]) {
                    //기본이미지 노출
                    image.src = '../images/face.png';
                    return;
                }else{
                	submit_btn.style.display = '';
                }
                
                //FileReader 객체 생성
                const reader = new FileReader();
                //이미지 읽기
                reader.readAsDataURL(file.files[0]);
                reader.onload = function () {
                image.src = reader.result;
                };

	}; */
	
	// 미리 보기 이미지 호출
	const image = document.getElementById('image');
	// 파일 선택시 이벤트 연결
	const file = document.getElementById('file');
	// 전송 버튼 호출
	const submit_btn = document.getElementById('submit_btn');
	
	file.onchange = function () {
		  if (!file.files[0]) {
			  image.src = '../images/face.png';
              return;
		  }
		// 선택한 이미지 읽기
		const reader = new FileReader();
		reader.readAsDataURL(file.files[0]);
		
		reader.onload = function(){
			image.src = reader.result;
			submit_btn.style.display = '';
		};
	};
};
</script>
</head>
<body>
<h2>Profile Image Upload</h2>
<img src="../images/face.png" width="200" height="200" id="image">
<form action="/ch03_JSP/profile" method="post" enctype="multipart/form-data">
	<input type="file" name="file" id="file" accept="image/gif,image/png,image/jpeg">
	<input type="submit" value="Profile Upload" id="submit_btn" style="display: none;">
</form>
</body>
</html>