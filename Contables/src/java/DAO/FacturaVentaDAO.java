/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;
import Clases.FacturaVentaClass;
import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
/**
 *
 * @author User
 */
public class FacturaVentaDAO {
    
    public static boolean Validar(String idTipo) throws InstantiationException, IllegalAccessException, SQLException, SQLException {        
    boolean status = false;
    PreparedStatement pst = null;
    ResultSet rs = null;
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
        String sql="select * from facturaventa where idFactura=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, idTipo);
        rs = pst.executeQuery();
        status = rs.next();
    return status;
    }
    
    public boolean insertar(FacturaVentaClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;                
        String sql="insert into facturaventa (numeroFactura, horaFactura, fechaFactura, autorizacionFactura, establecimientoFactura, puntoemisionFactura, descuentoFactura, Cliente_idCliente , IVA_idIVA) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        pst = conn.prepareStatement(sql);        
        pst.setString(1, u.getNumeroFactura());
        pst.setString(2, u.getHoraFactura());
        pst.setString(3, u.getFechaFactura());
        pst.setString(4, u.getAutorizacionFactura());
        pst.setString(5, u.getEstablecimientoFactura());
        pst.setString(6, u.getPuntoemisionFactura());
        pst.setString(7, u.getDescuentoFactura());
        pst.setString(8, u.getCliente_idCliente());
        pst.setString(9, u.getIVA_idIVA());        
        pst.execute();
        agregado=true;
        pst.close();
       }
       c.cerrarConexion();
      } catch (SQLException e) {
       agregado=false;
       e.printStackTrace();
      }
      return agregado;
     }
    
    public boolean modificar(FacturaVentaClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="update facturaventa set numeroFactura=?, fechaFactura=?, autorizacionFactura=?, establecimientoFactura=?, puntoemisionFactura=?, descuentoFactura=?, Cliente_idCliente=?, IVA_idIVA=?where idFactura=?";
        pst = conn.prepareStatement(sql);
        
        
        pst.setString(1, u.getNumeroFactura());
        pst.setString(2, u.getFechaFactura());
        pst.setString(3, u.getAutorizacionFactura());
        pst.setString(4, u.getEstablecimientoFactura());
        pst.setString(5, u.getPuntoemisionFactura());
        pst.setString(6, u.getDescuentoFactura());
        pst.setString(7, u.getCliente_idCliente());
        pst.setString(8, u.getIVA_idIVA());          
        pst.execute();
        agregado=true;
        pst.close();
       }
       c.cerrarConexion();
      } catch (SQLException e) {
       agregado=false;
       e.printStackTrace();
      }
      return agregado;
     } 
    
    public static LinkedList<FacturaVentaClass>  consultar() throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<FacturaVentaClass> listahistorial=new LinkedList<FacturaVentaClass>();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  facturaventa";
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        FacturaVentaClass r= new FacturaVentaClass();
        
        r.setIdFactura(rs.getString(1));
        r.setNumeroFactura(rs.getString(2));
        r.setFechaFactura(rs.getString(3));
        r.setAutorizacionFactura(rs.getString(4));
        r.setEstablecimientoFactura(rs.getString(5));
        r.setPuntoemisionFactura(rs.getString(6));
        r.setDescuentoFactura (rs.getString(7));
        r.setCliente_idCliente (rs.getString(8));
        r.setIVA_idIVA (rs.getString(9));
        listahistorial.add(r);
       }
   rs.close();
   st.close();
  return listahistorial;
}   
public static LinkedList<FacturaVentaClass>  consultarfinal() throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<FacturaVentaClass> listahistorial=new LinkedList<FacturaVentaClass>();
   FacturaVentaClass r= new FacturaVentaClass();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="SELECT MAX(idFactura) FROM facturaventa";
   ResultSet rs = st.executeQuery(sql);
        if (rs != null && rs.next()){
            r.setIdFactura(rs.getString(1));
            listahistorial.add(r);     
        } 
        else 
        { 
        r.setIdFactura("0");
        listahistorial.add(r);
       }
   rs.close();
   st.close();

  return listahistorial;
}  


}
