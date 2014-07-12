/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Clases;

/**
 *
 * @author Leitos
 */
public class ProductoClass {
    
    String idProducto;
    String nombreProducto;
    String costoProducto;
    String precioProducto;
    String stockProducto;
    String impuestoProducto;

    public ProductoClass() {
    }

    public ProductoClass(String idProducto, String nombreProducto, String costoProducto, String precioProducto, String stockProducto, String impuestoProducto) {
        this.idProducto = idProducto;
        this.nombreProducto = nombreProducto;
        this.costoProducto = costoProducto;
        this.precioProducto = precioProducto;
        this.stockProducto = stockProducto;
        this.impuestoProducto = impuestoProducto;
    }

    public ProductoClass(String nombreProducto, String costoProducto, String precioProducto, String stockProducto, String impuestoProducto) {
        this.nombreProducto = nombreProducto;
        this.costoProducto = costoProducto;
        this.precioProducto = precioProducto;
        this.stockProducto = stockProducto;
        this.impuestoProducto = impuestoProducto;
    }

    public String getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(String idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getCostoProducto() {
        return costoProducto;
    }

    public void setCostoProducto(String costoProducto) {
        this.costoProducto = costoProducto;
    }

    public String getPrecioProducto() {
        return precioProducto;
    }

    public void setPrecioProducto(String precioProducto) {
        this.precioProducto = precioProducto;
    }

    public String getStockProducto() {
        return stockProducto;
    }

    public void setStockProducto(String stockProducto) {
        this.stockProducto = stockProducto;
    }

    public String getImpuestoProducto() {
        return impuestoProducto;
    }

    public void setImpuestoProducto(String impuestoProducto) {
        this.impuestoProducto = impuestoProducto;
    }
    
    
}
