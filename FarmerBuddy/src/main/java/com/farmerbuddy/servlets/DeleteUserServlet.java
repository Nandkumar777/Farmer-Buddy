package com.farmerbuddy.servlets;

import com.farmerbuddy.utils.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userIdStr = request.getParameter("id");
        System.out.println("Trying to delete user with ID: " + userIdStr);

        if (userIdStr != null && !userIdStr.isEmpty()) {
            try {
                int userId = Integer.parseInt(userIdStr);

                try (Connection conn = DBUtil.getConnection()) {

                    // Step 1: Delete products associated with this user
                    try (PreparedStatement ps1 = conn.prepareStatement("DELETE FROM products WHERE user_id = ?")) {
                        ps1.setInt(1, userId);
                        ps1.executeUpdate();
                    }

                    // Step 2: Delete user
                    try (PreparedStatement ps2 = conn.prepareStatement("DELETE FROM users WHERE user_id = ?")) {
                        ps2.setInt(1, userId);
                        int rowsAffected = ps2.executeUpdate();
                        System.out.println("User deleted successfully, rows affected: " + rowsAffected);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }

            } catch (NumberFormatException e) {
                System.err.println("Invalid user ID format: " + userIdStr);
                e.printStackTrace();
            }
        } else {
            System.err.println("User ID is null or empty");
        }

        // Redirect back to manage users page
        response.sendRedirect(request.getContextPath() + "/manageUsers");
    }
}
