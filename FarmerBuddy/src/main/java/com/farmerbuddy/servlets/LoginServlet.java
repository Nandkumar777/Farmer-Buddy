package com.farmerbuddy.servlets;

import com.farmerbuddy.utils.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Log incoming parameters
        System.out.println("Login Attempt - Email: " + email + ", Role: " + role);

        String hashedPassword = hashPassword(password);

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM users WHERE email = ? AND password = ? AND role = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, hashedPassword); // Ensure DB passwords are hashed
            ps.setString(3, role);

            rs = ps.executeQuery();

            if (rs.next()) {
                // Successful login
                HttpSession session = request.getSession();
                session.setAttribute("userId", rs.getInt("user_id"));
                session.setAttribute("userName", rs.getString("name"));
                session.setAttribute("userEmail", rs.getString("email"));
                session.setAttribute("userRole", rs.getString("role"));

                System.out.println("Login successful for user: " + rs.getString("name"));

                // Role-based redirection
                switch (role.toUpperCase()) {
                    case "FARMER":
                        response.sendRedirect("jsp/farmer_dashboard.jsp");
                        break;
                    case "BUYER":
                        response.sendRedirect("jsp/buyer_dashboard.jsp");
                        break;
                    case "ADMIN":
                        response.sendRedirect("jsp/admin_dashboard.jsp");
                        break;
                    default:
                        response.sendRedirect("jsp/login.jsp?error=invalidRole");
                        break;
                }

            } else {
                // Failed login
                System.out.println("Login failed - invalid credentials");
                response.sendRedirect("jsp/login.jsp?error=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("jsp/login.jsp?error=exception");
        } finally {
            DBUtil.close(rs);
            DBUtil.close(ps);
            DBUtil.close(conn);
        }
    }

    // SHA-256 password hashing
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes());
            StringBuilder hexString = new StringBuilder();

            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }

            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }
}
