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
<title>상세페이지</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<div class="page-main">
		<h2>글 상세 정보</h2>
		<%
		int num = Integer.parseInt(request.getParameter("num"));

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {
			// Connection 객체 반환
			conn = DBUtil.getConnection();

			//SQL 문 작성
			sql = "SELECT * FROM tboard WHERE num = ?";

			// JDBC 수행 3단계
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setInt(1, num);
			// JDBC 수행 4단계
			rs = pstmt.executeQuery();

			if(rs.next()){
				String name = rs.getString("name");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Date reg_date = rs.getDate("reg_date");
			%>
			<ul>
				<li>글 번호 : <%= num %></li>
				<li>제목 : <%= title %></li>
				<li>작성자 : <%= name %></li>
				<li>작성일 : <%= reg_date %></li>
			</ul>
			<hr width="100%" size="1" noshade="noshade">
			<p>
				<%= content %>
			</p>
			<hr width="100%" size="1" noshade="noshade">
			<div class="align-right">
				<input type="button" value="수정" onclick="location.href='updateTestForm.jsp?num=<%=num%>'">
				<input type="button" value="삭제" onclick="location.href='deleteTestForm.jsp?num=<%=num%>'">
				<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
			</div>
<%
			} else{
%>

	<div class="result-display">
		<div class="align-center">
			글 상세 정보가 존재하지 않습니다.<p>
			<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
		</div>
	</div>

<%		
			}
			
		} catch (Exception e) {
%>

	<div class="result-display">
		<div class="align-center">
			오류가 발생하여 글 상세 정보를 불러오는데 실패하였습니다.<p>
			<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
		</div>
	</div>
	
<%		
			e.printStackTrace();
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		%>
	</div>

</body>
</html>