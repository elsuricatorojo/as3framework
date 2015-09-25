/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 21/01/2011 10:55
*/
package es.robertoferrero.juegos{
	import es.robertoferrero.framework.loaders.Buffer;
	import es.robertoferrero.juegos.utils.lib.LibAssets;
	import es.robertoferrero.juegos.utils.lib.LibParams;
	import es.robertoferrero.juegos.utils.lib.LibPaths;
	import flash.events.IEventDispatcher;
	//--
	public interface IMainJuego extends IEventDispatcher {
		// import es.robertoferrero.juegos.IMainJuego
		//--
		function get_params():LibParams
		function get_paths():LibPaths
		function get_assets():LibAssets
		function get_cargadorInicial():Buffer
		function get_cargadorAssets():Buffer
		function get_mainConfigXML():XML
	}
}