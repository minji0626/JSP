<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="kr.util.DBUtil" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%
//	전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("utf-8");
//	전송된 데이터 반환
	String id = request.getParameter("id");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	try{
//		Connection 객체 반환하기		
		conn = DBUtil.getConnection();
//		SQL문 작성하기
		sql = "SELECT id FROM people WHERE id=?"; // 행이 있으면 등록된 ID가 있다면 중복, 없다면 미중복
		pstmt = conn.prepareStatement(sql);
//		?에 데이터 바인딩
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){ // 아이디 중복의 경우		
%>
	{"result" : "idDuplicated"}
	
<%			
		} else { // 아이디 미중복의 경우
%>
	{"result" : "idNotFound"}
<%			
		}
	}catch(Exception e){
%>
	{"result" : "failure"}
<%
		e.printStackTrace();
	} finally{
		DBUtil.executeClose(rs, pstmt, conn);
	}
%>