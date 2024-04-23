<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구입 내역 확인</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	HashMap<String, Integer> map = new HashMap<String, Integer>();

	map.put("가방", 200000);
	map.put("신발", 100000);
	map.put("옷", 50000);
	map.put("식사권", 150000);

	// 배송비
	int deliveryfee = 5000;
	
	// 총 구매 비용
	int sum = 0;
	%>
	
	<h3><%=request.getParameter("name")%>님의 구매 내역</h3>
	이름 : <%=request.getParameter("name")%><br> 
	배송 희망일 : <%=request.getParameter("order_date")%><br> 
	구입 내용 :
	<%
	String[] items = request.getParameterValues("item");
	if(items!=null){
		for (int i = 0; i < items.length; i++) {
			sum += map.get(items[i]);
			%>
			<%= items[i] %>
			<% 
			if(i < items.length - 1) out.print(", ");
		} // end of for
		if(sum < 300000) sum += deliveryfee;
		else deliveryfee = 0;
		%> 
		
		<br>
		배송비 : <%= String.format("%,d원",deliveryfee) %>원<br> 
		총 구매 비용(배송비 포함) : <%= String.format("%,d원",sum) %>원<br>
		
	<%	
	}	// end of if
	%> 
</body>
</html>