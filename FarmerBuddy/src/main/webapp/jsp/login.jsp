<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Farmer Buddy</title>
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="../css/login.css">
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

<div class="login-wrapper">
<div class="login-container">
    <h2>User Login</h2>

    <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
        <label for="email">Email</label>
        <input type="email" name="email" id="email" required 
               value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">

        <label for="password">Password</label>
        <input type="password" name="password" id="password" required>

        <label for="role">Role</label>
        <select name="role" id="role" required>
            <option value="">-- Select Role --</option>
            <option value="FARMER" <%= "FARMER".equals(request.getParameter("role")) ? "selected" : "" %>>Farmer</option>
            <option value="BUYER" <%= "BUYER".equals(request.getParameter("role")) ? "selected" : "" %>>Buyer</option>
            <option value="ADMIN" <%= "ADMIN".equals(request.getParameter("role")) ? "selected" : "" %>>Admin</option>
        </select>

        <% 
            String error = request.getParameter("error");
            if ("true".equals(error)) {
        %>
            <div class="error-message">Invalid email, password, or role. Please try again.</div>
        <% } else if ("invalidRole".equals(error)) { %>
            <div class="error-message">Invalid role selected.</div>
        <% } else if ("exception".equals(error)) { %>
            <div class="error-message">Server error occurred. Try again later.</div>
        <% } %>

        <button type="submit">Login</button>
    </form>

    <p style="text-align:center; margin-top: 15px;">
        Don't have an account? <a href="register.jsp">Register Here</a>
    </p>
</div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
