<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.board.dao.BoardDAO"%>
<%@ page import="kr.board.vo.BoardVO" %>
<%
	// 인코딩 타입 지정
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String passwd = request.getParameter("passwd");
	
	BoardDAO dao = BoardDAO.getInstance();
	// 비밀번호 인증을 위해 기본키를 전달해서 한 건의 레코드를 전달 받음
	BoardVO db_board = dao.getBoard(num);
	
	boolean check = false;
	if(db_board!=null){
		// 비밀번호 체크
		check = db_board.isCheckedPassword(passwd);
	}
	if(check){
		dao.delete(num);
%>
<script type="text/javascript">
	alert("글 삭제가 완료되었습니다.");
	location.href='list.jsp';
</script>
<%
	} else{
%>
<script type="text/javascript">
	alert('비밀번호 불일치');
	history.go(-1);
</script>
<%
	}
%>