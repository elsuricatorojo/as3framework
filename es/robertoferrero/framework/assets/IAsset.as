/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 22/02/2011 12:18
*/
package es.robertoferrero.framework.assets {
	import flash.events.IEventDispatcher;
	//--
	public interface IAsset extends IEventDispatcher {
		function get inicializado():Boolean
		function getCopy():Object
	}
}