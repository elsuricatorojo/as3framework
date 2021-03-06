﻿/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com|| roberto@ionewmedia.com
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 20/01/2011 21:06
*/
package es.robertoferrero.juegos.utils.eventos {
	//---------------------------
	// IMPORTS del Package:
	import flash.events.Event;
	//---------------------------
	// CLASSES del Package:
	public class EventoMainJuego extends Event {
		// import es.robertoferrero.juegos.utils.eventos.EventoMainJuego
		//------------
		// PARAMETROS:
		public static const MAIN_INIT:String = "mainInit";
		public static const MAIN_CARGA_CONFIG_INICIO:String="mainCargaConfigInicio";
		public static const MAIN_CARGA_CONFIG_FIN:String="mainCargaConfigFin";
		public static const MAIN_CARGA_ASSETS_INICIO:String="mainCargaAssetsInicio";
		public static const MAIN_CARGA_ASSETS_FIN:String = "mainCargaAssetsFin";
		public static const MAIN_INTRO_INICIAR:String="mainIntroIniciar";
		public static const MAIN_INTRO_FIN:String="mainIntroFin";
		public static const MAIN_JUEGO_INICIAR:String = "mainJuegoIniciar";
		//------------
		// CONSTRUCTORA:
		public function EventoMainJuego(type:String, bubbles:Boolean=false, cancelable:Boolean=false) { 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event{ 
			return new EventoMainJuego(type, bubbles, cancelable);
		} 
		
		public override function toString():String { 
			return formatToString("EventoMain", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}