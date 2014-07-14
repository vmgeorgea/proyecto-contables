/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import Clases.ProductoClass;
import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

/**
 *
 * @author Leitos
 */
public class ProductoDAO {
    
    public static boolean Validar(String idTipo) throws InstantiationException, IllegalAccessException, SQLException, SQLException {        
    boolean status = false;
    PreparedStatement pst = null;
    ResultSet rs = null;
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
        String sql="select * from producto where idCliente=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, idTipo);
        rs = pst.executeQuery();
        status = rs.next();
    return status;
    }
    
    public boolean insertar(ProductoClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        
        
        String sql="insert into producto (nombreProducto, costoProducto, precioProducto, stockProducto, impuestoProducto) values (?, ?, ?, ?, ?)";
        pst = conn.prepareStatement(sql);
        
        pst.setString(1, u.getNombreProducto());
        pst.setDouble(2, Double.parseDouble(u.getCostoProducto()));
        pst.setDouble(3, Double.parseDouble(u.getPrecioProducto()));
        pst.setInt(4, Integer.parseInt(u.getStockProducto()));
        pst.setString(5, u.getImpuestoProducto());
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
    
    public boolean modificar(ProductoClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="update producto set nombreProducto=?, costoProducto=?, precioProducto=?, stockProducto=?, impuestoProducto=? where idProducto=?";
        pst = conn.prepareStatement(sql);
        
        
        pst.setString(1, u.getNombreProducto());
        pst.setDouble(2, Double.parseDouble(u.getCostoProducto()));
        pst.setDouble(3, Double.parseDouble(u.getPrecioProducto()));
        pst.setInt(4, Integer.parseInt(u.getStockProducto()));
        pst.setString(5, u.getImpuestoProducto());
        pst.setString(6, u.getIdProducto());
        
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

    public boolean modificarcantidadventa(String idProducto, String cantidadProducto) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="update producto set stockProducto=stockProducto-? where idProducto=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, cantidadProducto);
        pst.setString(2, idProducto);
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
    
    public boolean modificarcantidadcompra(String idProducto, String cantidadProducto) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="update producto set stockProducto=stockProducto+? where idProducto=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, cantidadProducto);
        pst.setString(2, idProducto);
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
    
    public static LinkedList<ProductoClass>  consultar() throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<ProductoClass> listahistorial=new LinkedList<ProductoClass>();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  producto";
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        ProductoClass r= new ProductoClass();
        
        r.setIdProducto(rs.getString(1));
        r.setNombreProducto(rs.getString(2));
        r.setCostoProducto(rs.getString(3));
        r.setPrecioProducto(rs.getString(4));
        r.setStockProducto(rs.getString(5));
        r.setImpuestoProducto(rs.getString(6));
        
        listahistorial.add(r);
       }
   rs.close();
   st.close();
  return listahistorial;
}
}
