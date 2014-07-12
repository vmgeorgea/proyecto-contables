/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Clases.ClienteClass;
import DAO.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
@WebServlet(name = "BuscarClienteServlet", urlPatterns = {"/BuscarClienteServlet"})
public class BuscarClienteServlet extends HttpServlet {

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
            throws ServletException, IOException, InstantiationException, IllegalAccessException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            ClienteClass cc= new ClienteClass();
            ClienteDAO cd= new ClienteDAO(); 
            cc=cd.consultarcliente(request.getParameter("cedulaCliente"));
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuscarClienteServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<center>");
            out.println("<table>");        
               out.println("<td>Cedula Cliente:</td>"); 
               out.println("<td><input type='text' id='cedulaCliente' name='cedulaCliente' readonly='readonly' value='"+cc.getCedula()+"'></td>"); 
               out.println("<td>Nombre Cliente:</td>"); 
               out.println("<td><input type='text' id='nombreCliente' name='nombreCliente' readonly='readonly' value='"+cc.getNombre()+"'></td>"); 
               out.println("<td>Apellido Cliente:</td>");   
               out.println("<td><input type='text' id='apellidoCliente' name='apellidoCliente' readonly='readonly' value='"+cc.getApellido()+"'/></td>");                                    
               out.println("<tr>"); 
               out.println("<td>Direccion Cliente:</td>"); 
               out.println("<td><input type='text' id='direccionCliente' name='direccionCliente' readonly='readonly' value='"+cc.getDireccion()+"'/></td>");                                   
               out.println("<td>Telefono Cliente:</td>");
               out.println("<td><input type='text' id='telefonoCliente' name='telefonoCliente' readonly='readonly' value='"+cc.getTelefono()+"'/></td>"); 
            out.println("</table>");
            out.println("</center>");
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
        try {
            processRequest(request, response);
        } catch (InstantiationException ex) {
            Logger.getLogger(BuscarClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(BuscarClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BuscarClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        out.println("<td>Nombre Cliente:</td>"); 
        try {
            processRequest(request, response);
        } catch (InstantiationException ex) {
            Logger.getLogger(BuscarClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(BuscarClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BuscarClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
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
