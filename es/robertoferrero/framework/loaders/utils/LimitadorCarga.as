/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 21/04/2009 11:23
*/
package es.robertoferrero.framework.loaders.utils{
	//---------------------------
	// IMPORTS del Package:
	import flash.display.MovieClip;
	import flash.events.Event;
	import es.robertoferrero.framework.utils.ZLog
	import es.robertoferrero.framework.loaders.eventos.EventoCarga;
	//---------------------------
	// CLASSES del Package:
	public class LimitadorCarga extends MovieClip{
		// import es.robertoferrero.framework.loaders.utils.LimitadorCarga
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		private var maxPorFrame:Number
		private var cargados:Number = 0
		private var totales:Number = NaN
		private var contadorFrames:Number = 0
		private var inicializado:Boolean =false
		//------------
		// CONSTRUCTORA:
		public function LimitadorCarga(_maxPorFrame:Number=100){
			trace ("(LimitadorCarga.CONSTRUCTORA)!")
			maxPorFrame = _maxPorFrame
			if (maxPorFrame>100) {
				maxPorFrame=100
			}
		}
		public function init():void {
			trace ("(LimitadorCarga.init)!")
			if (!inicializado) {
				inicializado=true
				init_motor()
			}else {
				trace("   ATENCION: Se está intentando inicilaizar LimitadorCarga y ya está inicializado!")
			}
		}
		//------------
		// PUBLICOS:
		public function actualizarProgress(_cargados:Number, _totales:Number):void {
			//ZLog.trace ("(LimitadorCarga.actualizarProgress) " + _cargados + "/" + _totales)
			if (!inicializado) {
				//init()
			}
			cargados = _cargados
			if (_totales>0) {
				totales = _totales
			}
		}
		// Getters:
		// Setters:
		//------------
		// PRIVADOS:
		private function init_motor():void {
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		private function emitirActualizacion() {
			var porcentajeReal:Number
			var porcentajeMax:Number = maxPorFrame * contadorFrames
			var porcentajeEmitir:Number
			if (porcentajeMax>=100) {
				porcentajeMax = 100
			}
			if (!isNaN(totales)) {
				porcentajeReal = (cargados/totales)*100
			}
			//--
			if (porcentajeReal<porcentajeMax) {
				porcentajeEmitir = porcentajeReal
			}else {
				porcentajeEmitir = porcentajeMax
			}
			if (porcentajeEmitir >= 100) {
				this.removeEventListener(Event.ENTER_FRAME,onEnterFrame)
			}
			//--
			//trace("   porcentajeMax: " + porcentajeMax)
			//trace("   porcentajeReal: " + porcentajeReal)
			//trace("   porcentajeEmitir: " + porcentajeEmitir)
			//--
			var data:Object=new Object();
			data.bytesLoaded= totales*(porcentajeEmitir/100)
			data.bytesTotal = totales
			data.porcentaje = porcentajeEmitir
			var evento:EventoCarga = new EventoCarga(EventoCarga.PROGRESS_CARGA, null, null, data)
			this.dispatchEvent(evento)
		}
		//------------
		// EVENTOS:
		private function onEnterFrame(evento:Event) {
			contadorFrames++
			emitirActualizacion()
		}
	}
}