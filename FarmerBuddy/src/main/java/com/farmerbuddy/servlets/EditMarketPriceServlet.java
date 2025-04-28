package com.farmerbuddy.servlets;

import com.farmerbuddy.dao.MarketPriceDAO;
import com.farmerbuddy.model.MarketPrice;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/EditMarketPriceServlet")
public class EditMarketPriceServlet extends HttpServlet {
    private MarketPriceDAO marketPriceDAO;

    @Override
    public void init() throws ServletException {
        marketPriceDAO = new MarketPriceDAO(); // Initialize your DAO here
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam != null) {
            int id = Integer.parseInt(idParam);
            MarketPrice marketPrice = marketPriceDAO.getMarketPriceById(id);

            if (marketPrice != null) {
                request.setAttribute("marketPrice", marketPrice);
                RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/admin/editMarketPrice.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/MarketPriceServlet");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/MarketPriceServlet");
        }
    }
}
