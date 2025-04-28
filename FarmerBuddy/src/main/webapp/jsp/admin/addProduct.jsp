<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Product</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin-top : 100px;
        }
        .form-container {
            width: 40%;
            margin: 40px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input[type="text"],
        input[type="number"] {
            width: 95%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .submit-btn {
            display: block;
            margin: 20px auto 0;
            background-color: #4CAF50;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .submit-btn:hover {
            background-color: #45a049;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
	<jsp:include page="adminNavBar.jsp" />
<div class="form-container">
    <h2>➕ Add New Product</h2>

    <form action="${pageContext.request.contextPath}/AddProductServlet" method="post">
        <label for="name">Product Name:</label>
        <input type="text" name="name" id="name" required>

        <label for="category">Category:</label>
        <input type="text" name="category" id="category" required>

        <label for="price">Price (₹):</label>
        <input type="number" name="price" id="price" step="0.01" required>

        <label for="quantity">Quantity:</label>
        <input type="number" name="quantity" id="quantity" required>

        <input type="submit" value="Add Product" class="submit-btn">
    </form>
</div>
		<jsp:include page="../footer.jsp" />
</body>
</html>
