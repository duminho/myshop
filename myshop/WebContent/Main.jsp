<%@page import="product.productDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록변경삭제</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<jsp:useBean id="dto" class="product.productDTO"></jsp:useBean>
	<jsp:useBean id="dao" class="product.productDAO"></jsp:useBean>
	<%
		ArrayList list = new ArrayList();
		list = dao.selectAll();
	%>
	<div class="top">
		<p>메인화면</p>
		<form action="select.jsp" id="form">
			<input type="text" id="id" name="id">
			<button type="submit">검색</button>
		</form>
		<button type="button" id="insert"><a href="insert.jsp">상품등록</a></button>
		<button type="button" id="selectall"><a href="selectall.jsp">상품전체보기</a></button>
	</div>
	
	<div class="content">
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