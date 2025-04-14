<%-- 
    Document   : detalleHabitacion
    Created on : 12-04-2025, 3:01:10 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="partials/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <title>Habitaciones Disponibles</title>
</head>
<body>
    <h1>Habitaciones</h1>

    <c:if test="${not empty mensaje}">
        <p style="color:red;">${mensaje}</p>
    </c:if>

    <c:if test="${empty habitaciones}">
        <p>No hay habitaciones disponibles.</p>
    </c:if>

    <c:forEach var="hab" items="${habitaciones}">
        <div>
            <p><strong>N°:</strong> ${hab.numero}</p>
            <p><strong>Tipo:</strong> ${hab.tipo}</p>
            <p><strong>Precio:</strong> $${hab.precio}</p>
            <form action="ReservarServlet" method="post">
                <input type="hidden" name="habitacionId" value="${hab.id}">
                <label>Desde:</label>
                <input type="date" name="fechaInicio" required>
                <label>Hasta:</label>
                <input type="date" name="fechaFin" required>
                <button type="submit">Reservar</button>
            </form>
        </div>
        <hr>
    </c:forEach>
</body>
</html>
