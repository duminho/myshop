<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#form").submit(function() {
			var d = $(this).serialize();
			$.ajax({
				url:"insert2.jsp",
				data: d,
				success: function(result) {
					alert("ajax 성공!!");
					
				}
			});
			
			return false;
		});
	});
</script>
</head>
<body>
	<div style="position: absolute; left: 450px;">
		<p><a href="Main.jsp">메인으로</a></p>
		<form action="" id="form">
		아이디:<input type="text" name="id" id="id">
		<br>
		제목:<input type="text" name="title" id="title">
		<br>
		내용:<input type="text" name="content" id="content">
		<br>
		가격:<input type="text" name="price" id="price">
		<br>
		<button type="submit">등록</button>
		</form>		
	</div>
	
</body>
</html>