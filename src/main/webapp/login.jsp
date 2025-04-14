<%-- 
    Document   : login
    Created on : 12-04-2025, 3:11:07 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="partials/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <title>Iniciar Sesión</title>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Iniciar Sesión</h2>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow p-4">
                <form action="LoginServlet" method="post">
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Contraseña</label>
                        <input type="password" name="contrasena" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Entrar</button>
                </form>

                <!-- Mostrar mensaje solo si tiene contenido -->
                <c:if test="${mensaje != null && not empty mensaje}">
                    <c:choose>
                        <c:when test="${mensaje.contains('exitoso') or mensaje.contains('correctamente')}">
                            <div class="alert alert-success mt-3">${mensaje}</div>
                        </c:when>
                        <c:otherwise>
                            <div class="alert alert-danger mt-3">${mensaje}</div>
                        </c:otherwise>
                    </c:choose>
                    <c:remove var="mensaje" />
                </c:if>

            </div>
        </div>
    </div>
</div>
</body>
</html>
