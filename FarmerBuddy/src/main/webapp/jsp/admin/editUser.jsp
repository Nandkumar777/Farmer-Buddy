<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.farmerbuddy.utils.DBUtil" %>

<%
    String userIdParam = request.getParameter("user_id");
    boolean invalidId = false;
    int userId = 0;
    String name = "", email = "", role = "";

    if (userIdParam != null && !userIdParam.trim().isEmpty()) {
        try {
            userId = Integer.parseInt(userIdParam);
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                conn = DBUtil.getConnection();
                String sql = "SELECT * FROM users WHERE user_id = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, userId);
                rs = ps.executeQuery();

                if (rs.next()) {
                    name = rs.getString("name");
                    email = rs.getString("email");
                    role = rs.getString("role");
                } else {
                    invalidId = true;
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

<!DOCTYPE html>
<html>
<head>
    <title>Edit User - Farmer Buddy</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/editUser.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
<jsp:include page="adminNavBar.jsp" />

<div class="form-wrapper">
    <div class="form-container">
        <h2>Edit User Details</h2>

        <% if (!invalidId) { %>
        <form action="<%= request.getContextPath() %>/UpdateUserServlet" method="post">
            <input type="hidden" name="user_id" value="<%= userId %>">

            <label for="name">Name</label>
            <input type="text" name="name" id="name" value="<%= name %>" required>

            <label for="email">Email</label>
            <input type="email" name="email" id="email" value="<%= email %>" required>

            <label for="role">Role</label>
            <select name="role" id="role" required>
                <option value="FARMER" <%= "FARMER".equals(role) ? "selected" : "" %>>Farmer</option>
                <option value="BUYER" <%= "BUYER".equals(role) ? "selected" : "" %>>Buyer</option>
                <option value="ADMIN" <%= "ADMIN".equals(role) ? "selected" : "" %>>Admin</option>
            </select>

            <button type="submit">Update</button>
        </form>
        <% } else { %>
        <div class="alert alert-danger">
            <strong>Error:</strong> User not found or invalid user ID!
        </div>
        <% } %>
    </div>
</div>

<jsp:include page="../footer.jsp" />
</body>
</html>
