/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 20/04/2009 13:28
*/
package es.robertoferrero.framework.loaders{
	//---------------------------
	// IMPORTS del Package:
	
	import flash.events.EventDispatcher
	//--
	import es.robertoferrero.framework.utils.ArrayUtils;
	import es.robertoferrero.framework.utils.ObjectUtils;
	import es.robertoferrero.framework.data.Datos;
	import es.robertoferrero.framework.loaders.eventos.EventoCarga;
	import es.robertoferrero.framework.loaders.utils.GestorPesos;
	import es.robertoferrero.framework.loaders.Cargador
	//---------------------------
	// CLASSES del Package:
	public class Buffer extends EventDispatcher implements Cargador{
		// import es.robertoferrero.framework.loaders.Buffer
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		public var numIntentos:Number = 5
		public var retryOnError:Boolean=false;
		public var resumeOnError:Boolean=true;
		public var resumeOnExito:Boolean = false;
		//--
		private var _bufferId:String // Tiene getter
		private var _tipocarga:String = "Buffer"
		private var buffer:Buffer 
		private var items:Datos
		private var pesos:GestorPesos
		private var todoCargadoEmitido:Boolean = false
		//------------
		// CONSTRUCTORA:
		public function Buffer(bufferId:String, _buffer:Buffer=null){
			trace ("(Buffer.CONSTRUCTORA)!")
			// El parámetro "_buffer" se emplea si el buffer es en si un carga de otro buffer
			_bufferId = bufferId
			buffer = _buffer
			items = new Datos("datos_buffer")
			pesos = new GestorPesos()
		}
		public function init():void {  // Obligado por interface "Cargador"
			trace ("(Buffer.init) bufferId: "+_bufferId)
			if (buffer==null) {
				iniciarBuffer()
			}else {
				trace("ATENCION: Existe un buffer. El arranque de carga no se realiza mediante init sino por el evento onIniciarCarga!!")
			}
		}
		public function testScope(cadena:String) {
			trace("(Buffer.testScope) --------------- "+cadena)
		}
		//------------
		// PUBLICOS:
		public function nuevaCarga(cargador:Cargador, pesoRelativo:Number = 1):Boolean {
			trace ("(Buffer.nuevaCarga)("+bufferId+")!")
			var cargaId:String = cargador.cargaId
			var existe:Boolean = items.existeItem(cargaId)
			var resultado:Boolean
			if (!existe) {
				pesos.nuevaCarga(cargaId, pesoRelativo)
				this.addEventListener(EventoCarga.INICIAR_CARGA, cargador.onIniciarCarga);
				cargador.addEventListener(EventoCarga.CARGA_INICIADA, this.onCargaIniciada)
				cargador.addEventListener(EventoCarga.PROGRESS_CARGA, this.onProgressCarga)
				cargador.addEventListener(EventoCarga.EXITO_CARGA, this.onExitoCarga)
				cargador.addEventListener(EventoCarga.ERROR_CARGA, this.onErrorCarga)
				//--
				trace("   cargador.tipocarga: "+cargador.tipocarga)
				if (cargador.tipocarga == "Buffer") {
					trace("(La carga es un buffer. Nos hacemso oyentes de su evento TODO_CARGADO)")
					cargador.addEventListener(EventoCarga.TODO_CARGADO, this.onBufferCargado)
				}
				//--
				var obj:Object = new Object()
				obj.cargaId = cargaId
				obj.ref = cargador
				obj.cargado = false
				obj.intentos = 0
				obj.tipoCarga = cargador.tipocarga
				items.nuevoItem(cargaId, obj)
				resultado = true
			}else {
				trace("ATENCION: Ya existe una cargaId con ese nombre (" + cargaId + "). No se hace nada.")
				resultado = false
			}
			return resultado
		}
		public function resumir():void {
			siguienteCarga()
		}
		public function getCargador(cargaId:String):Cargador {
			var cargador:Cargador
			var existe:Boolean = items.existeItem(cargaId)
			if (existe) {
				var objItem:Object = items.getItem(cargaId)
				cargador = objItem.ref
			}else {
				cargador = null
			}
			return cargador
		}
		public function get_pesoTotal():Number {
			// NUEVO: 08/10/2011 14:55
			// Devuelve el total de pesos. No en KBs sino la suma de pesos pasados en nuevas cargas.
			return pesos.get_pesoTotal()
		}
		// Getters/Setters:
		public function get bufferId():String { return _bufferId; }
		public function get cargaId():String { return _bufferId	} // Obligado por interface "Cargador"
		public function get tipocarga():String { return _tipocarga; } // Obligado por interface "Cargador"
		public function get path():String { return null; }
		public function set path(valor:String):void { trace("ATENCION: El Buffer no permite actualizar el path!")	}
		//------------
		// INTERNOS:
		
		//------------
		// PRIVADOS:
		private function iniciarBuffer():void {
			trace("(Buffer.iniciarBuffer)("+bufferId+")!")
			siguienteCarga()
		}
		private function siguienteCarga():void {
			trace("(Buffer.siguienteCarga)("+bufferId+")!")
			var todoCargado:Boolean = eval_todoCargado()
			if (!todoCargado) {
				var primeraCargaSinCargar:String = get_primeraCargaSinCargar()
				trace("   primeraCargaSinCargar: " + primeraCargaSinCargar)
				iniciarCarga(primeraCargaSinCargar)
			}else if(!todoCargadoEmitido){
				trace("ATENCION: Todo Cargado!")
				var evento:EventoCarga
				if (buffer == null) {
					evento = new EventoCarga(EventoCarga.TODO_CARGADO, null, bufferId)
					this.dispatchEvent(evento)
					todoCargadoEmitido = true
				}else {
					evento = new EventoCarga(EventoCarga.TODO_CARGADO, bufferId, buffer.bufferId)
					this.dispatchEvent(evento)
					todoCargadoEmitido = true
				}
			}
		}
		private function iniciarCarga(cargaId:String):void {
			trace("(Buffer.iniciarCarga)("+bufferId+") cargadId: " + cargaId);
			var evento:EventoCarga = new EventoCarga(EventoCarga.INICIAR_CARGA, cargaId, bufferId)
			this.dispatchEvent(evento)
		}
		//--
		private function marcarComoCargado(cargaId:String):void {
			trace("(Buffer.marcarComoCargado)("+bufferId+") cargadId: " + cargaId);
			var objCarga:Object = items.getItem(cargaId)
			objCarga.cargado = true
		}
		private function emitirProgreso(cargaId:String, porcentaje:Number):void {
			var porcentajeCombinado:Number = pesos.get_porcentajeCarga(cargaId, porcentaje)
			//trace("   porcentajeCombinado: " + porcentajeCombinado)
			var dataPorcentaje:Object = new Object()
			dataPorcentaje.porcentaje = porcentajeCombinado
			//--
			var evento:EventoCarga = new EventoCarga(EventoCarga.PROGRESS_CARGA, cargaId, bufferId, dataPorcentaje)
			this.dispatchEvent(evento)
		}
		//--
		private function get_primeraCargaSinCargar():String {
			// Devuelve la cargaId de la primera carga sin cargar.
			var primeraCargaSinCargar:String = null
			for (var i = 0; i < items.numItems; i++ ) {
				var cargaId:String = items.getItemIdAt(i)
				var objCarga:Object = items.getItemAt(i)
				//ObjectUtils.traceObject(objCarga, "objCarga")
				trace("  cargaId: "+cargaId+"  cargado: "+objCarga.cargado)
				if (!objCarga.cargado) {
					primeraCargaSinCargar = items.getItemIdAt(i)
					break
				}
			}
			return primeraCargaSinCargar
		}
		private function eval_todoCargado():Boolean {
			var arrayCargados:Array = new Array()
			var todoCargado:Boolean = false
			for (var i = 0; i < items.numItems; i++ ) {
				var objCarga:Object = items.getItemAt(i)
				arrayCargados.push(objCarga.cargado)
			}
			var todoTrue:Boolean = ArrayUtils.evalTodosTrue(arrayCargados)
			if (todoTrue) {
				todoCargado = true
			}
			return todoCargado
		}
		//------------
		// EVENTOS:
		public function onIniciarCarga(evento:EventoCarga):void {  // Obligado por interface "Cargador"
			if (buffer != null && evento.cargaId == bufferId) {
				// Este buffer actua como buffer secundario y recibe el evento del buffer principal de iniciar carga.
				trace("(Buffer.onIniciarCarga)("+bufferId+") cargadId: " + evento.cargaId);
				iniciarBuffer()
			}
		}
		//--
		private function onCargaIniciada(evento:EventoCarga):void {
			
		}
		private function onProgressCarga(evento:EventoCarga):void {
			if (evento.bufferId == bufferId) {
				var cargaId:String = evento.cargaId
				var porcentaje:Number = evento.data.porcentaje
				emitirProgreso(cargaId, porcentaje)
			}
		}
		private function onExitoCarga(evento:EventoCarga):void {
			trace("(Buffer.onExitoCarga)("+bufferId+") cargadId: "+evento.cargaId+"   bufferIds: "+bufferId+"/"+evento.bufferId)
			if (evento.bufferId == bufferId) {
				trace("    El exitoCarga pertenece al buffer!")
				//var evento2:EventoCarga = new EventoCarga(EventoCarga.EXITO_CARGA, evento.cargaId, bufferId, evento.data,evento.evento,evento.bubbles)
				marcarComoCargado(evento.cargaId)
				emitirProgreso(evento.cargaId, 100)
				var evento2:EventoCarga = evento.clone() as EventoCarga
				this.dispatchEvent(evento2)
				if (resumeOnExito) {
					siguienteCarga()
				}
			}
		}
		private function onErrorCarga(evento:EventoCarga):void {
			
		}
		private function onBufferCargado(evento:EventoCarga):void {
			trace("(Buffer.onBufferCargado)("+bufferId+") cargadId: " + evento.cargaId);
			if (evento.bufferId == bufferId) {
				var evento2:EventoCarga = new EventoCarga(EventoCarga.EXITO_CARGA, evento.cargaId, bufferId, evento.data, evento.evento);
				this.dispatchEvent(evento2);
				//--
				marcarComoCargado(evento.cargaId)
				emitirProgreso(evento.cargaId, 100)
				if (resumeOnExito) {
					siguienteCarga()
				}
			}
		}
	}
	
}