<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.board.dao.BoardDAO"%>
<%@ page import="kr.board.vo.BoardVO" %>
<%
	// 인코딩 타입 지정
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="boardVO" class="kr.board.vo.BoardVO"/>
<jsp:setProperty property="*" name="boardVO"/>
<%
	// useBean의 id하고 setProperty의 name을 일치시켜야함
	BoardDAO dao = BoardDAO.getInstance();

	// 비밀번호 인증을 위해서 기본키를 전달하고 한 건의 레코드를 전달 받음
	BoardVO db_board = dao.getBoard(boardVO.getNum());
	
	boolean check = false;
	if(db_board!=null){
		check = db_board.isCheckedPassword(boardVO.getPasswd());
	}
	if(check){
		boardVO.setIp(request.getRemoteAddr());
		dao.update(boardVO);
%>
<script type="text/javascript">
	alert("글 수정이 완료되었습니다.");
	location.href='detail.jsp?num=<%=boardVO.getNum()%>'
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
