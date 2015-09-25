/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com|| roberto@ionewmedia.com
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 24/09/2008 12:37
*/
package es.robertoferrero.framework.loaders {
	//---------------------------
	// IMPORTS del Package:
	//import flash.events.EventDispatcher;
	import es.robertoferrero.framework.core.Consola;
	import flash.display.MovieClip
	import flash.display.Loader;
	import flash.events.*;
	import flash.media.Sound;
	import flash.net.*;
	//--
	import es.robertoferrero.framework.utils.StringUtils
	import es.robertoferrero.framework.utils.ObjectUtils
	import es.robertoferrero.framework.loaders.Buffer;
	import es.robertoferrero.framework.loaders.eventos.EventoCarga;
	import es.robertoferrero.framework.loaders.utils.LimitadorCarga
	//---------------------------
	// CLASSES del Package:
	public class CargadorMP3 extends MovieClip implements Cargador{
		//------------
		// PARAMETROS:
		private var _path:String
		private var _cargaId:String
		private var buffer:Buffer
		private var _tipocarga:String = "CargadorMP3"
		//--
		private var consola:Consola
		//--
		private var cargaLimitada:Boolean = false
		private var limiteCarga:Number
		private var limitador:LimitadorCarga
		private var cargaRealFinalizada:Boolean = false
		private var cargaLimitadaFinalizada:Boolean = false
		private var eventoExito:EventoCarga
		//--
		private var loader:Sound;
		//--
		public var emitirEventosURLLoader:Boolean=false // Determina si se emiten los eventos propios de URLLoader
		//------------
		// CONSTRUCTORA:
		public function CargadorMP3(path:String,cargaId:String=null, _buffer:Buffer=null, _limiteCarga:Number=100) {
			trace("(CargadorMP3.CONTRUCTORA)!")
			_path=path;
			_cargaId=cargaId;
			buffer = _buffer
			limiteCarga = _limiteCarga
			limitador = new LimitadorCarga(limiteCarga)
			if (limiteCarga > 100) {
				limiteCarga=100
			}else if (limiteCarga < 100) {
				trace("   carga limitada ("+limiteCarga+")")
				cargaLimitada = true
				limitador.addEventListener(EventoCarga.PROGRESS_CARGA, onProgresoCargaLimitada)
			}
			//--
			consola = Consola.getInstance()
			//--
			init_loader()
		}
		public function init():void {
			//trace("(CargadorMP3.init) cargaId: "+cargaId);
			if (this.buffer == null) {
				cargar()
			}else {
				trace("ATENCION: Existe un buffer. El arranque de carga no se realiza mediante init!!")
			}
		}
		
		//------------
		// PUBLICOS:
		// GETTERS:
		public function get cargaId():String { return _cargaId; } // Obligado por interface "Cargador"
		public function get tipocarga():String { return _tipocarga; } // Obligado por interface "Cargador"
		public function get path():String { return _path; }
		public function set path(valor:String):void {_path = valor;	}
		//------------
		// PRIVADOS:
		private function init_loader() {
			loader = new Sound()
			loader.addEventListener(Event.COMPLETE,onExitoCarga);
			loader.addEventListener(Event.OPEN,onCargaIniciada);
			loader.addEventListener(ProgressEvent.PROGRESS,onProgresoCarga);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
			loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, onHttpStatus);
			loader.addEventListener(IOErrorEvent.IO_ERROR,onIoError);
		}
		private function cargar() {
			var request:URLRequest = new URLRequest(this._path);
			try {
				loader.load(request);
			} catch (error:Error) {
				trace("Unable to load requested document.");
			}
			limitador.init()
		}
		private function filtrar_bufferId():String {
			if (buffer!=null) {
				return buffer.bufferId
			}else {
				return null
			}
		}
		private function eval_emitirExito() {
			trace("(CargadorMP3.onCargaIniciada)  real: " + cargaRealFinalizada+" / limitada: "+cargaLimitadaFinalizada);
			if (cargaLimitadaFinalizada && cargaRealFinalizada) {
				this.dispatchEvent(eventoExito);
			}
		}
		//------------
		// EVENTOS:
		//------
		// Buffer:
		public function onIniciarCarga(bufferEvent:EventoCarga):void {
			// Lo emite el Buffer
			if (cargaId == bufferEvent.cargaId) {
				trace("(CargadorMP3.onIniciarCarga cargadId: " + bufferEvent.cargaId);
				consola.trazar("(CargadorMP3.onIniciarCarga cargadId: " + bufferEvent.cargaId);
				cargar();
			}
		}
		//------
		//URLLoader:
		private function onCargaIniciada(loaderEvent:Event):void {
			// Lo emite URLLoader
			trace("(CargadorMP3.onCargaIniciada)  cargadId: " + cargaId);
			consola.trazar("(CargadorMP3.onCargaIniciada)  cargadId: " + cargaId);
			var evento:EventoCarga = new EventoCarga(EventoCarga.CARGA_INICIADA, cargaId, filtrar_bufferId(), null, loaderEvent);
			this.dispatchEvent(evento);
			//--
			if (emitirEventosURLLoader) {
				this.dispatchEvent(loaderEvent);
			}
		}
		private function onProgresoCarga(loaderEvent:ProgressEvent):void {
			// Lo emite URLLoader
			if (cargaLimitada) {
				limitador.actualizarProgress(loaderEvent.bytesLoaded, loaderEvent.bytesTotal)
			}else {
				trace("(CargadorMP3.onProgresoCarga)  cargadId: " + cargaId+"   "+ loaderEvent.bytesLoaded + "/" + loaderEvent.bytesTotal);
				consola.trazar("(CargadorMP3.onProgresoCarga)  cargadId: " + cargaId+"   "+ loaderEvent.bytesLoaded + "/" + loaderEvent.bytesTotal);
				var data:Object=new Object();
				data.bytesLoaded= loaderEvent.bytesLoaded;
				data.bytesTotal = loaderEvent.bytesTotal;
				data.porcentaje = Math.round((data.bytesLoaded / data.bytesTotal) * 100)
				var evento:EventoCarga = new EventoCarga(EventoCarga.PROGRESS_CARGA, cargaId,  filtrar_bufferId(), data, loaderEvent);
				this.dispatchEvent(evento);
				//--
				if (emitirEventosURLLoader) {
					this.dispatchEvent(loaderEvent);
				}
			}
			
		}
		private function onProgresoCargaLimitada(evento:EventoCarga):void {
			trace("(CargadorMP3.onProgresoCargaLimitada)  cargadId: " + cargaId+"   "+ evento.data.bytesLoaded + "/" + evento.data.bytesTotal);
			consola.trazar("(CargadorMP3.onProgresoCargaLimitada)  cargadId: " + cargaId+"   "+ evento.data.bytesLoaded + "/" + evento.data.bytesTotal);
			if (evento.data.porcentaje == 100) {
				cargaLimitadaFinalizada = true
				eval_emitirExito()
			}else{
				var evento2:EventoCarga = new EventoCarga(EventoCarga.PROGRESS_CARGA, cargaId,  filtrar_bufferId(), evento.data, null);
				this.dispatchEvent(evento2);
			}
		}
		private function onExitoCarga(loaderEvent:Event):void {
			trace("(CargadorMP3.onExitoCarga):" + cargaId);
			consola.trazar("(CargadorMP3.onExitoCarga):" + cargaId);
			// Lo emite URLLoader
			cargaRealFinalizada = true
			//var data:Object=new Object();
			//data.loader= this.loader;
			var data:Sound = this.loader
			//--
			if (cargaLimitada) {
				// Guardamos el evento pero no lo emitimos
				eventoExito = new EventoCarga(EventoCarga.EXITO_CARGA, cargaId, filtrar_bufferId(), data, loaderEvent);
				eval_emitirExito()
			}else {
				var evento:EventoCarga = new EventoCarga(EventoCarga.EXITO_CARGA, cargaId, filtrar_bufferId(), data, loaderEvent);
				this.dispatchEvent(evento);
				if (emitirEventosURLLoader) {
					this.dispatchEvent(loaderEvent);
				}
			}
		}
		private function onSecurityError(loaderEvent:SecurityErrorEvent):void {
			// Lo emite URLLoader
			trace("(CargadorMP3.onSecurityError) : " + loaderEvent);
			consola.trazar("(CargadorMP3.onSecurityError) : " + loaderEvent);
			var evento:EventoCarga = new EventoCarga(EventoCarga.ERROR_CARGA, cargaId, filtrar_bufferId(), null, loaderEvent);
			this.dispatchEvent(evento);
			//--
			if (emitirEventosURLLoader) {
				this.dispatchEvent(loaderEvent);
			}
		}
		private function onHttpStatus(loaderEvent:HTTPStatusEvent):void {
			// Lo emite URLLoader
			//trace("(CargadorMP3.onHttpStatus) : " + loaderEvent);
			if (emitirEventosURLLoader) {
				this.dispatchEvent(loaderEvent);
			}
		}
		private function onIoError(loaderEvent:IOErrorEvent):void {
			// Lo emite URLLoader
			trace("(CargadorMP3.onIoError): " + loaderEvent);
			consola.trazar("(CargadorMP3.onIoError): " + loaderEvent);
			var evento:EventoCarga = new EventoCarga(EventoCarga.ERROR_CARGA, cargaId, filtrar_bufferId(), null, loaderEvent);
			this.dispatchEvent(evento);
			//--
			if (emitirEventosURLLoader) {
				this.dispatchEvent(loaderEvent);
			}
		}
	}
	
}