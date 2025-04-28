<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String userName = (String) session.getAttribute("userName");
    String userRole = (String) session.getAttribute("userRole");
    if (userName == null || !"BUYER".equalsIgnoreCase(userRole)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Buyer Dashboard</title>
</head>
<body>
    <h2>Welcome, <%= userName %> (BUYER)</h2>
    <p>This is the Buyer Dashboard.</p>
    <a href="LogoutServlet">Logout</a>
</body>
</html>
