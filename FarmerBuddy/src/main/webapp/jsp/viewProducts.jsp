<%@page import="com.farmerbuddy.utils.DBUtil"%>
<%@ page import="java.sql.*, java.util.*, com.farmerbuddy.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>View Products</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/viewProducts.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/farmer_dashboard.css">
</head>
<body>

<jsp:include page="header.jsp" />

<h2>Your Products</h2>

<%
    List<Product> productList = new ArrayList<>();
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        conn = DBUtil.getConnection();
        int userId = Integer.parseInt(session.getAttribute("userId").toString());

        String sql = "SELECT p.*, u.name AS farmer_name FROM products p JOIN users u ON p.user_id = u.user_id WHERE p.user_id = ?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, userId);
        rs = ps.executeQuery();

        while (rs.next()) {
            Product product = new Product();
            product.setId(rs.getInt("product_id"));
            product.setName(rs.getString("name"));
            product.setCategory(rs.getString("category"));
            product.setPrice(rs.getDouble("price"));
            product.setQuantity(rs.getInt("quantity"));
            product.setDescription(rs.getString("description"));
            product.setFarmerUsername(rs.getString("farmer_name"));
            productList.add(product);
        }

        request.setAttribute("productList", productList);

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>

<!-- 📊 Total Count -->
<div class="total-count">
    Total Products: <%= productList.size() %>
</div>

<!-- 📋 Product Table -->
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Price (₹)</th>
            <th>Quantity</th>
            <th>Description</th>
            <th>Farmer Name</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
    <%
        if (!productList.isEmpty()) {
            for (Product product : productList) {
    %>
        <tr>
            <td><%= product.getId() %></td>
            <td><%= product.getName() %></td>
            <td><%= product.getCategory() %></td>
            <td><%= product.getPrice() %></td>
            <td><%= product.getQuantity() %></td>
            <td><%= product.getDescription() %></td>
            <td><%= product.getFarmerUsername() %></td>
            <td>
                <a href="${pageContext.request.contextPath}/jsp/editProduct.jsp?product_id=<%= product.getId() %>" class="btn btn-primary">Edit</a>
                <a href="<%= request.getContextPath() %>/DeleteProductServlet?id=<%= product.getId() %>"  onclick="return confirm('Are you sure you want to delete this product?')" class="btn btn-danger">Delete</a>
      
             </td>
        </tr>
    <%
            }
        } else {
    %>
        <tr><td colspan="8" style="text-align:center;">No products found.</td></tr>
    <%
        }
    %>
    </tbody>
</table>

<br>
<a class="add-btn" href="${pageContext.request.contextPath}/jsp/addProduct.jsp">+ Add New Product</a>
<jsp:include page="footer.jsp" />
</body>
</html>
