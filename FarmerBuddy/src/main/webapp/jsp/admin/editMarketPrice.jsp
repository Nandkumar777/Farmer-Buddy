<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.farmerbuddy.model.MarketPrice" %>
<%
    MarketPrice marketPrice = (MarketPrice) request.getAttribute("marketPrice");
%>
<html>
<head>
    <title>Edit Market Price</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/editMarketPrice.css">
</head>
<body>
<jsp:include page="adminNavBar.jsp" />
<div class="form-container">
    <h2>Edit Market Price</h2>
    <form action="${pageContext.request.contextPath}/UpdateMarketPriceServlet" method="post">
        <input type="hidden" name="id" value="<%= marketPrice.getId() %>">	
        
        <label>Crop Name:</label>
        <input type="text" name="cropName" value="<%= marketPrice.getCropName() %>" required>
         

        <label>Price per Kg:</label>
        <input type="text" name="price" value="<%= marketPrice.getMarketPrice() %>" required>

         
        <button type="submit">Update</button>
    </form>
</div>
<jsp:include page="../footer.jsp" />
</body>
</html>
