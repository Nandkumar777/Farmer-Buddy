<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.farmerbuddy.model.MarketPrice" %>
<%
    List<MarketPrice> marketPriceList = (List<MarketPrice>) request.getAttribute("marketPriceList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Market Prices</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/market_prices.css">
</head>
<body>
 <jsp:include page="adminNavBar.jsp" />
<h2>💹 Market Prices</h2>

<a href="${pageContext.request.contextPath}/jsp/admin/addMarketPrice.jsp" class="add-btn">➕ Add New Market Price</a>

<table class="table">
    <tr>
        <th>ID</th>
        <th>Crop Name</th>
        <th>Price (₹/kg)</th>
        <th>Date</th>
        <th>Actions</th>
    </tr>

    <%
        if (marketPriceList != null && !marketPriceList.isEmpty()) {
            for (MarketPrice mp : marketPriceList) {
    %>
    <tr>
        <td><%= mp.getId() %></td>
        <td><%= mp.getCropName() %></td>
        <td><%= mp.getMarketPrice() %></td>
        <td><%= mp.getLastUpdated() %></td>
        <td class="actions">
            <a href="${pageContext.request.contextPath}/EditMarketPriceServlet?id=<%= mp.getId() %>" class="edit-btn">Edit</a>
            <a href="${pageContext.request.contextPath}/DeleteMarketPriceServlet?id=<%= mp.getId() %>" class="delete-btn" onclick="return confirm('Are you sure you want to delete this entry?');">Delete</a>
        </td>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="6">No market price data available.</td>
    </tr>
    <% } %>
</table>
 <jsp:include page="../footer.jsp" />
</body>
</html>
