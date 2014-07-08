/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    
    function ValNumeros(variable){
        Numer=parseInt(variable);
        if (isNaN(Numer)){
            return "";
        }
        return Numer;
    }
    function ValidarNumeros(Control){
        Control.value=ValNumerico(Control.value);
    }

    function ValidarLetras(idcampo) {
    var cadena = document.getElementById(idcampo).value;
    var exp_reg  = /^[a-z\u00C0-\u00ff]+$/i;
    var verifica = exp_reg.test(cadena);
        if (verifica == true){
        return cadena
        }else {
        return "";
        }
    }
