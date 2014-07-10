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
public class CuentaClass {
String idCuenta;
String numeroCuenta;
String descripcionCuenta;
String categoriaCuenta;
String saldoInicialCuenta;
String saldoFinalCuenta;
String Cuenta_idCuenta;
String Tipo_idTipo;

    public CuentaClass() {
    }

    public CuentaClass(String idCuenta, String numeroCuenta, String descripcionCuenta, String categoriaCuenta, String saldoInicialCuenta, String saldoFinalCuenta, String Cuenta_idCuenta, String Tipo_idTipo) {
        this.idCuenta = idCuenta;
        this.numeroCuenta = numeroCuenta;
        this.descripcionCuenta = descripcionCuenta;
        this.categoriaCuenta = categoriaCuenta;
        this.saldoInicialCuenta = saldoInicialCuenta;
        this.saldoFinalCuenta = saldoFinalCuenta;
        this.Cuenta_idCuenta = Cuenta_idCuenta;
        this.Tipo_idTipo = Tipo_idTipo;
    }
    public CuentaClass(String numeroCuenta, String descripcionCuenta, String categoriaCuenta, String saldoInicialCuenta, String saldoFinalCuenta, String Cuenta_idCuenta, String Tipo_idTipo) {
        this.numeroCuenta = numeroCuenta;
        this.descripcionCuenta = descripcionCuenta;
        this.categoriaCuenta = categoriaCuenta;
        this.saldoInicialCuenta = saldoInicialCuenta;
        this.saldoFinalCuenta = saldoFinalCuenta;
        this.Cuenta_idCuenta = Cuenta_idCuenta;
        this.Tipo_idTipo = Tipo_idTipo;
    }

    public String getCategoriaCuenta() {
        return categoriaCuenta;
    }

    public void setCategoriaCuenta(String categoriaCuenta) {
        this.categoriaCuenta = categoriaCuenta;
    }
    public String getIdCuenta() {
        return idCuenta;
    }

    public void setIdCuenta(String idCuenta) {
        this.idCuenta = idCuenta;
    }

    public String getNumeroCuenta() {
        return numeroCuenta;
    }

    public void setNumeroCuenta(String numeroCuenta) {
        this.numeroCuenta = numeroCuenta;
    }

    public String getDescripcionCuenta() {
        return descripcionCuenta;
    }

    public void setDescripcionCuenta(String descripcionCuenta) {
        this.descripcionCuenta = descripcionCuenta;
    }

    public String getSaldoInicialCuenta() {
        return saldoInicialCuenta;
    }

    public void setSaldoInicialCuenta(String saldoInicialCuenta) {
        this.saldoInicialCuenta = saldoInicialCuenta;
    }

    public String getSaldoFinalCuenta() {
        return saldoFinalCuenta;
    }

    public void setSaldoFinalCuenta(String saldoFinalCuenta) {
        this.saldoFinalCuenta = saldoFinalCuenta;
    }

    public String getCuenta_idCuenta() {
        return Cuenta_idCuenta;
    }

    public void setCuenta_idCuenta(String Cuenta_idCuenta) {
        this.Cuenta_idCuenta = Cuenta_idCuenta;
    }

    public String getTipo_idTipo() {
        return Tipo_idTipo;
    }

    public void setTipo_idTipo(String Tipo_idTipo) {
        this.Tipo_idTipo = Tipo_idTipo;
    }

}
