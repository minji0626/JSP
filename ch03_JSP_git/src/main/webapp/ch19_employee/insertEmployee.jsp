<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%
	// 전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="employee" class="kr.employee.vo.EmployeeVO" />
<jsp:setProperty property="*" name="employee" />
<%
	EmployeeDAO dao = EmployeeDAO.getInstance();
	dao.insertEmployee(employee);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 등록</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
	<div class="page-main">
		<h1>사원 등록 완료</h1>
		<div class="result-display">
			<div class="align-center">
				등록되었습니다.
				<p>
				<button onclick="location.href='main.jsp'">Home</button>
			</div>
		</div>
	</div>
</body>
</html>