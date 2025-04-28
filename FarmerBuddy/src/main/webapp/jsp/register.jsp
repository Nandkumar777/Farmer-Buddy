<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Farmer Buddy</title>
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/register.css">
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
	</div><% String message = (String) request.getAttribute("message"); %>
<% String error = (String) request.getAttribute("error"); %>

<% if (message != null) { %>
    <div class="success-message">
        <i class="fas fa-check-circle"></i> <%= message %>
    </div>
<% } %>

<% if (error != null) { %>
    <div class="error-message">
        <i class="fas fa-times-circle"></i> <%= error %>
    </div>
<% } %>
<div class="form-container">
    <h2>User Registration</h2>

    <form action="RegisterServlet" method="post">
        <label for="name">Name</label>
        <input type="text" name="name" id="name" required>

        <label for="email">Email</label>
        <input type="email" name="email" id="email" required>

        <label for="password">Password</label>
        <input type="password" name="password" id="password" required>

        <label for="role">Role</label>
        <select name="role" id="role" required>
            <option value="">Select Role</option>
            <option value="FARMER">Farmer</option>
            <option value="BUYER">Buyer</option>
            <option value="ADMIN">Admin</option>
        </select>

        <label for="phone">Phone Number</label>
        <input type="text" name="phone" id="phone" required>

        <label for="address">Address</label>
        <textarea name="address" id="address" rows="3" required></textarea>

        <input type="submit" value="Register">
    </form>

    <div class="login-link">
        Already registered? <a href="login.jsp">Login here</a>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
