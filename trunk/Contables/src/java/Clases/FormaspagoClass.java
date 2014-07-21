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
public class FormaspagoClass {
String idformaspago;
String descripcionformaspago;
String idcuenta;

    public String getIdcuenta() {
        return idcuenta;
    }

    public void setIdcuenta(String idcuenta) {
        this.idcuenta = idcuenta;
    }


    public FormaspagoClass() {
    }

    public FormaspagoClass(String descripcionformaspago, String idcuenta) {
        this.descripcionformaspago = descripcionformaspago;
        this.idcuenta = idcuenta;
    }

    public String getIdformaspago() {
        return idformaspago;
    }

    public void setIdformaspago(String idformaspago) {
        this.idformaspago = idformaspago;
    }

    public String getDescripcionformaspago() {
        return descripcionformaspago;
    }

    public void setDescripcionformaspago(String descripcionformaspago) {
        this.descripcionformaspago = descripcionformaspago;
    }


        

}
