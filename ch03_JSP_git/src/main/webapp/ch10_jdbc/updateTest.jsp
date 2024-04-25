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
<title>글 수정</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String passwd = request.getParameter("passwd");
	String content = request.getParameter("content");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	try{
		// Connection 객체 반환
		conn = DBUtil.getConnection();
		// SQL문 작성
		sql = "UPDATE tboard SET name=?,title=?,passwd=?,content=? WHERE num=?";
		// JDBC 수행 3단계
		pstmt = conn.prepareStatement(sql);
		// ?에 데이터 바인딩
		pstmt.setString(1,name);
		pstmt.setString(2,title);
		pstmt.setString(3,passwd);
		pstmt.setString(4,content);
		pstmt.setInt(5,num);
		
		// JDBC 수행 4단계 : SQL문 실행
		pstmt.executeUpdate();
%>
	
	<div class="result-display">
		<div class="align-center">
			글 수정이 완료되었습니다.<p>
			<input type="button" value="글상세" onclick="location.href='detailTest.jsp?num=<%= num %>'">
		</div>
	</div>
	
<%
	}catch(Exception e){
%>

		<div class="result-display">
			<div class="align-center">
				오류가 발생햇습니다. 수정할 글 정보 호출에 실패하였습니다.<p>
			<input type="button" value="목록" onclick="location.href='updateTestForm.jsp?num=<%= num%>'">
			</div>
		</div>
		
<%
		e.printStackTrace();
	}finally{
		DBUtil.executeClose(null, pstmt, conn);
	}
%>
</body>
</html>