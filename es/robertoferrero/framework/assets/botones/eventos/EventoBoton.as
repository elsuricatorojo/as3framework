/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* C31/01/2011 11:46
*/
package es.robertoferrero.framework.assets.botones.eventos{
	//---------------------------
	// IMPORTS del Package:
	import flash.events.MouseEvent;
	import flash.display.InteractiveObject;
	//---------------------------
	// CLASSES del Package:
	public class EventoBoton extends MouseEvent{
		// import es.robertoferrero.framework.assets.botones.eventos.EventoBoton
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		public static const PRESS:String = "press";
		public static const ROLL_OVER:String = "rollOver";
		public static const ROLL_OUT:String = "rollOut";
		public static const DRAG:String = "drag";
		public static const DRAG_OVER:String = "dragOver";
		public static const DRAG_OUT:String = "dragOut";
		public static const RELEASE:String = "release";
		public static const RELEASE_OUTSIDE:String = "releaseOutside";
		public static const STATE_UP:String = "stateUp";
		public static const STATE_OVER:String = "stateOver";
		public static const STATE_DOWN:String = "stateDown";
		public static const DOUBLE_CLICK :String = "doubleClick";
		//------------
		// CONSTRUCTORA:
		public function EventoBoton(type:String, bubbles:Boolean = false, cancelable:Boolean = false,
									localX:Number = NaN, localY:Number = NaN, relatedObject:InteractiveObject = null,
									ctrlKey:Boolean = false, altKey:Boolean = false, shiftKey:Boolean = false,
									buttonDown:Boolean = false, delta:int = 0){
			//trace("(EventoBoton.CONSTRUCTORA)!")
			//trace("   type: " + type)
			//trace("   ctrlKey: "+ctrlKey)
			super(type, bubbles, cancelable, localX, localY, relatedObject, ctrlKey, altKey, shiftKey, buttonDown, delta);
		}
		//------------
		// PUBLICOS:
		public override  function toString():String {
			return formatToString("EventoBoton","type", "bubbles","cancelable","eventPhase", "localX", "localY", "relatedObject", "ctrlKey", "altKey", "shiftKey", "buttonDown", "delta");
		}
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		//------------
		// EVENTOS:
		
	}
}