<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	HashMap<String, Integer> map = new HashMap<String,Integer>();
	
	map.put("c0",4000);
	map.put("c1",5000);
	map.put("c2",6000);
	
	// 총 구매 내역
	int total = 0;
%>
<h3>주문 내역</h3>
<%
 int numc0 = Integer.parseInt(request.getParameter("food_c0"));
	if(numc0 > 0){
		total += numc0 * map.get("c0");
%>
짜장면 <%= numc0 %>개<br>
<%
	}
%>

<%
 int numc1 = Integer.parseInt(request.getParameter("food_c1"));
	if(numc1 > 0){
		total += numc1 * map.get("c1");
%>
짬뽕 <%= numc1 %>개<br>
<%
	}
%>

<%
 int numc2 = Integer.parseInt(request.getParameter("food_c2"));
	if(numc2 > 0){
		total += numc2 * map.get("c2");
%>
볶음밥 <%= numc2 %>개<br>
<%
	}
%>
총 지불 금액 : <%= String.format("%,d원", total) %><br>

</body>
</html>