<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO"%>
<%@ page import="kr.employee.vo.EmployeeVO"%>
<%
	Integer user_num = (Integer) session.getAttribute("user_num");
	if (user_num == null) { // 로그인 되지 않은 경우
    	response.sendRedirect("loginForm.jsp");
    	return;
	} // 로그인 된 경우
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 수정</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style3.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#update_form').submit(function(){
	    const items = document.querySelectorAll('.input-check');
	    for(let i = 0; i < items.length; i++){
	        if(items[i].value.trim() == ''){
	            const label = document.querySelector('label[for="'+items[i].id+'"]');
	            alert(label.textContent + ' 항목은 필수 입력');
	            
	            items[i].value = '';
	            items[i].focus();
	            return false;
	        }
	    } // end of for
	});
});
</script>
</head>
<body>
<%
	EmployeeDAO dao = EmployeeDAO.getInstance();
	EmployeeVO vo = dao.getEmployee(user_num);
%>
<div class="page-main">
		<h1>사원 정보 수정</h1>
		<form action="updateEmployee.jsp" method="post" id="update_form">
			<ul>
				<li>
					<label for="name">이름</label>
					<input type="text" name="name" id="name" value="<%=vo.getName() %>" class="input-check" >
				</li>
				<li>
					<label for="passwd">PW</label>
					<input type="password" name="passwd" id="passwd" class="input-check" maxlength="12">
				</li>
				<li>
					<label for="salary">연봉</label>
					<input type="number" name="salary" value="<%=vo.getSalary() %>" id="salary" >
				</li>
				<li>
					<label for="job">직업</label>
					<input type="text" name="job" id="job" value="<%=vo.getJob() %>" class="input-check">
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="Update">
				<input type="button" value="Home" onclick="location.href='main.jsp'">
			</div>
		</form>
	</div>
</body>
</html>