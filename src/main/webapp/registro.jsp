<%-- 
    Document   : registro
    Created on : 12-04-2025, 3:09:39 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="partials/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <title>Registro</title>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Registro de Usuario</h2>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow p-4">
                <form action="RegistroServlet" method="post">
                    <div class="mb-3">
                        <label class="form-label">Nombre</label>
                        <input type="text" name="nombre" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Contraseña</label>
                        <input type="password" name="contrasena" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-success w-100">Registrarse</button>
                </form>

                <!-- Mostrar solo si hay mensaje con contenido -->
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
