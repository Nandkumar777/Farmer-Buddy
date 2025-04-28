<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Market Price</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/market_prices.css">
</head>
<body>
<jsp:include page="adminNavBar.jsp" />
<form action="${pageContext.request.contextPath}/AddMarketPriceServlet" method="post" class="form-container">
    <div class="form-group">
        <label for="cropName">Crop Name:</label>
        <input type="text" id="cropName" name="cropName" required>
    </div>

    <div class="form-group">
        <label for="marketPrice">Market Price (₹/kg):</label>
        <input type="number" id="marketPrice" name="marketPrice" step="0.01" required>
    </div>

    <div class="form-group">
        <label for="lastUpdated">Date:</label>
        <input type="date" id="lastUpdated" name="lastUpdated" required>
    </div>

    <button type="submit" class="submit-btn">➕ Add Price</button>
</form>

<a href="${pageContext.request.contextPath}/MarketPriceServlet" class="back-btn">⬅️ Back to Market Prices</a>

<jsp:include page="../footer.jsp" />
</body>
</html>
