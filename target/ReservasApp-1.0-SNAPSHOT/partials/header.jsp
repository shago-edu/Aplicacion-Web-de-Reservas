<%-- 
    Document   : header
    Created on : 12-04-2025, 3:17:23 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Usuario" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div style="background:#eee; padding:10px;">
    <a href="index.jsp">Inicio</a>
    <c:choose>
        <c:when test="${not empty sessionScope.usuario}">
            |
            <a href="MisReservasServlet">Mis Reservas</a> |
            <span>Bienvenido, ${sessionScope.usuario.nombre}</span> |
            <a href="LogoutServlet">Cerrar Sesión</a>
        </c:when>
        <c:otherwise>
            |
            <a href="login.jsp">Iniciar Sesión</a> |
            <a href="registro.jsp">Registrarse</a>
        </c:otherwise>
    </c:choose>
</div>
<hr>
