<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.farmerbuddy.utils.DBUtil" %>
<%@ page import="com.farmerbuddy.model.Product" %>
<%@ page import="java.sql.*" %>

<%
    String idParam = request.getParameter("product_id");
    Product product = null;
    boolean invalidId = false;

    if (idParam != null && !idParam.trim().isEmpty()) {
        try {
            int productId = Integer.parseInt(idParam);

            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                conn = DBUtil.getConnection();
                String sql = "SELECT * FROM products WHERE product_id = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, productId);
                rs = ps.executeQuery();

                if (rs.next()) {
                    product = new Product();
                    product.setId(rs.getInt("product_id"));
                    product.setName(rs.getString("name"));
                    product.setCategory(rs.getString("category"));
                    product.setPrice(rs.getDouble("price"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setDescription(rs.getString("description"));
                }

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            }
        } catch (NumberFormatException e) {
            invalidId = true;
        }
    } else {
        invalidId = true;
    }
%>

<html>
<head>
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/editProduct.css">
    
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container mt-5">
    <h2 class="mb-4 text-success">Edit Product</h2>

    <% if (product != null) { %>
    <form action="../EditProductServlet" method="post">
        <input type="hidden" name="product_id" value="<%= product.getId() %>">

        <div class="mb-3">
            <label for="name" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= product.getName() %>" required>
        </div>

        <div class="mb-3">
            <label for="category" class="form-label">Category</label>
            <select class="form-select" id="category" name="category" required>
                <option value="">-- Select Category --</option>
                <option value="VEGETABLES" <%= "VEGETABLES".equals(product.getCategory()) ? "selected" : "" %>>Vegetables</option>
                <option value="FRUITS" <%= "FRUITS".equals(product.getCategory()) ? "selected" : "" %>>Fruits</option>
                <option value="GRAINS" <%= "GRAINS".equals(product.getCategory()) ? "selected" : "" %>>Grains</option>
                <option value="DAIRY" <%= "DAIRY".equals(product.getCategory()) ? "selected" : "" %>>Dairy</option>
                <option value="SEED" <%= "SEED".equals(product.getCategory()) ? "selected" : "" %>>Seed</option>
                <option value="OTHER" <%= "OTHER".equals(product.getCategory()) ? "selected" : "" %>>Other</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="price" class="form-label">Price (₹)</label>
            <input type="number" class="form-control" id="price" name="price" step="0.01" value="<%= product.getPrice() %>" required>
        </div>

        <div class="mb-3">
            <label for="quantity" class="form-label">Quantity</label>
            <input type="number" class="form-control" id="quantity" name="quantity" value="<%= product.getQuantity() %>" required>
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3"><%= product.getDescription() %></textarea>
        </div>

        <button type="submit" class="btn btn-success">Update Product</button>
        <a href="viewProducts.jsp" class="btn btn-secondary">Cancel</a>
    </form>
    <% } else { %>
        <div class="alert alert-danger">
            <strong>Error:</strong> 
            <% if (invalidId) { %>
                Invalid Product ID format!
            <% } else { %>
                Product not found!
            <% } %>
        </div>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="footer.jsp" />
</body>
</html>
