<%@ page import="kr.util.DBUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제 처리</title>
<link rel="stylesheet" href="../css/style2.css" type="text/css">
</head>
<body>
<%
	// POST 방식으로 전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("UTF-8");

	// 전송된 데이터 반환
	int num = Integer.parseInt(request.getParameter("num"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	try {
		// Connection 객체 반환
		conn = DBUtil.getConnection();
		// SQL문 작성
		sql = "DELETE FROM product WHERE num=?";
		//JDBC 수행 3단계
		pstmt = conn.prepareStatement(sql);
		// ?에 데이터 바인딩
		pstmt.setInt(1, num);
		//JDBC 수행 4단계 : SQL문 실행
		pstmt.executeUpdate();
%>

	<div class="result-display">
		<div class="align-center">
			제품 삭제가 완료되었습니다.<p>
			<input type="button" class="button"  value="목록" onclick="location.href='selectTest.jsp'">
		</div>
	</div>


<%
	} catch (Exception e) {
%>

	<div class="result-display">
		<div class="align-center">
			오류가 발생하였습니다. 제품 삭제에 실패하였습니다.<p>
			<input type="button" class="button" value="목록" onclick="location.href='selectTest.jsp'">
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