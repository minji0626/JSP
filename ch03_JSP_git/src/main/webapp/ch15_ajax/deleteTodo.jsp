<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="kr.util.DBUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%

request.setCharacterEncoding("utf-8");

int id = Integer.parseInt(request.getParameter("id"));

Connection conn = null;
PreparedStatement pstmt = null;
String sql = null;

try{
	conn = DBUtil.getConnection();
	sql = "DELETE FROM todo WHERE id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, id);
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