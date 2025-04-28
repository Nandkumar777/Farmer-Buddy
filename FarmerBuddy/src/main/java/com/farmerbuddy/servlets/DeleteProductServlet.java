package com.farmerbuddy.servlets;

import com.farmerbuddy.utils.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productIdStr = request.getParameter("id");

        if (productIdStr != null && !productIdStr.isEmpty()) {
            try {
                int productId = Integer.parseInt(productIdStr);

                try (Connection conn = DBUtil.getConnection()) {
                    String sql = "DELETE FROM products WHERE product_id = ?";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setInt(1, productId);
                    ps.executeUpdate();
                    ps.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // Redirect back to the products page
        response.sendRedirect(request.getContextPath() + "/jsp/viewProducts.jsp");
    }
}
