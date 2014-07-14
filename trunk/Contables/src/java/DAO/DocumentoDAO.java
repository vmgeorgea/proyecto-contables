/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import Clases.DocumentoClass;
import Clases.TipoClass;
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
public class DocumentoDAO {
    
    public static boolean Validar(String idTipo) throws InstantiationException, IllegalAccessException, SQLException, SQLException {        
    boolean status = false;
    PreparedStatement pst = null;
    ResultSet rs = null;
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
        String sql="select * from documento where idDocumento=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, idTipo);
        rs = pst.executeQuery();
        status = rs.next();
    return status;
    }
    
    public boolean insertar(DocumentoClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="insert into documento (descripciondocumento) values (?, )";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getDescripciondocumento());
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
    
    public boolean modificar(DocumentoClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="update documento set descripciondocumento=? where iddocumento=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getDescripciondocumento());
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
    
   public static LinkedList<DocumentoClass>  consultar() throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<DocumentoClass> listahistorial=new LinkedList<DocumentoClass>();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="select * from  documento";
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        DocumentoClass r= new DocumentoClass();
        r.setIddocumento(rs.getString(1));
        r.setDescripciondocumento(rs.getString(2));
        listahistorial.add(r);
       }
   rs.close();
   st.close();
  return listahistorial;
}
    public DocumentoClass consultardocumento(String idTipo) throws InstantiationException, IllegalAccessException, SQLException, SQLException {        
    DocumentoClass r= new DocumentoClass();
    PreparedStatement pst = null;
    ResultSet rs = null;
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
        String sql="select * from documento where cedula=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, idTipo);
        rs = pst.executeQuery();
            while(rs.next()){
            r.setIddocumento(rs.getString(1));
            r.setDescripciondocumento(rs.getString(2));
            }    
      return r;   
    }
    
   public boolean eliminar(DocumentoClass u) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{       
    boolean agregado=false;
      try {
       Conexion c=new Conexion();
       Connection conn=c.getConexion();
       if(conn!=null){
        PreparedStatement pst = null;
        String sql="delete from  documento where iddocumento=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, u.getIddocumento());
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
