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
public class IVAClass {
String idIva;
String valorIva;    

    public IVAClass() {
    }

    public IVAClass(String idIva, String valorIva) {
        this.idIva = idIva;
        this.valorIva = valorIva;
    }

    public String getIdIva() {
        return idIva;
    }

    public void setIdIva(String idIva) {
        this.idIva = idIva;
    }

    public String getValorIva() {
        return valorIva;
    }

    public void setValorIva(String valorIva) {
        this.valorIva = valorIva;
    }

}
