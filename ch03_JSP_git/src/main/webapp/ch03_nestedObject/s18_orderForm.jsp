<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[실습]음식 주문</title>
<script type="text/javascript">
/*  
[실습]
수량은 꼭 입력, 세 가지 음식 중에서 하나는 꼭 주문해야 한다.
수량이 0으로 전달이 되면 명시 하지 않아도 된다.
짜장면 - 4000원, 짬뽕 - 5000원, 볶음밥 - 6000원
[출력 예시]
짜장면 2개
짬뽕 1개
총 지불 금액 : 13,000원
 */
window.onload = function() {
	const form = document.getElementById('myForm');
	form.onsubmit = function() {
		const c0 = document.getElementById('c0');
		const c1 = document.getElementById('c1');
		const c2 = document.getElementById('c2');
		if(c0.value.trim()== ''){
			alert('수량을 입력해주세요.');
			c0.value='';
			return false;
		}
		if(c1.value.trim()== ''){
			alert('수량을 입력해주세요.');
			c1.value='';
			return false;
		}
		if(c2.value.trim()== ''){
			alert('수량을 입력해주세요.');
			c2.value='';
			return false;
		}
		if(c0.value.trim() == 0 && c1.value.trim() == 0 && c2.value.trim() == 0){
			alert('반드시 하나의 음식은 주문을 해야합니다.');
			c0.value='';
			c1.value='';
			c2.value='';
			return false;
		}
	}

}
</script>
</head>

<body>
 <form action="s19_order.jsp" method="post" id="myForm">
 <table>
 	<tr>
 		<td class="title">식사류</td>
 		<td>
 			<ul>
 			<li>
 				<label for="c0">짜장면</label>
 				<input type="number" name="food_c0" id="c0" min="0" max="99" value="0">
 			</li>
 			<li>
 				<label for="c1">짬뽕</label>
 				<input type="number" name="food_c1" id="c1" min="0" max="99" value="0">
 			</li>
 			<li>
 				<label for="c2">볶음밥</label>
 				<input type="number" name="food_c2" id="c2" min="0" max="99" value="0">
 			</li>
 			</ul>
 		</td>
 	</tr>
 	<tr align="center">
 		<td colspan="2">
 			<input type="submit" value="전송">
 		</td>
 	</tr>
 </table>
 </form>
</body>

</html>