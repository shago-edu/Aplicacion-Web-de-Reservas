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
<div class="container mt-5">
    <h2 class="mb-4 text-center">Habitaciones disponibles</h2>

    <c:if test="${not empty mensaje}">
        <div class="alert alert-danger text-center">${mensaje}</div>
    </c:if>

    <c:if test="${empty habitaciones}">
        <div class="alert alert-warning text-center">No hay habitaciones disponibles.</div>
    </c:if>

    <div class="row">
        <c:forEach var="hab" items="${habitaciones}">
            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <p><strong>N°:</strong> ${hab.numero}</p>
                        <p><strong>Tipo:</strong> ${hab.tipo}</p>
                        <p><strong>Precio:</strong> $${hab.precio}</p>
                        <form action="ReservarServlet" method="post">
                            <input type="hidden" name="habitacionId" value="${hab.id}">
                            <div class="mb-2">
                                <label>Desde:</label>
                                <input type="date" class="form-control" name="fechaInicio" required>
                            </div>
                            <div class="mb-2">
                                <label>Hasta:</label>
                                <input type="date" class="form-control" name="fechaFin" required>
                            </div>
                            <button type="submit" class="btn btn-success w-100">Reservar</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
