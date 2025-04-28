<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Weather Updates</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3f3f3;
            margin-top: 100px;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            text-align: center;
        }

        .weather-card {
            background-color: #ffffff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .weather-card h3 {
            margin-bottom: 15px;
            font-size: 24px;
            color: #333;
        }

        .weather-card p {
            font-size: 18px;
            margin: 8px 0;
            color: #444;
        }

        .error {
            color: red;
            font-size: 18px;
            margin-top: 20px;
        }

        input[type="text"] {
            padding: 8px;
            font-size: 16px;
            border-radius: 8px;
            border: 1px solid #ccc;
            width: 250px;
            margin-bottom: 10px;
        }

        button {
            padding: 8px 16px;
            font-size: 16px;
            border: none;
            background-color: #3c8dbc;
            color: white;
            border-radius: 8px;
            cursor: pointer;
        }

        button:hover {
            background-color: #367fa9;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <h2>Current Weather Update</h2>

        <!-- Search Form -->
        <form method="get" action="${pageContext.request.contextPath}/weather">
            <input type="text" name="city" placeholder="Enter City Name" required />
            <button type="submit">Get Weather</button>
        </form>

        <!-- Error Message -->
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>

        <!-- Weather Details -->
        <c:if test="${not empty city}">
            <div class="weather-card">
                <h3>${city}</h3>

                <p><strong>Temperature:</strong>
                    <c:choose>
                        <c:when test="${not empty temp}">
                            ${temp}°C
                        </c:when>
                        <c:otherwise>
                            N/A
                        </c:otherwise>
                    </c:choose>
                </p>

                <p><strong>Humidity:</strong>
                    <c:choose>
                        <c:when test="${not empty humidity}">
                            ${humidity}%
                        </c:when>
                        <c:otherwise>
                            N/A
                        </c:otherwise>
                    </c:choose>
                </p>

                <p><strong>Condition:</strong>
                    <c:choose>
                        <c:when test="${not empty condition}">
                            ${condition}
                        </c:when>
                        <c:otherwise>
                            N/A
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>
        </c:if>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
