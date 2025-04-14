<%-- 
    Document   : resultadoHoteles
    Created on : 12-04-2025, 2:59:45 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="partials/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <title>Resultados</title>
</head>
<body>
    <h1>Hoteles disponibles</h1>

    <c:if test="${empty hoteles}">
        <p>No se encontraron hoteles en esa ciudad.</p>
    </c:if>

    <c:forEach var="hotel" items="${hoteles}">
        <div>
            <h3>${hotel.nombre}</h3>
            <p>${hotel.direccion} - ${hotel.ciudad}</p>
            <a href="ControladorServlet?accion=detalle&hotelId=${hotel.id}">Ver habitaciones</a>
        </div>
        <hr>
    </c:forEach>
</body>
</html>

