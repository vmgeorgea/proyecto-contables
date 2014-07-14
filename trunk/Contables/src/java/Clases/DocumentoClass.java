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
public class DocumentoClass {
    
    String iddocumento;	
    String descripciondocumento;

    public DocumentoClass() {
    }

    public DocumentoClass(String descripciondocumento) {
        this.descripciondocumento = descripciondocumento;
    }

    public String getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(String iddocumento) {
        this.iddocumento = iddocumento;
    }

    public String getDescripciondocumento() {
        return descripciondocumento;
    }

    public void setDescripciondocumento(String descripiciondocumento) {
        this.descripciondocumento = descripiciondocumento;
    }

  

    
}
