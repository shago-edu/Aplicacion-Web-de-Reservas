<%-- 
    Document   : header
    Created on : 12-04-2025, 3:17:23 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Usuario" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Bootstrap -->
<head>
    <title>Reservas Hotel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<nav class="navbar navbar-expand-lg navbar-light bg-light px-3">
    <a class="navbar-brand" href="index.jsp">ReservasApp</a>

    <div class="collapse navbar-collapse">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <c:if test="${not empty sessionScope.usuario}">
                <li class="nav-item">
                    <a class="nav-link" href="MisReservasServlet">Mis Reservas</a>
                </li>

                <!-- Solo para administradores -->
                <c:if test="${sessionScope.usuario.rol == 'admin'}">
                    <li class="nav-item">
                        <a class="nav-link text-danger fw-bold" href="AdminReservasServlet">Panel Admin</a>
                    </li>
                </c:if>
            </c:if>
        </ul>

        <ul class="navbar-nav">
            <c:choose>
                <c:when test="${not empty sessionScope.usuario}">
                    <li class="nav-item">
                        <span class="nav-link">Bienvenido, ${sessionScope.usuario.nombre}</span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="LogoutServlet">Cerrar Sesión</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Iniciar Sesión</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="registro.jsp">Registrarse</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>
