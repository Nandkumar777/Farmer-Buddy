<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String userName = (String) session.getAttribute("userName");
    String userRole = (String) session.getAttribute("userRole");
    if (userName == null || !"FARMER".equalsIgnoreCase(userRole)) {
        response.sendRedirect("jsp/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Market Prices</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/market_prices.css">
</head>
<body>
	<jsp:include page="header.jsp" />
    <h2 style="text-align: center;">Current Market Prices</h2>
    <table>
        <tr>
            <th>Crop Name</th>
            <th>Market Price (₹/kg)</th>
            <th>Last Updated</th>
        </tr>

        <c:forEach var="price" items="${marketPrices}">
            <tr>
                <td>${price.cropName}</td>
                <td>₹${price.marketPrice}</td>
                <td>${price.lastUpdated}</td>
            </tr>
        </c:forEach>

    </table>
<jsp:include page="footer.jsp" />
</body>
</html>
