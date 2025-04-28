<!-- about.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us - Farmer Buddy</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/about_us.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
   <!-- Navbar -->
	<div class="navbar">
		<div class="logo">
			<i class="fas fa-hands-holding"></i>
			<i class="fas fa-seedling"></i>
			<span class="logo-text"><a href="../index.jsp">Farmer Buddy</a></span>
		</div>
		<div class="menu">
			<a href="about_us.jsp">About</a>
			<a href="contact_us.jsp">Contact Us</a> 
			<a href="login.jsp">Login</a>
			<a href="register.jsp">Register</a>
		</div>
	</div>
    <div class="about-section">
        <h1>About Farmer Buddy</h1>
        <p>Farmer Buddy is a platform designed to empower farmers and bridge the gap between agricultural producers and buyers. We aim to provide a digital solution that connects farmers, buyers, and agricultural experts in one place.</p>
        
        <h2>Our Mission</h2>
        <p>To enhance the lives of farmers by offering a user-friendly platform where they can sell their produce, get real-time market insights, access agricultural resources, and improve their income.</p>

        <h2>What We Offer</h2>
        <ul>
            <li>Product Listings And Marketplace for Farmers</li>
            <li>Real-Time Weather Updates</li>
            <li>Crop Suggestions And Market Prices</li>
            <li>Buyer-Farmer Direct Communication</li>
            <li>Secure Login And Role-Based Access</li>
        </ul>

        <h2>Why Choose Us?</h2>
        <p>We believe in empowering the backbone of our country — our farmers — by digitizing agriculture and bringing technology to their fingertips.</p>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
