/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Clases.AsientoClass;
import Clases.ProveedorClass;
import Clases.ProductoClass;
import Clases.FacturaCompraProductoClass;
import Clases.ProductoCompraClass;
import Clases.FacturaCompraClass;
import Clases.TransaccionClass;
import DAO.AsientoDAO;
import DAO.FacturaCompraProductoDAO;
import DAO.FacturaCompraDAO;
import DAO.ProductoDAO;
import DAO.TransaccionDAO;
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
@WebServlet(name = "FacturaCompraServlet", urlPatterns = {"/FacturaCompraServlet"})
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
            out.println("<title>Servlet FacturaCompraServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FacturaCompraServlet at " + request.getContextPath() + "</h1>");
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
            LinkedList<ProductoCompraClass> lista =(LinkedList) session.getAttribute("productoscompra");
            FacturaCompraProductoDAO fvpd = new  FacturaCompraProductoDAO();
            FacturaCompraDAO fvd = new  FacturaCompraDAO();
            ProductoDAO pd =new ProductoDAO();
            TransaccionDAO td= new TransaccionDAO();
            ProveedorClass cc= new ProveedorClass();
            AsientoDAO ad= new AsientoDAO();
            AsientoClass ac= new AsientoClass();                         
            cc= (ProveedorClass)session.getAttribute("proveedor");
            String a=session.getAttribute("idFactura").toString();
            String b=session.getAttribute("fechaFactura").toString();
            ac =ad.consultarfecha(b);
            if(ac.getIdAsiento()!=null){      
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
                        String cuenta1=null;
                        String cuenta2=null;
                        String concepto=null;
                              if(request.getParameter("formaspagoFactura").toString().equals("1")){ 
                                  //caja
                              cuenta1="4";
                              cuenta2="21";
                              concepto="Compra de productos, pago efectivo";
                              }
                              if(request.getParameter("formaspagoFactura").equals("2")){  
                                  //banco
                              cuenta1="7";
                              cuenta2="21";
                              concepto="Compra de productos, pago por cheque";
                              }
                              if(request.getParameter("formaspagoFactura").equals("3")){ 
                                  //deudas por cobrar
                              cuenta1="11";
                              cuenta2="21";
                              concepto="Compra de productos credito";
                               }
                                 String debe=request.getParameter("cedldatotal");
                                 String haber=request.getParameter("cedldatotal");
                                 String referencia="Factura Compra";                         
                                 String documento=session.getAttribute("idFactura").toString();
                                 String idAsiento=ac.getIdAsiento();
                                 String numeroDiario=String.valueOf(Integer.parseInt(ac.getNumeroDiario()));
                                 String periodoAsiento=ac.getPeriodoAsiento();
                                 String fechaAsiento=ac.getFechaAsiento();
                                 String numeroAsiento=ac.getNumeroAsiento();
                                 String conceptoAsiento=concepto;
                                 String debeAsiento=String.valueOf(Float.parseFloat(ac.getDebeAsiento())+Float.parseFloat(debe));
                                 String haberAsiento=String.valueOf(Float.parseFloat(ac.getHaberAsiento())+Float.parseFloat(haber));
                                 AsientoClass ac1, ac2;
                                 ac1= new AsientoClass(idAsiento, numeroDiario, periodoAsiento, fechaAsiento, numeroAsiento,conceptoAsiento, debeAsiento, haberAsiento);
                                 boolean sw5=ad.modificar(ac1);
                                 ac2= new AsientoClass(String.valueOf(Integer.parseInt(numeroDiario)+1), periodoAsiento, fechaAsiento, numeroAsiento, "", "0", "0");
                                 boolean sw6=ad.insertar(ac2);
                                     if (sw5 && sw6){
                                     TransaccionClass u1=new TransaccionClass(debe, "0", referencia, documento, cuenta2, ac1.getIdAsiento());
                                     TransaccionClass u2=new TransaccionClass("0", haber, referencia, documento, cuenta1, ac1.getIdAsiento());
                                     boolean sw3=td.insertar(u1);
                                     boolean sw4=td.insertar(u2);
                                                if(sw3 && sw4){    
                                                try {
                                                sw1=sw;                                
                                                boolean sw2=pd.modificarcantidadcompra((String)lista.get(i).getIdProducto().toString(), (String) lista.get(i).getCostoProducto().toString(), (String) lista.get(i).getCantidadProducto().toString());
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
                                        }else{
                                        PrintWriter out=response.getWriter();
                                        out.println("Fail registration.");
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
            }else{
            PrintWriter out=response.getWriter();
            out.println("Ingrese un asiento.");            
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
