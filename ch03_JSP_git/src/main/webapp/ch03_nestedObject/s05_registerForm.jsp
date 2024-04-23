<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[실습]회원 가입</title>
<script type="text/javascript">

	window.onload = function() {
		const myForm = document.getElementById('myForm');
		myForm.onsubmit = function() {

			const name = document.getElementById('name');
			const id = document.getElementById('id');
			const pw = document.getElementById('password');

			if (name.value.trim() == '') {
				alert('이름을 입력해주세요.');
				name.value = '';
				name.focus();
				return false;
			}

			if (id.value.trim() == '') {
				alert('아이디를 입력해주세요.');
				id.value = '';
				id.focus();
				return false;
			}

			if (!/^[A-Za-z0-9]{4,12}$/.test(id.value.trim())) {
				alert('영문 또는 숫자만 사용, 최소 4자~ 최대 12자 사용');
				id.value = '';
				id.focus();
				return false;
			}

			if (pw.value.trim() == '') {
				alert('비밀번호를 입력해주세요.');
				pw.value = '';
				pw.focus();
				return false;
			}

			if (!/^[A-Za-z0-9!~]{4,12}$/.test(pw.value.trim())) {
				alert('영문,숫자,특수문자[!,~] 사용 가능, 최소 4자~ 최대 12자 사용');
				pw.value = '';
				pw.focus();
				return false;
			}
		}
	}
</script>
</head>
<body>
<%--
이름(name), 아이디(id), 비밀번호(password), 전화번호(phone), 
취미(hobby)- checkbox[영화 보기, 음악 감상, 등산, 낚시, 춤
자기소개(content textarea)

출력 예시
이름 : 홍길동 	필수입력
ID : 			필수
PW : 			필수
전화번호 : 
취미 : 
자기 소개 : 서울에서 태어나 계속 서울 거주
--%>

<form action="s06_register.jsp" method="post" id="myForm">
이름 : <input type="text" name="name" id="name"><br>
ID : <input type="text" name="id" id="id"><br>
PW : <input type="password" name="password" id="password"><br>
전화번호 : <input type="text" name="phone" placeholder="010-0000-0000의 형태로 입력해주세요."><br>
취미 : 
<input type="checkbox" name="hobby" value="영화 보기"> 영화 보기
<input type="checkbox" name="hobby" value="음악 감상"> 음악 감상
<input type="checkbox" name="hobby" value="등산"> 등산
<input type="checkbox" name="hobby" value="낚시"> 낚시
<input type="checkbox" name="hobby" value="춤"> 춤
<br>
자기소개<br>
<textarea cols="30" rows="5" name="content"></textarea>
<br>
<input type="submit" value="입력">
</form>
</body>
</html>