/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Clases.ClienteClass;
import Clases.ProductoClass;
import Clases.FacturaVentaProductoClass;
import Clases.ProductoVentaClass;
import Clases.FacturaVentaClass;
import DAO.FacturaVentaProductoDAO;
import DAO.FacturaVentaDAO;
import DAO.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "FacturaVentaServlet", urlPatterns = {"/FacturaVentaServlet"})
public class FacturaVentaServlet extends HttpServlet {

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
            out.println("<title>Servlet FacturaVentaServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FacturaVentaServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(true);
        boolean sw1=false;
        LinkedList<ProductoVentaClass> lista =(LinkedList) session.getAttribute("productos");
        FacturaVentaProductoDAO fvpd = new  FacturaVentaProductoDAO();
        FacturaVentaDAO fvd = new  FacturaVentaDAO();
        ProductoDAO pd =new ProductoDAO();
        ClienteClass cc= new ClienteClass();
        cc= (ClienteClass)session.getAttribute("cliente");
        String a=session.getAttribute("idFactura").toString();
        String b=session.getAttribute("fechaFactura").toString();
        String c=request.getParameter("descuentoFactura");
        String d=cc.getIdCliente();
        String e=request.getParameter("ivaFactura").toString();
        FacturaVentaClass fvpc=new FacturaVentaClass(a, b,"986789456734", "PARQUE INDUSTRIAL", "001", c, d,e);
                for(int i=0; lista.size()<i;i++){
            try {
                String idFactura = request.getParameter("idFactura").toUpperCase();
                String idProducto = lista.get(i).getIdProducto().toUpperCase();
                String cantidadProducto = lista.get(i).getCantidadProducto().toUpperCase();
                FacturaVentaProductoClass u=new FacturaVentaProductoClass(idProducto, idFactura, cantidadProducto);
                boolean sw=fvpd.insertar(u);
                if(sw){
                    try {
                        sw1=sw;
                        lista.remove(i);
                        boolean sw2=pd.modificarcantidad((String)lista.get(i).getIdProducto().toString(), (String) lista.get(i).getCantidadProducto().toString());
                        if(sw2){
                            PrintWriter out=response.getWriter();
                            out.println("OK.");
                        }else{
                            PrintWriter out=response.getWriter();
                            out.println("Fail registration.");
                        }
                    } catch (SQLException ex) {
                        Logger.getLogger(FacturaVentaServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(FacturaVentaServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (InstantiationException ex) {
                        Logger.getLogger(FacturaVentaServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (IllegalAccessException ex) {
                        Logger.getLogger(FacturaVentaServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }else{
                    PrintWriter out=response.getWriter();
                    out.println("Fail registration.");
                }
            } catch (SQLException ex) {
                Logger.getLogger(FacturaVentaServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(FacturaVentaServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InstantiationException ex) {
                Logger.getLogger(FacturaVentaServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(FacturaVentaServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
                }
                if(sw1){
                ClienteClass cc1= new ClienteClass();
                session.setAttribute("idFactura", "");
                session.setAttribute("productos", lista);
                session.setAttribute("cliente", cc1);
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
