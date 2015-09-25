/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 20/04/2009 13:22
*/
// INTERFACE:
package es.robertoferrero.framework.loaders {
	//--
	import flash.events.IEventDispatcher
	import es.robertoferrero.framework.loaders.eventos.EventoCarga;
	//--
	public interface Cargador extends IEventDispatcher {
		// es.robertoferrero.framework.loaders.Cargador
		function init():void;
		function onIniciarCarga(evento:EventoCarga):void
		function get cargaId():String;
		function get tipocarga():String;
		function get path():String;
		function set path(valor:String):void;
	}
}