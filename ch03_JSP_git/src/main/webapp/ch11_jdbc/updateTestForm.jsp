<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.util.DBUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 정보 수정하기</title>
<link rel="stylesheet" href="../css/style2.css" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<div class="page-main">
	<h2>제품 정보 수정하기</h2>
<%
		int num = Integer.parseInt(request.getParameter("num"));

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try{
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM product WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				String name = rs.getString("name");
				int price = rs.getInt("price");
				int stock = rs.getInt("stock");
				String origin = rs.getString("origin");
%>
         	<form action="updateTest.jsp" id="myForm" method="post">
			<input type="hidden" name="num" value="<%= num %>">
		<ul>
			<li>
				<label for="name">제품명</label>
				<input type="text" name="name" id="name" value="<%= name %>">
			</li>
			<li>
				<label for="price">제품 가격</label>
				<input type="number" name="price" id="price" value="<%= price %>">
			</li>
			<li>
				<label for="stock">제품 재고</label>
				<input type="number" name="stock" id="stock" value="<%= stock %>">
			</li>
			<li>
				<label for="origin">제조사</label>
				<input type="text" name="origin" id="origin" value="<%= origin %>">
			</li>
		</ul>
		
		<div class="align-center">
			<input type="submit" class="button" value="수정">
			<input type="button" class="button" value="목록" onclick="location.href='selectTest.jsp'">
		</div>
		
	</form>
	
<%
			} else{
%>

		<div class="result-display">
			<div class="align-center">
				오류가 발생햇습니다. 수정할 제품 정보 호출에 실패하였습니다.<p>
				<input type="button" class="button" value="목록" onclick="location.href='selectTest.jsp'">
			</div>
		</div>

<%
			}
		} catch(Exception e) {
%>

		<div class="result-display">
			<div class="align-center">
				오류가 발생햇습니다. 수정할 제품 정보 호출에 실패하였습니다.<p>
			<input type="button" class="button" value="목록" onclick="location.href='selectTest.jsp'">
			</div>
		</div>

<%
			e.printStackTrace();
		} finally{
			DBUtil.executeClose(rs, pstmt, conn);
		}
%>

</div>
</body>
</html>