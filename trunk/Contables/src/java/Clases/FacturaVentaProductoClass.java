/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Clases;

/**
 *
 * @author User
 */
public class FacturaVentaProductoClass {
String idProducto;
String idFactura;
String cantidadProducto;

    public FacturaVentaProductoClass() {
    }

    public FacturaVentaProductoClass(String idProducto, String idFactura, String cantidadProducto) {
        this.idProducto = idProducto;
        this.idFactura = idFactura;
        this.cantidadProducto = cantidadProducto;
    }

    public String getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(String idProducto) {
        this.idProducto = idProducto;
    }

    public String getIdFactura() {
        return idFactura;
    }

    public void setIdFactura(String idFactura) {
        this.idFactura = idFactura;
    }

    public String getCantidadProducto() {
        return cantidadProducto;
    }

    public void setCantidadProducto(String cantidadProducto) {
        this.cantidadProducto = cantidadProducto;
    }

}
