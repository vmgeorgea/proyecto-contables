/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Clases.AsientoClass;
import Clases.ClienteClass;
import Clases.ProveedorClass;
import Clases.ProductoClass;
import Clases.FacturaCompraProductoClass;
import Clases.ProductoCompraClass;
import Clases.FacturaCompraClass;
import Clases.IVAClass;
import Clases.TransaccionClass;
import DAO.AsientoDAO;
import DAO.FacturaCompraProductoDAO;
import DAO.FacturaCompraDAO;
import DAO.IVADAO;
import DAO.ProductoDAO;
import DAO.TransaccionDAO;
import com.itextpdf.text.Chunk;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Collection;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.util.List;
import java.util.*;
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
            Calendar fecha = new GregorianCalendar();
            FacturaCompraProductoDAO fvpd = new  FacturaCompraProductoDAO();
            FacturaCompraDAO fvd = new  FacturaCompraDAO();
            ProductoDAO pd =new ProductoDAO();
            TransaccionDAO td= new TransaccionDAO();
            ProveedorClass cc= new ProveedorClass();
            AsientoDAO ad= new AsientoDAO();
            AsientoClass ac1= new AsientoClass();                         
            cc= (ProveedorClass)session.getAttribute("proveedorcompra");
            String a=session.getAttribute("idFacturacompra").toString();
            String b=session.getAttribute("fechaFacturacompra").toString();
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
            
            String c=request.getParameter("descuentoFacturacompra").toString();
            String d=cc.getIdProveedor();
            String e=request.getParameter("ivaFacturacompra");
            int hora = fecha.get(Calendar.HOUR_OF_DAY);
            String hr;
                if (hora<10){
                hr="0"+String.valueOf(hora);
                }else{
                hr=String.valueOf(hora);
                }
            int minuto = fecha.get(Calendar.MINUTE);
            String mnt;
                if (minuto<10){
                mnt="0"+String.valueOf(minuto);
                }else{
                mnt=String.valueOf(minuto);
                }
            int segundo = fecha.get(Calendar.SECOND);
            String sgd;
                if (segundo<10){
                sgd="0"+String.valueOf(segundo);
                }else{
                sgd=String.valueOf(segundo);
                }        
            String horaactual=hr+":"+mnt+":"+sgd;            
            FacturaCompraClass fvc=new FacturaCompraClass(a, horaactual, b,"986789456734", "PARQUE INDUSTRIAL", "001", c, d,e);
            boolean sw0=fvd.insertar(fvc);
                if(sw0){
                for(int i=0; i<lista.size();i++){
                    try {
                        String idFactura = session.getAttribute("idFacturacompra").toString();
                        String idProducto = lista.get(i).getIdProducto().toUpperCase();
                        String cantidadProducto = lista.get(i).getCantidadProducto().toUpperCase();
                        FacturaCompraProductoClass u=new FacturaCompraProductoClass(idFactura, idProducto, cantidadProducto);
                        boolean sw=fvpd.insertar(u);
                        if(sw){
                        int val1=request.getParameter("formaspagoFacturacompra").toString().indexOf("-");
                        int val2=request.getParameter("formaspagoFacturacompra").toString().length();
                        String cuenta1=request.getParameter("formaspagoFacturacompra").toString().substring(val1+1, val2);
                        String cuenta2="21";
                        String concepto="Compra de productos. Factura Compra "+a;
                                 String debe=request.getParameter("cedldatotalcompra");
                                 String haber=request.getParameter("cedldatotalcompra");
                                 String referencia="Factura Compra "+a;                         
                                 String documento=session.getAttribute("idFacturacompra").toString();
                                 String idAsiento=ac2.getIdAsiento();
                                 String numeroDiario=String.valueOf(Integer.parseInt(ac2.getNumeroDiario()));
                                 String periodoAsiento=ac2.getPeriodoAsiento();
                                 String fechaAsiento=ac2.getFechaAsiento();
                                 String numeroAsiento=ac2.getNumeroAsiento();
                                 String conceptoAsiento=concepto;
                                 String debeAsiento=String.valueOf(Float.parseFloat(debe));
                                 String haberAsiento=String.valueOf(Float.parseFloat(haber));
                                 AsientoClass ac3;
                                 ac3= new AsientoClass(idAsiento, numeroDiario, periodoAsiento, fechaAsiento, numeroAsiento,conceptoAsiento, debeAsiento, haberAsiento);
                                 boolean sw5=ad.modificar(ac3);
                                     if (sw5){
                                     TransaccionClass u1=new TransaccionClass(debe, "0", referencia, documento, cuenta2, ac2.getIdAsiento());
                                     TransaccionClass u2=new TransaccionClass("0", haber, referencia, documento, cuenta1, ac2.getIdAsiento());
                                     boolean sw3=td.insertar(u1);
                                     boolean sw4=td.insertar(u2);
                                                if(sw3 && sw4){    
                                                try {
                                                sw1=sw;                                
                                                boolean sw2=pd.modificarcantidadcompra((String)lista.get(i).getIdProducto().toString(), (String) lista.get(i).getCostoProducto().toString(), (String) lista.get(i).getCantidadProducto().toString());                                                
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
                /////////////////////////////////////
                    Document document = new Document();
                    response.setContentType("application/pdf");
                    PdfWriter.getInstance(document, response.getOutputStream());
                    LinkedList<ProductoCompraClass> listaxvr =(LinkedList) session.getAttribute("productoscompra"); 
                    PdfPCell cell;
                    int i=0;
                    float to=0;
                    document.open();

                    /* new paragraph instance initialized and add function write in pdf file*/
                    PdfPTable mitablafactura=new PdfPTable(2);
                    cell = new PdfPCell(new Phrase("Factura"));
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablafactura.addCell(cell);
                    cell = new PdfPCell(new Phrase("Fecha"));
                    cell.setHorizontalAlignment(Element.ALIGN_MIDDLE);
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablafactura.addCell(cell);
                    cell = new PdfPCell(new Phrase(a));
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablafactura.addCell(cell);
                    cell = new PdfPCell(new Phrase(b));
                    cell.setHorizontalAlignment(Element.ALIGN_MIDDLE);
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablafactura.addCell(cell); 
                    document.add(mitablafactura);
                    document.add(new Phrase("\n"));
                    PdfPTable mitablaproveedor=new PdfPTable(2);                    
                    cell = new PdfPCell(new Phrase("RUC Proveedor"));
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablaproveedor.addCell(cell);
                    cell = new PdfPCell(new Phrase(cc.getIdentificacionProveedor()));
                    cell.setHorizontalAlignment(Element.ALIGN_MIDDLE);
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablaproveedor.addCell(cell);                    
                    cell = new PdfPCell(new Phrase("Nombre Proveedor"));
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablaproveedor.addCell(cell);
                    cell = new PdfPCell(new Phrase(cc.getNombreProveedor()));
                    cell.setHorizontalAlignment(Element.ALIGN_MIDDLE);
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablaproveedor.addCell(cell);                   
                    cell = new PdfPCell(new Phrase("Direccion Proveedor"));
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablaproveedor.addCell(cell);
                    cell = new PdfPCell(new Phrase(cc.getDireccionProveedor()));
                    cell.setHorizontalAlignment(Element.ALIGN_MIDDLE);
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablaproveedor.addCell(cell);      
                    cell = new PdfPCell(new Phrase("Telefono Proveedor"));
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablaproveedor.addCell(cell);
                    cell = new PdfPCell(new Phrase(cc.getTelefonoProveedor()));
                    cell.setHorizontalAlignment(Element.ALIGN_MIDDLE);
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablaproveedor.addCell(cell);                     
                    document.add(mitablaproveedor);
                    document.add(new Phrase("\n"));
                    PdfPTable mitablasimple=new PdfPTable(4);
                        mitablasimple.addCell("ID");
                        mitablasimple.addCell("Cantidad");
                        mitablasimple.addCell("Costo");
                        mitablasimple.addCell("Total");
                    for (Iterator iter = listaxvr.iterator(); iter.hasNext();) {
                        ProductoCompraClass customerBean = (ProductoCompraClass) iter.next();
                        String id = customerBean.getIdProducto();
                        String cantidad = customerBean.getCantidadProducto();
                        String costo = customerBean.getCostoProducto();
                        String total = String.valueOf(Float.valueOf(cantidad)*Float.valueOf(costo));
                        mitablasimple.addCell(id);
                        mitablasimple.addCell(cantidad);
                        mitablasimple.addCell(costo);
                        mitablasimple.addCell(total);
                        listaxvr.remove(i);
                        i++;
                        to=to+Float.valueOf(total);
                        session.setAttribute("productoscompra",  listaxvr);
                    }

                    float descuento=to*(Float.valueOf(c));
                    IVAClass i1= new IVAClass();
                    IVADAO i2= new IVADAO();
                    i1=i2.consultariva(e);
                    float iva=(to-descuento)*Float.valueOf(i1.getValorIva());
                    float x=to-descuento+iva;
                        mitablasimple.addCell("");
                        mitablasimple.addCell("");
                        mitablasimple.addCell("SubTotal");
                        mitablasimple.addCell(String.valueOf(to));
                        mitablasimple.addCell("");
                        mitablasimple.addCell("");
                        mitablasimple.addCell("Descuento");
                        mitablasimple.addCell(c);                        
                        mitablasimple.addCell("");
                        mitablasimple.addCell("");
                        mitablasimple.addCell("SubTotal Descuento");
                        mitablasimple.addCell(String.valueOf(descuento));  
                        mitablasimple.addCell("");
                        mitablasimple.addCell("");
                        mitablasimple.addCell("IVA");
                        mitablasimple.addCell(i1.getValorIva());    
                        mitablasimple.addCell("");
                        mitablasimple.addCell("");
                        mitablasimple.addCell("SubTotal IVA");
                        mitablasimple.addCell(String.valueOf(iva));    
                        mitablasimple.addCell("");
                        mitablasimple.addCell("");
                        mitablasimple.addCell("Total");
                        mitablasimple.addCell(String.valueOf(x));                        
                    document.add(mitablasimple);                    
                    document.close(); //document instance closed  
                    
                ////////////////////////////////////                                
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
        } catch (DocumentException ex) {
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
