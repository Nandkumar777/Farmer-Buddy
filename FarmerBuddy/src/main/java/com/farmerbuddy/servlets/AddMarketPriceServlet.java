package com.farmerbuddy.servlets;

import com.farmerbuddy.dao.MarketPriceDAO;
import com.farmerbuddy.model.MarketPrice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/AddMarketPriceServlet")
public class AddMarketPriceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cropName = request.getParameter("cropName");
        String marketPriceStr = request.getParameter("marketPrice");
        String lastUpdatedStr = request.getParameter("lastUpdated");

        double marketPrice = Double.parseDouble(marketPriceStr);

        // 🔥 Convert String to java.sql.Date
        Date lastUpdated = Date.valueOf(lastUpdatedStr);

        MarketPrice mp = new MarketPrice();
        mp.setCropName(cropName);
        mp.setMarketPrice(marketPrice);
        mp.setLastUpdated(lastUpdated); // ✅ Set properly

        MarketPriceDAO dao = new MarketPriceDAO();
        boolean success = dao.addMarketPrice(mp);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/MarketPriceServlet");
        } else {
            response.getWriter().println("Failed to add market price. Try again.");
        }
    }
}
