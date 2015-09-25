/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 31/01/2011 11:46
* 
* Funcionalidad y enfoque basado en los trabajos de:
* http://www.xtyler.com/code/112
* http://blog.andre-michelle.com/2007/simplemouseevents-onreleaseoutside-ondragout/
*/
package es.robertoferrero.framework.assets.botones {
	//---------------------------
	// IMPORTS del Package:	
	import flash.display.InteractiveObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	//--
	import es.robertoferrero.framework.assets.botones.eventos.EventoBoton
	//---------------------------
	// CLASSES del Package:
	public class Botonizador {
		// import es.robertoferrero.framework.assets.botones.Botonizador
		//------------
		// PARAMETROS:	
		private static var buttonIndex:Dictionary = new Dictionary(true);
		//------------
		// ACCESOS ESTATICOS:
		// Utilizar este metodo estatico para dotar de funcionalidad de boton a un InteractiveObject
		public static function registrar(object:InteractiveObject):InteractiveObject {
			trace("(Botonizador.registrar): "+object)	
			object.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown, false, 0xFF);
			object.addEventListener(MouseEvent.ROLL_OVER, onRollOver, false, 0xFF);
			object.addEventListener(MouseEvent.ROLL_OUT, onRollOut, false, 0xFF);
			object.addEventListener(MouseEvent.MOUSE_UP, onMouseUp, false, 0xFF);
			return object;
		}
		//------------
		// COSNTRUCTORA:
		public function Botonizador(){
		}
		//------------
		// PRIVADOS:
		private static function emitirEvento(button:InteractiveObject, type:String, event:MouseEvent = null):void {
			//trace("(Botonizador.emitirEvento): "+type)	
			if ( !button.hasEventListener(type) ) {
				// Si no tiene listeners paramos aquí
				return;
			}
			var buttonEvent:EventoBoton;
			if (event == null) {
				//trace("1")
				buttonEvent = new EventoBoton(type, false, false, button.mouseX, button.mouseY);
			} else {
				//trace("2")
				buttonEvent = new EventoBoton(type, false, false, button.mouseX, button.mouseY, event.relatedObject,
											 event.ctrlKey, event.altKey, event.shiftKey, event.buttonDown, event.delta);
			}
			button.dispatchEvent(buttonEvent);
		}
		private static function onMouseDown(event:MouseEvent):void {
		//trace("(Botonizador.onMouseDown): "+event)	
			var button:InteractiveObject = event.currentTarget as InteractiveObject;
			buttonIndex[button] = true;
			button.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			button.stage.addEventListener(MouseEvent.MOUSE_UP, onRelease);
			button.stage.addEventListener(Event.MOUSE_LEAVE, onRelease);
			emitirEvento(button, EventoBoton.PRESS, event);
			emitirEvento(button, EventoBoton.STATE_DOWN, event);
		}
		private static function onMouseMove(event:MouseEvent):void{
			for(var i:* in buttonIndex) {
				var button:InteractiveObject = i as InteractiveObject;
				emitirEvento(button, EventoBoton.DRAG, event);
			}
		}
		private static function onRollOver(event:MouseEvent):void {
		//trace("(Botonizador.onRollOver)!")
			var button:InteractiveObject = event.currentTarget as InteractiveObject;			
			if(buttonIndex[button] != null) {
				buttonIndex[button] = true;
				emitirEvento(button, EventoBoton.DRAG_OVER, event);
				emitirEvento(button, EventoBoton.STATE_DOWN, event);
			} else if (!event.buttonDown) {				
				emitirEvento(button, EventoBoton.STATE_OVER, event);
			}
			if(event.buttonDown) {
				event.stopImmediatePropagation();
			}
		}
		private static function onRollOut(event:MouseEvent):void{
			var button:InteractiveObject = event.currentTarget as InteractiveObject;
			if(buttonIndex[button] != null) {
				buttonIndex[button] = false;
				emitirEvento(button, EventoBoton.DRAG_OUT, event);
				emitirEvento(button, EventoBoton.STATE_OVER, event);
			} else if(!event.buttonDown) {
				emitirEvento(button, EventoBoton.STATE_UP, event);
			}
			if(event.buttonDown) {
				event.stopImmediatePropagation();
			}
		}
		private static function onMouseUp(event:MouseEvent):void		{
			var button:InteractiveObject = event.currentTarget as InteractiveObject;
			if(buttonIndex[button] == null) {
				emitirEvento(button, EventoBoton.ROLL_OVER, event);
				emitirEvento(button, EventoBoton.STATE_OVER, event);
			}
		}
		private static function onRelease(event:Event):void{
			var stage:Stage = event.currentTarget as Stage;
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.removeEventListener(MouseEvent.MOUSE_UP, onRelease);
			stage.removeEventListener(Event.MOUSE_LEAVE, onRelease);
			for(var i:* in buttonIndex) {
				var button:InteractiveObject = i as InteractiveObject;
				if(buttonIndex[i]) {					
					emitirEvento(button, EventoBoton.RELEASE);
					emitirEvento(button, EventoBoton.STATE_OVER);					
				} else {					
					emitirEvento(button, EventoBoton.RELEASE_OUTSIDE);
					emitirEvento(button, EventoBoton.STATE_UP);
				}				
				delete buttonIndex[i];
			}
		}	
	}
}