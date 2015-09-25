/*
DOCUMENTACION:
* io newmedia S.L. - http://www.zona-io.com || http://www.ionewmedia.com
* Roberto Ferrero - roberto@zona-io.com	|| roberto@ionewmedia.com	
* This code is under a Creative Commons Attribution License
* http://creativecommons.org/licenses/by/2.5/
* Creada: 03/02/2011 20:58
*/
package es.robertoferrero.juegos.assets.pantallas{
	//---------------------------
	// IMPORTS del Package:
	import es.robertoferrero.juegos.assets.menus.eventos.EventoMenuJuego;
	import es.robertoferrero.juegos.assets.pantallas.IPantallaJuego;
	import es.robertoferrero.juegos.IJuego;
	import es.robertoferrero.juegos.IMainJuego;
	import flash.display.MovieClip;
	//---------------------------
	// CLASSES del Package:
	public class PantallaBase extends MovieClip implements IPantallaJuego{
		// import es.robertoferrero.juegos.assets.pantallas.PantallaBase
		//------------
		// DOCUMENTACION:
		//------------
		// PARAMETROS:
		// En el timeline:
		public var mc:MovieClip
		//--
		private var _pantallaId:String
		private var juego:IJuego
		private var mostrandose:Boolean = false
		//------------
		// CONSTRUCTORA:
		public function PantallaBase(){
			trace ("(PantallaBase.CONSTRUCTORA)!")
			this.visible = false
		}
		//------------
		// PUBLICOS:
		// Obligados por el interface:
		public function init(_juego:IJuego, id:String):void {
			_pantallaId = id
			juego = _juego
			juego.addEventListener(EventoMenuJuego.OPCION_SELECCIONADA, this.onOpcionSeleccionada)
			//juego.registrarPantalla(this)
			//--
			mc["init"](juego)
		}
		public function get pantallaId():String {
			return _pantallaId
		}
		// Getters:
		// Setters:
		//------------
		// INTERNOS:
		//------------
		// PRIVADOS:
		private function mostrar() {
			if (!mostrandose) {
				trace ("(PantallaBase.mostrar): "+pantallaId)
				mostrandose = true
				this.visible = true
			}
		}
		private function ocultar() {
			if (mostrandose) {
				trace ("(PantallaBase.ocultar): "+pantallaId)
				mostrandose = false
				this.visible = false
			}
		}
		//------------
		// EVENTOS:
		private function onOpcionSeleccionada(evento:EventoMenuJuego):void {
			if (evento.opcionId == pantallaId) {
				mostrar()
			}else {
				ocultar()
			}
		}
	}
}