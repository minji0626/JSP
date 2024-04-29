<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="kr.util.DBUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

<%
	request.setCharacterEncoding("utf-8");

	String todo = request.getParameter("todo");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	try{
		conn = DBUtil.getConnection();
		sql = "INSERT INTO todo(id,todo) VALUES(todo_seq.nextval,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, todo);
		pstmt.executeUpdate();

%>
	{"result" : "success"}
<%
	} catch(Exception e){
		
%>
	{"result" : "failure"}
<%
		e.printStackTrace();
	} finally{
		DBUtil.executeClose(null, pstmt, conn);
	}

%>