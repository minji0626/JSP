<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="kr.util.DBUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%
request.setCharacterEncoding("utf-8");

int id = Integer.parseInt(request.getParameter("id"));
int completed = Integer.parseInt(request.getParameter("completed"));

// Toggle 형태로 움직일 수 있게 만들어줌
if(completed == 0) completed = 1;
else completed = 0;

Connection conn = null;
PreparedStatement pstmt = null;
String sql = null;

try {
	conn = DBUtil.getConnection();
	sql = "UPDATE todo SET completed=? WHERE id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,completed);
	pstmt.setInt(2, id);
	pstmt.executeUpdate();

%>
	{"result":"success"}
<%
} catch (Exception e) {
%>
	{"result":"failure"}
<%	

	e.printStackTrace();
} finally {
	DBUtil.executeClose(null, pstmt, conn);
}
%>