<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
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
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
	<jsp:include page="admin/adminNavBar.jsp" />
    <!-- Main Content -->
    <div class="main-content">
        <div class="welcome-box">
            <h3>Welcome, <%= userName %> (ADMIN)</h3>
            <p>
                You're in the <strong>Admin Control Center</strong> of <strong>Farmer Buddy</strong>. From here, you can manage users, monitor activities, and oversee platform performance efficiently.
            </p>
        </div>

        <!-- Admin Info Section -->
        <div class="theory-section">
            <h3>🛠️ What You Can Do as an Admin</h3>
            <ul>
                <li><strong>👥 Manage Users:</strong> Approve new accounts, manage farmers and buyers, or deactivate problematic users.</li>
                <li><strong>📦 Oversee Products:</strong> View all products listed by users and take action if needed.</li>
                <li><strong>💹 Update Market Prices:</strong> Ensure farmers and buyers see accurate, timely pricing info.</li>
                <li><strong>⛅ Provide Weather Info:</strong> Integrate weather updates to help farmers make smart decisions.</li>
                <li><strong>🛒 Track Orders:</strong> Review and track product orders and transaction histories.</li>
                <li><strong>📊 Analyze Reports:</strong> Get insights through charts, tables, and system logs.</li>
            </ul>
            <p>
                Your role ensures the system stays <strong>safe, smooth, and scalable</strong>. Thank you for being the backbone of this smart agriculture initiative.
            </p>
        </div>

    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
