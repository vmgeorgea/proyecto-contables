/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Clases.AsientoClass;
import Clases.TransaccionClass;
import DAO.AsientoDAO;
import DAO.CuentaDAO;
import DAO.TransaccionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
@WebServlet(name = "AsientoModificarServlet1", urlPatterns = {"/AsientoModificarServlet1"})
public class AsientoModificarServlet1 extends HttpServlet {
private static final long serialVersionUID = 1L;
AsientoDAO ud = new AsientoDAO();
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
            String idAsiento = request.getParameter("idAsiento").toUpperCase();
            String numeroAsiento = request.getParameter("numeroAsiento").toUpperCase();
            String fechaAsiento = request.getParameter("fechaAsiento").toUpperCase();
            String conceptoAsiento = request.getParameter("conceptoAsiento").toUpperCase();
            String debeAsiento = request.getParameter("debeAsiento").toUpperCase();
            String haberAsiento = request.getParameter("haberAsiento").toUpperCase();
            LinkedList <TransaccionClass> listaTra=new LinkedList<TransaccionClass>();
            TransaccionDAO daoTra=new TransaccionDAO();
            
            try {
                listaTra=TransaccionDAO.consultarTransaccion(idAsiento);
            } catch (SQLException ex) {
                Logger.getLogger(AsientoModificarServlet1.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            HttpSession session = request.getSession(true);
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AsientoServlet</title>");    
            
            out.println("<link rel='stylesheet' type='text/css' media='all' href= 'CSS/style.css'>");
            out.println("<link rel='stylesheet' type='text/css' media='all' href='fancybox/jquery.fancybox.css'>");
            
            out.println("<link rel='stylesheet' type='text/css' href='CSS/tcal.css' />");

            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Asiento " + numeroAsiento + "</h1>");
            
            out.println("<form id='guardarAsientoform' name='guardarAsientoform' action='Asiento.jsp'  method='post'>");
        
            out.println("<table id='miTabla'>");
            out.println("<tr align=\"center\">");
            out.println("<td class=\"estilo1\" colspan=\"4\" >Asiento</td>");
            out.println("</tr>");    
            out.println("<tr align=\"center\">");
            out.println("<td class=\"estilo1\" colspan=\"4\">-"+numeroAsiento+"- </td>");
            out.println("</tr>");
            out.println("<tr align=\"center\">");
            out.println("<td class=\"estilo1\">Fecha</td>");
            out.println("<td class=\"estilo1\">Detalle</td>");
            out.println("<td class=\"estilo1\">Debe</td>");
            out.println("<td class=\"estilo1\">Haber</td>");
            out.println("</tr>");
            out.println("<tr align=\"left\">");
            out.println("<td colspan=\"4\" class=\"estilo1\">"+fechaAsiento+"</td>");
            out.println("</tr>");
            
            for(int j=0;j<listaTra.size();j++){
                       if(listaTra.get(j).getHaberTransaccion().equals("0.0")){
                            out.println("<tr align=\"left\">");
                            CuentaDAO cue=new CuentaDAO();
                            String nom=cue.consultarNombre(listaTra.get(j).getCuenta_idCuenta());
                            out.println("<td></td><td>"+nom+"</td>");
                            out.println("<td>"+listaTra.get(j).getDebeTransaccion()+"</td> <td></td> ");
                            //out.println("<td><a class='modalbox' href='#modificar'><img SRC='Imagen/Modificar.png'></a> <a class='modalbox' href='#modificar'><img SRC='Imagen/Eliminar.png'></a></td>");
                            //out.println("<td></td>");
                            
                            out.println("</tr>");
                       }
                   }
                   for(int j=0;j<listaTra.size();j++){
                       if(listaTra.get(j).getDebeTransaccion().equals("0.0")){
                            out.println("<tr align=\"left\">");
                            CuentaDAO cue=new CuentaDAO();
                            String nom=cue.consultarNombre(listaTra.get(j).getCuenta_idCuenta());
                            out.println("<td></td><td>--"+nom+"</td>");
                            out.println("<td></td><td>"+listaTra.get(j).getHaberTransaccion()+"</td>");
                            //out.println("<td><a class='modalbox' href='#modificar'><img SRC='Imagen/Modificar.png'></a> <a class='modalbox' href='#modificar'><img SRC='Imagen/Eliminar.png'></a></td>");
                            //out.println("<td><a class='modalbox' href='#modificar'><img SRC='Imagen/Eliminar.png'></a></td>");
                          
                            out.println("</tr>");
                       }
                   } 
                   out.println("<tr align=\"left\">");
        
                
                   out.println("<td class=\"estilo1\" colspan=\"2\">TOTAL</td>");

                    out.println("<td class=\"estilo1\">"+debeAsiento+"</td>");

                    out.println("<td class=\"estilo1\">"+haberAsiento+"</td>");

                    out.println("<td></td>");

                    out.println("</tr>");
            
                    out.println("<tr align=\"center\">");

                    out.println("<td class=\"estilo1\" >Ref:</td>");
                
                    out.println("<td class=\"estilo1\" colspan=\"2\">"+conceptoAsiento+"</td>");

                    out.println("<td></td>");

                    out.println("</tr>");
            
                out.println("</table>");

                out.println("<input type='submit' value='Aceptar' id='send' >");

                out.println("</form>");
            
            
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
        Logger.getLogger(AsientoModificarServlet1.class.getName()).log(Level.SEVERE, null, ex);
    } catch (IllegalAccessException ex) {
        Logger.getLogger(AsientoModificarServlet1.class.getName()).log(Level.SEVERE, null, ex);
    } catch (SQLException ex) {
        Logger.getLogger(AsientoModificarServlet1.class.getName()).log(Level.SEVERE, null, ex);
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
    try {
        processRequest(request, response);
    } catch (InstantiationException ex) {
        Logger.getLogger(AsientoModificarServlet1.class.getName()).log(Level.SEVERE, null, ex);
    } catch (IllegalAccessException ex) {
        Logger.getLogger(AsientoModificarServlet1.class.getName()).log(Level.SEVERE, null, ex);
    } catch (SQLException ex) {
        Logger.getLogger(AsientoModificarServlet1.class.getName()).log(Level.SEVERE, null, ex);
    }
        String idAsiento = request.getParameter("idAsiento").toUpperCase();
        LinkedList <TransaccionClass> listaTra=new LinkedList<TransaccionClass>();
        TransaccionDAO daoTra=new TransaccionDAO();
    try {
        listaTra=TransaccionDAO.consultarTransaccion(idAsiento);
        out.println("<form id='guardarAsientoform' name='guardarAsientoform' action='Asiento.jsp'  method='post'>");
        
        out.println("<table>");
        out.println("<tr>");
        out.println("</d>HOLA</td>");
        out.println("</tr>");
        out.println("</table>");
        
        out.println("<input type='submit' value='Aceptar' id='send' onclick='javaScript:Eliminar();'>");
        
        out.println("</form>");
        
    } catch (InstantiationException ex) {
        Logger.getLogger(AsientoModificarServlet1.class.getName()).log(Level.SEVERE, null, ex);
    } catch (IllegalAccessException ex) {
        Logger.getLogger(AsientoModificarServlet1.class.getName()).log(Level.SEVERE, null, ex);
    } catch (SQLException ex) {
        Logger.getLogger(AsientoModificarServlet1.class.getName()).log(Level.SEVERE, null, ex);
    }
        
        
        
        /*try {
            
            String idAsiento = request.getParameter("idAsiento").toUpperCase();
            String numeroDiario = request.getParameter("numeroDiario").toUpperCase();
            String periodoAsiento = request.getParameter("periodoAsiento").toUpperCase();
            String fechaAsiento = request.getParameter("fechaAsiento").toUpperCase();
            String numeroAsiento = request.getParameter("numeroAsiento").toUpperCase();
            String conceptoAsiento = request.getParameter("conceptoAsiento").toUpperCase();
            String debeAsiento = request.getParameter("debeAsiento").toUpperCase();
            String haberAsiento = request.getParameter("haberAsiento").toUpperCase();
            
            AsientoClass u=new AsientoClass(idAsiento, numeroDiario, periodoAsiento, fechaAsiento, numeroAsiento, conceptoAsiento, debeAsiento, haberAsiento);
        
            boolean sw=ud.modificar(u);
        if(sw){*/
            request.getRequestDispatcher("Asiento.jsp").forward(request, response);
        /*}else{
            PrintWriter out=response.getWriter();
            out.println("Fail registration.");
        } 
    } catch (SQLException ex) {
        Logger.getLogger(AsientoModificarServlet1.class.getName()).log(Level.SEVERE, null, ex);
    } catch (ClassNotFoundException ex) {
        Logger.getLogger(AsientoModificarServlet1.class.getName()).log(Level.SEVERE, null, ex);
    } catch (InstantiationException ex) {
        Logger.getLogger(AsientoModificarServlet1.class.getName()).log(Level.SEVERE, null, ex);
    } catch (IllegalAccessException ex) {
        Logger.getLogger(AsientoModificarServlet1.class.getName()).log(Level.SEVERE, null, ex);
    }*/
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
