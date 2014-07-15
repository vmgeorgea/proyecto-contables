/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import Clases.AsientoClass;
import Clases.CuentaClass;
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
public class AsientoDAO {
    
      public static boolean Validar(String idTipo) throws InstantiationException, IllegalAccessException, SQLException, SQLException {        
    boolean status = false;
    PreparedStatement pst = null;
    ResultSet rs = null;
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
        String sql="select * from Cuenta where idAsiento=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, idTipo);
        rs = pst.executeQuery();
        status = rs.next();
    return status;
    }
    
    public boolean insertar(AsientoClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="insert into asiento (numeroDiario, periodoAsiento, fechaAsiento, numeroAsiento, conceptoAsiento, debeAsiento, haberAsiento) values (?, ?, ?, ?, ?, ?, ?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getNumeroDiario());
        pst.setString(2, u.getPeriodoAsiento());
        pst.setString(3, u.getFechaAsiento());
        pst.setInt(4, Integer.parseInt(u.getNumeroAsiento()));
        pst.setString(5, u.getConceptoAsiento());
        pst.setDouble(6, Double.parseDouble(u.getDebeAsiento()));
        pst.setDouble(7, Double.parseDouble(u.getHaberAsiento()));
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

    public boolean modificar(AsientoClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="update asiento set numeroDiario=?, periodoAsiento=?, fechaAsiento=?, numeroAsiento=?, conceptoAsiento=?, debeAsiento=?, haberAsiento=? where idAsiento=?";
        pst = conn.prepareStatement(sql);
        
        pst.setString(1, u.getNumeroDiario());
        pst.setString(2, u.getPeriodoAsiento());
        pst.setString(3, u.getFechaAsiento());
        pst.setInt(4, Integer.parseInt(u.getNumeroAsiento()));
        pst.setString(5, u.getConceptoAsiento());
        pst.setDouble(6, Double.parseDouble(u.getDebeAsiento()));
        pst.setDouble(7, Double.parseDouble(u.getHaberAsiento()));
        pst.setInt(8, Integer.parseInt(u.getIdAsiento()));
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
    public boolean eliminar(AsientoClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="delete from asiento where idAsiento=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getIdAsiento());
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
  public static LinkedList<AsientoClass>  consultar() throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<AsientoClass> listahistorial=new LinkedList<AsientoClass>();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  asiento";
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        AsientoClass r= new AsientoClass();
        r.setIdAsiento(rs.getString(1));
        r.setNumeroDiario(rs.getString(2));
        r.setPeriodoAsiento(rs.getString(3));
        r.setFechaAsiento(rs.getString(4));
        r.setNumeroAsiento(rs.getString(5));
        r.setConceptoAsiento(rs.getString(6));
        r.setDebeAsiento(rs.getString(7));
        r.setHaberAsiento(rs.getString(8));
        listahistorial.add(r);
       }
   rs.close();
   st.close();
  return listahistorial;
 }
    
  public static AsientoClass  consultarAsiento(String id) throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<AsientoClass> listahistorial=new LinkedList<AsientoClass>();
   AsientoClass aux= new AsientoClass();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  asiento where idAsiento="+id;
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        AsientoClass r= new AsientoClass();
        r.setIdAsiento(rs.getString(1));
        r.setNumeroDiario(rs.getString(2));
        r.setPeriodoAsiento(rs.getString(3));
        r.setFechaAsiento(rs.getString(4));
        r.setNumeroAsiento(rs.getString(5));
        r.setConceptoAsiento(rs.getString(6));
        r.setDebeAsiento(rs.getString(7));
        r.setHaberAsiento(rs.getString(8));
        aux=r;
        listahistorial.add(r);
       }
   rs.close();
   st.close();
  return aux;
 }
  
    public static AsientoClass  consultarfecha(String fecha) throws InstantiationException, IllegalAccessException, SQLException{
   AsientoClass aux= new AsientoClass();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  asiento where fechaAsiento='"+fecha+"'";
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        AsientoClass r= new AsientoClass();
        r.setIdAsiento(rs.getString(1));
        r.setNumeroDiario(rs.getString(2));
        r.setPeriodoAsiento(rs.getString(3));
        r.setFechaAsiento(rs.getString(4));
        r.setNumeroAsiento(rs.getString(5));
        r.setConceptoAsiento(rs.getString(6));
        r.setDebeAsiento(rs.getString(7));
        r.setHaberAsiento(rs.getString(8));
        aux=r;
       }
   rs.close();
   st.close();
  return aux;
 }

    public static AsientoClass  consultarnumerodiario(String numerodiario, String fecha) throws InstantiationException, IllegalAccessException, SQLException{
   AsientoClass aux= new AsientoClass();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  asiento where fechaAsiento='"+fecha+"' and numeroasiento='"+numerodiario+"'";
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        AsientoClass r= new AsientoClass();
        r.setIdAsiento(rs.getString(1));
        r.setNumeroDiario(rs.getString(2));
        r.setPeriodoAsiento(rs.getString(3));
        r.setFechaAsiento(rs.getString(4));
        r.setNumeroAsiento(rs.getString(5));
        r.setConceptoAsiento(rs.getString(6));
        r.setDebeAsiento(rs.getString(7));
        r.setHaberAsiento(rs.getString(8));
        aux=r;
       }
   rs.close();
   st.close();
  return aux;
 }    
  
}
