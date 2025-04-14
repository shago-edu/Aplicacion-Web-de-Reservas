/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import modelo.Hotel;

import javax.persistence.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/BuscarHotelesServlet")
public class BuscarHotelesServlet extends HttpServlet {

    private EntityManagerFactory emf;

    @Override
    public void init() {
        emf = Persistence.createEntityManagerFactory("hotelPU");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String ciudad = request.getParameter("ciudad");

        if (ciudad == null || ciudad.trim().isEmpty()) {
            request.setAttribute("mensaje", "Debes ingresar una ciudad para buscar.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        try {
            EntityManager em = emf.createEntityManager();
            List<Hotel> hoteles = em.createQuery("SELECT h FROM Hotel h WHERE h.ciudad LIKE :ciudad", Hotel.class)
                    .setParameter("ciudad", "%" + ciudad + "%")
                    .getResultList();

            request.setAttribute("hoteles", hoteles);
            request.getRequestDispatcher("resultadoHoteles.jsp").forward(request, response);

            em.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error al buscar hoteles.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
        if (emf != null) {
            emf.close();
        }
    }
}