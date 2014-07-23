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
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
            Calendar fecha = new GregorianCalendar();
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
            FacturaVentaClass fvc=new FacturaVentaClass(a, horaactual, b,"986789456734", "PARQUE INDUSTRIAL", "001", c, d,e);
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
                        String concepto="Venta de productos. Factura Venta "+a;
                                 String debe=request.getParameter("cedldatotal");
                                 String haber=request.getParameter("cedldatotal");
                                 String referencia="Factura Venta "+a;                         
                                 String documento=session.getAttribute("idFactura").toString();
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
                    cell = new PdfPCell(new Phrase("Cedula/RUC Cliente"));
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablaproveedor.addCell(cell);
                    cell = new PdfPCell(new Phrase(cc.getCedula()));
                    cell.setHorizontalAlignment(Element.ALIGN_MIDDLE);
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablaproveedor.addCell(cell);                    
                    cell = new PdfPCell(new Phrase("Nombre Cliente"));
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablaproveedor.addCell(cell);
                    cell = new PdfPCell(new Phrase(cc.getNombre()+" "+cc.getApellido()));
                    cell.setHorizontalAlignment(Element.ALIGN_MIDDLE);
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablaproveedor.addCell(cell);                   
                    cell = new PdfPCell(new Phrase("Direccion Cliente"));
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablaproveedor.addCell(cell);
                    cell = new PdfPCell(new Phrase(cc.getDireccion()));
                    cell.setHorizontalAlignment(Element.ALIGN_MIDDLE);
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablaproveedor.addCell(cell);      
                    cell = new PdfPCell(new Phrase("Telefono Cliente"));
                    cell.setBorder(Rectangle.NO_BORDER);
                    mitablaproveedor.addCell(cell);
                    cell = new PdfPCell(new Phrase(cc.getTelefono()));
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
                        ProductoVentaClass customerBean = (ProductoVentaClass) iter.next();
                        String id = customerBean.getIdProducto();
                        String cantidad = customerBean.getCantidadProducto();
                        String costo = customerBean.getPrecioProducto();
                        String total = String.valueOf(Float.valueOf(cantidad)*Float.valueOf(costo));
                        mitablasimple.addCell(id);
                        mitablasimple.addCell(cantidad);
                        mitablasimple.addCell(costo);
                        mitablasimple.addCell(total);
                        listaxvr.remove(i);
                        i++;
                        to=to+Float.valueOf(total);
                        session.setAttribute("productos",  listaxvr);
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
