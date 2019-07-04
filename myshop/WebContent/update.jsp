
<%@page import="product.productDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div style="position: absolute; left: 450px; top: 120px;">
			<form action="update2.jsp">
				아이디:<input type="text" name="id"><br>
				내용:<input type="text" name="content"><br>
				가격:<input type="text" name="price"><br>
				
				<button type="submit">변경</button>
			</form>
		</div>
</body>
</html>