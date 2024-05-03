<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.vo.EmployeeVO"%>
<%@ page import="kr.employee.dao.EmployeeDAO"%>
<%
    Integer user_num = (Integer) session.getAttribute("user_num");
    if (user_num == null) { // 로그인 되지 않은 경우
        response.sendRedirect("loginForm.jsp");
        return;
    }
	// 로그인 된 경우
	EmployeeDAO dao = EmployeeDAO.getInstance();
	EmployeeVO vo = dao.getEmployee(user_num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 상세 정보</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style3.css">
</head>
<body>
	<div class="page-main">
		<h1>사원 정보</h1>
		<ul>
			<li>이름  : <%= vo.getName() %></li>
			<li>아이디  : <%= vo.getId() %></li>
			<li>연봉  : <%= String.format("%,d원", vo.getSalary()) %></li>
			<li>직업   : <%= vo.getJob() %></li>
			<li>가입일  : <%= vo.getReg_date() %></li>
		</ul>
		<hr size="2" width="100%" noshade="noshade">
		<div class="align-right">
			<input type="button" value="Update Info" onclick="location.href='updateEmployeeForm.jsp'">
			<input type="button" value="Delete Account" onclick="location.href='deleteEmployeeForm.jsp'">
			<input type="button" value="Home" onclick="location.href='main.jsp'">
		</div>
	</div>
</body>
</html>
