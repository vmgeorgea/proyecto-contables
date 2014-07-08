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
public class TipoClass {
String idTipo;
String nombreTipo;

    public TipoClass() {
    }

    public TipoClass(String nombreTipo) {
        this.nombreTipo = nombreTipo;
    }

    public TipoClass(String idTipo, String nombreTipo) {
        this.idTipo = idTipo;
        this.nombreTipo = nombreTipo;
    }
    

    public String getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(String idTipo) {
        this.idTipo = idTipo;
    }

    public String getNombreTipo() {
        return nombreTipo;
    }

    public void setNombreTipo(String nombreTipo) {
        this.nombreTipo = nombreTipo;
    }

        

}
