package com.farmerbuddy.servlets;

import com.farmerbuddy.dao.MarketPriceDAO;
import com.farmerbuddy.model.MarketPrice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

// Map servlet to URL
@WebServlet("/UpdateMarketPriceServlet")
public class UpdateMarketPriceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private MarketPriceDAO marketPriceDAO;

    @Override
    public void init() throws ServletException {
        marketPriceDAO = new MarketPriceDAO(); // Initialize DAO
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Read form parameters
            int id = Integer.parseInt(request.getParameter("id"));
            String cropName = request.getParameter("cropName");
            double price = Double.parseDouble(request.getParameter("price"));
           

            // Create MarketPrice object
            MarketPrice marketPrice = new MarketPrice();
            marketPrice.setId(id);
            marketPrice.setCropName(cropName);
            marketPrice.setMarketPrice(price);
           
            // Update in database
            boolean isUpdated = marketPriceDAO.updateMarketPrice(marketPrice);

            if (isUpdated) {
                response.sendRedirect("MarketPriceServlet");
            } else {
                response.sendRedirect("jsp/admin/editMarketPrice.jsp?id=" + id + "&error=updateFailed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("../error.jsp"); // You can create a generic error page
        }
    }
}
