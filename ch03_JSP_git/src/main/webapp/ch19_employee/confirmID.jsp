<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="kr.util.DBUtil"%>
<%@ page import="kr.employee.dao.EmployeeDAO"%>
<%@ page import="kr.employee.vo.EmployeeVO"%>
<%
	//전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("UTF-8");
	// 전송된 데이터 반환
	String id = request.getParameter("id");
	
	EmployeeDAO dao = EmployeeDAO.getInstance();
	EmployeeVO member = dao.checkEmployee(id);
	if(member!=null){// 아이디 중복되었음
%>
{"result" : "idDuplicated"}
<%
	}else{	// 아이디 미중복
%>
{"result":"idNotFound"}
<%	
	}
%>