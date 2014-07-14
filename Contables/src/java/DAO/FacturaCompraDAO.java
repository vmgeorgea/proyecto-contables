/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;
import Clases.FacturaCompraClass;
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
public class FacturaCompraDAO {
    
    public static boolean Validar(String idTipo) throws InstantiationException, IllegalAccessException, SQLException, SQLException {        
    boolean status = false;
    PreparedStatement pst = null;
    ResultSet rs = null;
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
        String sql="select * from facturacompra where idFactura=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, idTipo);
        rs = pst.executeQuery();
        status = rs.next();
    return status;
    }
    
    public boolean insertar(FacturaCompraClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;                
        String sql="insert into facturacompra (numeroFactura, fechaFactura, autorizacionFactura, establecimientoFactura, puntoemisionFactura, descuentoFactura, Proveedor_idProveedor , IVA_idIVA) values (?, ?, ?, ?, ?, ?, ?, ?)";
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
    
    public boolean modificar(FacturaCompraClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="update facturacompra set numeroFactura=?, fechaFactura=?, autorizacionFactura=?, establecimientoFactura=?, puntoemisionFactura=?, descuentoFactura=?, Cliente_idCliente=?, IVA_idIVA=?where idFactura=?";
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
    
    public static LinkedList<FacturaCompraClass>  consultar() throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<FacturaCompraClass> listahistorial=new LinkedList<FacturaCompraClass>();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  facturacompra";
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        FacturaCompraClass r= new FacturaCompraClass();        
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
public static LinkedList<FacturaCompraClass>  consultarfinal() throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<FacturaCompraClass> listahistorial=new LinkedList<FacturaCompraClass>();
   FacturaCompraClass r= new FacturaCompraClass();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="SELECT MAX(idFactura) FROM facturacompra";
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
