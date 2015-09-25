/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 10/02/2011 11:45
*/
package es.robertoferrero.framework.assets.paneles.eventos {
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.assets.paneles.datos.DataPanel;
	import flash.events.Event;
	//---------------------------
	// CLASSES del Package:
	public class EventoPanel extends Event {
		//------------
		// PARAMETROS:
		public static const ACTUALIZADO:String = "actualizado";
		public static const INICIALIZADO:String = "inicializado";
		public static const DRAG_INICIADO:String = "dragIniciado";
		public static const DRAG_FINALIZADO:String = "dragFinalizado";
		//--
		public var data:DataPanel
		//------------
		// CONSTRUCTORA:
		public function EventoPanel(type:String, data:DataPanel, bubbles:Boolean=false, cancelable:Boolean=false) 	{ 
			this.data = data
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event	{ 
			return new EventoPanel(type, data, bubbles, cancelable);
		} 
		
		public override function toString():String 	{ 
			return formatToString("EventoPanel", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}