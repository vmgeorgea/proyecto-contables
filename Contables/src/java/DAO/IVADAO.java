/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import Clases.IVAClass;
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
public class IVADAO {
    public static boolean Validar(String idTipo) throws InstantiationException, IllegalAccessException, SQLException, SQLException {        
    boolean status = false;
    PreparedStatement pst = null;
    ResultSet rs = null;
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
        String sql="select * from Iva where idCliente=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, idTipo);
        rs = pst.executeQuery();
        status = rs.next();
    return status;
    }
    
    public boolean insertar(IVAClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;        
        String sql="insert into Iva (valorIva) values (?)";
        pst = conn.prepareStatement(sql);        
        pst.setString(1, u.getValorIva());
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
    
    public boolean modificar(IVAClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="update iva set valorIva=? where idIva=?";
        pst = conn.prepareStatement(sql);       
        pst.setString(1, u.getValorIva());
        pst.setString(2, u.getIdIva());
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
    
    public static LinkedList<IVAClass>  consultar() throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<IVAClass> listahistorial=new LinkedList<IVAClass>();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  Iva";
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        IVAClass r= new IVAClass();        
        r.setIdIva(rs.getString(1));
        r.setValorIva(rs.getString(2));        
        listahistorial.add(r);
       }
   rs.close();
   st.close();
  return listahistorial;
}
     
    
        public boolean eliminar(IVAClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="delete from iva where idIva=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getIdIva());
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
        
   public IVAClass  consultariva(String u) throws InstantiationException, IllegalAccessException, SQLException{
   IVAClass r= new IVAClass(); 
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  Iva where idiva="+u;
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){               
        r.setIdIva(rs.getString(1));
        r.setValorIva(rs.getString(2));        
       }
   rs.close();
   st.close();
  return r;
}        
}
