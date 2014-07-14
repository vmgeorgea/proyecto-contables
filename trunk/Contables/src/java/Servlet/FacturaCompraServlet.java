/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Clases.ProveedorClass;
import Clases.ProductoClass;
import Clases.FacturaCompraProductoClass;
import Clases.ProductoCompraClass;
import Clases.FacturaCompraClass;
import DAO.FacturaCompraProductoDAO;
import DAO.FacturaCompraDAO;
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
public class FacturaCompraServlet extends HttpServlet {

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
        try {
            HttpSession session = request.getSession(true);
            boolean sw1=false;
            LinkedList<ProductoCompraClass> lista =(LinkedList) session.getAttribute("productos");
            FacturaCompraProductoDAO fvpd = new  FacturaCompraProductoDAO();
            FacturaCompraDAO fvd = new  FacturaCompraDAO();
            ProductoDAO pd =new ProductoDAO();
            ProveedorClass cc= new ProveedorClass();
            cc= (ProveedorClass)session.getAttribute("proveedor");
            String a=session.getAttribute("idFactura").toString();
            String b=session.getAttribute("fechaFactura").toString();
            String c=request.getParameter("descuentoFactura").toString();
            String d=cc.getIdProveedor();
            String e=request.getParameter("ivaFactura");
            FacturaCompraClass fvc=new FacturaCompraClass(a, b,"986789456734", "PARQUE INDUSTRIAL", "001", c, d,e);
            boolean sw0=fvd.insertar(fvc);
            if(sw0){
                for(int i=0; i<lista.size();i++){
                    try {
                        String idFactura = session.getAttribute("idFactura").toString();
                        String idProducto = lista.get(i).getIdProducto().toUpperCase();
                        String cantidadProducto = lista.get(i).getCantidadProducto().toUpperCase();
                        FacturaCompraProductoClass u=new FacturaCompraProductoClass(idFactura, idProducto, cantidadProducto);
                        boolean sw=fvpd.insertar(u);
                        if(sw){
                            try {
                                sw1=sw;                                
                                boolean sw2=pd.modificarcantidadcompra((String)lista.get(i).getIdProducto().toString(), (String) lista.get(i).getCantidadProducto().toString());
                                lista.remove(i);
                                if(sw2){
                                                                        
                                }else{
                                    PrintWriter out=response.getWriter();
                                    out.println("Fail registration.");
                                }
                            } catch (SQLException ex) {
                                Logger.getLogger(FacturaCompraServlet.class.getName()).log(Level.SEVERE, null, ex);
                            } catch (ClassNotFoundException ex) {
                                Logger.getLogger(FacturaCompraServlet.class.getName()).log(Level.SEVERE, null, ex);
                            } catch (InstantiationException ex) {
                                Logger.getLogger(FacturaCompraServlet.class.getName()).log(Level.SEVERE, null, ex);
                            } catch (IllegalAccessException ex) {
                                Logger.getLogger(FacturaCompraServlet.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }else{
                            PrintWriter out=response.getWriter();
                            out.println("Fail registration.");
                        }
                    } catch (SQLException ex) {
                        Logger.getLogger(FacturaCompraServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(FacturaCompraServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (InstantiationException ex) {
                        Logger.getLogger(FacturaCompraServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (IllegalAccessException ex) {
                        Logger.getLogger(FacturaCompraServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }else{
                PrintWriter out=response.getWriter();
                out.println("Fail registration.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(FacturaCompraServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FacturaCompraServlet.class.getName()).log(Level.SEVERE, null, ex);                        
        } catch (InstantiationException ex) {
            Logger.getLogger(FacturaCompraServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(FacturaCompraServlet.class.getName()).log(Level.SEVERE, null, ex);
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
