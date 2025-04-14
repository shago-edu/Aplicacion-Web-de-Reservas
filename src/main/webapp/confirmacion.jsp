<%-- 
    Document   : confirmacion
    Created on : 12-04-2025, 3:01:32 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="partials/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <title>Reserva Confirmada</title>
</head>
<body>
<div class="container mt-5">
    <div class="alert alert-success text-center shadow-sm">
        <h4 class="alert-heading">¡Reserva realizada con éxito!</h4>
        <p>${mensaje}</p>
        <hr>
        <a href="index.jsp" class="btn btn-primary">Volver al inicio</a>
    </div>
</div>
</body>
</html>
