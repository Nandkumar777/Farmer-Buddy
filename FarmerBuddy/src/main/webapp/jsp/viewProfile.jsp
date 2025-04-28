<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>

<c:choose>
    <c:when test="${empty sessionScope.userName or empty sessionScope.userRole}">
        <c:redirect url="login.jsp"/>
    </c:when>
</c:choose>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Profile</title>
    <link rel="stylesheet" href="../css/view_profile.css">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="main-content">
    <h2>Your Profile Details</h2>
    <table border="1" cellpadding="10" style="margin-top: 20px;">
        <tr>
            <th>Full Name</th>
            <td>${sessionScope.userName != null ? sessionScope.userName : "N/A"}</td>
        </tr>
        <tr>
            <th>Email</th>
            <td>${sessionScope.userEmail != null ? sessionScope.userEmail : "N/A"}</td>
        </tr>
        <tr>
            <th>Role</th>
            <td>${sessionScope.userRole}</td>
        </tr>
    </table>
</div>

<jsp:include page="footer.jsp" />

</body>
</html> 