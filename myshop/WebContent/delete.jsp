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
	<p><a href="Main.jsp">메인으로</a></p>
	<%
		productDAO dao = new productDAO();
	
		String id = request.getParameter("id");
		
		dao.delete(id);
		
	%>
	<%= id %>
</body>
</html>