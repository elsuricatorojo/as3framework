/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 07/02/2011 12:17
* IMPORTANTE: Todas las clases del paquete com.ionewmedia que extienden MovieClip
*             vinculados a elementos de biblioteca requieren desactivar:
*             "Declaracion instancias de escenario automaticamente" en "Configuración de publicación" en (CS3).
* IMPORTAT: All classes inside the com.ionewmedia package that extends MovieClip and are linked to Library items
*             need the "Automatically declare stage instances" UNCHECKED in "Publish Settings" (CS3)
*/
package es.robertoferrero.framework.assets.sliders{
	import es.robertoferrero.framework.assets.botones.Botonizador;
	import es.robertoferrero.framework.assets.botones.eventos.EventoBoton;
	import es.robertoferrero.framework.assets.sliders.datos.DataSlider;
	import es.robertoferrero.framework.assets.sliders.eventos.EventoSlider;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	//---------------------------
	// IMPORTS del Package:
	//---------------------------
	// CLASSES del Package:
	public class SliderBase extends MovieClip implements ISlider{
		// import es.robertoferrero.framework.assets.sliders.SliderBase
		//------------
		// DOCUMENTACION:
		// Un boton de manejador no redimensionable
		// Sin botones de btUp o btDown
		
		//------------
		// PARAMETROS:
		// En el timeline:
		public var manejador_mc:MovieClip
		public var base_mc:MovieClip
		//--
		public var id:String
		public var propiedad:String 
		//--
		private var size:Number
		private var rango:Number 
		private var manejadorSize:Number
		//--
		private var _inicializado:Boolean = false
		private var modoAutonomo
		//------------
		// CONSTRUCTORA:
		public function SliderBase (){
			trace ("(SliderBase.CONSTRUCTORA)!")
			this.visible = false
			if (this.parent == this.stage && this.parent!=null) {
				trace("    SliderBase en modo AUTONOMO!")
				// MODO AUTONOMO
				modoAutonomo = true
				init("slider_test", 0.5, 10, 200, "y")
			}else {
				trace("    SliderBase en modo INTEGRADO!")
				modoAutonomo = false
				// MODO INTEGRADO
			}
		}
		//------------
		// PUBLICOS:
		// Obligados por el interfce IAsset
		public function getCopy():Object {
			var copy:Object = new SliderBase() as Object
			return copy
		}
		public function get inicializado():Boolean {
			return _inicializado
		}
		// Obligados por el interfce ISlider
		public function init(id:String, ratio:Number = 0, manejadorSize:Number = 30, size:Number = 150, propiedad:String = null):void {
			trace ("(SliderBase.init)!")
			trace("   id: "+id)
			trace("   ratio: "+ratio)
			trace("   manejadorSize: "+manejadorSize)
			trace("   size: "+size)
			trace("   propiedad: "+propiedad)
			this.visible = true
			this._inicializado = true
			//--
			this.id = id
			this.size = size
			this.propiedad = propiedad
			//--
			this.manejadorSize = manejadorSize
			manejador_mc.height = this.manejadorSize
			this.rango = this.size-this.manejadorSize
			var posIni:Number = this.rango * ratio
			//--
			base_mc.height = this.size
			manejador_mc.buttonMode = true
			manejador_mc.useHandCursor = true
			manejador_mc.y = posIni
			Botonizador.registrar(manejador_mc)
			manejador_mc.addEventListener(MouseEvent.MOUSE_DOWN, onMousedown)
			manejador_mc.addEventListener(MouseEvent.MOUSE_UP, onMouseup)
			manejador_mc.addEventListener(EventoBoton.RELEASE_OUTSIDE, onReleaseoutside)
			//--
			var dataSlider:DataSlider = getData()
			var evento:EventoSlider = new EventoSlider(EventoSlider.INICIALIZADO, dataSlider)
			this.dispatchEvent(evento)
		}
		// Getters:
		public function getData():DataSlider {
			var dataSlider:DataSlider = new DataSlider()
			dataSlider.posicion = manejador_mc.y
			dataSlider.manejadorSize = manejadorSize
			dataSlider.propiedad = propiedad
			dataSlider.rango = size-manejadorSize
			dataSlider.ratio = manejador_mc.y / rango
			dataSlider.size = size
			dataSlider.slider = this
			//--
			return dataSlider
		}
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		private function eval_startDrag() {
			trace("(SliderBase.eval_startDrag)!")
			init_motor()
			var limites:Rectangle = new Rectangle(0, 0, 0, rango)
			manejador_mc.startDrag(false, limites)
			//--
			var data:DataSlider = getData()
			var evento:EventoSlider = new EventoSlider(EventoSlider.DRAG_INICIADO, data)
			this.dispatchEvent(evento)
		}
		private function eval_stopDrag() {
			trace("(SliderBase.eval_stopDrag)!")
			kill_motor()
			manejador_mc.stopDrag()
			//--
			var data:DataSlider = getData()
			var evento:EventoSlider = new EventoSlider(EventoSlider.DRAG_FINALIZADO, data)
			this.dispatchEvent(evento)
		}
		private function init_motor() {
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler)
		}
		private function kill_motor() {
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler)
		}
		//------------
		// EVENTOS:
		private function onMousedown(evento:MouseEvent):void {
			trace ("(SliderBase.onMousedown)!")
			eval_startDrag()
			
		}
		private function onMouseup(evento:MouseEvent):void {
			trace ("(SliderBase.onMouseup)!")
			eval_stopDrag()
		}
		private function onReleaseoutside(evento:EventoBoton):void {
			trace ("(SliderBase.onReleaseoutside)!")
			eval_stopDrag()
		}
		private function onMouseMoveHandler(evento:MouseEvent):void {
			//trace ("(SliderBase.onMouseMoveHandler)!")
			var dataSlider:DataSlider = getData()
			var evento2:EventoSlider = new EventoSlider(EventoSlider.ACTUALIZADO, dataSlider)
			this.dispatchEvent(evento2)
		}
	}
}