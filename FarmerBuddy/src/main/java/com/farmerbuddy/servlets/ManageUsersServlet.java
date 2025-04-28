package com.farmerbuddy.servlets;

import com.farmerbuddy.dao.UserDAO;
import com.farmerbuddy.model.User;
import com.farmerbuddy.utils.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/manageUsers")
public class ManageUsersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if the user is logged in and has ADMIN role
        String userName = (String) request.getSession().getAttribute("userName");
        String userRole = (String) request.getSession().getAttribute("userRole");

        // If user is not logged in or is not an admin, redirect to login page
        if (userName == null || userRole == null || !userRole.equalsIgnoreCase("ADMIN")) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Get the database connection
            Connection connection = DBUtil.getConnection();
            UserDAO userDAO = new UserDAO(connection);

            // Fetch all users from the database
            List<User> userList = userDAO.getAllUsers();

            // Set the list of users as a request attribute to display in JSP
            request.setAttribute("userList", userList);

            // Forward the request to the manageUsers.jsp page
            request.getRequestDispatcher("jsp/admin/manageUsers.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle delete or other actions if needed
        String action = request.getParameter("action");

        if ("delete".equalsIgnoreCase(action)) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            try {
                // Get the database connection
                Connection connection = DBUtil.getConnection();
                UserDAO userDAO = new UserDAO(connection);

                // Delete user by userId
                boolean isDeleted = userDAO.deleteUser(userId);

                if (isDeleted) {
                    // Redirect to the same page to refresh the user list after deletion
                    response.sendRedirect("manageUsers");
                } else {
                    // If deletion fails, show error
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error deleting user.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
            }
        }
    }
}
