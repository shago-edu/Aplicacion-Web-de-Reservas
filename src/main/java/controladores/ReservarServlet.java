/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import modelo.*;

import javax.persistence.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/ReservarServlet")
public class ReservarServlet extends HttpServlet {

    private EntityManagerFactory emf;

    @Override
    public void init() {
        emf = Persistence.createEntityManagerFactory("hotelPU");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        if (usuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String fechaInicioStr = request.getParameter("fechaInicio");
        String fechaFinStr = request.getParameter("fechaFin");

        if (fechaInicioStr == null || fechaFinStr == null ||
            fechaInicioStr.isEmpty() || fechaFinStr.isEmpty()) {

            request.setAttribute("mensaje", "Debes seleccionar ambas fechas.");
            request.getRequestDispatcher("detalleHabitacion.jsp").forward(request, response);
            return;
        }

        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            Long habitacionId = Long.parseLong(request.getParameter("habitacionId"));
            LocalDate fechaInicio = LocalDate.parse(fechaInicioStr);
            LocalDate fechaFin = LocalDate.parse(fechaFinStr);

            Habitacion habitacion = em.find(Habitacion.class, habitacionId);

            Reserva reserva = new Reserva();
            reserva.setFechaInicio(fechaInicio);
            reserva.setFechaFin(fechaFin);
            reserva.setUsuario(usuario);
            reserva.setHabitacion(habitacion);

            tx.begin();
            em.persist(reserva);
            tx.commit();

            request.setAttribute("mensaje", "Reserva realizada exitosamente.");
            request.getRequestDispatcher("confirmacion.jsp").forward(request, response);

        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw new ServletException("Error al procesar la reserva", e);
        } finally {
            em.close();
        }
    }

    @Override
    public void destroy() {
        if (emf != null) {
            emf.close();
        }
    }
}
