/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;


import Clases.TipoClass;
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
public class TipoDAO {


    public static boolean Validar(String idTipo) throws InstantiationException, IllegalAccessException, SQLException, SQLException {        
    boolean status = false;
    PreparedStatement pst = null;
    ResultSet rs = null;
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
        String sql="select * from tipo where idTipo=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, idTipo);
        rs = pst.executeQuery();
        status = rs.next();
    return status;
    }
    
    public boolean insertar(TipoClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="insert into tipo (nombreTipo) values (?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getNombreTipo());
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

    public boolean modificar(TipoClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="update tipo set (?) where idTipo=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getNombreTipo());
        pst.setString(2, u.getIdTipo());
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
    public boolean eliminar(TipoClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="delete from  tipo where idTipo=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getIdTipo());
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
  public static LinkedList<TipoClass>  consultar(String usuario) throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<TipoClass> listahistorial=new LinkedList<TipoClass>();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  tipo";
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        TipoClass r= new TipoClass();
        r.setIdTipo(rs.getString(3));
        r.setNombreTipo(rs.getString(4));
        listahistorial.add(r);
       }
   rs.close();
   st.close();
  return listahistorial;
 }
    
}

