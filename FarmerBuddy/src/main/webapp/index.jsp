<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farmer Buddy</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css">
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
	<%@ include file="jsp/navbar.jsp" %>
	<img src="images/Buddy.jpg" alt="Farmer Image" class="full-bg-img">
	<%@ include file="jsp/footer.jsp" %>
</body>
</html>
