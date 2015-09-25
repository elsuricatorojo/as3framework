/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 04/02/2011 11:26
*/
package es.robertoferrero.framework.gui.pruebas{
	import es.robertoferrero.framework.gui.botones.Botonizador;
	import es.robertoferrero.framework.gui.botones.eventos.EventoBoton;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	//---------------------------
	// IMPORTS del Package:
	//---------------------------
	// CLASSES del Package:
	public class FakeAsset extends MovieClip{
		// import es.robertoferrero.framework.gui.pruebas.FakeAsset
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		// En el timeline:
		public var bt:MovieClip
		public var contorno:MovieClip
		//--
		private var rango:Number 
		private var modoAutonomo
		//------------
		// CONSTRUCTORA:
		public function FakeAsset(){
			trace ("(FakeAsset.CONSTRUCTORA)!")
			if (this.parent == this.stage && this.parent!=null) {
				trace("    FakeAsset en modo AUTONOMO!")
				// MODO AUTONOMO
				modoAutonomo = true
				init(200)
			}else {
				trace("    FakeAsset en modo INTEGRADO!")
				modoAutonomo = false
				// MODO INTEGRADO
			}
		}
		//------------
		// PUBLICOS:
		public function init(alto:Number) {
			trace ("(FakeAsset.init): "+alto)
			rango = alto-bt.height-3
			contorno.height = alto
			//--
			//bt.mouseEnabled = true
			bt.useHandCursor = true
			Botonizador.registrar(bt)
			bt.addEventListener(EventoBoton.RELEASE_OUTSIDE, this.onReleaseOutSide)
			bt.addEventListener(MouseEvent.MOUSE_DOWN, this.onMousedown)
			bt.addEventListener(MouseEvent.MOUSE_UP, this.onMouseup)
		}
		public function testScope(cadena:String):void {
			trace ("(FakeAsset.testScope) --------------------------- "+cadena)
		}
		// Getters:
		public function getCopy():FakeAsset {
			return new FakeAsset()
		}
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		private function eval_startDrag() {
			//var btManejador_mc:MovieClip = bt as MovieClip
			//trace("   btManejador_mc: "+btManejador_mc)
			//--
			var limites:Rectangle = new Rectangle(2, 2, 0, rango)
			bt.startDrag(false, limites)
		}
		private function eval_stoptDrag() {
			//var btManejador_mc:MovieClip = bt as MovieClip
			bt.stopDrag()
		}
		//------------
		// EVENTOS:
		private function onMouseup(evento:MouseEvent) {
			//trace ("(FakeAsset.onMouseup)!")
			eval_stoptDrag()
			
		}
		private function onMousedown(evento:MouseEvent) {
			//trace ("(FakeAsset.onMousedown)!")
			eval_startDrag()
			
		}
		private function onReleaseOutSide(evento:EventoBoton) {
			//trace ("(FakeAsset.onReleaseOutSide)!")
			eval_stoptDrag()
			
		}
		//--
		private function onMouseMoveHandler(evento:MouseEvent):void {
			
		}
	}
}