package com.farmerbuddy.servlets;

import com.farmerbuddy.utils.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/jsp/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Step 1: Get form data from request
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // Step 2: Hash the password
        String hashedPassword = hashPassword(password);

        // Step 3: Insert into database
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBUtil.getConnection();

            String sql = "INSERT INTO users (name, email, password, role, phone, address) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, hashedPassword);
            pstmt.setString(4, role);
            pstmt.setString(5, phone);
            pstmt.setString(6, address);

            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
                // Success
                request.setAttribute("message", "Registration successful! Please login.");
                request.getRequestDispatcher("/jsp/register.jsp").forward(request, response);
                
            } else {
                request.setAttribute("error", "Registration failed. Try again.");
                request.getRequestDispatcher("/jsp/register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("/jsp/register.jsp").forward(request, response);
        } finally {
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }

    // Utility method for hashing password
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());

            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b)); // convert byte to hex
            }
            return sb.toString();

        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password: " + e.getMessage());
        }
    }
}
