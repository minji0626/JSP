<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	// 로그아웃
	session.invalidate();
	response.sendRedirect("main.jsp");
%>