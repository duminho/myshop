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
	<jsp:useBean id="dto" class="product.productDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />
	<%
		productDAO dao = new productDAO();
	
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String p = request.getParameter("price");
		int price = Integer.valueOf(p);
		
		dto.setId(id);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPrice(price);
		
		dao.insert(dto);
		
	%>
	<%= id %>
</body>
</html>