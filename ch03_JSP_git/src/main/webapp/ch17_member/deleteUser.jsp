<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.member.dao.MemberDAO"%>
<%@ page import="kr.member.vo.MemberVO"%>
<%
	String user_id = (String)session.getAttribute("user_id");
	if(user_id==null){ // 로그인 되지 않은 경우
		response.sendRedirect("loginForm.jsp");
	} else{ // 로그인 된 경우
		// 전송된 인코딩 타입 지정
		request.setCharacterEncoding("utf-8");
		// 전송된 데이터 반환
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");

		MemberDAO dao = MemberDAO.getInstance();
		MemberVO member = dao.checkMember(id);
		boolean check = false;
		// 아이디가 등록되어 있고, 로그인한 아이디와 일치할 경우
		if(member!=null && user_id.equals(id)){
			// 비밀번호 일치 여부 체크
			check = member.isCheckedPassword(passwd);
		}
		if(check){ // 인증 성공
			// 회원 정보 삭제
			dao.deleteMember(member.getNum());
			//로그 아웃
			session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 완료</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
	<div class="page-main">
	<h1>회원 탈퇴 완료</h1>
		<div class="result-display">
			<div class="align-center">
				회원 탈퇴가 완료되었습니다.<p>
				<input type="button" class="button" value="Home" onclick="location.href='main.jsp'">
			</div>
		</div>
	</div>
</body>
</html>
<%
	}else{
%>
<script type="text/javascript">
	alert('아이디 또는 비밀번호가 불일치 합니다.');
	history.go(-1);
</script>
<%		
	}
}
%>