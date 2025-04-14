/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import modelo.Habitacion;

import javax.persistence.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/DetalleHabitacionServlet")
public class DetalleHabitacionServlet extends HttpServlet {

    private EntityManagerFactory emf;

    @Override
    public void init() {
        emf = Persistence.createEntityManagerFactory("hotelPU");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("hotelId");

        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect("index.jsp");
            return;
        }

        Long hotelId;
        try {
            hotelId = Long.parseLong(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("index.jsp");
            return;
        }

        EntityManager em = emf.createEntityManager();

        try {
            List<Habitacion> habitaciones = em.createQuery(
                    "SELECT h FROM Habitacion h WHERE h.hotel.id = :hotelId", Habitacion.class)
                    .setParameter("hotelId", hotelId)
                    .getResultList();

            request.setAttribute("habitaciones", habitaciones);
            request.getRequestDispatcher("detalleHabitacion.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error al cargar habitaciones.");
            request.getRequestDispatcher("index.jsp").forward(request, response);

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
