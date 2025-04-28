<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%
String userName = (String) session.getAttribute("userName");
String userRole = (String) session.getAttribute("userRole");

if (userName == null || userRole == null || !userRole.equalsIgnoreCase("FARMER")) {
	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farmer Dashboard</title>
<link rel="stylesheet" href="../css/farmer_dashboard.css">
</head>
<body>

	<jsp:include page="header.jsp" />

	<div class="main-content">

		<div class="welcome-box">
			<h3>Welcome, <%=userName%> (FARMER)</h3>
			<p>
				This is your <strong>Farmer Buddy</strong> — a smart digital tool created to support you in every farming activity.<br>
				Here, you can easily manage your products, track weather forecasts, and check current market prices — all from one place.
			</p>
		</div>

		<!-- Theory/Information Section -->
		<div class="theory-section">
			<h3>🌾 Why is the Farmer Buddy Important?</h3>
			<p>
				The <strong>Farmer Buddy</strong> is designed to make your life easier, your work smarter, and your income better. It gives you instant access to all the tools and information you need for successful farming.
			</p>
			<ul>
				<li><strong>✅ Manage Your Products:</strong> Quickly add new products, view your listings, and keep track of your inventory — no paperwork needed.</li>
				<li><strong>✅ Check Weather Reports:</strong> Get accurate weather updates to protect your crops and plan your farming schedule properly.</li>
				<li><strong>✅ Monitor Market Prices:</strong> Stay updated with the latest rates of crops in the market so you can sell at the best time and earn more profit.</li>
				<li><strong>✅ Save Time with Technology:</strong> Avoid manual efforts and make use of this easy-to-use dashboard to work more efficiently.</li>
				<li><strong>✅ Access Anytime, Anywhere:</strong> Whether you are in the field or at home, the dashboard is available anytime to help you make good decisions.</li>
			</ul>
			<p>
				This dashboard brings you closer to <strong>modern, smart farming practices</strong>. It helps you grow more, earn more, and secure a better future for your family.
			</p>
		</div>

	</div>

	<jsp:include page="footer.jsp" />

</body>
</html>
