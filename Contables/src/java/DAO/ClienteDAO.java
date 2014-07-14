/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import Clases.ClienteClass;
import Conexion.Conexion;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
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
public class ClienteDAO {
    
    public static boolean Validar(String idTipo) throws InstantiationException, IllegalAccessException, SQLException, SQLException {        
    boolean status = false;
    PreparedStatement pst = null;
    ResultSet rs = null;
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
        String sql="select * from cliente where idCliente=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, idTipo);
        rs = pst.executeQuery();
        status = rs.next();
    return status;
    }
    
    public boolean insertar(ClienteClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        
        
        String sql="insert into cliente (cedula, nombre, apellido, direccion, telefono, tipo) values (?, ?, ?, ?, ?, ?)";
        pst = conn.prepareStatement(sql);
        
        pst.setString(1, u.getCedula());
        pst.setString(2, u.getNombre());
        pst.setString(3, u.getApellido());
        pst.setString(4, u.getDireccion());
        pst.setString(5, u.getTelefono());
        pst.setString(6, u.getTipo());
        
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
    
    public boolean modificar(ClienteClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="update cliente set cedula=?, nombre=?, apellido=?, direccion=?, telefono=?, tipo=? where idCliente=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getCedula());
        pst.setString(2, u.getNombre());
        pst.setString(3, u.getApellido());
        pst.setString(4, u.getDireccion());
        pst.setString(5, u.getTelefono());
        pst.setString(6, u.getTipo());
        pst.setString(7, u.getIdCliente());
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
    
   public static LinkedList<ClienteClass>  consultar() throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<ClienteClass> listahistorial=new LinkedList<ClienteClass>();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  cliente";
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        ClienteClass r= new ClienteClass();
        r.setIdCliente(rs.getString(1));
        r.setCedula(rs.getString(2));
        r.setNombre(rs.getString(3));
        r.setApellido(rs.getString(4));
        r.setDireccion(rs.getString(5));
        r.setTelefono(rs.getString(6));
        r.setTipo(rs.getString(7));
        listahistorial.add(r);
       }
   rs.close();
   st.close();
  return listahistorial;
}
    public ClienteClass consultarcliente(String idTipo) throws InstantiationException, IllegalAccessException, SQLException, SQLException {        
    ClienteClass r= new ClienteClass();
    PreparedStatement pst = null;
    ResultSet rs = null;
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
        String sql="select * from cliente where cedula=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, idTipo);
        rs = pst.executeQuery();
            while(rs.next()){
            r.setIdCliente(rs.getString(1));
            r.setCedula(rs.getString(2));
            r.setNombre(rs.getString(3));
            r.setApellido(rs.getString(4));
            r.setDireccion(rs.getString(5));
            r.setTelefono(rs.getString(6));
            r.setTipo(rs.getString(7));
            }    
      return r;   
    }
}
