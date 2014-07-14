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
public class FacturaVentaClass {
String idFactura;
String numeroFactura;
String fechaFactura;
String autorizacionFactura;
String establecimientoFactura;
String puntoemisionFactura;
String descuentoFactura;
String Cliente_idCliente;
String IVA_idIVA;

    public FacturaVentaClass() {
    }

    public FacturaVentaClass(String idFactura, String numeroFactura, String fechaFactura, String autorizacionFactura, String establecimientoFactura, String puntoemisionFactura, String descuentoFactura, String Cliente_idCliente, String IVA_idIVA) {
        this.idFactura = idFactura;
        this.numeroFactura = numeroFactura;
        this.fechaFactura = fechaFactura;
        this.autorizacionFactura = autorizacionFactura;
        this.establecimientoFactura = establecimientoFactura;
        this.puntoemisionFactura = puntoemisionFactura;
        this.descuentoFactura = descuentoFactura;
        this.Cliente_idCliente = Cliente_idCliente;
        this.IVA_idIVA = IVA_idIVA;
    }
    public FacturaVentaClass( String numeroFactura, String fechaFactura, String autorizacionFactura, String establecimientoFactura, String puntoemisionFactura, String descuentoFactura, String Cliente_idCliente, String IVA_idIVA) {
        this.numeroFactura = numeroFactura;
        this.fechaFactura = fechaFactura;
        this.autorizacionFactura = autorizacionFactura;
        this.establecimientoFactura = establecimientoFactura;
        this.puntoemisionFactura = puntoemisionFactura;
        this.descuentoFactura = descuentoFactura;
        this.Cliente_idCliente = Cliente_idCliente;
        this.IVA_idIVA = IVA_idIVA;
    }
   
    public String getIdFactura() {
        return idFactura;
    }

    public void setIdFactura(String idFactura) {
        this.idFactura = idFactura;
    }

    public String getNumeroFactura() {
        return numeroFactura;
    }

    public void setNumeroFactura(String numeroFactura) {
        this.numeroFactura = numeroFactura;
    }

    public String getFechaFactura() {
        return fechaFactura;
    }

    public void setFechaFactura(String fechaFactura) {
        this.fechaFactura = fechaFactura;
    }

    public String getAutorizacionFactura() {
        return autorizacionFactura;
    }

    public void setAutorizacionFactura(String autorizacionFactura) {
        this.autorizacionFactura = autorizacionFactura;
    }

    public String getEstablecimientoFactura() {
        return establecimientoFactura;
    }

    public void setEstablecimientoFactura(String establecimientoFactura) {
        this.establecimientoFactura = establecimientoFactura;
    }

    public String getPuntoemisionFactura() {
        return puntoemisionFactura;
    }

    public void setPuntoemisionFactura(String puntoemisionFactura) {
        this.puntoemisionFactura = puntoemisionFactura;
    }

    public String getDescuentoFactura() {
        return descuentoFactura;
    }

    public void setDescuentoFactura(String descuentoFactura) {
        this.descuentoFactura = descuentoFactura;
    }

    public String getCliente_idCliente() {
        return Cliente_idCliente;
    }

    public void setCliente_idCliente(String Cliente_idCliente) {
        this.Cliente_idCliente = Cliente_idCliente;
    }

    public String getIVA_idIVA() {
        return IVA_idIVA;
    }

    public void setIVA_idIVA(String IVA_idIVA) {
        this.IVA_idIVA = IVA_idIVA;
    }

}
