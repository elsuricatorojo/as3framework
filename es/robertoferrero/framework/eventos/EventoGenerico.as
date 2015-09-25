/*
DOCUMENTACION:
* Roberto Ferrero - roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 01/08/2011 12:29
*/
package es.robertoferrero.framework.eventos{
	//---------------------------
	// IMPORTS del Package:
	import flash.events.Event;
	//---------------------------
	// CLASSES del Package:
	public class EventoGenerico extends Event{
		// import es.robertoferrero.framework.eventos.EventoGenerico
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		public var tipo:String
		public var data:Object
		//------------
		// CONSTRUCTORA:
		public function EventoGenerico(type:String, _data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false){ 
			tipo = type
			data = _data
			super(type, bubbles, cancelable);
		} 
		//------------
		// OVERRIDES:
		public override function clone():Event{ 
			return new EventoGenerico(type, data, bubbles, cancelable);
		} 
		
		public override function toString():String{ 
			return formatToString("EventoGenerico", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}