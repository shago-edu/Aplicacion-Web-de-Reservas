/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import modelo.Reserva;
import modelo.Usuario;

import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminReservasServlet")
public class AdminReservasServlet extends HttpServlet {

    private EntityManagerFactory emf;

    @Override
    public void init() {
        emf = Persistence.createEntityManagerFactory("hotelPU");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        if (usuario == null || !"admin".equals(usuario.getRol())) {
            response.sendRedirect("index.jsp");
            return;
        }

        EntityManager em = emf.createEntityManager();

        try {
            List<Reserva> reservas = em.createQuery("SELECT r FROM Reserva r", Reserva.class).getResultList();
            request.setAttribute("reservas", reservas);
            request.getRequestDispatcher("adminReservas.jsp").forward(request, response);
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
