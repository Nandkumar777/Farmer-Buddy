<!-- header.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<div class="navbar">
	<div class="logo">
		<i class="fas fa-hands-holding"></i>
		<i class="fas fa-seedling"></i>
		<span class="logo-text"><a href="farmer_dashboard.jsp">Farmer Buddy</a></span>
	</div>		 
	<!-- Navigation Links -->
	<div class="nav-links">
		<a href="${pageContext.request.contextPath}/jsp/farmer_dashboard.jsp">🏠 Dashboard</a>
		<a href="${pageContext.request.contextPath}/jsp/addProduct.jsp">➕ Add Product</a>
		<a href="${pageContext.request.contextPath}/jsp/viewProducts.jsp">📋 View Products</a>
		<a href="${pageContext.request.contextPath}/MarketPrice">💹 Market Prices</a>
		<a href="${pageContext.request.contextPath}/jsp/weatherUpdates.jsp">⛅ Weather Updates</a>
	</div> 
	 <div class="profile-section">
        <div class="profile-name">👤 <%= session.getAttribute("userName") %></div>
        <div class="profile-dropdown">
            <a href="${pageContext.request.contextPath}/jsp/viewProfile.jsp">View Profile</a>
            <a href="http://localhost:8080/FarmerBuddy/logout">Logout</a>
        </div>
    </div>
</div>
