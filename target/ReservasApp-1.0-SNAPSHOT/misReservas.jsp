<%-- 
    Document   : misReservas
    Created on : 12-04-2025, 3:13:00 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="partials/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <title>Mis Reservas</title>
</head>
<body>
    <h1>Mis Reservas</h1>

    <c:if test="${empty reservas}">
        <p>No tienes reservas registradas.</p>
    </c:if>

    <c:forEach var="res" items="${reservas}">
        <p>
            <strong>Hotel:</strong> ${res.habitacion.hotel.nombre}<br>
            <strong>Habitación:</strong> ${res.habitacion.numero} <br>
            <strong>Desde:</strong> ${res.fechaInicio} hasta ${res.fechaFin}
        </p>
        <hr>
    </c:forEach>
</body>
</html>
