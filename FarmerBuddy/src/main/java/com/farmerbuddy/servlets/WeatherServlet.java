package com.farmerbuddy.servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import org.json.JSONObject;

@WebServlet("/weather")
public class WeatherServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // OpenWeatherMap API Key
    private static final String API_KEY = "7132339cef5025ef22009115d4a9c0aa";
    private static final String API_URL = "https://api.openweathermap.org/data/2.5/weather?q=%s&units=metric&appid=" + API_KEY;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String city = request.getParameter("city");

        if (city == null || city.trim().isEmpty()) {
            request.setAttribute("error", "Please enter a valid city name.");
            forwardToWeatherPage(request, response);
            return;
        }

        try {
            // API Call
            String jsonResponse = fetchWeatherData(city);

            // Parse JSON Response
            JSONObject json = new JSONObject(jsonResponse);
            
            if (json.has("cod") && json.getInt("cod") != 200) {
                request.setAttribute("error", "City not found. Please enter a valid city name.");
            } else {
                request.setAttribute("city", city);
                request.setAttribute("temp", json.getJSONObject("main").getDouble("temp"));
                request.setAttribute("humidity", json.getJSONObject("main").getInt("humidity"));
                request.setAttribute("condition", json.getJSONArray("weather").getJSONObject(0).getString("description"));
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error fetching weather data: " + e.getMessage());
        }

        // Forward to JSP Page
        forwardToWeatherPage(request, response);
    }

    private String fetchWeatherData(String city) throws IOException {
        String apiUrl = String.format(API_URL, city);
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        int responseCode = conn.getResponseCode();
        if (responseCode != 200) {
            throw new IOException("Invalid response from API: " + responseCode);
        }

        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String inputLine;
        StringBuilder responseContent = new StringBuilder();
        
        while ((inputLine = in.readLine()) != null) {
            responseContent.append(inputLine);
        }
        in.close();

        return responseContent.toString();
    }

    private void forwardToWeatherPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/weather.jsp");
        dispatcher.forward(request, response);
    }
}
