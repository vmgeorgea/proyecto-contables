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
public class TransaccionClass {
    
    String idTransaccion;
    String debeTransaccion;
    String haberTransaccion;
    String referenciaTransaccion;
    String documentoTransaccion;
    String Cuenta_idCuenta;
    String Asiento_idAsiento;

    public TransaccionClass() {
    }

    public TransaccionClass(String idTransaccion, String debeTransaccion, String haberTransaccion, String referenciaTransaccion, String documentoTransaccion, String Cuenta_idCuenta, String Asiento_idAsiento) {
        this.idTransaccion = idTransaccion;
        this.debeTransaccion = debeTransaccion;
        this.haberTransaccion = haberTransaccion;
        this.referenciaTransaccion = referenciaTransaccion;
        this.documentoTransaccion = documentoTransaccion;
        this.Cuenta_idCuenta = Cuenta_idCuenta;
        this.Asiento_idAsiento = Asiento_idAsiento;
    }
    public TransaccionClass(String debeTransaccion, String haberTransaccion, String referenciaTransaccion, String documentoTransaccion, String Cuenta_idCuenta, String Asiento_idAsiento) {
        
        this.debeTransaccion = debeTransaccion;
        this.haberTransaccion = haberTransaccion;
        this.referenciaTransaccion = referenciaTransaccion;
        this.documentoTransaccion = documentoTransaccion;
        this.Cuenta_idCuenta = Cuenta_idCuenta;
        this.Asiento_idAsiento = Asiento_idAsiento;
    }
    
    
    public String getIdTransaccion() {
        return idTransaccion;
    }

    public void setIdTransaccion(String idTransaccion) {
        this.idTransaccion = idTransaccion;
    }

    public String getDebeTransaccion() {
        return debeTransaccion;
    }

    public void setDebeTransaccion(String debeTransaccion) {
        this.debeTransaccion = debeTransaccion;
    }

    public String getHaberTransaccion() {
        return haberTransaccion;
    }

    public void setHaberTransaccion(String haberTransaccion) {
        this.haberTransaccion = haberTransaccion;
    }

    public String getReferenciaTransaccion() {
        return referenciaTransaccion;
    }

    public void setReferenciaTransaccion(String referenciaTransaccion) {
        this.referenciaTransaccion = referenciaTransaccion;
    }

    public String getDocumentoTransaccion() {
        return documentoTransaccion;
    }

    public void setDocumentoTransaccion(String documentoTransaccion) {
        this.documentoTransaccion = documentoTransaccion;
    }

    public String getCuenta_idCuenta() {
        return Cuenta_idCuenta;
    }

    public void setCuenta_idCuenta(String Cuenta_idCuenta) {
        this.Cuenta_idCuenta = Cuenta_idCuenta;
    }

    public String getAsiento_idAsiento() {
        return Asiento_idAsiento;
    }

    public void setAsiento_idAsiento(String Asiento_idAsiento) {
        this.Asiento_idAsiento = Asiento_idAsiento;
    }
    
    
    
}
