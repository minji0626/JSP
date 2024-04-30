<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.member.dao.MemberDAO"%>
<%@ page import="kr.member.vo.MemberVO"%>
<%
	Integer user_num = (Integer) session.getAttribute("user_num");
	if(user_num==null){ // 로그인 되지 않은 경우
		response.sendRedirect("loginForm.jsp");
	} else{ // 로그인 된 경우
%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>회원 정보 수정</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#modify_form').submit(function(){
	    const items = document.querySelectorAll('.input-check');
	    for(let i = 0; i < items.length; i++){
	        if(items[i].value.trim() == ''){
	            const label = document.querySelector('label[for="'+items[i].id+'"]');
	            alert(label.textContent + ' 항목은 필수 입력');
	            
	            items[i].value = '';
	            items[i].focus();
	            return false;
	        }
	        if(items[i].id == 'id' && count == 0){
	            alert('ID 중복 체크는 필수입니다.');
	            return false;
	        }
	    } // end of for
	});
});
</script>
	</head>
	<body>
	<%
	MemberDAO dao = MemberDAO.getInstance();
	MemberVO member = dao.getMember(user_num);

	if (member.getPhone() == null) {
		member.setPhone("");
	}
	%>
	<div class="page-main">
		<h1>회원 정보 수정</h1>
		<form action="modifyUser.jsp" method="post" id="modify_form">
			<ul>
				<li>
					<label for="name">이름</label>
					<input type="text" name="name" id="name" class="input-check" maxlength="10" value="<%= member.getName()%>">
				</li>
				<li>
					<label for="passwd">비밀번호</label>
					<input type="password" name="passwd" id="passwd" class="input-check" maxlength="12">
				</li>
				<li>
					<label for="email">이메일</label>
					<input type="email" name="email" id="email" class="input-check" maxlength="50" value="<%= member.getEmail()%>">
				</li>
				<li>
					<label for="phone">전화번호</label>
					<input type="text" name="phone" id="phone" maxlength="15" value="<%= member.getPhone()%>">
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="Modify">
				<input type="button" value="Home" onclick="location.href='main.jsp'">
			</div>
		</form>
	</div>
	</body>
	</html>
<%
	}
%>
