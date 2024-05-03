<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.vo.EmployeeVO"%>
<%@ page import="kr.employee.dao.EmployeeDAO"%>

<%
	String user_id = (String) session.getAttribute("user_id");
	Integer user_num = (Integer) session.getAttribute("user_num");
	if (user_id == null) { // 로그인 되지 않은 경우
		response.sendRedirect("loginForm.jsp");
		return;
	} else { // 로그인 된 경우
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		EmployeeDAO dao = EmployeeDAO.getInstance();
		EmployeeVO vo = dao.checkEmployee(user_id);
		
		boolean check = false;
		if(vo!=null && user_id.equals(id)){
			check = vo.isCheckedPassword(passwd);
		}
		if(check){
			dao.deleteEmployee(vo.getNum());
			session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 완료</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style3.css">
</head>
<body>
	<div class="page-main">
	<h1>사원 계정 탈퇴 완료</h1>
		<div class="result-display">
			<div class="align-center">
				사원 탈퇴가 완료되었습니다.<p>
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