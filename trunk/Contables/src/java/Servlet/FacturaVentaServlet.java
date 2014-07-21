/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Clases.AsientoClass;
import Clases.ClienteClass;
import Clases.ProductoClass;
import Clases.FacturaVentaProductoClass;
import Clases.ProductoVentaClass;
import Clases.FacturaVentaClass;
import Clases.IVAClass;
import Clases.ProductoCompraClass;
import Clases.TransaccionClass;
import DAO.AsientoDAO;
import DAO.TransaccionDAO;
import DAO.FacturaVentaProductoDAO;
import DAO.FacturaVentaDAO;
import DAO.IVADAO;
import DAO.ProductoDAO;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Iterator;
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
        try {
            HttpSession session = request.getSession(true);
            boolean sw1=false;
            LinkedList<ProductoVentaClass> lista =(LinkedList) session.getAttribute("productos");
            FacturaVentaProductoDAO fvpd = new  FacturaVentaProductoDAO();
            FacturaVentaDAO fvd = new  FacturaVentaDAO();
            ProductoDAO pd =new ProductoDAO();
            TransaccionDAO td= new TransaccionDAO();
            ClienteClass cc= new ClienteClass();
            AsientoDAO ad= new AsientoDAO();
            AsientoClass ac1= new AsientoClass();                         
            cc= (ClienteClass)session.getAttribute("cliente");
            String a=session.getAttribute("idFactura").toString();
            String b=session.getAttribute("fechaFactura").toString();
            
            ac1 =ad.consultarfecha(b);
            AsientoClass ac2= new AsientoClass(); 
            Calendar cal = Calendar.getInstance();
                
                if(ac1.getIdAsiento()==null){            
                ac2= new AsientoClass("1", Integer.toString(cal.get(Calendar.YEAR)), b, "1", "", "0", "0");
                ad.insertar(ac2);
                ac2 =ad.consultarfecha(b);             
                }else{
                 int xvr=Integer.parseInt(ac1.getNumeroAsiento())+1;
                ac2= new AsientoClass(ac1.getNumeroDiario(), ac1.getPeriodoAsiento(), b, String.valueOf(xvr), "", "0", "0");
                ad.insertar(ac2);
                ac2 =ad.consultarfecha(b);   
                }                
                
            String c=request.getParameter("descuentoFactura").toString();
            String d=cc.getIdCliente();
            String e=request.getParameter("ivaFactura");
            FacturaVentaClass fvc=new FacturaVentaClass(a, b,"986789456734", "PARQUE INDUSTRIAL", "001", c, d,e);
            boolean sw0=fvd.insertar(fvc);
                if(sw0){
                for(int i=0; i<lista.size();i++){
                    try {
                        String idFactura = session.getAttribute("idFactura").toString();
                        String idProducto = lista.get(i).getIdProducto().toUpperCase();
                        String cantidadProducto = lista.get(i).getCantidadProducto().toUpperCase();
                        FacturaVentaProductoClass u=new FacturaVentaProductoClass(idFactura, idProducto, cantidadProducto);
                        boolean sw=fvpd.insertar(u);
                        if(sw){
                        int val1=request.getParameter("formaspagoFactura").toString().indexOf("-");
                        int val2=request.getParameter("formaspagoFactura").toString().length();
                        String cuenta1=request.getParameter("formaspagoFactura").toString().substring(val1+1, val2);
                        String cuenta2="21";
                        String concepto="Venta de productos";
                                 String debe=request.getParameter("cedldatotal");
                                 String haber=request.getParameter("cedldatotal");
                                 String referencia="Factura Venta";                         
                                 String documento=session.getAttribute("idFactura").toString();
                                 String idAsiento=ac2.getIdAsiento();
                                 String numeroDiario=String.valueOf(Integer.parseInt(ac2.getNumeroDiario()));
                                 String periodoAsiento=ac2.getPeriodoAsiento();
                                 String fechaAsiento=ac2.getFechaAsiento();
                                 String numeroAsiento=ac2.getNumeroAsiento();
                                 String conceptoAsiento=ac2.getConceptoAsiento();
                                 String debeAsiento=String.valueOf(Float.parseFloat(ac2.getDebeAsiento())+Float.parseFloat(debe));
                                 String haberAsiento=String.valueOf(Float.parseFloat(ac2.getHaberAsiento())+Float.parseFloat(haber));
                                 AsientoClass ac3;
                                 ac3= new AsientoClass(idAsiento, numeroDiario, periodoAsiento, fechaAsiento, numeroAsiento,conceptoAsiento, debeAsiento, haberAsiento);
                                 boolean sw5=ad.insertar(ac3);
                                     if (sw5){
                                     TransaccionClass u1=new TransaccionClass(debe, "0", referencia, documento, cuenta1, ac2.getIdAsiento());
                                     TransaccionClass u2=new TransaccionClass("0", haber, referencia, documento, cuenta2, ac2.getIdAsiento());
                                     boolean sw3=td.insertar(u1);
                                     boolean sw4=td.insertar(u2);
                                                if(sw3 && sw4){    
                                                try {
                                                sw1=sw;                                
                                                boolean sw2=pd.modificarcantidadventa((String)lista.get(i).getIdProducto().toString(), (String) lista.get(i).getCantidadProducto().toString());
                                                    if(sw2){

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
                                        }else{
                                        PrintWriter out=response.getWriter();
                                        out.println("Fail registration.");
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
                /////////////////////////////////////
                    Document document = new Document();
                    response.setContentType("application/pdf");
                    PdfWriter.getInstance(document, response.getOutputStream());
                    LinkedList<ProductoVentaClass> listaxvr =(LinkedList) session.getAttribute("productos"); 
                    int i=0;
                    float to=0;
                    document.open();

                    /* new paragraph instance initialized and add function write in pdf file*/
                    document.add(new Paragraph(" Factura " + a + "\n\n"));
                    document.add(new Paragraph(" Fecha " + b + "\n\n"));
                    document.add(new Paragraph("------------------------------------------------------"));
                    document.add(new Paragraph(" Nombre Cliente " + cc.getNombre() + "\n\n"));
                    document.add(new Paragraph(" RUC/Cedula" + cc.getCedula() + "\n\n"));
                    document.add(new Paragraph(" Direccion Cliente " + cc.getDireccion() + "\n\n"));
                    document.add(new Paragraph(" Telefono Cliente " + cc.getTelefono() + "\n\n"));
                    document.add(new Paragraph("------------------------------------------------------"));
                    document.add(new Paragraph("ID ::   Cantidad ::   Precio ::   Total::\n\n"));
                    for (Iterator iter = listaxvr.iterator(); iter.hasNext();) {
                        ProductoVentaClass customerBean = (ProductoVentaClass) iter.next();
                        String id = customerBean.getIdProducto();
                        String cantidad = customerBean.getCantidadProducto();
                        String costo = customerBean.getPrecioProducto();
                        String total = String.valueOf(Float.valueOf(cantidad)*Float.valueOf(costo));
                        document.add(new Paragraph("     " +id + "          " + cantidad + "         " + costo + "         " + total+ "\n\n"));
                        listaxvr.remove(i);
                        i++;
                        to=to+Float.valueOf(total);
                        session.setAttribute("productos",  listaxvr);
                    }
                    float descuento=to*(Float.valueOf(c));
                    IVAClass i1= new IVAClass();
                    IVADAO i2= new IVADAO();
                    i1=i2.consultariva(e);
                    float iva=((to-descuento)*Float.valueOf(i1.getValorIva()));
                    float x=to-descuento+iva;
                    document.add(new Paragraph("------------------------------------------------------"));
                    document.add(new Paragraph(" SubTotal:                    " + String.valueOf(to) + "\n\n"));
                    document.add(new Paragraph(" Descuento:                   " + c + "\n\n"));
                    document.add(new Paragraph(" SubTotal Descuento: " + String.valueOf(descuento) + "\n\n"));
                    document.add(new Paragraph(" IVA:                         " + i1.getValorIva() + "\n\n"));   
                    document.add(new Paragraph(" SubTotal IVA:           " + String.valueOf(iva) + "\n\n"));
                    document.add(new Paragraph(" Total:                       " + String.valueOf(x) + "\n\n"));                     
                    document.close(); //document instance closed  
                    
                ////////////////////////////////////                   
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
        } catch (DocumentException ex) {
            Logger.getLogger(FacturaVentaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
