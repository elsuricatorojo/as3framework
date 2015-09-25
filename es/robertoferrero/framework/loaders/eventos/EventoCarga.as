/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com|| roberto@ionewmedia.com
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 200710
*/
package es.robertoferrero.framework.loaders.eventos{
	//---------------------------
	// IMPORTS del Package:
	import flash.events.*;
	//---------------------------
	// CLASSES del Package:
	public class EventoCarga extends Event {
		// import es.robertoferrero.framework.loaders.eventos.EventoCarga
		//------------
		// PARAMETROS:
		public static  const INICIAR_CARGA:String="iniciarCarga";
		public static  const CARGA_INICIADA:String="cargaIniciada";//--> Event.OPEN
		public static  const PROGRESS_CARGA:String="progressCarga";//--> ProgressEvent.PROGRESS
		public static  const EXITO_CARGA:String="exitoCarga";//--> Event.COMPLETE 
		public static  const ERROR_CARGA:String="errorCarga";//--> IOErrorEvent.IO_ERROR y SecurityErrorEvent.SECURITY_ERROR
		public static  const TODO_CARGADO:String="todoCargado";
		//--
		public var data:Object;
		public var cargaId:String;
		public var bufferId:String
		public var evento:Event // Contiene de haberlo el evento original
		//------------
		// CONSTRUCTORA:
		function EventoCarga(type:String, cargaId:String = null, bufferId:String=null, data:Object=null, evento:Event=null, bubbles:Boolean=false) {
			//trace("(EventoCarga.CONSTRUCTORA) eventoId: "+eventoId);
			super(type,bubbles);
			this.cargaId = cargaId;
			this.bufferId = bufferId
			this.evento = evento
			this.data = data;
		}
		//------------
		// PUBLICOS:
		public override  function clone():Event {
			return new EventoCarga(type,cargaId,bufferId,data,evento, bubbles);
		}
		public override  function toString():String {
			return formatToString("EventoCarga","type","bubbles","cancelable","eventPhase");
		}
		//------------
		// PRIVADOS:
		//------------
		// EVENTOS:
		//------------
		// EMISOR:
	}
}