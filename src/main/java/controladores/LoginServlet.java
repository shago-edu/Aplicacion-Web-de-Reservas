/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import modelo.Usuario;
import utilidades.HashUtil;

import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private EntityManagerFactory emf;

    @Override
    public void init() {
        emf = Persistence.createEntityManagerFactory("hotelPU");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");

        if (email == null || email.trim().isEmpty() ||
            contrasena == null || contrasena.trim().isEmpty()) {
            request.setAttribute("mensaje", "Debes ingresar email y contraseña.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        EntityManager em = emf.createEntityManager();

        try {
            TypedQuery<Usuario> query = em.createQuery(
                "SELECT u FROM Usuario u WHERE u.email = :email AND u.contrasena = :contrasena", Usuario.class);
            query.setParameter("email", email);
            query.setParameter("contrasena", HashUtil.sha256(contrasena));

            Usuario usuario = query.getSingleResult();

            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);

            response.sendRedirect("index.jsp");

        } catch (NoResultException e) {
            request.setAttribute("mensaje", "Credenciales inválidas.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
