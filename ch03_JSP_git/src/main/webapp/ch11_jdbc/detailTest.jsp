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
<title>상품 상세 정보 불러오기</title>
<link rel="stylesheet" href="../css/style2.css" type="text/css">
</head>
<body>
	<div class="page-main">
		<h2>상품 상세 정보</h2>
		<%
			int num = Integer.parseInt(request.getParameter("num"));
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			
			try{
				conn = DBUtil.getConnection(); // 1단계
				sql = "SELECT * FROM product WHERE num = ?"; //sql문 작성
				pstmt = conn.prepareStatement(sql);	// 2단계
				pstmt.setInt(1, num);	// ?에 데이터 바인딩
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					String name = rs.getString("name");
					int price = rs.getInt("price");
					int stock = rs.getInt("stock");
					String origin = rs.getString("origin");
					Date reg_date = rs.getDate("reg_date");			
%>

		<ul>
			<li>제품 번호 : <%= num %></li>
			<li>제품명 : <%= name %></li>
			<li>제품 가격 : <%= String.format("%,d원", price) %></li>
			<li>제품 재고 : <%= stock %>개</li>
			<li>제조사 : <%= origin %></li>
			<li>제품 등록일 : <%= reg_date %></li>
		</ul>
			<hr width="100%" size="1" noshade="noshade">
			
			<div class="align-right">
				<input type="button" value="Update" class="button" onclick="location.href='updateTestForm.jsp?num=<%=num%>'">
				<input type="button" value="Delete" class="button" id ="delete_btn">
				<input type="button" value="List" class="button" onclick="location.href='selectTest.jsp'">
			</div>

		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			delete_btn.onclick = function(){
				let choice = confirm('해당 제품을 삭제하시겠습니까?');
				if(choice){
					location.replace('deleteTest.jsp?num=<%=num%>');
				}
			};
		</script>


		<%		
		}else{
%>
			<div class="result-display">
				<div class="align-center">
				 제품 상세 정보가 존재하지 않습니다.<p>
				 <input type="button" value="List" class="button" onclick="location.href='selectTest.jsp'">
				</div>
			</div>
<%
		}
			} catch(Exception e){
				e.printStackTrace();
%>				
			<div class="result-display">
				<div class="align-center">
				 오류가 발생하여 제품 상세 정보를 불러오는데 실패하였습니다.<p>
				 <input type="button" value="List" class="button" onclick="location.href='selectTest.jsp'">
				</div>
			</div>
	
<%				
			} finally{
				DBUtil.executeClose(rs, pstmt, conn);
			}
%>
	</div>
</body>
</html>