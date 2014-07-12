/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Clases.ProveedorClass;
import DAO.ProveedorDAO;
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
@WebServlet(name = "ProveedorModificarServlet", urlPatterns = {"/ProveedorModificarServlet"})
public class ProveedorModificarServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
ProveedorDAO ud = new ProveedorDAO();
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
            out.println("<title>Servlet ProveedorServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProveedorServlet at " + request.getContextPath() + "</h1>");
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
            
            String idProveedor = request.getParameter("idProveedor").toUpperCase();
            String identificacionProveedor = request.getParameter("identificacionProveedor").toUpperCase();
            String nombreProveedor = request.getParameter("nombreProveedor").toUpperCase();
            String direccionProveedor = request.getParameter("direccionProveedor").toUpperCase();
            String telefonoProveedor = request.getParameter("telefonoProveedor").toUpperCase();
            String autorizacionProveedor = request.getParameter("autorizacionProveedor").toUpperCase();
            String fechaCaducidadAutorizacionProveedor = request.getParameter("fechaCaducidadAutorizacionProveedor").toUpperCase();
            String tipoProveedor = request.getParameter("tipoProveedor").toUpperCase();
            
            ProveedorClass u=new ProveedorClass(idProveedor,identificacionProveedor, nombreProveedor, direccionProveedor, telefonoProveedor, autorizacionProveedor, fechaCaducidadAutorizacionProveedor, tipoProveedor);
        
            boolean sw=ud.modificar(u);
        if(sw){
            request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
        }else{
            PrintWriter out=response.getWriter();
            out.println("Fail registration.");
        } 
    } catch (SQLException ex) {
        Logger.getLogger(ProveedorModificarServlet.class.getName()).log(Level.SEVERE, null, ex);
    } catch (ClassNotFoundException ex) {
        Logger.getLogger(ProveedorModificarServlet.class.getName()).log(Level.SEVERE, null, ex);
    } catch (InstantiationException ex) {
        Logger.getLogger(ProveedorModificarServlet.class.getName()).log(Level.SEVERE, null, ex);
    } catch (IllegalAccessException ex) {
        Logger.getLogger(ProveedorModificarServlet.class.getName()).log(Level.SEVERE, null, ex);
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
