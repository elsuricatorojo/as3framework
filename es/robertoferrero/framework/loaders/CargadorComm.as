/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com|| roberto@ionewmedia.com
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 19/06/2008 13:28
*/
package es.robertoferrero.framework.loaders {
	//---------------------------
	// IMPORTS del Package:
	//import flash.display.Sprite;
	import flash.events.*;
	import flash.net.*;
	//--
	import es.robertoferrero.framework.utils.StringUtils
	import es.robertoferrero.framework.utils.ObjectUtils
	import es.robertoferrero.framework.loaders.Buffer;
	import es.robertoferrero.framework.loaders.eventos.EventoCarga;
	//---------------------------
	// CLASSES del Package:
	public class CargadorComm extends EventDispatcher implements Cargador {
		// import es.robertoferrero.framework.loaders.CargadorComm
		//------------
		// DESCRIPCION:
		// Clase diseñada para gestionar la carga de un archivo de variables (variable1=valor1&variable2=valo2&...)
		// AUTONOMO: Puede actuar auntonomamente en cuyo caso la carga se inicia al llamar al método "init()"
		// BUFFER: Está diseñada para actuar junto a "es.robertoferrero.framework.loaders.Buffer" en cargas secuenciales.
		// Filtra la cadena recibida para eliminar "&" iniciales y finales los cuales generan errores de ejecución.
		// PERMITE ENVIAR PARAMETROS pasando un objeto con variables en el parametro dataEnvio.
		// CONSTRUCTORA: CargadorComm(path:String,cargaId:String=null, _buffer:Buffer=null, _dataEnvio:Object=null, _metodo:String="POST", _emitirEventosURLLoader=false)
		///------------
		// PARAMETROS:
		private var _path:String
		private var _cargaId:String
		private var buffer:Buffer
		private var _tipocarga:String = "CargadorComm"
		//--
		private var dataEnvio:Object // Si se le pasa null no mandará variables.
		private var metodo:String // {GET,POST}
		private var loader:URLLoader;
		private var urlVars:URLVariables // Solo se utiliza si dataEnvio!=null
		//--
		public var emitirEventosURLLoader:Boolean=false // Determina si se emiten los eventos propios de URLLoader
		//------------
		// CONSTRUCTORA:
		public function CargadorComm(path:String,cargaId:String=null, _buffer:Buffer=null, _dataEnvio:Object=null, _metodo:String="POST") {
			trace("(CargadorComm.CONSTRUCTORA) cargaId: "+_cargaId);
			_path=path;
			_cargaId=cargaId;
			buffer = _buffer
			dataEnvio = _dataEnvio
			metodo = _metodo
			//--
			if(dataEnvio!=null){
				urlVars = new URLVariables()
				for (var param:Object in dataEnvio) {
					urlVars[param]= dataEnvio[param]
				}
			}
			//--
			init_loader()
		}
		public function init():void {
			//trace("(CargadorComm.init) cargaId: "+cargaId);
			if (this.buffer == null) {
				cargar()
			}else {
				trace("ATENCION: Existe un buffer. El arranque de carga no se realiza mediante init sino por el evento onIniciarCarga!!")
			}
		}
		public function get_cargaId():String {
			return cargaId
		}
		//------------
		// PUBLICOS:
		public function get cargaId():String { return _cargaId; } // Obligado por interface "Cargador"
		public function get tipocarga():String { return _tipocarga; } // Obligado por interface "Cargador"
		public function get path():String { return _path; }
		public function set path(valor:String):void {_path = valor;	}
		//------------
		// PRIVADOS:
		private function init_loader() {
			loader = new URLLoader;
			loader.dataFormat = URLLoaderDataFormat.TEXT; //TEXT en vez de VARIABLES permite formatear la cadena, eliminando "&" de inicio y fin, y evitar un error de compilación
			loader.addEventListener(Event.COMPLETE,onExitoCarga);
			loader.addEventListener(Event.OPEN,onCargaIniciada);
			loader.addEventListener(ProgressEvent.PROGRESS,onProgresoCarga);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
			loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, onHttpStatus);
			loader.addEventListener(IOErrorEvent.IO_ERROR,onIoError);
		}
		private function cargar() {
			trace("(CargadorComm.cargar): " + cargaId)
			var request:URLRequest = new URLRequest(this._path);
			if(dataEnvio!=null){
				request.method = metodo
				request.data = urlVars
				ObjectUtils.traceObject(urlVars, "Variables enviadas a: " + _path)
			}else {
				trace("=====================================")
				trace("NO SE ENVIAN VARIABLES A: " + _path)
				trace("=====================================")
			}
			try {
				loader.load(request);
			} catch (error:Error) {
				trace("Unable to load requested document.");
			}
		}
		private function filtrar_bufferId():String {
			if (buffer!=null) {
				return buffer.bufferId
			}else {
				return null
			}
		}
		//------------
		// EVENTOS:
		//------
		// Buffer:
		public function onIniciarCarga(bufferEvent:EventoCarga):void { // Obligado por interface "Cargador"
			// Lo emite el Buffer
			if (cargaId == bufferEvent.cargaId) {
				trace("(CargadorComm.onIniciarCarga) cargadId: " + bufferEvent.cargaId);
				cargar();
			}
		}
		//------
		//URLLoader
		private function onCargaIniciada(loaderEvent:Event):void {
			// Lo emite URLLoader
			trace("(CargadorComm.onCargaIniciada)  cargadId: " + cargaId);
			var evento:EventoCarga = new EventoCarga(EventoCarga.CARGA_INICIADA, cargaId, filtrar_bufferId(), null, loaderEvent);
			this.dispatchEvent(evento);
			//--
			if (emitirEventosURLLoader) {
				this.dispatchEvent(loaderEvent);
			}
		}
		private function onProgresoCarga(loaderEvent:ProgressEvent):void {
			// Lo emite URLLoader
			//trace("(CargadorComm.onProgresoCarga)  cargadId: " + cargaId+"   "+ event.bytesLoaded + "/" + event.bytesTotal);
			var data:Object=new Object();
			data.bytesLoaded= loaderEvent.bytesLoaded;
			data.bytesTotal = loaderEvent.bytesTotal;
			data.porcentaje = Math.round((data.bytesLoaded/data.bytesTotal)*100)
			//--
			var evento:EventoCarga = new EventoCarga(EventoCarga.PROGRESS_CARGA, cargaId, filtrar_bufferId(), data, loaderEvent);
			this.dispatchEvent(evento);
			//--
			if (emitirEventosURLLoader) {
				this.dispatchEvent(loaderEvent);
			}
		}
		private function onExitoCarga(loaderEvent:Event):void {
			// Lo emite URLLoader
			trace("(CargadorComm.onExitoCarga):" + cargaId);
			// Pasamos a un obj las variables recibidas.
			var cadenaFiltrada:String=StringUtils.eliminarAndpersandsExtremos(loader.data)
			var vars:URLVariables = new URLVariables(cadenaFiltrada);
			var data=new Object()
			for (var param in vars) {
				data[param]=vars[param]
			}
			ObjectUtils.traceObject(data, "Variables recibidas de: "+_path)
			//--
			var evento:EventoCarga = new EventoCarga(EventoCarga.EXITO_CARGA, cargaId, filtrar_bufferId(), data, loaderEvent);
			this.dispatchEvent(evento);
			//--
			if (emitirEventosURLLoader) {
				this.dispatchEvent(loaderEvent);
			}

		}
		private function onSecurityError(loaderEvent:SecurityErrorEvent):void {
			// Lo emite URLLoader
			trace("(CargadorComm.onOpen):" + cargaId);
			var evento:EventoCarga = new EventoCarga(EventoCarga.ERROR_CARGA, cargaId, filtrar_bufferId(), null, loaderEvent);
			this.dispatchEvent(evento);
			//--
			if (emitirEventosURLLoader) {
				this.dispatchEvent(loaderEvent);
			}
		}
		private function onHttpStatus(loaderEvent:HTTPStatusEvent):void {
			// Lo emite URLLoader
			//trace("(CargadorComm.onHttpStatus) : " + loaderEvent);
			if (emitirEventosURLLoader) {
				this.dispatchEvent(loaderEvent);
			}
		}
		private function onIoError(loaderEvent:IOErrorEvent):void {
			// Lo emite URLLoader
			trace("(CargadorComm.onIoError):" + cargaId);
			var evento:EventoCarga = new EventoCarga(EventoCarga.ERROR_CARGA, cargaId, filtrar_bufferId(), null, loaderEvent);
			this.dispatchEvent(evento);
			//--
			if (emitirEventosURLLoader) {
				this.dispatchEvent(loaderEvent);
			}
		}
	
	}
	
}
