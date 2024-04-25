<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.util.DBUtil" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Insert Process</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<%
// Post 방식으로 인코딩
request.setCharacterEncoding("UTF-8");

// 전송된 데이터를 반환 시키는 작업
String name = request.getParameter("name");
int price = Integer.parseInt(request.getParameter("price"));
int stock = Integer.parseInt(request.getParameter("stock"));
String origin = request.getParameter("name");

// DB 연결시키기
Connection conn = null;
PreparedStatement pstmt = null;
String sql = null;

try{
	// Connection 객체 반환하기
	conn = DBUtil.getConnection();
	
	// SQL문 작성하기
	sql = "INSERT INTO product (num,name,price,stock,origin,reg_date) VALUES(product_seq.nextval,?,?,?,?,SYSDATE)";
	
	// JDBC 수행 3단계 : pstmt 객체 생성하기
	pstmt = conn.prepareStatement(sql);
	
	// ?에 데이터 바인딩 시키기
	pstmt.setString(1, name);
	pstmt.setInt(2,price);
	pstmt.setInt(3,stock);
	pstmt.setString(4,origin);
	
	// JDBC 수행 4단계 : SQL문 실행시키기
	pstmt.executeUpdate();
%>
	<div class="result-display">
	 <div class="align-center">
	 	Product Insert Complete!<p></p>
	 	<input type="button" value="List" onclick="location.href='selectTest.jsp'">
	 </div>
	</div>
<%
} catch(Exception e){
%>
	<div class="result-display">
	 <div class="align-center">
	 	Product Insert Uncompleted. Error has occurred.<p></p>
	 	<input type="button" value="Insert" onclick="location.href='insertTestForm.jsp'">
	 </div>
	</div>
<% 
	e.printStackTrace();
} finally{
	DBUtil.executeClose(null, pstmt, conn);
}
%>

</body>
</html>