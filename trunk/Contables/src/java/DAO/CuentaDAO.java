/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;


import Clases.CuentaClass;
import Conexion.Conexion;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;


/**
 *
 * @author User
 */
public class CuentaDAO {


    public static boolean Validar(String idTipo) throws InstantiationException, IllegalAccessException, SQLException, SQLException {        
    boolean status = false;
    PreparedStatement pst = null;
    ResultSet rs = null;
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
        String sql="select * from Cuenta where idCuenta=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, idTipo);
        rs = pst.executeQuery();
        status = rs.next();
    return status;
    }
    
    public boolean insertar(CuentaClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="insert into cuenta (numeroCuenta, descripcionCuenta, saldoInicialCuenta, saldoFinalCuenta, Cuenta_idCuenta, Tipo_idTipo) values (?, ?, ?, ?, ?, ?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, Integer.parseInt(u.getNumeroCuenta()));
        pst.setString(2, u.getDescripcionCuenta());
        pst.setString(3, u.getSaldoInicialCuenta());
        pst.setString(4, u.getSaldoFinalCuenta());
        pst.setInt(5, Integer.parseInt(u.getCuenta_idCuenta()));
        pst.setInt(6, Integer.parseInt(u.getTipo_idTipo()));
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

    public boolean modificar(CuentaClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="update Cuenta set (?, ?, ?, ?, ?, ?) where idTipo=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getNumeroCuenta());
        pst.setString(2, u.getDescripcionCuenta());
        pst.setString(3, u.getSaldoInicialCuenta());
        pst.setString(4, u.getSaldoFinalCuenta());
        pst.setString(5, u.getCuenta_idCuenta());
        pst.setString(6, u.getTipo_idTipo());
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
    public boolean eliminar(CuentaClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="delete from  Cuenta where idTipo=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getIdCuenta());
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
  public static LinkedList<CuentaClass>  consultar() throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<CuentaClass> listahistorial=new LinkedList<CuentaClass>();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  Cuenta";
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        CuentaClass r= new CuentaClass();
        r.setIdCuenta(rs.getString(1));
        r.setNumeroCuenta(rs.getString(2));
        r.setDescripcionCuenta(rs.getString(3));
        r.setSaldoInicialCuenta(rs.getString(4));
        r.setSaldoFinalCuenta(rs.getString(5));
        r.setCuenta_idCuenta(rs.getString(6));  
        r.setTipo_idTipo(rs.getString(7));        
        listahistorial.add(r);
       }
   rs.close();
   st.close();
  return listahistorial;
 }
    
}

