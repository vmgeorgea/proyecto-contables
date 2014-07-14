/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import Clases.FacturaVentaProductoClass;
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
public class FacturaVentaProductoDAO {
 public static boolean Validar(String idFactura) throws InstantiationException, IllegalAccessException, SQLException, SQLException {        
    boolean status = false;
    PreparedStatement pst = null;
    ResultSet rs = null;
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
        String sql="select * from facturaventaproducto where idFactura=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, idFactura);
        rs = pst.executeQuery();
        status = rs.next();
    return status;
    }
    
    public boolean insertar(FacturaVentaProductoClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;                
        String sql="insert into facturaventaproducto (idProdcuto, idFactura, cantidadProducto) values (?, ?, ?)";
        pst = conn.prepareStatement(sql);        
        pst.setString(1, u.getIdProducto());
        pst.setString(2, u.getIdFactura());
        pst.setString(3, u.getCantidadProducto());       
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
    
    public static LinkedList<FacturaVentaProductoClass>  consultar() throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<FacturaVentaProductoClass> listahistorial=new LinkedList<FacturaVentaProductoClass>();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  facturaventaproducto";
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        FacturaVentaProductoClass r= new FacturaVentaProductoClass();
        
        r.setIdProducto(rs.getString(1));
        r.setIdFactura(rs.getString(2));
        r.setCantidadProducto(rs.getString(3));
        listahistorial.add(r);
       }
   rs.close();
   st.close();
  return listahistorial;
}   
public static LinkedList<FacturaVentaProductoClass>  consultarfinal() throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<FacturaVentaProductoClass> listahistorial=new LinkedList<FacturaVentaProductoClass>();
   FacturaVentaProductoClass r= new FacturaVentaProductoClass();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="SELECT MAX(idFactura) FROM facturaventaproducto";
   ResultSet rs = st.executeQuery(sql);
           if ( rs.getRow() == 0 ) 
        { 

        
        r.setIdFactura("0");
        r.setIdProducto("0");
        r.setCantidadProducto("0");
        listahistorial.add(r);
        } 
        else 
        { 
       while(rs.next()){
        r.setIdFactura(rs.getString(1));
        r.setIdProducto(rs.getString(2));
        r.setCantidadProducto(rs.getString(3));
        listahistorial.add(r);
       }
   rs.close();
   st.close();
}
  return listahistorial;
}      
}
