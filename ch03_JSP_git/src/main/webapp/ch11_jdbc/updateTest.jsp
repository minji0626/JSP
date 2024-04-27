<%@page import="java.sql.PreparedStatement"%>
<%@ page import="kr.util.DBUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 정보 수정하기</title>
<link rel="stylesheet" href="../css/style2.css" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	int stock = Integer.parseInt(request.getParameter("stock"));
	String origin = request.getParameter("origin");

	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	try {
		conn = DBUtil.getConnection();
		sql = "UPDATE product SET name=?, price=?, stock=?, origin=? WHERE num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, price);
		pstmt.setInt(3, stock);
		pstmt.setString(4, origin);
		pstmt.setInt(5, num);

		pstmt.executeUpdate();
	%>
	
	<div class="result-display">
		<div class="align-center">
			제품 정보가 수정되었습니다.<p>
			<input type="button" class="button" value="제품 정보" onclick="location.href='detailTest.jsp?num=<%= num %>'">
		</div>
	</div>


	<%
	} catch (Exception e) {
	%>
	
	<div class="result-display">
		<div class="align-center">
			오류가 발생했습니다. 해당 제품 정보 호출에 실패하였습니다.<p>
			<input type="button" class="button" value="목록" onclick="location.href='updateTestForm.jsp?num=<%= num%>'">
		</div>
	</div>
	
	<%
	e.printStackTrace();
	} finally {
	DBUtil.executeClose(null, pstmt, conn);
	}
	%>
</body>
</html>