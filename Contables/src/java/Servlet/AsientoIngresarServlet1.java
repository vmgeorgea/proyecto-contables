/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Clases.AsientoClass;
import DAO.AsientoAuxDAO;
import DAO.AsientoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "AsientoIngresarServlet1", urlPatterns = {"/AsientoIngresarServlet1"})
public class AsientoIngresarServlet1 extends HttpServlet {
private static final long serialVersionUID = 1L;
AsientoAuxDAO ud = new AsientoAuxDAO();
AsientoDAO ud1 = new AsientoDAO();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AsientoServlet1</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AsientoServlet1 at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try {
        String numeroDiario = request.getParameter("numeroDiario").toUpperCase();
        String periodoAsiento = request.getParameter("periodoAsiento").toUpperCase();
        String fechaAsiento = request.getParameter("fechaAsiento").toUpperCase();
        String numeroAsiento = request.getParameter("numeroAsiento").toUpperCase();
        String conceptoAsiento = request.getParameter("conceptoAsiento").toUpperCase();
        String debeAsiento = request.getParameter("debeAsiento").toUpperCase();
        String haberAsiento = request.getParameter("haberAsiento").toUpperCase();
        AsientoClass u=new AsientoClass(numeroDiario, periodoAsiento, fechaAsiento, numeroAsiento, conceptoAsiento, debeAsiento, haberAsiento);
        boolean sw1=ud1.insertar(u);
        boolean sw=ud.insertar(u);
        if(sw){
            request.getRequestDispatcher("IngresarAsiento.jsp").forward(request, response);
        }else{
            PrintWriter out=response.getWriter();
            out.println("Fail registration.");
        } 
    } catch (SQLException ex) {
        Logger.getLogger(AsientoIngresarServlet1.class.getName()).log(Level.SEVERE, null, ex);
    } catch (ClassNotFoundException ex) {
        Logger.getLogger(AsientoIngresarServlet1.class.getName()).log(Level.SEVERE, null, ex);
    } catch (InstantiationException ex) {
        Logger.getLogger(AsientoIngresarServlet1.class.getName()).log(Level.SEVERE, null, ex);
    } catch (IllegalAccessException ex) {
        Logger.getLogger(AsientoIngresarServlet1.class.getName()).log(Level.SEVERE, null, ex);
    }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
