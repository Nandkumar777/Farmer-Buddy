package com.farmerbuddy.servlets;

import com.farmerbuddy.utils.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("jsp/login.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");

        // Match form field names
        String name = request.getParameter("productName");
        String category = request.getParameter("category").toUpperCase();
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO products (user_id, name, category, price, quantity, description) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setString(2, name);
            stmt.setString(3, category);
            stmt.setDouble(4, price);
            stmt.setInt(5, quantity);
            stmt.setString(6, description);
            stmt.executeUpdate();

            response.sendRedirect("jsp/viewProducts.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("This is executed ");
            response.sendRedirect("jsp/addProduct.jsp?error=1");
        }
    }
}
