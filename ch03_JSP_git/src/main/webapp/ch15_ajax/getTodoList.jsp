<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ page import="kr.util.DBUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

[<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;

try{
	conn = DBUtil.getConnection();
	sql = "SELECT*FROM todo ORDER BY id DESC";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		int id = rs.getInt("id");
		String todo = rs.getString("todo");
		Date created = rs.getDate("created");
		int completed = rs.getInt("completed");
		
		if(rs.getRow() > 1){ // 첫 번째 내용은 쉼표가 들어가지 않음
			out.println(",");
		}
		
%>
	{
	"id" : <%=id%>,
	"todo" : "<%=todo%>",
	"created" : "<%=created%>",
	"completed" : <%=completed%>
	}

<%
	}
	
} catch(Exception e){
	e.printStackTrace();
} finally{
	DBUtil.executeClose(rs, pstmt, conn);
}
%>]
