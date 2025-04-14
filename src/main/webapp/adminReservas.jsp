<%-- 
    Document   : adminReservas
    Created on : 13-04-2025, 10:42:03 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="partials/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <title>Panel Administrador</title>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Gestión de Reservas</h2>

    <c:if test="${empty reservas}">
        <div class="alert alert-warning text-center">No hay reservas registradas.</div>
    </c:if>

    <c:if test="${not empty reservas}">
        <div class="table-responsive">
            <table class="table table-bordered table-hover align-middle">
                <thead class="table-dark text-center">
                    <tr>
                        <th>ID</th>
                        <th>Usuario</th>
                        <th>Email</th>
                        <th>Hotel</th>
                        <th>Habitación</th>
                        <th>Tipo</th>
                        <th>Precio</th>
                        <th>Desde</th>
                        <th>Hasta</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="reserva" items="${reservas}">
                        <tr>
                            <td>${reserva.id}</td>
                            <td>${reserva.usuario.nombre}</td>
                            <td>${reserva.usuario.email}</td>
                            <td>${reserva.habitacion.hotel.nombre}</td>
                            <td>${reserva.habitacion.numero}</td>
                            <td>${reserva.habitacion.tipo}</td>
                            <td>$${reserva.habitacion.precio}</td>
                            <td>${reserva.fechaInicio}</td>
                            <td>${reserva.fechaFin}</td>
                            <td class="text-center">
                                <form action="EliminarReservaServlet" method="post"
                                      onsubmit="return confirm('¿Estás seguro de eliminar esta reserva?');">
                                    <input type="hidden" name="id" value="${reserva.id}">
                                    <button type="submit" class="btn btn-sm btn-danger">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
</div>
</body>
</html>


