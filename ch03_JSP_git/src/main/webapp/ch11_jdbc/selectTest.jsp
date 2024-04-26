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
<link rel="stylesheet" href="../css/style2.css" type="text/css">
</head>
<body class="page-main">
	<h2>Product List</h2>
	<div class="align-right">
		<input type="button" class="button" value="Insert Product" onclick="location.href='insertTestForm.jsp'">
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
			// JDBC 수행 4단계 : SQL문을 실행해서 테이블에 반영하고 결과 행을 resultset에 담아서 반환
			rs = pstmt.executeQuery();
%>
			<table>
				<tr>
					<th>제품 번호</th>
					<th>제품명</th>
					<th>제조사</th>
					<th>등록일</th>
				</tr>

<%
	while(rs.next()){
		int num = rs.getInt("num");
		String name = rs.getString("name");
		String origin = rs.getString("origin");
		Date reg_date = rs.getDate("reg_date");
		%>
		<tr>
			<td><%= num %></td>
			<td><a href="detailTest.jsp?num=<%= num %>"><%= name %></a></td>
			<td><%= origin %></td>
			<td><%= reg_date %></td>
		</tr>
		
		<%
	}

%>
			</table>
<%
			
		}catch(Exception e){
			%>
			<div class="result-display">
				<span>오류 발생!</span>
			</div>
			<%
			e.printStackTrace();
		}finally{
			DBUtil.executeClose(rs, pstmt, conn);
		}
	
	%>
</body>