<%@ page contentType="text/html; charset=UTF-8" language="java" session="true" %>
<%
    String userName = (String) session.getAttribute("userName");
    String userRole = (String) session.getAttribute("userRole");

    if (userName == null || userRole == null || !userRole.equalsIgnoreCase("ADMIN")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Panel - Navbar</title>  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/adminNavbar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<!-- Admin Navbar -->
<div class="navbar">
    <div class="logo">
		<i class="fas fa-hands-holding"></i>
		<i class="fas fa-seedling"></i> 
		<span class="logo-text"><a href="${pageContext.request.contextPath}/jsp/admin_dashboard.jsp">Farmer Buddy</a></span>
		
	</div>		 

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/jsp/admin_dashboard.jsp">🏠 Dashboard</a>
        <a href="${pageContext.request.contextPath}/manageUsers">👥 Manage Users</a>
        <a href="${pageContext.request.contextPath}/jsp/admin/manageProducts.jsp">📦 Manage Products</a>
        <a href="${pageContext.request.contextPath}/MarketPriceServlet">💹 Market Prices</a>
        <a href="${pageContext.request.contextPath}/jsp/orders.jsp">🛒 Orders & Transactions</a>
    </div>

    <div class="profile-section">
        <div class="profile-name">👤 <%= userName %> (<%= userRole %>)</div>
        <div class="profile-dropdown">
            <a href="${pageContext.request.contextPath}/jsp/viewProfile.jsp">View Profile</a>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
    </div>
</div>

</body>
</html>
