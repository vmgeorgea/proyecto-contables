/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import Clases.TransaccionClass;
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
public class TransaccionDAO {
    
    public static boolean Validar(String idTipo) throws InstantiationException, IllegalAccessException, SQLException, SQLException {        
    boolean status = false;
    PreparedStatement pst = null;
    ResultSet rs = null;
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
        String sql="select * from Transaccion where idTransaccion=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, idTipo);
        rs = pst.executeQuery();
        status = rs.next();
    return status;
    }
    
    public boolean insertar(TransaccionClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        
        String sql="insert into transaccion (debeTransaccion, haberTransaccion, referenciaTransaccion, documentoTransaccion, Cuenta_idCuenta, Asiento_idAsiento) values (?, ?, ?, ?, ?, ?)";
        pst = conn.prepareStatement(sql);
        
        pst.setDouble(1, Double.parseDouble(u.getDebeTransaccion()));
        pst.setDouble(2, Double.parseDouble(u.getHaberTransaccion()));
        pst.setString(3, u.getReferenciaTransaccion());
        pst.setString(4, u.getDocumentoTransaccion());
        pst.setInt(5, Integer.parseInt(u.getCuenta_idCuenta()));
        pst.setInt(6, Integer.parseInt(u.getAsiento_idAsiento()));
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
    
    public boolean modificar(TransaccionClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="update transaccion set debeTransaccion=?, haberTransaccion=?, referenciaTransaccion=?, documentoTransaccion=?, Cuenta_idCuenta=?, Asiento_idAsiento=? where idTransaccion=?";
        pst = conn.prepareStatement(sql);
        
        
        pst.setDouble(1, Double.parseDouble(u.getDebeTransaccion()));
        pst.setDouble(2, Double.parseDouble(u.getHaberTransaccion()));
        pst.setString(3, u.getReferenciaTransaccion());
        pst.setString(4, u.getDocumentoTransaccion());
        pst.setInt(5, Integer.parseInt(u.getCuenta_idCuenta()));
        pst.setInt(6, Integer.parseInt(u.getAsiento_idAsiento()));
        pst.setInt(7, Integer.parseInt(u.getIdTransaccion()));
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
    
    
    public static LinkedList<TransaccionClass>  consultar() throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<TransaccionClass> listahistorial=new LinkedList<TransaccionClass>();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  Transaccion";
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        TransaccionClass r= new TransaccionClass();
        
        r.setIdTransaccion(rs.getString(1));
        r.setDebeTransaccion(rs.getString(2));
        r.setHaberTransaccion(rs.getString(3));
        r.setReferenciaTransaccion(rs.getString(4));
        r.setDocumentoTransaccion(rs.getString(5));
        r.setCuenta_idCuenta(rs.getString(6));
        r.setAsiento_idAsiento(rs.getString(7));
       
        listahistorial.add(r);
       }
   rs.close();
   st.close();
  return listahistorial;
}
    
    public static LinkedList<TransaccionClass>  consultarTransaccion(String id) throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<TransaccionClass> listahistorial=new LinkedList<TransaccionClass>();
   TransaccionClass aux= new TransaccionClass();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  transaccion where Asiento_idAsiento="+id;
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        TransaccionClass r= new TransaccionClass();
       r.setIdTransaccion(rs.getString(1));
        r.setDebeTransaccion(rs.getString(2));
        r.setHaberTransaccion(rs.getString(3));
        r.setReferenciaTransaccion(rs.getString(4));
        r.setDocumentoTransaccion(rs.getString(5));
        r.setCuenta_idCuenta(rs.getString(6));
        r.setAsiento_idAsiento(rs.getString(7));
        aux=r;
        listahistorial.add(r);
       }
   rs.close();
   st.close();
  return listahistorial;
 }
    
    
    public boolean eliminar(TransaccionClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="delete from transaccion where idTransaccion=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getIdTransaccion());
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
}
