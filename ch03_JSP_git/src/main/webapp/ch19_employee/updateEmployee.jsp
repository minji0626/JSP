<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO"%>
<%@ page import="kr.employee.vo.EmployeeVO"%>
<%
	Integer user_num = (Integer) session.getAttribute("user_num");
	if (user_num == null) { // 로그인 되지 않은 경우
    	response.sendRedirect("loginForm.jsp");
    	return;
	} 
	else {// 로그인 된 경우
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="employee" class="kr.employee.vo.EmployeeVO"/>
<jsp:setProperty property="*" name="employee"/>
<%
	employee.setNum(user_num);
	EmployeeDAO dao = EmployeeDAO.getInstance();
	dao.updateEmployee(employee);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 업데이트</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style3.css">
</head>
<body>
	<div class="page-main">
	<h1>사원 정보 업데이트</h1>
		<div class="result-display">
			<div class="align-center">
				사원 정보가 업데이트 되었습니다.<p>
				<input type="button" class="button" value="MyPage" onclick="location.href='myPage.jsp'">
			</div>
		</div>
	</div>
</body>
</html>
<%
	}
%>