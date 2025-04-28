<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.farmerbuddy.model.User" %>
<%
    String userName = (String) session.getAttribute("userName");
    String userRole = (String) session.getAttribute("userRole");

    // Redirect to login if no user is logged in or if the user is not an admin
    if (userName == null || userRole == null || !userRole.equalsIgnoreCase("ADMIN")) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get the list of users passed from the servlet
    List<User> userList = (List<User>) request.getAttribute("userList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/manageUsers.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

    <jsp:include page="adminNavBar.jsp" />

    <div class="main-content">
        <div class="table-container">
            <h2>👥 All Registered Users</h2>

            <!-- Table to display user information -->
            <table>
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (userList != null && !userList.isEmpty()) {
                            for (User u : userList) {
                    %>
                    <tr>
                        <td><%= u.getId() %></td>
                        <td><%= u.getUsername() %></td>
                        <td><%= u.getEmail() %></td>
                        <td><%= u.getRole() %></td>
                        <td class="action-buttons">
                            <a href="jsp/admin/editUser.jsp?user_id=<%= u.getId() %>">✏️ Edit</a>           
                            <a href="DeleteUserServlet?id=<%= u.getId() %>">❌ Delete</a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="6">No users found.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <jsp:include page="../footer.jsp" />
</body>
</html>
