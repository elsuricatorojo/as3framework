/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 21/01/2011 10:31
*/
package es.robertoferrero.juegos.assets.intros {
	import es.robertoferrero.juegos.IMainJuego;
	import flash.events.IEventDispatcher;
	//--
	public interface IIntroInicio extends IEventDispatcher {
		// import es.robertoferrero.juegos.assets.intros.IIntroInicio
		//--
		function init(_main:IMainJuego):void
	}
}