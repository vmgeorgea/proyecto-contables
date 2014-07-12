/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var miCalendario = null;
//Una instancia de un emergente para el ejemplo
var emergeCalendario = null;
//Una instancia para el formulario de envío de datos
var miForm = null;
window.onload = function() {

    // EJEMPLO DEL CALENDARIO --------------------------------

    //Creamos el primer emergente para el calendario
    emergeCalendario = new formEmerge("emergeCalendario", "Calendario",
            true, 2, "marco");
    //Componemos un interior para ubicar el calendario
    var html = "<div class='previo-cal'>" +
    "<input type='button' value='&lt;' " +
    "onclick = 'miCalendario.mueveCalendar(-1)' />" +
    "<input type='text' id='ubica-titulo' value='' size='8' " +
    "onfocus = 'miCalendario.entraFecha(this)' " +
    "onblur = 'miCalendario.mueveMesAnyo(this)' />" +
    "<input type='button' value='&gt;' " +
    "onclick = 'miCalendario.mueveCalendar(1)' />" +
    "</div>" +
    "<div id='ubica-calendario'></div>";
    //Ponemos esa composición en el interior del emergente
    emergeCalendario.nuevoInterior(html);
    //Establecemos el cuadro de fecha como objeto respuesta.
    emergeCalendario.idObjetoRespuesta = "cuadro-fecha";
    //Cuando se abra el calendario, situamos la fecha del cuadro
    emergeCalendario.eventoAbrir = true;
    emergeCalendario.ejecutaEventoAbrir = function (){
        //Construimos la hoja del calendario según la fecha del objeto
        //respuesta. Si no es válida o está en blanco ponemos la fecha
        //actual. compruebaFecha() y fechaActual() son dos funciones
        //globales de calendar.js
        var fecha = "";
        var arrFecha = compruebaFecha(emergeCalendario.respuesta);
        if (arrFecha == null) {
            fecha = fechaActual()[4];
            emergeCalendario.respuesta = fecha;
        } else {
            fecha = arrFecha[3]
        }
        miCalendario.situaFecha(fecha);
    }
    //Cuando pulsemos aceptar extraemos la fecha del calendario
    emergeCalendario.eventoAceptar = true;
    emergeCalendario.ejecutaEventoAceptar = function(){
         emergeCalendario.respuesta = miCalendario.devuelveFecha("fecha-larga");
    }
    //Creamos un objeto calendario, pero no construimos inicialmente
    //ninguna hoja de calendario, pues esto se hará con el evento abrir
    //del emergente que llama al método situaFecha() del calendario que
    //creará la hoja de ese mes y fecha.
    var hoy = fechaActual();
    var fechaHoy = hoy[1]+"/"+hoy[2]+"/"+hoy[3];
    miCalendario = new calendar("miCalendario", "ubica-calendario",
            "ubica-titulo", fechaHoy, true);
}


