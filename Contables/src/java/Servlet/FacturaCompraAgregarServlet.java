/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Clases.ProductoCompraClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
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
@WebServlet(name = "FacturaCompraAgregarServlet", urlPatterns = {"/FacturaCompraAgregarServlet"})
public class FacturaCompraAgregarServlet extends HttpServlet {

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
            out.println("<title>Servlet FacturaAgregarServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FacturaAgregarServlet at " + request.getContextPath() + "</h1>");
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
        if(session.getAttribute("proveedor")==null){
         PrintWriter out=response.getWriter();
         out.println("Ingrese Proveedor");   
        }else{
            if(session.getAttribute("productoscompra")!=null){
                 int a1=request.getParameter("nombreProducto").toString().indexOf("-");
                 int a2=request.getParameter("nombreProducto").toString().indexOf("/");
                 int a3=request.getParameter("nombreProducto").toString().length();
                 String id=request.getParameter("nombreProducto").toString().substring(0, a1);
                 String nombre=request.getParameter("nombreProducto").toString().substring(a1+1, a2);
                 String precio=request.getParameter("nombreProducto").toString().substring(a2+1, a3);
                LinkedList<ProductoCompraClass> lista1 =(LinkedList) session.getAttribute("productoscompra");
                String idProducto = id.toUpperCase();
                String nombreProducto = nombre.toUpperCase();
                String precioProducto = precio.toUpperCase();
                String cantidadProducto = request.getParameter("cantidadProducto").toUpperCase();
                ProductoCompraClass u=new  ProductoCompraClass(idProducto, nombreProducto, precioProducto, cantidadProducto);
                lista1.add(u);      
                session.setAttribute("productoscompra", lista1);
            }else{
                LinkedList<ProductoCompraClass> lista2 =new LinkedList<ProductoCompraClass> ();
                 int a1=request.getParameter("nombreProducto").toString().indexOf("-");
                 int a2=request.getParameter("nombreProducto").toString().indexOf("/");
                 int a3=request.getParameter("nombreProducto").toString().length();
                 String id=request.getParameter("nombreProducto").toString().substring(0, a1);
                 String nombre=request.getParameter("nombreProducto").toString().substring(a1+1, a2);
                 String precio=request.getParameter("nombreProducto").toString().substring(a2+1, a3);                
                String idProducto = id.toUpperCase();
                String nombreProducto = nombre.toUpperCase();
                String precioProducto = precio.toUpperCase();
                String cantidadProducto = request.getParameter("cantidadProducto").toUpperCase();
                ProductoCompraClass u=new  ProductoCompraClass(idProducto, nombreProducto, precioProducto, cantidadProducto);
                lista2.add(u);      
                session.setAttribute("productoscompra", lista2);                
            }
         }
        request.getRequestDispatcher("FacturaCompraProductos.jsp").forward(request, response); 
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
