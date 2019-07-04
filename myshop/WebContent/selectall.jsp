<%@page import="product.productDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<jsp:useBean id="dto" class="product.productDTO"></jsp:useBean>
	<jsp:useBean id="dao" class="product.productDAO"></jsp:useBean>
	<%
		ArrayList list = new ArrayList();
		list = dao.selectAll();
	%>
	<div class="content">
		<p>상품 전체보기</p>
		<table border="2" style="text-align: center; width: 500px; height: 50px;">
			<tr>
				<td>아이디</td>
				<td>제목</td>
				<td>상품설명</td>
				<td>가격</td>
				<td>삭제버튼</td>
				<td>수정버튼</td>
			</tr>
			<%
				for(int i=0;i<list.size();i++){
				
				dto = (productDTO)list.get(i);
			%>
			<tr id="t1">
				
				<td><%= dto.getId() %></td>
				<td><%= dto.getTitle() %></td>
				<td><%= dto.getContent() %></td>
				<td><%= dto.getPrice() %></td>
				<td><button type="button" id="delete"><a href="delete.jsp?id=<%= dto.getId() %>">상품삭제</a></button></td>
				<td><button type="button" id="update"><a href="update.jsp">상품변경</a></button></td>
				
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>