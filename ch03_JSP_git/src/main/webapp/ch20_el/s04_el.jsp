<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 텍스트</title>
</head>
<body>
<%	
	String str ="여름 여행";
	pageContext.setAttribute("msg", "봄");
	request.setAttribute("msg2", "여름");
	session.setAttribute("msg3", "가을");
	application.setAttribute("msg4", "겨울");
%>
page 영역 : <%= pageContext.getAttribute("msg")%><br>
request 영역 : <%= request.getParameter("msg2")%><br>
session 영역 : <%= session.getAttribute("msg3")%><br>
application 영역 : <%= application.getAttribute("msg4")%><br>
------------------------------------<br>
<%-- 
내장객체명을 생략하고 속성명을 호출하면 
JSP 4개 영역에서 page, request, session, application 영역 순으로 
검색해서 해당 속성명이 있으면 속성값을 반환 
--%>
page 영역 : ${pageScope.msg},${msg }<br>
request 영역 : ${requestScope.msg2},${msg2}<br>
session 영역 : ${sessionScope.msg3},${msg3 }<br>
application 영역 : ${applicationScope.msg4},${msg4 }<br>
------------------------------------<br>
str : <%=str %>, ${str }
<%--
스크립트릿에서 선언한 변수의 값은 el에서 바로 읽을 수 없음.
변수의 값을 읽기 원한다면 JSP 4개 영역에 저장 후 읽어와야 한다
--%>
</body>
</html>