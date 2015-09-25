/*
DOCUMENTACION:
* Roberto Ferrero - roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 25/07/2011 19:59
*/
package es.robertoferrero.test.A01_ClickPoint{
	//---------------------------
	// IMPORTS del Package:
	import flash.events.MouseEvent
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import es.robertoferrero.framework.eventos.EventoGenerico
	//---------------------------
	// CLASSES del Package:
	public class ClickPoint extends MovieClip{
		// import es.robertoferrero.test.A01_ClickPoint.ClickPoint
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		public var id:String
		//--
		private var dim:Rectangle
		//------------
		// CONSTRUCTORA:
		public function ClickPoint(){
			trace ("(ClickPoint.CONSTRUCTORA)!")
		}
		public function init(_dim:Rectangle, _id:String=null):void {
			trace ("(ClickPoint.init)!")
			id = _id
			dim = _dim
			//--
			var stageRef = this.stage
			if (stageRef==null) {
				trace("ATENCION: stage==null Esto puede deberse a que se está ejecutando el init() de la intsnacia antes de que ésta haya sido añadida al display-list mediante addChild()")
			}else{
				stageRef.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown2)
				stageRef.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut2)
				stageRef.addEventListener(MouseEvent.MOUSE_UP, onMouseUp2)
			}
		}
		//------------
		// PUBLICOS:
		// Getters:
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		//------------
		// EVENTOS:
		private function onMouseDown2(event:MouseEvent):void {
			trace ("(ClickPoint.onMouseDown2)!")
			trace("   stageX: " + event.stageX)
			trace("   stageY: " + event.stageY)
			trace("   x: "+this.mouseX)
			trace("   y: " + this.mouseY)
			var obj:Object = new Object()
			obj.stageX = event.stageX
			obj.stageY = event.stageY
			obj.mouseX = this.mouseX
			obj.mouseY = this.mouseY
			var evento2:EventoGenerico = new EventoGenerico("onMouseDown2", obj)
			this.dispatchEvent(evento2)
		}
		private function onMouseOut2(event:MouseEvent):void {
			trace ("(ClickPoint.onMouseOut2)!")
		}
		private function onMouseUp2(event:MouseEvent):void {
			trace ("(ClickPoint.onMouseUp2)!")
		}
	}
	
}