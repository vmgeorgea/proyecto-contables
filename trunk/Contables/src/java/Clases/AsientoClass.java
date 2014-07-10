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
public class AsientoClass {
    
    String idAsiento;
    String numeroDiario;
    String periodoAsiento;
    String fechaAsiento;
    String numeroAsiento;
    String conceptoAsiento;
    String debeAsiento;
    String haberAsiento;

    public AsientoClass() {
    }

    public AsientoClass(String idAsiento, String numeroDiario, String periodoAsiento, String fechaAsiento, String numeroAsiento, String conceptoAsiento, String debeAsiento, String haberAsiento) {
        this.idAsiento = idAsiento;
        this.numeroDiario = numeroDiario;
        this.periodoAsiento = periodoAsiento;
        this.fechaAsiento = fechaAsiento;
        this.numeroAsiento = numeroAsiento;
        this.conceptoAsiento = conceptoAsiento;
        this.debeAsiento = debeAsiento;
        this.haberAsiento = haberAsiento;
    }
    public AsientoClass(String numeroDiario, String periodoAsiento, String fechaAsiento, String numeroAsiento, String conceptoAsiento, String debeAsiento, String haberAsiento) {
        this.numeroDiario = numeroDiario;
        this.periodoAsiento = periodoAsiento;
        this.fechaAsiento = fechaAsiento;
        this.numeroAsiento = numeroAsiento;
        this.conceptoAsiento = conceptoAsiento;
        this.debeAsiento = debeAsiento;
        this.haberAsiento = haberAsiento;
    }
    

    public String getIdAsiento() {
        return idAsiento;
    }

    public void setIdAsiento(String idAsiento) {
        this.idAsiento = idAsiento;
    }

    public String getNumeroDiario() {
        return numeroDiario;
    }

    public void setNumeroDiario(String numeroDiario) {
        this.numeroDiario = numeroDiario;
    }

    public String getPeriodoAsiento() {
        return periodoAsiento;
    }

    public void setPeriodoAsiento(String periodoAsiento) {
        this.periodoAsiento = periodoAsiento;
    }

    public String getFechaAsiento() {
        return fechaAsiento;
    }

    public void setFechaAsiento(String fechaAsiento) {
        this.fechaAsiento = fechaAsiento;
    }

    public String getNumeroAsiento() {
        return numeroAsiento;
    }

    public void setNumeroAsiento(String nuemroAsiento) {
        this.numeroAsiento = nuemroAsiento;
    }

    public String getConceptoAsiento() {
        return conceptoAsiento;
    }

    public void setConceptoAsiento(String conceptoAsiento) {
        this.conceptoAsiento = conceptoAsiento;
    }

    public String getDebeAsiento() {
        return debeAsiento;
    }

    public void setDebeAsiento(String debeAsiento) {
        this.debeAsiento = debeAsiento;
    }

    public String getHaberAsiento() {
        return haberAsiento;
    }

    public void setHaberAsiento(String haberAsiento) {
        this.haberAsiento = haberAsiento;
    }
    
    
}
