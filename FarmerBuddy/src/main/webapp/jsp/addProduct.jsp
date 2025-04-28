<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
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
    <title>Add Product - Farmer Buddy</title>
    <link rel="stylesheet" href="../css/addProduct.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="main-content">
        <h3>Add New Product</h3>

        <!-- Message Section (Optional) -->
        <%
            String message = (String) request.getAttribute("message");
            String messageType = (String) request.getAttribute("messageType"); // success / error
            if (message != null && messageType != null) {
        %>
            <div class="message <%= messageType %>"><%= message %></div>
        <% } %>

        <div class="form-container">
            <form action="../AddProductServlet" method="post">
                <div class="form-group">
                    <label for="productName">Product Name:</label>
                    <input type="text" name="productName" id="productName" required maxlength="100">
                </div>

                <div class="form-group">
                    <label for="category">Category:</label>
                    <select name="category" id="category" required>
                        <option value="">--Select Category--</option>
                        <option value="Vegetables">Vegetables</option>
                        <option value="Fruits">Fruits</option>
                        <option value="Grains">Grains</option>
                        <option value="Seed">Seed	</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="price">Price (per unit):</label>
                    <input type="number" name="price" id="price" required min="1" step="0.01">
                </div>

                <div class="form-group">
                    <label for="quantity">Quantity:</label>
                    <input type="number" name="quantity" id="quantity" required min="1">
                </div>

                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea name="description" id="description" rows="4" maxlength="500"></textarea>
                </div>

                <input type="submit" value="Add Product">
            </form>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>
