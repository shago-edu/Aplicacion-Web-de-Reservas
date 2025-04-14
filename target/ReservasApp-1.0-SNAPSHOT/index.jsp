<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="partials/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <title>Buscador de Hoteles</title>
</head>
<body>
    <h1>Buscar Hoteles</h1>

    <form action="ControladorServlet" method="get">
        <input type="hidden" name="accion" value="buscar">
        <label for="ciudad">Ciudad:</label>
        <input type="text" name="ciudad" required>
        <button type="submit">Buscar</button>
    </form>

    <c:if test="${not empty mensaje}">
        <p style="color:red;">${mensaje}</p>
    </c:if>
</body>
</html>
