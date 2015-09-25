/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com|| roberto@ionewmedia.com
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 07/10/2011 16:33
*/
package es.robertoferrero.framework.loaders.eventos {
	//---------------------------
	// IMPORTS del Package:
	import flash.events.Event;
	//---------------------------
	// CLASSES del Package:
	public class EventoMain extends Event {
		// import es.robertoferrero.framework.loaders.eventos.EventoMain
		//------------
		// PARAMETROS:
		public static const MAIN_INIT:String = "mainInit";
		public static const MAIN_CARGA_CONFIG_INICIO:String="mainCargaConfigInicio";
		public static const MAIN_CARGA_CONFIG_FIN:String = "mainCargaConfigFin";
		public static const MAIN_CARGA_EXTERNOS_INICIO:String="mainCargaExternosInicio";
		public static const MAIN_CARGA_EXTERNOS_FIN:String="mainCargaExternosFin";
		public static const MAIN_CARGA_ASSETS_INICIO:String="mainCargaAssetsInicio";
		public static const MAIN_CARGA_ASSETS_FIN:String = "mainCargaAssetsFin";
		public static const MAIN_INTRO_INICIAR:String="mainIntroIniciar";
		public static const MAIN_INTRO_FIN:String="mainIntroFin";
		public static const MAIN_JUEGO_INICIAR:String = "mainJuegoIniciar";
		//------------
		// CONSTRUCTORA:
		public function EventoMain(type:String, bubbles:Boolean=false, cancelable:Boolean=false) { 
			super(type, bubbles, cancelable);
		}

		public override function clone():Event{ 
			return new EventoMain(type, bubbles, cancelable);
		} 
		
		public override function toString():String { 
			return formatToString("EventoMain", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}