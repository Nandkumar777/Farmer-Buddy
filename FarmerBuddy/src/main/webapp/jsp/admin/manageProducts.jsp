<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.farmerbuddy.model.Product"%>
<%
List<Product> productList = (List<Product>) request.getAttribute("productList");
%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Products</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<style>
body {
	font-family: Arial, sans-serif;
}

h2 {
	text-align: center;
}

.product-table {
	width: 90%;
	margin: 20px auto;
	border-collapse: collapse;
}

.product-table th, .product-table td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}

.product-table th {
	background-color: #f4f4f4;
}

.actions a {
	margin: 0 5px;
	text-decoration: none;
	padding: 5px 10px;
	border-radius: 5px;
	color: white;
}

.edit-btn {
	background-color: #4CAF50;
}

.delete-btn {
	background-color: #f44336;
}

.add-btn {
	display: block;
	width: 200px;
	margin: 20px auto;
	padding: 10px;
	text-align: center;
	background-color: #2196F3;
	color: white;
	text-decoration: none;
	border-radius: 5px;
}
</style>
</head>
<body>

	<jsp:include page="adminNavBar.jsp" />

	<h2>📦 Manage Products</h2>

	<a href="${pageContext.request.contextPath}/jsp/admin/addProduct.jsp"
		class="add-btn">➕ Add New Product</a>

	<table class="product-table">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Category</th>
			<th>Price (₹)</th>
			<th>Quantity</th>
			<th>Actions</th>
		</tr>

		<%
		if (productList != null && !productList.isEmpty()) {
			for (Product product : productList) {
		%>
		<tr>
			<td><%=product.getId()%></td>
			<td><%=product.getName()%></td>
			<td><%=product.getCategory()%></td>
			<td><%=product.getPrice()%></td>
			<td><%=product.getQuantity()%></td>
			<td class="actions"><a
				href="${pageContext.request.contextPath}/EditProductServlet?id=<%= product.getId() %>"
				class="edit-btn">Edit</a> <a
				href="${pageContext.request.contextPath}/DeleteProductServlet?id=<%= product.getId() %>"
				class="delete-btn"
				onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
			</td>
		</tr>
		<%
		}
		} else {
		%>
		<tr>
			<td colspan="6">No products available.</td>
		</tr>
		<%
		}
		%>
	</table>
	
	<jsp:include page="../footer.jsp" />
	
</body>
</html>
