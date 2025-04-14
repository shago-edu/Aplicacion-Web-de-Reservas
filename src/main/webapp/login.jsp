<%-- 
    Document   : login
    Created on : 12-04-2025, 3:11:07 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="partials/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <title>Iniciar Sesión</title>
</head>
<body>
    <h1>Login</h1>
    <form action="LoginServlet" method="post">
        <label>Email:</label><br>
        <input type="email" name="email" required><br>
        <label>Contraseña:</label><br>
        <input type="password" name="contrasena" required><br><br>
        <button type="submit">Entrar</button>
    </form>

    <c:if test="${not empty mensaje}">
        <p style="color:red;">${mensaje}</p>
    </c:if>
</body>
</html>

