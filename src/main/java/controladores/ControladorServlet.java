/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ControladorServlet")
public class ControladorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null || accion.trim().isEmpty()) {
            response.sendRedirect("index.jsp");
            return;
        }

        System.out.println("Acción solicitada: " + accion);

        switch (accion) {
            case "buscar":
                request.getRequestDispatcher("BuscarHotelesServlet").forward(request, response);
                break;
            case "detalle":
                request.getRequestDispatcher("DetalleHabitacionServlet").forward(request, response);
                break;
            case "reservar":
                request.getRequestDispatcher("ReservarServlet").forward(request, response);
                break;
            default:
                response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doGet(request, response);
    }
}
