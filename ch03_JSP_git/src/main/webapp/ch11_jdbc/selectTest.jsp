<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.util.DBUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body class="page-main">
	<h2>Product List</h2>
	<div class="align-right">
		<input type="button" value="Insert Product" onclick="location.href='insertTestForm.jsp'">
	</div>
	
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try{
			// JDBC 1 단계
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "SELECT * FROM product ORDER BY num DESC";
			// JDBC 2 단계
			pstmt = conn.prepareStatement(sql);
			
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.executeClose(rs, pstmt, conn);
		}
	
	
	%>
	
	
</body>
</html>