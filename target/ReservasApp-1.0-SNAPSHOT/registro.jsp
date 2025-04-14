<%-- 
    Document   : registro
    Created on : 12-04-2025, 3:09:39 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="partials/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <title>Registro de Usuario</title>
</head>
<body>
    <h1>Registrarse</h1>
    <form action="RegistroServlet" method="post">
        <label>Nombre:</label><br>
        <input type="text" name="nombre" required><br>
        <label>Email:</label><br>
        <input type="email" name="email" required><br>
        <label>Contraseña:</label><br>
        <input type="password" name="contrasena" required><br><br>
        <button type="submit">Registrarse</button>
    </form>

    <c:if test="${not empty mensaje}">
        <p style="color:red;">${mensaje}</p>
    </c:if>
</body>
</html>
