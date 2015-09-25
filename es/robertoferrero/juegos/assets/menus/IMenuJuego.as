/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 25/01/2011 18:02
*/
package es.robertoferrero.juegos.assets.menus {
	import es.robertoferrero.juegos.assets.menus.datos.DataOpcionMenu;
	import es.robertoferrero.juegos.IMainJuego;
	import flash.events.IEventDispatcher;
	//--
	public interface IMenuJuego extends IEventDispatcher{
		function init(_main:IMainJuego):void
		function getOpciones():DataOpcionMenu
	}
}