# 🏨 ReservasApp

Aplicación en línea para administrar reservas hoteleras.  Facilita a los usuarios el registro, la búsqueda de hoteles por zona, la reserva de habitaciones por fecha y el seguimiento de sus reservas.  
Adicionalmente, dispone de un panel de gestión para administrar todas las reservas del sistema.

---

## ⚙️ Tecnologías utilizadas

- **Java EE 8** (JSP, Servlets)
- **JPA (Hibernate)** como ORM
- **MySQL** como base de datos relacional
- **JSTL** para lógica en las vistas
- **Bootstrap 5** para estilos visuales
- **NetBeans** como IDE principal
- **Apache Tomcat 9** como servidor de despliegue

---

## 🚀 Ejecución local

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/tu_usuario/ReservasApp.git

2. Abrir el proyecto en NetBeans.

3. Verificar conexión a base de datos (reservas_db) en persistence.xml.

4. Asegurarse de tener configurado Tomcat en NetBeans.

5. Ejecutar el proyecto desde el IDE o compilar con Maven:

mvn clean package

6. Acceder desde el navegador a:

http://localhost:8080/ReservasApp/

👤 Roles disponibles

-usuario: puede registrarse, iniciar sesión, buscar hoteles y hacer reservas.

-admin: accede al panel de gestión de reservas.

🧪 Funcionalidades clave

-Registro e inicio de sesión de usuarios

-Búsqueda de hoteles por ciudad

-Listado de habitaciones disponibles por hotel

-Reservas con selección de fechas

-Visualización de reservas personales

-Portal administrador con:

    -Listado completo de reservas

    -Eliminación de reservas

🔐 Usuario de prueba (admin)

Email: admin@hotel.com
Contraseña: admin123

👨‍💻 Autor
Santiago Parra
Proyecto desarrollado como parte de la asignatura de Desarrollo Web II
