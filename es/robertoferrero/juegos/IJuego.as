/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 17/01/2011 10:50
*/
package es.robertoferrero.juegos {
	import es.robertoferrero.juegos.assets.pantallas.IPantallaJuego;
	import es.robertoferrero.juegos.utils.lib.LibAssets;
	import flash.events.IEventDispatcher;
	//--
	public interface IJuego extends IEventDispatcher{
		// import es.robertoferrero.juegos.IJuego
		//--
		function init(_main:IMainJuego):void
		//function registrarPantalla(pantalla:IPantallaJuego):void
		function get assets():LibAssets
	}
}