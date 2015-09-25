/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 21/01/2011 11:03
*/
package es.robertoferrero.juegos.assets.precargas {
	import flash.events.IEventDispatcher;
	import es.robertoferrero.juegos.IMainJuego;
	//--
	public interface IPrecargaInicio extends IEventDispatcher {
		// import es.robertoferrero.juegos.assets.precargas.IPrecargaInicio
		//--
		function init(_main:IMainJuego):void
	}
}