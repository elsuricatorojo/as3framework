/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 25/01/2011 18:02
*/
package es.robertoferrero.juegos.assets.pantallas {
	import es.robertoferrero.juegos.IJuego;
	import flash.events.IEventDispatcher;
	//--
	public interface IPantallaJuego extends IEventDispatcher {
		// import es.robertoferrero.juegos.assets.pantallas.IPantallaJuego
		function init(_juego:IJuego, id:String):void
		function get pantallaId():String
	}
}