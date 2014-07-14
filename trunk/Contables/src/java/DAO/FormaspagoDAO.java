/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;


import Clases.FormaspagoClass;
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
public class FormaspagoDAO {


    public static boolean Validar(String idTipo) throws InstantiationException, IllegalAccessException, SQLException, SQLException {        
    boolean status = false;
    PreparedStatement pst = null;
    ResultSet rs = null;
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
        String sql="select * from formapago where idformapago=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, idTipo);
        rs = pst.executeQuery();
        status = rs.next();
    return status;
    }
    
    public boolean insertar(FormaspagoClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="insert into formaspago (descripcionformapago) values (?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getDescripcionformaspago());
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

    public boolean modificar(FormaspagoClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="update formaspago set descripcionformapago=? where idformapago=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getDescripcionformaspago());
        pst.setString(2, u.getIdformaspago());
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
    public boolean eliminar(FormaspagoClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="delete from  formaspago where idformapago=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getIdformaspago());
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
  public static LinkedList<FormaspagoClass>  consultar() throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<FormaspagoClass> listahistorial=new LinkedList<FormaspagoClass>();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  formaspago";
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        FormaspagoClass r= new FormaspagoClass();
        r.setIdformaspago(rs.getString(1));
        r.setDescripcionformaspago(rs.getString(2));
        listahistorial.add(r);
       }
   rs.close();
   st.close();
  return listahistorial;
 }
    
}

