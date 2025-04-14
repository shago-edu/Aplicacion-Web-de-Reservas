<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="partials/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <title>Buscador de Hoteles</title>
    <!-- Bootstrap ya está incluido desde header.jsp -->
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Buscar Hoteles</h1>

    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow p-4">
                <form action="ControladorServlet" method="get">
                    <input type="hidden" name="accion" value="buscar">
                    <div class="mb-3">
                        <label for="ciudad" class="form-label">Ciudad:</label>
                        <input type="text" class="form-control" name="ciudad" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Buscar</button>
                </form>

                <c:if test="${not empty mensaje}">
                    <div class="alert alert-danger mt-3">${mensaje}</div>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>
