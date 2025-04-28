package com.farmerbuddy.servlets;

import com.farmerbuddy.dao.MarketPriceDAO;
import com.farmerbuddy.model.MarketPrice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/MarketPrice")
public class MarketPriceFarmer extends HttpServlet {
    private static final long serialVersionUID = 1L; // ✅ Fix warning

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MarketPriceDAO dao = new MarketPriceDAO();
        List<MarketPrice> priceList = dao.getAllPrices();

        request.setAttribute("marketPriceList", priceList);
        request.getRequestDispatcher("jsp/marketPrices.jsp").forward(request, response);
    }
}
