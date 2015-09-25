/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 17/01/2011 11:11
*/
package es.robertoferrero.juegos.lib.escudoHumano{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.juegos.assets.menus.eventos.EventoMenuJuego;
	import es.robertoferrero.juegos.assets.menus.IMenuJuego;
	import es.robertoferrero.juegos.assets.pantallas.IPantallaJuego;
	import es.robertoferrero.juegos.lib.escudoHumano.pantallas.Instrucciones;
	import es.robertoferrero.juegos.utils.eventos.EventoMainJuego;
	import es.robertoferrero.juegos.IMainJuego
	import es.robertoferrero.juegos.IJuego;
	import es.robertoferrero.juegos.utils.lib.LibAssets;
	//--
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	//---------------------------
	// CLASSES del Package:
	public class EscudoH extends MovieClip implements IJuego {
		// import es.robertoferrero.juegos.lib.escudoHumano.EscudoH
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		// En el timeline:
		public var instrucciones:IPantallaJuego
		public var juego:IPantallaJuego
		public var creditos:IPantallaJuego
		//--
		public var main:IMainJuego
		//--
		private var _assets:LibAssets
		private var menu:IMenuJuego
		//------------
		// CONSTRUCTORA:
		public function EscudoH(){
			trace ("(EscudoH.CONSTRUCTORA)!")
			//--
			
		}
		//------------
		// PUBLICOS:
		// Definidos en el interface IJuego
		public function init(_main:IMainJuego):void {
			trace ("(EscudoH.init)!")
			//--
			main = _main
			main.addEventListener(EventoMainJuego.MAIN_JUEGO_INICIAR, onIniciarJuego)
			//--
			_assets = main.get_assets()
			//--
			menu = assets.getAssetRef("MENU") as IMenuJuego
			menu.addEventListener(EventoMenuJuego.OPCION_SELECCIONADA, this.onOpcionSeleccionada)
			this.addChild(menu as DisplayObject)
			//--
			instrucciones.init(this, "op_instrucciones")
			juego.init(this, "op_jugar")
			creditos.init(this, "op_creditos")
		}
		//public function registrarPantalla(pantalla:IPantallaJuego):void {
		//	trace ("(EscudoH.registrarPantalla): "+pantalla.pantallaId)
		//}
		public function get assets():LibAssets {
			return _assets
		}
		//--
		public function testScope(cadena:String):void {
			trace ("(EscudoH.testScope) ------------------------ "+cadena)
		}
		// Getters:
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		//------------
		// EVENTOS:
		private function onIniciarJuego(evento:EventoMainJuego):void {
			trace ("(EscudoH.onIniciarJuego)!")
		}
		//--
		private function onOpcionSeleccionada(evento:EventoMenuJuego):void {
			trace ("(EscudoH.onOpcionSeleccionada)!")
			var evento2:EventoMenuJuego = new EventoMenuJuego(EventoMenuJuego.OPCION_SELECCIONADA, evento.opcionId)
			this.dispatchEvent(evento2)
		}
	}
	
}