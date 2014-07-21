/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO;

import Clases.KardexClass;
import Conexion.Conexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

/**
 *
 * @author User
 */
public class KardexDAO {
  public LinkedList<KardexClass>  consultar(String id) throws InstantiationException, IllegalAccessException, SQLException{
   LinkedList<KardexClass> listahistorial=new LinkedList<KardexClass>();
   Conexion c=new Conexion();
   Connection conn=c.getConexion();
   Statement st = conn.createStatement();
   String sql="(select fc.fechafactura, fcp.idfactura,'compra' ,fcp.cantidadproducto,   p.precioproducto FROM facturacompraproducto fcp, facturacompra fc, producto p where fcp.idfactura=fc.idfactura and p.idproducto=fcp.idproducto and p.idproducto="+id+") union (select fv.fechafactura, fvp.idfactura,'venta', fvp.cantidadproducto,  p.precioproducto FROM facturaventaproducto fvp, facturaventa fv, producto p where fvp.idfactura=fv.idfactura and p.idproducto=fvp.idproducto and p.idproducto="+id+") order by fechafactura, idfactura desc";
   ResultSet rs = st.executeQuery(sql);
       while(rs.next()){
        KardexClass r= new KardexClass();
        r.setFecha(rs.getString(1));
        r.setIdfactura(rs.getString(2));
        r.setDetalle(rs.getString(3));
        r.setCantidad(rs.getString(4));
        r.setPrecio(rs.getString(5));
        listahistorial.add(r);
       }
   rs.close();
   st.close();
  return listahistorial;
 }   
}
