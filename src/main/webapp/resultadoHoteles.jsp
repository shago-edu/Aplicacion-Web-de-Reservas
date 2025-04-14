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
<div class="container mt-5">
    <h2 class="text-center mb-4">Hoteles disponibles</h2>

    <c:if test="${empty hoteles}">
        <div class="alert alert-warning text-center">No se encontraron hoteles en esa ciudad.</div>
    </c:if>

    <div class="row">
        <c:forEach var="hotel" items="${hoteles}">
            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">${hotel.nombre}</h5>
                        <p class="card-text">${hotel.direccion} - ${hotel.ciudad}</p>
                        <a href="ControladorServlet?accion=detalle&hotelId=${hotel.id}" class="btn btn-primary w-100">Ver habitaciones</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
