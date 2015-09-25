/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 07/02/2011 12:28
*/
package es.robertoferrero.framework.assets.sliders.eventos {
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.framework.assets.sliders.datos.DataSlider;
	import flash.events.Event;
	//---------------------------
	// CLASSES del Package:
	public class EventoSlider extends Event {
		//------------
		// PARAMETROS:
		public static const ACTUALIZADO:String = "actualizado";
		public static const INICIALIZADO:String = "inicializado";
		public static const DRAG_INICIADO:String = "dragIniciado";
		public static const DRAG_FINALIZADO:String = "dragFinalizado";
		//--
		public var data:DataSlider
		//------------
		// CONSTRUCTORA:
		public function EventoSlider(type:String, data:DataSlider, bubbles:Boolean=false, cancelable:Boolean=false) 	{ 
			this.data = data
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event	{ 
			return new EventoSlider(type, data, bubbles, cancelable);
		} 
		
		public override function toString():String 	{ 
			return formatToString("EventoSlider", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}