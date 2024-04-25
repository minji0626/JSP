<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Insert</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<div class="page-main">
	<h2>Product Insert</h2>
	<form action="insertTest.jsp" id="myForm" method="post">
		<ul>
			<li>
				<label for="name">Name</label>
				<input type="text" name="name" id="name">
			</li>
			<li>
				<label for="price">Price</label>
				<input type="number" name="price" id="price" >
			</li>
			<li>
				<label for="stock">Stock</label>
				<input type="number" name="stock" id="stock">
			</li>
			<li>
				<label for="origin">Origin</label>
				<input type="text" name="origin" id="origin">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="Insert">
			<input type="button" value="List" onclick="location.href='selectTest.jsp'">
		</div>
	</form>
</div>
</body>
</html>