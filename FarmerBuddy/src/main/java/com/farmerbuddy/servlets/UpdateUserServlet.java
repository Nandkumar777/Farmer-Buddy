package com.farmerbuddy.servlets;

import com.farmerbuddy.utils.DBUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from the form
        String userId = request.getParameter("user_id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Database connection
            conn = DBUtil.getConnection();
            
            // SQL to update user data
            String sql = "UPDATE users SET name = ?, email = ?, role = ? WHERE user_id = ?";
            ps = conn.prepareStatement(sql);
            
            // Set values in the prepared statement
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, role);
            ps.setInt(4, Integer.parseInt(userId)); // Assuming userId is an integer
            
            // Execute the update
            int rowsUpdated = ps.executeUpdate();
            
            // Redirect to the user list page or some success page
            if (rowsUpdated > 0) {
            	response.sendRedirect(request.getContextPath() + "/manageUsers");
            } else {
                response.sendRedirect("jsp/admin/editUser.jsp?error=1"); // Show error if update fails
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("jsp/admin/editUser.jsp?error=2"); // Show error if there's a database issue
        } finally {
            try {
                // Close resources
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
