/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class Conexion {
private Connection con = null;
 public Conexion() throws InstantiationException, IllegalAccessException, SQLException {
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd", "root","johana");
    } catch (ClassNotFoundException ex) {
        Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
    }
 }
 
 public Connection getConexion(){
  return con;
 }
 
 public void cerrarConexion(){
  try {
   con.close();
  } catch (SQLException e) {
   e.printStackTrace();
  }
 }  
}
