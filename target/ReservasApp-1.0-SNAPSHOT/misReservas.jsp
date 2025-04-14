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
<div class="container mt-5">
    <h2 class="text-center mb-4">Mis Reservas</h2>

    <c:if test="${empty reservas}">
        <div class="alert alert-warning text-center">No tienes reservas registradas.</div>
    </c:if>

    <div class="row">
        <c:forEach var="res" items="${reservas}">
            <div class="col-md-6 mb-4">
                <div class="card shadow">
                    <div class="card-body">
                        <p><strong>Hotel:</strong> ${res.habitacion.hotel.nombre}</p>
                        <p><strong>Habitación:</strong> ${res.habitacion.numero}</p>
                        <p><strong>Fecha:</strong> ${res.fechaInicio} a ${res.fechaFin}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
