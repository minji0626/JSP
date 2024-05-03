<%@page import="kr.employee.vo.EmployeeVO"%>
<%@page import="kr.employee.dao.EmployeeDAO"%>
<%@ page import="kr.util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// 전송된 데이터 반환
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	EmployeeDAO dao = EmployeeDAO.getInstance();
	EmployeeVO vo = dao.checkEmployee(id);
	
	boolean check = false;
	if(vo!=null){
		check = vo.isCheckedPassword(passwd);
	}
	if(check){
		session.setAttribute("user_num", vo.getNum());
		session.setAttribute("user_id", vo.getId());
		response.sendRedirect("main.jsp");
	}else{
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style3.css">
<script type="text/javascript">
alert('아이디 또는 비밀번호가 불일치합니다.');
history.go(-1);
</script>
<%
	}
%>