/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 03/02/2011 10:58
*/
package es.robertoferrero.juegos.assets.menus.eventos {
	//---------------------------
	// IMPORTS del Package:
	import flash.events.Event;
	//---------------------------
	// CLASSES del Package:
	public class EventoMenuJuego extends Event {
		// import es.robertoferrero.juegos.assets.menus.eventos.EventoMenuJuego
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		public static const MENU_INIT:String = "menuInit";
		public static const OPCION_SELECCIONADA:String = "opcionSeleccionada";
		//--
		public var opcionId:String
		//------------
		// CONSTRUCTORA:
		public function EventoMenuJuego(type:String, opcionId:String, bubbles:Boolean = false, cancelable:Boolean = false) { 
			this.opcionId = opcionId
			super(type, bubbles, cancelable);
			
		} 
		public override function clone():Event { 
			return new EventoMenuJuego(type, opcionId, bubbles, cancelable);
		} 
		
		public override function toString():String	{ 
			return formatToString("EventoMenuJuego", "opcionId", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}