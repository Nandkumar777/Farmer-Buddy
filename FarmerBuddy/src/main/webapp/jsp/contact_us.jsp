<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Contact Us - Farmer Buddy</title>
	<link rel="stylesheet" href="../css/navbar.css">
	<link rel="stylesheet" href="../css/contact.css">
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

	<div class="contact-container">
    <h2>Contact Us</h2>
    <p>If you have any questions or inquiries, feel free to reach out to us using the form below or through our contact details.</p>

    <div class="contact-content">
        <div class="contact-info">
            <h3>Our Contact Details</h3>
            <p><i class="fas fa-map-marker-alt"></i> Pune, Maharashtra, India</p>
            <p><i class="fas fa-phone"></i> +91 9876543210</p>
            <p><i class="fas fa-envelope"></i> support@farmerbuddy.com</p>
        </div>

        <div class="contact-form">
            <form action="#" method="post">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="subject">Subject:</label>
                <input type="text" id="subject" name="subject" required>

                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5" required></textarea>

                <button type="submit">Send Message</button>
            </form>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
