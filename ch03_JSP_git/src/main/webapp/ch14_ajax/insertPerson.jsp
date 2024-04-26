<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="kr.util.DBUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String job = request.getParameter("job");
	String address = request.getParameter("address");
	String blood_type = request.getParameter("blood_type");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	try {
		conn = DBUtil.getConnection();
		sql = "INSERT INTO people(id,name,job,address,blood_type,reg_date) VALUES(?,?,?,?,?,SYSDATE)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, job);
		pstmt.setString(4, address);
		pstmt.setString(5, blood_type);
		pstmt.executeUpdate();
%>
	{"result" :"success"}
<%
	} catch(Exception e){
%>
	{"result":"failure"}
<%
		e.printStackTrace();
	}finally{
		DBUtil.executeClose(null, pstmt, conn);
	}
%>