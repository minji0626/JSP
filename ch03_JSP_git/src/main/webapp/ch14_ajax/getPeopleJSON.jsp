<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="kr.util.DBUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
[<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;

try {
	conn = DBUtil.getConnection();
	sql = "SELECT * FROM people ORDER BY reg_date DESC";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	while (rs.next()) {
		String id = rs.getString("id");
		String name = rs.getString("name");
		String job = rs.getString("job");
		String address = rs.getString("address");
		String blood_type = rs.getString("blood_type");
		String reg_date = rs.getString("reg_date");
		
		if(rs.getRow() > 1){ // 첫 번째 내용은 쉼표가 들어가지 않음
			out.println(",");
		}
%>
	{
		"id":"<%=id%>",
		"name":"<%=name%>",
		"job":"<%=job%>",
		"address" :"<%=address%>",
		"blood_type":"<%=blood_type%>",
		"reg_date":"<%=reg_date%>"
	}
<%		
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	DBUtil.executeClose(rs, pstmt, conn);
}
%>]
