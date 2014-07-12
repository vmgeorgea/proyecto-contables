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
public class ProveedorClass {
    
    String idProveedor;
    String identificacionProveedor;
    String nombreProveedor;
    String direccionProveedor;
    String telefonoProveedor;
    String autorizacionProveedor;
    String fechaCaducidadAutorizacionProveedor;
    String tipoProveedor;

    public ProveedorClass() {
    }

    public ProveedorClass(String idProveedor, String identificacionProveedor, String nombreProveedor, String direccionProveedor, String telefonoProveedor, String autorizacionProveedor, String fechaCaducidadAutorizacionProveedor, String tipoProveedor) {
        this.idProveedor = idProveedor;
        this.identificacionProveedor = identificacionProveedor;
        this.nombreProveedor = nombreProveedor;
        this.direccionProveedor = direccionProveedor;
        this.telefonoProveedor = telefonoProveedor;
        this.autorizacionProveedor = autorizacionProveedor;
        this.fechaCaducidadAutorizacionProveedor = fechaCaducidadAutorizacionProveedor;
        this.tipoProveedor = tipoProveedor;
    }

    public ProveedorClass(String identificacionProveedor, String nombreProveedor, String direccionProveedor, String telefonoProveedor, String autorizacionProveedor, String fechaCaducidadAutorizacionProveedor, String tipoProveedor) {
        this.identificacionProveedor = identificacionProveedor;
        this.nombreProveedor = nombreProveedor;
        this.direccionProveedor = direccionProveedor;
        this.telefonoProveedor = telefonoProveedor;
        this.autorizacionProveedor = autorizacionProveedor;
        this.fechaCaducidadAutorizacionProveedor = fechaCaducidadAutorizacionProveedor;
        this.tipoProveedor = tipoProveedor;
    }

    public String getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(String idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getIdentificacionProveedor() {
        return identificacionProveedor;
    }

    public void setIdentificacionProveedor(String identificacionProveedor) {
        this.identificacionProveedor = identificacionProveedor;
    }

    public String getNombreProveedor() {
        return nombreProveedor;
    }

    public void setNombreProveedor(String nombreProveedor) {
        this.nombreProveedor = nombreProveedor;
    }

    public String getDireccionProveedor() {
        return direccionProveedor;
    }

    public void setDireccionProveedor(String direccionProveedor) {
        this.direccionProveedor = direccionProveedor;
    }

    public String getTelefonoProveedor() {
        return telefonoProveedor;
    }

    public void setTelefonoProveedor(String telefonoProveedor) {
        this.telefonoProveedor = telefonoProveedor;
    }

    public String getAutorizacionProveedor() {
        return autorizacionProveedor;
    }

    public void setAutorizacionProveedor(String autorizacionProveedor) {
        this.autorizacionProveedor = autorizacionProveedor;
    }

    public String getFechaCaducidadAutorizacionProveedor() {
        return fechaCaducidadAutorizacionProveedor;
    }

    public void setFechaCaducidadAutorizacionProveedor(String fechaCaducidadAutorizacionProveedor) {
        this.fechaCaducidadAutorizacionProveedor = fechaCaducidadAutorizacionProveedor;
    }

    public String getTipoProveedor() {
        return tipoProveedor;
    }

    public void setTipoProveedor(String tipoProveedor) {
        this.tipoProveedor = tipoProveedor;
    }

   
    
}
