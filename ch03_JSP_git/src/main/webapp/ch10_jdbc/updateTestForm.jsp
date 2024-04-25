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
<title>게시판 글 수정</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<div class="page-main">
	<h2>글 수정</h2>
<%
		int num = Integer.parseInt(request.getParameter("num"));

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try{
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM tboard WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				String name = rs.getString("name");
				String title = rs.getString("title");
				String content = rs.getString("content");
%>
         	<form action="updateTest.jsp" id="myForm" method="post">
			<input type="hidden" name="num" value="<%= num %>">
		<ul>
			<li>
				<label for="name">이름</label>
				<input type="text" name="name" id="name" size="20" maxlength="10" value="<%= name %>">
			</li>
			<li>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" size="30" maxlength="10" value="<%= title %>">
			</li>
			<li>
				<label for="passwd">비밀번호</label>
				<input type="password" name="passwd" id="passwd" size="20" maxlength="10">
			</li>
			<li>
				<label for="content">내용</label>
				<textarea rows="5" cols="40" name="content" id="content"><%= content %></textarea>
			</li>
		</ul>
		
		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
		</div>
		
	</form>
	
<%
			} else{
%>

		<div class="result-display">
			<div class="align-center">
				오류가 발생햇습니다. 수정할 글 정보 호출에 실패하였습니다.<p>
				<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
			</div>
		</div>

<%
			}
		} catch(Exception e) {
%>

		<div class="result-display">
			<div class="align-center">
				오류가 발생햇습니다. 수정할 글 정보 호출에 실패하였습니다.<p>
			<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
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