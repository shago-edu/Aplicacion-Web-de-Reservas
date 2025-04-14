/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import modelo.Reserva;

import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/EliminarReservaServlet")
public class EliminarReservaServlet extends HttpServlet {

    private EntityManagerFactory emf;

    @Override
    public void init() {
        emf = Persistence.createEntityManagerFactory("hotelPU");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect("AdminReservasServlet");
            return;
        }

        Long id = Long.parseLong(idStr);

        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();
            Reserva reserva = em.find(Reserva.class, id);
            if (reserva != null) {
                em.remove(reserva);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }

        response.sendRedirect("AdminReservasServlet");
    }

    @Override
    public void destroy() {
        if (emf != null) emf.close();
    }
}

