/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import Clases.ClienteClass;
import Clases.ProveedorClass;
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
public class ProveedorDAO {
 
    public static boolean Validar(String idTipo) throws InstantiationException, IllegalAccessException, SQLException, SQLException {        
    boolean status = false;
    PreparedStatement pst = null;
    ResultSet rs = null;
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
        String sql="select * from proveedor where idCliente=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, idTipo);
        rs = pst.executeQuery();
        status = rs.next();
    return status;
    }
    
    public boolean insertar(ProveedorClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;

        String sql="insert into proveedor (identificacionProveedor, nombreProveedor, direccionProveedor, telefonoProveedor, autorizacionProveedor, fechaCaducidadAutorizacionProveedor, tipoProveedor) values (?, ?, ?, ?, ?, ?, ?)";
        pst = conn.prepareStatement(sql);
        
        pst.setString(1, u.getIdentificacionProveedor());
        pst.setString(2, u.getNombreProveedor());
        pst.setString(3, u.getDireccionProveedor());
        pst.setString(4, u.getTelefonoProveedor());
        pst.setString(5, u.getAutorizacionProveedor());
        pst.setString(6, u.getFechaCaducidadAutorizacionProveedor());
        pst.setString(7, u.getTipoProveedor());
        
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
    
    
    public boolean modificar(ProveedorClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="update proveedor set identificacionProveedor=?, nombreProveedor=?, direccionProveedor=?, telefonoProveedor=?, autorizacionProveedor=?, fechaCaducidadAutorizacionProveedor=?, tipoProveedor=? where idProveedor=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getIdentificacionProveedor());
        pst.setString(2, u.getNombreProveedor());
        pst.setString(3, u.getDireccionProveedor());
        pst.setString(4, u.getTelefonoProveedor());
        pst.setString(5, u.getAutorizacionProveedor());
        pst.setString(6, u.getFechaCaducidadAutorizacionProveedor());
        pst.setString(7, u.getTipoProveedor());
        pst.setString(8, u.getIdProveedor());
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
    
    
    public static LinkedList<ProveedorClass>  consultar() throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<ProveedorClass> listahistorial=new LinkedList<ProveedorClass>();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  proveedor";
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        ProveedorClass r= new ProveedorClass();
        
        r.setIdProveedor(rs.getString(1));
        r.setIdentificacionProveedor(rs.getString(2));
        r.setNombreProveedor(rs.getString(3));
        r.setDireccionProveedor(rs.getString(4));
        r.setTelefonoProveedor(rs.getString(5));
        r.setAutorizacionProveedor(rs.getString(6));
        r.setFechaCaducidadAutorizacionProveedor(rs.getString(7));
        r.setTipoProveedor(rs.getString(8));
        
        listahistorial.add(r);
       }
   rs.close();
   st.close();
  return listahistorial;
}
}
